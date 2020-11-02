<?php
/*
Plugin Name: LadiPage - Landing Page Builder
Plugin URI: http://ladipage.com
Description: Connector to access content from LadiPage service. (LadiPage: Landing Page Platform for Advertiser)
Author: LadiPage
Author URI: http://ladipage.com
Version: 2.5
*/
if( ! class_exists( "PageTemplater" ) ){
	require plugin_dir_path( __FILE__ ) . 'add-template.php';
}

if ( isset( $_SERVER['HTTP_ORIGIN'] ) ) {
	header( "Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}" );
	header( 'Access-Control-Allow-Credentials: true' );
	header( 'Access-Control-Max-Age: 86400' ); // cache for 1 day
}

if ( $_SERVER['REQUEST_METHOD'] == 'OPTIONS' ) {
	if ( isset( $_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD'] ) ) {
		header( "Access-Control-Allow-Methods: GET, POST, OPTIONS" );
	}
	if ( isset( $_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS'] ) ) {
		header( "Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}" );
	}
	exit( 0 );
}

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

if ( ! class_exists( 'Ladipage' ) ) {

	class Ladipage {
		protected static $_instance = null;

		protected $_notices = array();

		public static function instance() {
			if ( is_null( self::$_instance ) ) {
				self::$_instance = new self();
			}

			return self::$_instance;
		}

		public function __construct() {
			add_action( 'init', array( $this, 'init_endpoint' ) );
			add_action( 'admin_init', array( $this, 'check_environment' ) );
			add_action( 'admin_notices', array( $this, 'admin_notices' ), 15 );
			add_action( 'admin_menu', array( $this, 'add_ladipage_menu_item' ) );
			add_action( 'wp_ajax_ladipage_save_config', array( $this, 'save_config' ) );
			add_action( 'wp_ajax_ladipage_publish_lp', array( $this, 'publish_lp' ) );

			register_activation_hook( __FILE__, array( $this, 'activation_process' ) );
			register_deactivation_hook( __FILE__, array( $this, 'deactivation_process' ) );
		}

		public function activation_process() {
		    $this->init_endpoint();
			flush_rewrite_rules();
		}

		public function deactivation_process() {
			flush_rewrite_rules();
		}

		/* add hook and do action */
		public function init_endpoint() {
			add_filter( 'query_vars', array( $this, 'add_query_vars' ), 0 );
			add_action( 'parse_request', array( $this, 'sniff_requests' ) );
			add_rewrite_rule( '^ladipage/api', 'index.php?ladipage_api=1', 'top' );
		}

		public function add_query_vars( $vars ) {
			$vars[] = 'ladipage_api';

			return $vars;
		}

		public function sniff_requests() {
			global $wp, $wpdb;
			$query = $GLOBALS['wpdb'];
			$isLadipage = isset( $wp->query_vars['ladipage_api'] ) ? $wp->query_vars['ladipage_api'] : null;
			
			// Params for products & orders
			$productID = isset( $_GET['product_id'] ) ? $_GET['product_id'] : null;
			$variantID = isset( $_GET['variant_id'] ) ? $_GET['variant_id'] : null;
			$actProduct = isset( $_GET['action'] ) ? $_GET['action'] : null;
			$qty = isset( $_GET['qty'] ) ? $_GET['qty'] : 1;
			$cartItemKey = isset( $_GET['cart_item_key'] ) ? $_GET['cart_item_key'] : null;
			$keyword = isset( $_GET['keyword'] ) ? $_GET['keyword'] : null;
			
			if ( ! is_null( $isLadipage ) && $isLadipage === "1" ) {
				$params      = filter_input_array( INPUT_POST );
				$api_key     = isset( $params['token'] ) ? sanitize_text_field($params['token']) : null;
				$action      = isset( $params['action'] ) ? sanitize_text_field($params['action']) : null;
				$url         = isset( $params['url'] ) ? sanitize_text_field($params['url']) : null;
				$title       = isset( $params['title'] ) ? sanitize_text_field($params['title']) : null;
				$html        = isset( $params['html'] ) ? $params['html'] : '';
				$type       = isset( $params['type'] ) ? sanitize_text_field($params['type']) : null;

				$config = get_option( 'ladipage_config', '');
				
				// Check key for action products & orders
				if (isset( $_GET['ldp_token'] )) {
					$api_key = @$_GET['ldp_token'];
				}
					
				if ( $api_key !== $config['api_key'] ) {
					wp_send_json( array(
						'code'    => 190
					) );
				}
				
				// Action for Intergrated products & orders.
				if ($actProduct !== null) {
					switch($actProduct) {
						case 'product_info': 
							if ( !is_null($productID)) {
								$this->getProduct($productID);
							}
							break;
						case 'cart_add': 
							if ( !is_null($productID)) {
								$this->addToCart($productID, $qty, $variantID);
							}
							break;
						case 'cart_info': 
							$this->cartInfo();
							break;
						case 'cart_empty': 
							$this->cartEmpty();
							break;
						case 'cart_remove_item': 
							$this->cartRemoveItem($cartItemKey);
							break;
						case 'cart_update_item_qty': 
							$this->cartUpdateItemQty($cartItemKey, $qty);
							break;
						case 'order_create': 
							$this->createOrder($dataOrder);
							break;
						case 'product_list':
							$this->searchProduct($keyword);
							break;
						default:
					}
				}
				
				// Action for publish Landing Page
				switch ( $action ) {
					case 'create':
						if ( $this->get_id_by_slug($url) ) {
							wp_send_json( array(
								'code'    => 205
							) );
						}
						kses_remove_filters();
						if($type==null){
							$post_type = 'page';
						}else{
							$post_type = $type;
						}

						$query->insert( 
							$query->posts, 
							array(
								'post_title'=> $title, 
								'post_name'=> $url, 
								'post_type'=> 'page', 
								'post_content'=> trim($html), 
								'post_status' => 'publish'
							)
						);

						/*$id = wp_insert_post(
							array(
								'post_title'=>$title, 
								'post_name'=>$url, 
								'post_type'=>$post_type, 
								'post_content'=> trim($html), 
								'post_status' => 'publish',
								'filter' => true ,
								'page_template'  => 'null-template.php'
							)
						);*/

						if ($query && $query->insert_id) {
							$postID = $query->insert_id;
							if (empty(get_post_meta( $postID, '_wp_page_template', true )))
								add_post_meta($postID, '_wp_page_template', 'null-template.php');

							wp_send_json( array(
								'code'    => 200,
								'url'    => get_permalink($query->insert_id)
							) );
						}else{
							wp_send_json( array(
								'code'    => 400,
								'message' => __( 'Create failed, please try again.' )
							) );
						}
						break;
					
					case 'update':
						if ( ! $this->get_id_by_slug($url) ) {
							wp_send_json( array(
								'code'    => 400,
								'message' => __( 'URL does not exist' )
							) );
						}else{
							$id = $this->get_id_by_slug($url);
							$post = array(
								'post_title'=>$title, 
					            'post_content' => trim($html), 
							);

							$where = array(
								'ID' => $id
							);
					        kses_remove_filters();
							
							$query->update( $query->posts, $post, $where);
					        if ($query) {
								wp_send_json( array(
									'code'    => 200,
									'url'    => get_permalink($id)
								) );
					        } else {
					        	wp_send_json( array(
									'code'    => 400,
									'message' => __( 'Update failed, please try again.' )
								) );
					        }
						}
						break;

					case 'delete':
						if ( ! $this->get_id_by_slug($url) ) {
							wp_send_json( array(
								'code'    => 400,
								'message' => __( 'URL does not exist' )
							) );
						}else{
							$id = $this->get_id_by_slug($url);
							$result = wp_delete_post($id);
					        if($result){
					        	wp_send_json( array(
									'code'    => 200
								) );
					        }else{
					        	wp_send_json( array(
									'code'    => 400,
									'message' => __( 'Delete failed, please try again.' )
								) );
					        }
						}
						break;
					case 'checkurl':
						if ( ! $this->get_id_by_slug($url) ) {
							wp_send_json( array(
								'code'    => 206
							) );
						}else{
							wp_send_json( array(
								'code'    => 205
							) );
						}
						break;
					case 'checktoken':
						if ( $api_key === $config['api_key'] ) {
							wp_send_json( array(
								'code'    => 191
							) );
						}
						break;		
					default:
						wp_send_json( array(
							'code'    => 400,
							'message' => __( 'LadiPage action is not set or incorrect.' )
						) );
						break;
				}
			}
		}

		public function searchProduct($keyword = '', $page = 0) {
			try {
				$args = array(
					'posts_per_page' => 1000,
					'post_type' => array('product'),
					'stock_status' => array('instock', 'outofstock')
				);
				if ($keyword != '') {
					$args['s'] = $keyword;	
				}	
				
				
				$query = new WP_Query( $args );
				$productData = array();
				$postParentID = array();
				if ( $query->have_posts() ) {
            	$products = $query->posts;
					foreach ($products as $product) {
						setup_postdata( $product );
						$productAttribute = get_post_meta( $product->ID, '_product_attributes' );
						$_attrData = array();
						$i = 0;
						
						$productAttribute = (array) @$productAttribute[0];
							
						foreach ($productAttribute as $key => $attr) {
							$_itemAttr = array(
								'product_id' => $product->ID,
								'product_option_id' => $i,
								'name' => $attr['name'],
								'type' => 1,
								'position' => $attr['position'],
								'values' => explode(' | ', $attr['value'])
							);
							$_attrData[$i] = $_itemAttr;
							$i++;
						}
						
						$productPrice = get_post_meta( $product->ID, '_price', true );
						$comparePrice = get_post_meta( $product->ID, '_regular_price', true );
						$sku = get_post_meta( $product->ID, '_sku', true );
						$image = get_the_post_thumbnail_url($product->ID);
						$stockProduct = (int) get_post_meta( $product->ID, '_stock', true );
						
						$_product = array(
							'_id' => $product->ID,
							'product_id' => $product->ID,
							'name' => $product->post_title,
							'description' => $product->content,
							'unit' => null,
							'price' => $productPrice,
							'options' => $_attrData,
							'images' => array(),
							'image' => $image,
							'tags' => array(),
							'variants' => array(
								array(
									'_id' => $product->ID,
									'product_id' => $product->ID,
									'product_variant_id' => $product->ID,
									'store_id'=> null,
									'product_name' => $product->post_title,
									'description' => $product->content,
									'price' => $productPrice,
									'price_compare' => $comparePrice,
									'cost_per_item' => 0,
									'sku' => $sku,
									'quantity' => $stockProduct,
									'inventory_checked' => false,
									'weight'=> null,
									'height'=> null,
									'bar_code'=> null,
									'src' => null,
									'option_ids' => '',
									'text_quantity' => '',
									'title' => $product->post_title,
									'post_parent' => $product->post_parent,
									'option1' => null,
									'option2' => null,
									'option3' => null,
									'created_at' => $product->post_date,
									'updated_at' => $product->post_modified
								)
							),
							'relates' => array(),
							'cross_sells' => array(),
							'upsells' => array(),
							'post_parent' => $product->post_parent
						);
						$productData[] = $_product;
						if (!in_array($product->post_parent, $postParentID)) {
							$postParentID[] = $product->ID;
						}
					}
				}
				wp_reset_postdata();
				
				$argsVariant = array(
					'posts_per_page' => 1000,
					'post_type' => array('product_variation'),
					'post_parent__in' => $postParentID
				);
				
				$queryVariant = new WP_Query( $argsVariant );
				if ( $queryVariant->have_posts() ) {
            	$productVariants = $queryVariant->posts;
					foreach ($productVariants as $variant) {
						$arrayVariantName = @explode('-', $variant->post_title);
						$option1 = null;
						$option2 = null;
						$option3 = null;
						
						if (count($arrayVariantName) > 0) {
							$arrayOption = @explode(',', @end($arrayVariantName));
							if (count($arrayOption) > 0) {
								$option1 = @$arrayOption[0];
								$option2 = @$arrayOption[1];
								$option3 = @$arrayOption[2];
							}
						}
						
						$variantPrice = get_post_meta( $variant->ID, '_price', true ) 
							? get_post_meta( $variant->ID, '_price', true ) : get_post_meta( $variant->post_parent, '_price', true );
						$variantComparePrice = get_post_meta( $variant->ID, '_regular_price', true ) 
							? get_post_meta( $variant->ID, '_regular_price', true ) : get_post_meta( $variant->post_parent, '_regular_price', true );
						$variantSKU = get_post_meta( $variant->ID, '_sku', true );
						$stockVariant = (int) get_post_meta( $variant->ID, '_stock', true );
						
						$_variant = array(
							'_id' => $variant->ID,
							'product_id' => $variant->post_parent,
							'product_variant_id' => $variant->ID,
							'store_id'=> null,
							'product_name' => $variant->post_title,
							'description' => $variant->content,
							'price' => $variantPrice,
							'price_compare' => $variantComparePrice,
							'cost_per_item' => 0,
							'sku' => $variantSKU,
							'quantity' => $stockVariant,
							'inventory_checked' => false,
							'weight'=> null,
							'height'=> null,
							'bar_code'=> null,
							'src' => null,
							'option_ids' => '',
							'text_quantity' => '',
							'title' => $variant->post_title,
							'post_parent' => $variant->post_parent,
							'option1' => $option1,
							'option2' => $option2,
							'option3' => $option3,
							'created_at' => $variant->post_date,
							'updated_at' => $variant->post_modified
						);
						
						for ($i = 0; $i < count($productData); $i++) {
							if ($variant->post_parent == $productData[$i]['product_id']) {
									if ($productData[$i]['variants'][0]['product_id'] == $productData[$i]['variants'][0]['product_variant_id']) {
										array_splice($productData[$i]['variants'], 0, 0);
									}
								
								$productData[$i]['variants'][] = $_variant;
							}
						}
					}
				}
				
				// Search Product
				wp_send_json( array(
					'code'    => 200,
					'products'    => $productData
				) );
			} catch (Exception $ex) {
				wp_send_json(
					array(
						'code'    => 500,
						'data' => null,
						'message' => $ex->getMessage()
					)
				);
			}
		}
		
		public function getProduct($productID = null) {
			try {
				if ( class_exists( 'WooCommerce' ) ) {
					$_product = wc_get_product( $productID );
					$productData = $_product->get_data();
					$productData['image'] = wp_get_attachment_url( $productData['image_id'] );
					$gallery = [];
					for ($i = 0; $i < count($productData['gallery_image_ids']); $i++) {
						$gallery[] = wp_get_attachment_url( $productData['gallery_image_ids'][$i] );
					}
					$productData['gallery'] = $gallery;
					if ($productData) {
						wp_send_json(
							array(
								'code'    => 200,
								'data' => $productData,
								'message' => __( 'Success' )
							)
						);
					} else {
						wp_send_json(
							array(
								'code'    => 404,
								'data' => null,
								'message' => __( 'Can not find this product.' )
							)
						);
					}
				}
				wp_send_json(
					array(
						'code'    => 400,
						'data' => null,
						'message' => __( 'Bad request!' )
					)
				);
			} catch (Exception $ex) {
				wp_send_json(
					array(
						'code'    => 500,
						'data' => null,
						'message' => $ex->getMessage()
					)
				);
			}
		}
		
		public function cartInfo() {
			try {
				$cart = WC()->cart->get_cart();
				$cartData = [];
				foreach($cart as $item => $values) { 
					$values['product_name'] = $values['data']->get_name();
					$cartData[] = $values;
				} 
				
				wp_send_json(
					array(
						'code'    => 200,
						'data' => $cartData,
						'message' => 'Success'
					)
				);
			} catch (Exception $ex) {
				wp_send_json(
					array(
						'code'    => 500,
						'data' => null,
						'message' => $ex->getMessage()
					)
				);
			}
		}
		
		public function cartEmpty() {
			try {
				$cart = WC()->cart->empty_cart();
				wp_send_json(
					array(
						'code'    => 200,
						'data' => null,
						'message' => 'Success'
					)
				);
			} catch (Exception $ex) {
				wp_send_json(
					array(
						'code'    => 500,
						'data' => null,
						'message' => $ex->getMessage()
					)
				);
			}
		}
		
		public function cartUpdateItemQty($key, $qty) {
			try {
				if (WC()->cart->set_quantity($key, $qty)) {
					wp_send_json(
						array(
							'code'    => 200,
							'data' => null,
							'message' => 'Success'
						)
					);
				}
				wp_send_json(
						array(
							'code'    => 500,
							'data' => null,
							'message' => 'Error'
						)
					);
			} catch (Exception $ex) {
				wp_send_json(
					array(
						'code'    => 500,
						'data' => null,
						'message' => $ex->getMessage()
					)
				);
			}
		}
		
		public function cartRemoveItem($key) {
			try {
				if (WC()->cart->remove_cart_item($key)) {
					wp_send_json(
						array(
							'code'    => 200,
							'data' => null,
							'message' => 'Success'
						)
					);
				}
				wp_send_json(
						array(
							'code'    => 500,
							'data' => null,
							'message' => 'Error'
						)
					);
			} catch (Exception $ex) {
				wp_send_json(
					array(
						'code'    => 500,
						'data' => null,
						'message' => $ex->getMessage()
					)
				);
			}
		}
		
		public function addToCart($productID = null, $qty, $variantID = null) {
			try {
				if (! is_null($productID)) {
					if (WC()->cart->add_to_cart( $productID, $qty, $variantID)) {
						wp_send_json(
							array(
								'code'    => 200,
								'data' => null,
								'message' => 'Success'
							)
						);
					}
				}
			} catch (Exception $ex) {
				wp_send_json(
					array(
						'code'    => 500,
						'data' => null,
						'message' => $ex->getMessage()
					)
				);
			}
		}
		
		public function createOrder($data = null) {
			try {
					global $woocommerce;
					$data = [];
					if (isset($_POST['form_data'])) {
						$data = @$_POST['form_data'];
						$data = str_replace ('\"','"', $data);
						//$data = preg_replace('/[\x00-\x1F\x80-\xFF]/', '', $data);
						$data = json_decode($data, true);
					}
				
					if (count($data) == 0) {
						wp_send_json(
							array(
								'code'    => 500,
								'data' => null,
								'message' => 'Data Empty'
							)
						);
					}
				
				$order = wc_create_order();
				for ($i = 0; $i < count($data['line_items']); $i++) {
					$pID = $data['line_items'][$i]['product_id'];
					if (isset($data['line_items'][$i]['variation_id']) && $data['line_items'][$i]['variation_id'] > 0) {
						$pID = $data['line_items'][$i]['variation_id'];
					}
					
					$__product = wc_get_product($pID); 
					$order->add_product( $__product, $data['line_items'][$i]['quantity']);
				}
				
				$order->add_order_note(@$data['message']);
				// Set addresses
				$order->set_address( $data['billing'], 'billing' );
				$order->set_address( $data['shipping'], 'shipping' );

				// Set payment gateway
				$payment_gateways = WC()->payment_gateways->payment_gateways();
				$order->set_payment_method( $payment_gateways['bacs'] );

				// Calculate totals
				$order->calculate_totals();
				$order->update_status( 'Completed', 'Order Created From LadiPage - ', TRUE);
				if ($order) {
					wp_send_json(
						array(
							'code'    => 200,
							'data' => $order,
							'message' => 'SUCCESS'
						)
					);
				}
				wp_send_json(
						array(
							'code'    => 500,
							'data' => null,
							'message' => 'ERROR'
						)
					);
			} catch (Exception $ex) {
				wp_send_json(
					array(
						'code'    => 500,
						'data' => null,
						'message' => $ex->getMessage()
					)
				);
			}
		}
		
		protected function get_id_by_slug($page_slug) {
		    $page = get_page_by_path($page_slug,'OBJECT', ['post','page','product','property']);
		    if ($page) {
		        return $page->ID;
		    } else {
		        return null;
		    }
		} 

		public function get_option( $id, $default = '' ) {
			$options = get_option( 'ladipage_config', array() );
			if ( isset( $options[ $id ] ) && $options[ $id ] != '' ) {
				return $options[ $id ];
			} else {
				return $default;
			}
		}

		/* Add menu and option */
		public function check_environment() {
			if ( is_plugin_active( plugin_basename( __FILE__ ) ) ) {
				if ( ! function_exists( 'curl_init' ) ) {
					$this->add_admin_notice( 'curl_not_exist', 'error', __( 'LadiPage requires cURL to be installed.', 'ladipage' ) );
				}
			}
		}

		public function add_admin_notice( $slug, $class, $message ) {
			$this->_notices[ $slug ] = array(
				'class'   => $class,
				'message' => $message,
			);
		}

		public function admin_notices() {
			foreach ( $this->_notices as $notice_key => $notice ) {
				echo "<div class='" . esc_attr( $notice['class'] ) . "'><p>";
				echo wp_kses( $notice['message'], array( 'a' => array( 'href' => array() ) ) );
				echo '</p></div>';
			}
		}

		public function add_ladipage_menu_item() {
			add_menu_page( __( "LadiPage" ), __( "LadiPage" ), "manage_options", "ladipage-config", array(
				$this,
				'ladipage_settings_page'
			), null, 30 );
		}

		public function ladipage_settings_page() {
			if ( ! empty( $this->_notices ) ) {
				?>
                <div>Please install cURL to use LadiPage plugin</div>
				<?php
			} else {
				?>
                <div class="wrap">
                    <h2 class="title">LadiPage - Landing Page Builder</h2><br>
                    <form id="ladipage_config" class="ladiui-panel">
                    	<h3><strong>Config API Key</strong></h3>
                        <table class="form-table">
                            <tr>
                                <th scope="row">
                                    <label for="api_key">API KEY</label>
                                </th>
                                <td>
                                	<?php
                                		$config = get_option( 'ladipage_config', array());
                                		
                            		    if(!isset($config['api_key']) || trim($config['api_key']) == ''){
                            		    	$config['api_key'] = $this->generateRandomString(32);
                            		    	update_option( 'ladipage_config', $config );
                            		    }

                                	?>
                                    <input onClick="this.select();" readonly="readonly" name="api_key" id="api_key" type="text" class="regular-text ladiui input"
                                           value="<?php echo $this->get_option( 'api_key', '' ); ?>">
                                           <button type="button" id="ladipage_new_api" class="ladiui button primary">NEW API KEY</button>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">
                                    <label for="webiste_ladipage">API URL</label>
                                </th>
                                <td>
                                    <input onClick="this.select();" readonly="readonly" name="webiste_ladipage" id="webiste_ladipage" type="text" class="regular-text ladiui input" value="<?php echo get_home_url(); ?>">
                                </td>
                            </tr>
                        </table>

                        <div class="submit">
                            <button class="button button-primary ladiui button primary" id="ladipage_save_option" type="button">Save Changes
                            </button>
                        </div>
                    </form>
                    <form class="ladiui-panel" id="ladipage-publish-form">
                    	<h3><strong>Manualy LadiPage Publish</strong></h3>
                        <table class="form-table">
                            <tr>
                                <th scope="row">
                                    <label for="api_key">LadiPage KEY</label>
                                </th>
                                <td>
                                    <input name="ladipage_key" id="ladipage_key" type="text" class="regular-text ladiui input" placeholder="Your LadiPage Key"><br/>
                                </td>
                            </tr>
							<tr>
								<td></td>
								<td>
								<span id="ladipage-message" class="lp-hide" style="color:#0c61f2;font-style:italic">Processing...</span>
								<style>.lp-hide{display:none}</style>
								</td>
							</tr>
                        </table>
                        <div class="submit">
                            <button type="button" id="ladipage_publish" class="button button-primary ladiui button primary">Publish</button>
                        </div>
                    </form>
                    <script>
                        (function ($) {
                        	function generateRandomString(length = 10) {
							  	var text = "";
							  	var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
							  	for (var i = 0; i < length; i++)
							    text += possible.charAt(Math.floor(Math.random() * possible.length));
							  	return text;
							}
                            $(document).ready(function () {
                                $('#ladipage_save_option').on('click', function (event) {
                                    var data = JSON.stringify($('#ladipage_config').serializeArray());
                                    $.ajax({
                                        url: ajaxurl,
                                        type: 'POST',
                                        data: {
                                            action: 'ladipage_save_config',
                                            data: data
                                        },
                                        success: function (response) {
                                            alert('Save Success');
                                        }
                                    });
                                    event.preventDefault();
                                });
                                $("#ladipage_new_api").click(function(){
                                	var api = generateRandomString(32);
                                	$("#ladipage_config #api_key").val(api);
                                });

                                $('#ladipage_publish').on('click', function (event) {
									event.preventDefault();
									$('#ladipage-message').removeClass('lp-hide');
									$('#ladipage-message').empty().text('Processing...');
                                	var ladiPageKey = $('#ladipage_key').val();
                                	if (ladiPageKey == '') {
                                		alert('Please enter your LadiPage Key!');
                                		return false;
                                	}

                                    $.ajax({
                                        url: ajaxurl,
                                        type: 'POST',
                                        data: {
                                            action: 'ladipage_publish_lp',
                                            ladipage_key: ladiPageKey
                                        },
                                        success: function (res) {
											$('#ladipage-message').empty().html(res.message);
                                        }
                                    });
                                    event.preventDefault();

                                });

                            });
                        })(jQuery);
                    </script>
                </div>
				<?php
			}
		}

		public function save_config() {
			$data   = sanitize_text_field($_POST['data']);
			$data   = json_decode( stripslashes( $data ) );
			$option = array();

			foreach ( $data as $key => $value ) {
				$option[ $value->name ] = $value->value;
			}
			update_option( 'ladipage_config', $option );
			die;
		}

		public function publish_lp() {
			global $wp, $wpdb;
			$query = $GLOBALS['wpdb'];
			if (isset($_POST['ladipage_key']) && trim($_POST['ladipage_key']) != '') {
				$ladiPageKey = trim($_POST['ladipage_key']);
				$url = sprintf("https://api.ladipage.com/2.0/get-source-by-ladipage-key?ladipage_key=%s", $ladiPageKey);
				$jsonString = file_get_contents($url);
				if (!$jsonString) {
					$jsonString = get_web_page($url);
				}

				if ($jsonString) {
					$response = json_decode($jsonString);
					if (isset($response->code) && $response->code == 200) {
						$data = $response->data;
						if (!isset($data->url) || $data->url == '') {
							wp_send_json( array(
								'code'    => 403,
								'message' => __( 'Page URL invalid!' )
							) ); exit;
						}

						$pageId = $this->get_id_by_slug($data->url);
						if (!$pageId) {
							try {
								kses_remove_filters();
								/*$id = wp_insert_post(
									array(
										'post_title'=>$data->title . ' - LadiPage', 
										'post_name'=>$data->url, 
										'post_type'=>'page', 
										'post_content'=> trim($data->html), 
										'post_status' => 'publish',
										'filter' => true ,
										'page_template'  => 'null-template.php'
									)
								);*/
								$query->insert( 
									$query->posts, 
									array(
										'post_title'=> $data->title . ' - LadiPage', 
										'post_name'=> $data->url, 
										'post_type'=> 'page', 
										'post_content'=> trim($data->html), 
										'post_status' => 'publish'
									)
								);

								if ($query && $query->insert_id) {
									$postID = $query->insert_id;
									add_post_meta($postID, '_wp_page_template', 'null-template.php');
									wp_send_json( array(
										'code'    => 200,
										'message' => __( "Publish successfully! Page URL: " . site_url() . '/' . $data->url)
									) ); exit;
								}
							} catch (Exception $ex) {
								wp_send_json( array(
									'code'    => 500,
									'message' => __( $ex->message )
								) ); exit;
							}
							
						} else {
							/*$post = array(
					            'ID' => $pageId,
					            'post_title'=>$data->title . ' - LadiPage', 
					            'post_content' => trim($data->html), 
					        );
							$result = wp_update_post($post, true);*/
							kses_remove_filters();
							$post = array(
								'post_title' => $data->title . ' - LadiPage', 
					            'post_content' => trim($data->html), 
							);

							$where = array(
								'ID' => $pageId
							);
					        kses_remove_filters();
							
							$query->update( $query->posts, $post, $where);
					        if ($query) {
								wp_send_json( array(
										'code'    => 200,
										'message' => __( "Publish successfully! Page URL: " . site_url() . '/' . $data->url)
									) ); exit;
							}
							wp_send_json( array(
								'code'    => 500,
								'message' => __( "Can not update HTML for this Page")
							) ); exit;
						}
					} else {
						wp_send_json( array(
							'code'    => 500,
							'message' => __( $response->message )
						) ); exit;
					}
				}

				wp_send_json( array(
					'code'    => 500,
					'message' => __( "Can not update HTML from this LadiPage Key. Please try publish again" )
				) ); exit;
			}
		}

		public function generateRandomString($length = 10) {
		    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		    $charactersLength = strlen($characters);
		    $randomString = '';
		    for ($i = 0; $i < $length; $i++) {
		        $randomString .= $characters[rand(0, $charactersLength - 1)];
		    }
		    return $randomString;
		}

	}

	function Ladipage() {
		return Ladipage::instance();
	}

	Ladipage();
}

function get_web_page($request, $post = 0) {
	$data = array('message' => '', 'content' => '');

	if (function_exists('curl_exec')) {
		$ch = curl_init();
		if ($post == 1) {
			curl_setopt($ch, CURLOPT_POST,1);
		}
		curl_setopt($ch, CURLOPT_USERAGENT, cp_useragent());
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 5);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt($ch, CURLOPT_URL, $request);
		curl_setopt($ch, CURLOPT_TIMEOUT, 60);
		$response = curl_exec($ch);
		if (!$response) {
			$data['message'] = 'cURL Error Number ' . curl_errno($ch) . ' : ' . curl_error($ch);
		} else {
			$data['content'] = $response;
		}
		curl_close($ch);
	}

	return $response;
}

function cp_useragent() {
	$blist[] = "Mozilla/5.0 (compatible; Konqueror/4.0; Microsoft Windows) KHTML/4.0.80 (like Gecko)";
	$blist[] = "Mozilla/5.0 (compatible; Konqueror/3.92; Microsoft Windows) KHTML/3.92.0 (like Gecko)";
	$blist[] = "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; Media Center PC 5.0; .NET CLR 1.1.4322; Windows-Media-Player/10.00.00.3990; InfoPath.2";
	$blist[] = "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; Dealio Deskball 3.0)";
	$blist[] = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; NeosBrowser; .NET CLR 1.1.4322; .NET CLR 2.0.50727)";

	return $blist[array_rand($blist)];
}
?>