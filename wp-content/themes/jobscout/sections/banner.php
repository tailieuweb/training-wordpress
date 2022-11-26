<?php
/**
 * Banner Section
 *
 * @package JobScout
 */

$ed_banner         = get_theme_mod( 'ed_banner_section', true );
$banner_title      = get_theme_mod( 'banner_title', __( 'Nhiều công việc phù hợp với bạn', 'jobscout' ) );
$banner_subtitle   = get_theme_mod( 'banner_subtitle', __( 'Bí quyết đằng sau công ty của chúng tôi rất đơn giản: luôn đặt mình vào vị trí của nhân viên, khách hàng. Điều này cho phép chúng tôi nhìn thế giới qua đôi mắt của họ, dự đoán nhu cầu của họ và hiểu rõ hơn cảm xúc của họ', 'jobscout' ) );
$find_a_job_link   = get_option( 'job_manager_jobs_page_id', 0 );

if( $ed_banner && has_custom_header() ){ ?>
    <div id="banner-section" class="site-banner<?php if( has_header_video() ) echo esc_attr( ' video-banner' ); ?>">
        <div class="item">
            <?php the_custom_header_markup(); ?>
            <div class="banner-caption banner-caption-custom">
                <div class="container">
                    <div class="caption-inner">
                        <?php
                            if( $banner_title ) echo '<h2 class="title">' . esc_html( $banner_title ) . '</h2>';
                            if( $banner_subtitle ) echo '<div class="description">' . wpautop( wp_kses_post( $banner_subtitle ) ) . '</div>';
                        ?>
                        <div class="btn-form-page">
                            <a class="btn-ung-vien-dang-ky" href="/dang-tin-kiem-viec" >Ứng viên đăng ký</a>
                            <a class="btn-nha-tuyen-dung" href="/dang-ky-tuyen-dung" >採用を検討されている企業様はこちら</a>
                        </div>
                        <div class="form-wrap">
                            <div class="search-filter-wrap">
                            <?php
//                                if ( jobscout_is_wp_job_manager_activated() ) {
//                                    if( $find_a_job_link ){
//                                        get_template_part('template-parts/header','form');
//                                    }else{
//                                         get_search_form();
//                                    }
//                                }else{
//                                    get_search_form();
//                                }
                            ?>
                            </div>
                        </div>
<!--                        <div class="submit-job">-->
<!--                            <p>Hoặc</p>-->
<!--                            <a class="btn user-submit-job pum-trigger btn-secondary" href="#" style="cursor: pointer;">Đăng tìm việc</a>-->
<!--                        </div>-->
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php
}