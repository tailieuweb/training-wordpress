<?php
/**
 * The template for displaying the footer
 *
 * Contains the closing of the #content div and all content after.
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package thietbitheduc
 */

?>

	<footer id="colophon" class="site-footer">
		<div class="site-info">
			<div class="container">

			
			<div class="row container clearfix">
				<div class="wpb_column col-sm-6 col-md-3">
					<div class="footer-content">
					<p class="title-footer">DỊCH VỤ KHÁCH HÀNG</p>
					<ul>
						<li>- Giao hàng trong vòng 24 h</li>
						<li>- Bảo hành tại nhà.</li>
						<li>- Bảo trì mãi mãi.</li>
						<li>- Tổng đài: 1900 98 68 29</li>
						<li>- ĐT: (0274) 65 45 657</li>
						<li>- Hotline: 0979 433 900</li>
					</ul>
					</div>
				</div>
				<div class="wpb_column col-sm-6 col-md-3">
				<div class="footer-content">
					<p class="title-footer">VỀ CHÚNG TÔI</p>
					<ul>
						<li><a href="#">- Trang chủ</a> </li>
						<li><a href="">- Về Chúng Tôi</a> </li>
						<li><a href="">- Thông Tin Ngân Hàng</a> </li>
						<li><a href="">- Liên Hệ</a> </li>
					</ul>
				</div>
				</div>
				<div class="wpb_column col-sm-6 col-md-3">
				<div class="footer-content">
					<p class="title-footer">CHÍNH SÁCH CHUNG</p>
					<ul>
						<li>- Mua hàng và thanh toán</li>
						<li>- Chính sách giao nhận</li>
						<li>- Quy định đổi trả</li>
						<li>- Quy định bảo hành</li>
						<li>- Trả góp qua thẻ tín dụng</li>
						<li>- Hướng dẫn mua hàng</li>
					</ul>
				</div>
				</div>
				<div class="wpb_column col-sm-6 col-md-3">
				<div class="footer-content">
					<p class="title-footer">THÔNG TIN LIÊN HỆ</p>
					<ul>
						<li><span class="contact-intro"><i class="fa fa-phone"></i> ĐT: 1900 98 68 29 - 0979 433 900</span></li>
						<li><span><i class="fa fa-map-marker"></i> ĐC: 4-bis Hoàng Tăng Bí, p.Trung Mỹ Tây, Q.12, HCM </span></li>
						<li><span class="contact-intro"><i class="fa fa-phone"></i> ĐT: 1900 98 68 29 - 0979 433 900</span></li>
						<li><span><i class="fa fa-map-marker"></i> ĐC: 4-bis Hoàng Tăng Bí, p.Trung Mỹ Tây, Q.12, HCM </span></li>
					</ul>
				</div>
				</div>
			</div>
			</div>
			<div class="copy-right">
			<a href="<?php echo esc_url( __( 'https://wordpress.org/', 'thietbitheduc' ) ); ?>">
				<?php
				/* translators: %s: CMS name, i.e. WordPress. */
				printf( esc_html__( 'Proudly powered by %s', 'thietbitheduc' ), 'WordPress' );
				?>
			</a>
			<span class="sep"> | </span>
				<?php
				/* translators: 1: Theme name, 2: Theme author. */
				printf( esc_html__( 'Theme: %1$s by %2$s.', 'thietbitheduc' ), 'thietbitheduc', '<a href="http://underscores.me/">Underscores.me</a>' );
				?>
			</div>
			
		</div><!-- .site-info -->
	</footer><!-- #colophon -->
</div><!-- #page -->

<?php wp_footer(); ?>

</body>
</html>