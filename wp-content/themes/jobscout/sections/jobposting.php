<?php
/**
 * Job Posting Section
 *
 * @package JobScout
 */

$job_title         = get_theme_mod( 'job_posting_section_title', __( 'Job Posting', 'jobscout' ) );
$ed_jobposting     = get_theme_mod( 'ed_jobposting', true );
$count_posts       = wp_count_posts('job_listing');

if ( $ed_jobposting && jobscout_is_wp_job_manager_activated() && $job_title  ) {
    ?>
    <div class="pds-intro">
        <?php
        $has_widget_subcribe = is_active_sidebar('footer-intro');
        if ($has_widget_subcribe) {
            dynamic_sidebar('footer-intro');
        }
        ?>
    </div>
    <div id="acc-content"><!-- .site-header -->
        <div id="content" class="site-content">
            <div class="container">

                <div id="primary" class="content-area">
                    <main id="main" class="site-main">
                        <article id="post-10" class="post-10 page type-page status-publish hentry">
                            <header class="entry-header">
                            <h1 class="entry-title" style="text-align: center;">TÌM KIẾM CÔNG VIỆC</h1>
                            </header>
                            <div class="entry-content" itemprop="text">
                            <?php
                            /**
                             * Content
                             *
                             * @hooked jobscout_content_start
                             */
                            echo do_shortcode('[jobs]');
                            ?>
                            </div>
                        </article>
                    </main>
                </div>
            </div>
        </div>
    </div>


    <?php
}