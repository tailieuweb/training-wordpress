<?php
/**
 * thietbitheduc functions and definitions
 *
 * @link https://developer.wordpress.org/themes/basics/theme-functions/
 *
 * @package thietbitheduc
 */

if ( ! defined( '_S_VERSION' ) ) {
	// Replace the version number of the theme on each release.
	define( '_S_VERSION', '1.0.0' );
}

if ( ! function_exists( 'thietbitheduc_setup' ) ) :
	/**
	 * Sets up theme defaults and registers support for various WordPress features.
	 *
	 * Note that this function is hooked into the after_setup_theme hook, which
	 * runs before the init hook. The init hook is too late for some features, such
	 * as indicating support for post thumbnails.
	 */
	function thietbitheduc_setup() {
		/*
		 * Make theme available for translation.
		 * Translations can be filed in the /languages/ directory.
		 * If you're building a theme based on thietbitheduc, use a find and replace
		 * to change 'thietbitheduc' to the name of your theme in all the template files.
		 */
		load_theme_textdomain( 'thietbitheduc', get_template_directory() . '/languages' );

		// Add default posts and comments RSS feed links to head.
		add_theme_support( 'automatic-feed-links' );

		/*
		 * Let WordPress manage the document title.
		 * By adding theme support, we declare that this theme does not use a
		 * hard-coded <title> tag in the document head, and expect WordPress to
		 * provide it for us.
		 */
		add_theme_support( 'title-tag' );

		/*
		 * Enable support for Post Thumbnails on posts and pages.
		 *
		 * @link https://developer.wordpress.org/themes/functionality/featured-images-post-thumbnails/
		 */
		add_theme_support( 'post-thumbnails' );

		// This theme uses wp_nav_menu() in one location.
		register_nav_menus(
			array(
				'menu-1' => esc_html__( 'Primary', 'thietbitheduc' ),
			)
		);

		/*
		 * Switch default core markup for search form, comment form, and comments
		 * to output valid HTML5.
		 */
		add_theme_support(
			'html5',
			array(
				'search-form',
				'comment-form',
				'comment-list',
				'gallery',
				'caption',
				'style',
				'script',
			)
		);

		// Set up the WordPress core custom background feature.
		add_theme_support(
			'custom-background',
			apply_filters(
				'thietbitheduc_custom_background_args',
				array(
					'default-color' => 'ffffff',
					'default-image' => '',
				)
			)
		);

		// Add theme support for selective refresh for widgets.
		add_theme_support( 'customize-selective-refresh-widgets' );

		/**
		 * Add support for core custom logo.
		 *
		 * @link https://codex.wordpress.org/Theme_Logo
		 */
		add_theme_support(
			'custom-logo',
			array(
				'height'      => 250,
				'width'       => 250,
				'flex-width'  => true,
				'flex-height' => true,
			)
		);
	}
endif;
add_action( 'after_setup_theme', 'thietbitheduc_setup' );

/**
 * Set the content width in pixels, based on the theme's design and stylesheet.
 *
 * Priority 0 to make it available to lower priority callbacks.
 *
 * @global int $content_width
 */
function thietbitheduc_content_width() {
	$GLOBALS['content_width'] = apply_filters( 'thietbitheduc_content_width', 640 );
}
add_action( 'after_setup_theme', 'thietbitheduc_content_width', 0 );

/**
 * Register widget area.
 *
 * @link https://developer.wordpress.org/themes/functionality/sidebars/#registering-a-sidebar
 */
function thietbitheduc_widgets_init() {
	register_sidebar(
		array(
			'name'          => esc_html__( 'Sidebar', 'thietbitheduc' ),
			'id'            => 'sidebar-1',
			'description'   => esc_html__( 'Add widgets here.', 'thietbitheduc' ),
			'before_widget' => '<section id="%1$s" class="widget %2$s">',
			'after_widget'  => '</section>',
			'before_title'  => '<h2 class="widget-title">',
			'after_title'   => '</h2>',
		)
	);
}
add_action( 'widgets_init', 'thietbitheduc_widgets_init' );

/**
 * Enqueue scripts and styles.
 */
function thietbitheduc_scripts() {
	wp_enqueue_style( 'thietbitheduc-style', get_stylesheet_uri(), array(), _S_VERSION );
	wp_style_add_data( 'thietbitheduc-style', 'rtl', 'replace' );

	wp_enqueue_script( 'thietbitheduc-navigation', get_template_directory_uri() . '/js/navigation.js', array(), _S_VERSION, true );

	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
		wp_enqueue_script( 'comment-reply' );
	}
}
add_action( 'wp_enqueue_scripts', 'thietbitheduc_scripts' );

/**
 * Implement the Custom Header feature.
 */
require get_template_directory() . '/inc/custom-header.php';

/**
 * Custom template tags for this theme.
 */
require get_template_directory() . '/inc/template-tags.php';

/**
 * Functions which enhance the theme by hooking into WordPress.
 */
require get_template_directory() . '/inc/template-functions.php';

/**
 * Customizer additions.
 */
require get_template_directory() . '/inc/customizer.php';

/**
 * Load Jetpack compatibility file.
 */
if ( defined( 'JETPACK__VERSION' ) ) {
	require get_template_directory() . '/inc/jetpack.php';
}

wp_enqueue_style ('theme-bootstrap', get_template_directory_uri().'/css/bootstrap.min.css');
wp_enqueue_script( 'script', get_template_directory_uri() . '/js/bootstrap.min.js', array ( 'jquery' ), 1.1, true);
wp_enqueue_style ('font-as', 'https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css');


function theme_thietbitheduc_widgets_init() {
	register_sidebar( array(
		'name'          => __( 'Slider', 'theme_thietbitheduc' ),
		'id'            => 'slider',
		'description'   => __( 'Add widgets here to appear in posts and archive pages.', 'htmarketofficial' ),
		'before_widget' => '<section id="%1$s" class="widget %2$s">',
		'after_widget'  => '</section>',
	) ); 
}
add_action( 'widgets_init', 'theme_thietbitheduc_widgets_init' );


/*
 * change sale flash text
 * Author: https://levantoan.com
 */
add_filter('woocommerce_sale_flash','devvn_woocommerce_sale_flash', 10, 3);
function devvn_woocommerce_sale_flash($text, $post, $product){
    ob_start();
    $sale_price = get_post_meta( $product->get_id(), '_price', true);
    $regular_price = get_post_meta( $product->get_id(), '_regular_price', true);
    if (empty($regular_price) && $product->is_type( 'variable' )){
        $available_variations = $product->get_available_variations();
        $variation_id = $available_variations[0]['variation_id'];
        $variation = new WC_Product_Variation( $variation_id );
        $regular_price = $variation ->regular_price;
        $sale_price = $variation ->sale_price;
    }
    $sale = ceil(( ($regular_price - $sale_price) / $regular_price ) * 100);
    if ( !empty( $regular_price ) && !empty( $sale_price ) && $regular_price > $sale_price ) :
        $R = floor((255*$sale)/100);
        $G = floor((255*(100-$sale))/100);
        $bg_style = 'background:none;background-color: rgb(' . $R . ',' . $G . ',0);';
        echo apply_filters( 'devvn_woocommerce_sale_flash', '<span class="onsale" style="'. $bg_style .'">-' . $sale . '%</span>', $post, $product );
    endif;
	return ob_get_clean();
	
}

