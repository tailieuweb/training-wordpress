<?php
/**
 * Single job listing.
 *
 * This template can be overridden by copying it to yourtheme/job_manager/content-single-job_listing.php.
 *
 * @see         https://wpjobmanager.com/document/template-overrides/
 * @author      Automattic
 * @package     wp-job-manager
 * @category    Template
 * @since       1.0.0
 * @version     1.37.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly.
}

global $post;

if ( job_manager_user_can_view_job_listing( $post->ID ) ) : ?>
	<div class="single_job_listing">
		<?php if ( get_option( 'job_manager_hide_expired_content', 1 ) && 'expired' === $post->post_status ) : ?>
			<div class="job-manager-info"><?php _e( 'This listing has expired.', 'wp-job-manager' ); ?></div>
		<?php else : ?>
            <div class="job-detail-meta">
                <div class="col-1">
                    <?php get_job_manager_template( 'content-single-job_listing-company.php', [] ); ?>
                </div>
                <div class="col-2">
                    <h1 class="job-title"><?php the_title(); ?></h1>
                     <span class="created_at">Ngày tạo: <?php echo the_time('d-m-Y', $post->post_date) ?></span>
                    <?php get_job_manager_template( 'content-single-job_listing-meta.php', [] ); ?>
                </div>
                <div class="col-3">
                    [addthis tool="addthis_inline_share_toolbox_2ptb"]
                    <?php if ( candidates_can_apply() ) : ?>
                    <div class="job_application application">
                        <input type="button" class="application_button button" value="Ứng tuyển">
                    </div>
                    <?php endif; ?>
                </div>
            </div>


			<div class="job_description">
				<?php wpjm_the_job_description(); ?>
			</div>


			<?php
				/**
				 * single_job_listing_end hook
				 */
				do_action( 'single_job_listing_end' );
			?>
		<?php endif; ?>
	</div>
<?php else : ?>

	<?php get_job_manager_template_part( 'access-denied', 'single-job_listing' ); ?>

<?php endif; ?>
