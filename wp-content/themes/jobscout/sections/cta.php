<?php
/**
 * CTA Section
 *
 * @package JobScout
 */
if( is_active_sidebar( 'cta' ) ){ ?>
	<section id="cta-section" class="bg-cta-section bg-cta-section-custom">
	    <?php dynamic_sidebar( 'cta' ); ?>
	</section> <!-- .bg-cta-section -->
<?php
}