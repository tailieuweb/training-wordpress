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
      <!-- Top Bar -->
      <div id="page" class="site">
      <section id="wpo-topbar" class="wpo-topbar clear">
         <div class="container">
         <div class="wrapper">
            <?php
               wp_nav_menu( array(
                   'theme_location' => 'menu_id'
               ) );
               ?>
         </div>
      </section>
      <!-- Header -->
      <header id="masthead" class="site-header clear">
         <div class="site-header-menu">
            <div class="container">
               <div class="logo"><a href="http://fit.tdc.edu.vn/"><?php the_custom_logo(); ?> </a>
                  <span class="tam-giac">&nbsp;</span>
               </div>
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
            </div>
         </div>
      </header>

      <?php if ( is_front_page() ) { ?>
      <div id="slideshow" class="site-slider">
            <div class="row">
               <div class="col-md-12">
                  <?php dynamic_sidebar( 'slider' ); ?>
               </div>
            </div>
      </div>     
      <?php } ?>