<?php
/**
* The template for displaying product content in the single-product.php template
*
* This template can be overridden by copying it to yourtheme/woocommerce/content-single-product.php.
*
* HOWEVER, on occasion WooCommerce will need to update template files and you
* (the theme developer) will need to copy the new files to your theme to
* maintain compatibility. We try to do this as little as possible, but it does
* happen. When this occurs the version of the template file will be bumped and
* the readme will list any important changes.
*
* @see     https://docs.woocommerce.com/document/template-structure/
* @package WooCommerce\Templates
* @version 3.6.0
*/

defined('ABSPATH') || exit;

global $product;

/**
* Hook: woocommerce_before_single_product.
*
* @hooked woocommerce_output_all_notices - 10
*/
do_action('woocommerce_before_single_product');

if (post_password_required()) {
echo get_the_password_form(); // WPCS: XSS ok.
return;
}
?>
<div id="product-<?php the_ID();?>" <?php wc_product_class('', $product);?>>
<div class="row">
<div class="col-md-9">
<?php
/**
* Hook: woocommerce_before_single_product_summary.
*
* @hooked woocommerce_show_product_sale_flash - 10
* @hooked woocommerce_show_product_images - 20
*/
do_action('woocommerce_before_single_product_summary');
?>

<div class="summary entry-summary">
<?php
/**
* Hook: woocommerce_single_product_summary.
*
* @hooked woocommerce_template_single_title - 5
* @hooked woocommerce_template_single_rating - 10
* @hooked woocommerce_template_single_price - 10
* @hooked woocommerce_template_single_excerpt - 20
* @hooked woocommerce_template_single_add_to_cart - 30
* @hooked woocommerce_template_single_meta - 40
* @hooked woocommerce_template_single_sharing - 50
* @hooked WC_Structured_Data::generate_product_data() - 60
*/
do_action('woocommerce_single_product_summary');
?>
</div>



<?php
/**
* Hook: woocommerce_after_single_product_summary.
*
* @hooked woocommerce_output_product_data_tabs - 10
* @hooked woocommerce_upsell_display - 15
* @hooked woocommerce_output_related_products - 20
*/
do_action('woocommerce_after_single_product_summary');
?>

</div>

<div class="col-md-3 box-text">
<div class="sidebar-prouduct">
<ul>
<li>
<span><i class="fa fa-truck"></i></span>
<span><strong>GIAO H??NG MI???N PH??</strong><br>Giao h??ng mi???n ph?? t???i nh?? tr??n to??n qu???c</span>
</li>
<li>
<span><i class="fa">15</i></span>
<span><strong>?????I H??NG MI???N PH??</strong><br>?????i h??ng trong v??ng 15 ng??y n???u c?? l???i t??? nh?? s???n
xu???t</span>
</li>
<li><span><i class="fa fa-reply"></i></span>
                        <span><strong>HO??N TI???N 100%</strong><br>Ho??n ti???n 100% n???u kh??ch h??ng kh??ng h??i l??ng v??? s???n
                            ph???m</span>
                    </li>
                    <li>
                        <span><i class="fa fa-phone"></i></span>
                        <span><strong>??I???N THO???I H??? TR???</strong><br>
                            Hotline: 1900 98 68 29<br>
                        </span>
                    </li>
                </ul>
            </div>
            <div class="sidebar-local">
                <div class="sidebar-local-title">
                    <span>H??? TH??NG SI??U TH???</span>
                </div>
                    <ul>
						<li><span class="contact-intro"><i class="fa fa-phone"></i> ??T: 1900 98 68 29 - 0979 433 900</span></li>
						<li><span><i class="fa fa-map-marker"></i> ??C: 4-bis Ho??ng T??ng B??, p.Trung M??? T??y, Q.12, HCM </span></li>
						<li><span class="contact-intro"><i class="fa fa-phone"></i> ??T: 1900 98 68 29 - 0979 433 900</span></li>
						<li><span><i class="fa fa-map-marker"></i> ??C: 4-bis Ho??ng T??ng B??, p.Trung M??? T??y, Q.12, HCM </span></li>
					</ul>
            </div>
        </div>
</div>
</div>

<?php do_action('woocommerce_after_single_product');?>