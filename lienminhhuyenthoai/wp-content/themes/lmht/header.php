<!DOCTYPE html>
<!--[if IE 8]> <html <?php language_attributes(); ?> class="ie8"> <![endif]-->
<!--[if !IE]> <html <?php language_attributes(); ?>> <![endif]-->
 
<head>
        <meta charset="<?php bloginfo( 'charset' ); ?>" />
        <link rel="profile" href="http://gmgp.org/xfn/11" />
        <link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>" />
 
        <?php wp_head(); ?>
</head>
 
<body <?php body_class(); ?> > <!--Thêm class tượng trưng cho mỗi trang lên <body> để tùy biến-->
<header id="topheader" class="clearfix">
        <div id="header-content">
            <div id="main-navigation">
               
                <?php
                        wp_nav_menu(
                        	array(	
                        		'menu_id'        => 'primary-menu',
                        	)
                        );
                        ?>
                
            </div>
            <div id="groupButtonTop">
                <a href="http://taigame.lienminh.garena.vn">Tải Game</a>
                <a href="http://platform.garena.vn/register/">Đăng ký</a>
            </div>
        </div>
</header>  