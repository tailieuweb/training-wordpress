<?php
/**
 * Template part for displaying page content in page.php
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package JobScout
 */

?>

<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<?php

         if (is_page('gioi-thieu') || is_page('lien-he')) {?>
             <header class="entry-header">
                 <figure class="post-thumbnail">
                     <?php the_post_thumbnail( 'jobscout-single-fullwidth', array( 'itemprop' => 'image' ) ); ?>
                 </figure>
                 <?php the_title( '<h1 class="entry-title">', '</h1>' ) ?>
             </header>
         <?php } else {
             /**
              *
              * @hooked jobscout_entry_header - 10
              * @hooked jobscout_post_thumbnail - 15
              */
             do_action( 'jobscout_before_page_entry_content' );
         }
        /**
         * Entry Content
         *
         * @hooked jobscout_entry_content - 15
         * @hooked jobscout_entry_footer  - 20
         */
        do_action( 'jobscout_page_entry_content' );

    ?>
</article><!-- #post-<?php the_ID(); ?> -->
