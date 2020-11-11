<?php get_header(); ?>

<div id="main-content">
    <!-- Chỗ này để hiển thị posts hoặc page. -->
	<div class="post">
        <?php if (have_posts()) : while (have_posts()) : the_post(); ?>
		<div <?php post_class() ?> id="post-<?php the_ID(); ?>">
		<div class="entry-content">
		<?php
		the_content();

		wp_link_pages(
			array(
				'before' => '<div class="page-links">' . esc_html__( 'Pages:', 'lienminhhuyenthoai' ),
				'after'  => '</div>',
			)
		);
		?>
	</div><!-- .entry-content -->
		</div>
	<?php endwhile; endif; ?>
    </div>
</div>


<?php get_footer(); ?>