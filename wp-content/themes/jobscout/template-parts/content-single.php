<?php
/**
 * Template part for displaying posts
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package JobScout
 */

?>

<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<?php
        /**
         *
         * @hooked jobscout_entry_header - 10
         * @hooked jobscout_post_thumbnail - 15
        */
        //do_action( 'jobscout_before_single_post_entry_content' );
        ?>
        <div class='news-meta-info'>
            <div class="col-1">
                <?php jobscout_post_thumbnail() ?>
            </div>
            <div class="col-2">
                <?php  the_title( '<h1 class="entry-title">', '</h1>' ); ?>
                <span class="post-created-date">Ngày tạo: <?php jobscout_posted_on()?></span>
                <span class="post-category"><?php jobscout_category() ?></span>
            </div>
            <div class="col-3">
                Facebook button error-css
            </div>
        </div>
    <?php

        /**
         * @hooked jobscout_entry_content - 15
         * @hooked jobscout_entry_footer  - 20
        */
        do_action( 'jobscout_single_post_entry_content' );

    ?>
</article><!-- #post-<?php the_ID(); ?> -->
