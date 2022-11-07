<?php
/**
 * The template for displaying 404 pages (not found)
 *
 * @package JobScout
 */

get_header(); ?>

	<div id="primary" class="content-area">
		<main id="main" class="site-main">
			<section class="error-404 not-found">
				<div class="page-content">
                    <a class="btn-readmore btn-not-found-back" href="<?php echo esc_url( home_url( '/' ) ); ?>">Trang chủ</a>
                    <a class="btn-readmore btn-not-found-job" href="<?php echo esc_url( home_url( '/viec-lam' ) ); ?>">Việc làm</a>
				</div><!-- .page-content -->
			</section><!-- .error-404 -->
		</main><!-- #main -->
	</div><!-- #primary -->
<?php
get_footer();
