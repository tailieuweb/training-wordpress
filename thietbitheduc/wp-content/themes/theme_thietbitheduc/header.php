<?php
   /**
    * The header for our theme
    *
    * This is the template that displays all of the <head> section and everything up until <div id="content">
    *
    * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
    *
    * @package thietbitheduc
    */
   
   ?>
<!doctype html>
<html <?php language_attributes(); ?>>
   <head>
      <meta charset="<?php bloginfo( 'charset' ); ?>">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="profile" href="https://gmpg.org/xfn/11">
      <?php wp_head(); ?>
   </head>
   <body <?php body_class(); ?>>
      <?php wp_body_open(); ?>
      <div id="page" class="site">
      <a class="skip-link screen-reader-text" href="#primary"><?php esc_html_e( 'Skip to content', 'thietbitheduc' ); ?></a>
      <section id="wpo-topbar" class="wpo-topbar clear">
         <div class="container">
         <div class="wrapper">
            <div class="ht-logo pull-left">
               <?php the_custom_logo(); ?> 
            </div>
            <div class="ht-tool pull-right">
               <div class="tool-top clear">
                  <div class="ht-hotline pull-left"><span>Miền Nam : </span><span><a href="tel:0834309399">083 123 123</a></span><span> - Hotline : </span><span><a href="#">123 123 123</a></span> </div>
                  <div class="ht-login pull-right">
                     <ul>
                        <li><a rel="nofollow" href="#"><i class="fa fa-sign-out"></i> Đăng nhập</a></li>
                        <li><a rel="nofollow" href="#"><i class="fa fa-user"></i> Đăng ký</a></li>
                     </ul>
                  </div>
               </div>
               <div class="search-cart clear">
                  <div class="ht-search pull-left"><?php echo get_product_search_form(true);?></div>
                  <div class="ht-cart pull-right">
                     <a rel="nofollow" href="http://localhost/thietbitheduc/gio-hang" class="link-cart" title="Giỏ hàng"><i class="fa fa-shopping-cart" aria-hidden="true"></i> <span class="txt">Giỏ hàng</span> <span class="numCart"><?php echo sprintf ( _n( '%d', '%d', WC()->cart->get_cart_contents_count() ), WC()->cart->get_cart_contents_count() ); ?></span></a>
                     <div class="clear"></div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <header id="masthead" class="site-header clear">
         <!-- 3. React to state changes -->
         <div class="site-header-menu">
            <div class="container">
              
               <div class="navigation-top pull-right">
                  <nav id="site-navigation" class="main-navigation" role="navigation">
                     <button class="menu-toggle" aria-controls="top-menu" aria-expanded="false">
                     <?php esc_html_e( 'Menu', 'theme_thietbitheduc' ); ?>
                     </button>
                     <?php
wp_nav_menu( array(
                        	'theme_location' => 'menu-1',
                        'menu_id'        => 'primary-menu',
                        ) );
                        ?>
                  </nav>
                  <!-- #site-navigation -->
               </div>
            </div>
         </div>
      </header>
      <!-- #masthead --> 
      <?php if ( is_front_page() ) { ?>
      <div id="slideshow" class="site-slider container">
         <div class="container2">
            <div class="row">
               <div class="col-md-12">
                
                  <?php dynamic_sidebar( 'slider' ); ?>
                
               </div>
            </div>
         </div>
      </div>
      <?php } ?>