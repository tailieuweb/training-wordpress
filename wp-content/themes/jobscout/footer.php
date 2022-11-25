<?php
/**
 * The template for displaying the footer
 *
 * Contains the closing of the #content div and all content after.
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package JobScout
 */

    /**
     * After Content
     *
     * @hooked jobscout_content_end - 20
    */
    do_action( 'jobscout_before_footer' );

    /**
     * Footer
     *
     * @hooked jobscout_footer_start  - 20
     * @hooked jobscout_footer_top    - 30
     * @hooked jobscout_footer_bottom - 40
     * @hooked jobscout_footer_end    - 50
    */
    do_action( 'jobscout_footer' );

    /**
     * After Footer
     *
     * @hooked jobscout_page_end    - 20
    */
    do_action( 'jobscout_after_footer' );

    wp_footer(); ?>


    <script type="text/javascript">
            jQuery( document ).ready(function() {
                if (jQuery('.job_application').length == 1) {
                    // Set job -url
                    var job_url = jQuery('.at-above-post').data('url');
                    jQuery('#url_job').val(job_url);

                    // Set job -title
                    var job_title = jQuery('.job-title').text();
                    jQuery('#job_title').val(job_title);
                }
            });
    </script>
</body>
</html>
