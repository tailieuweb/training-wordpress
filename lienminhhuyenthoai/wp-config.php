<?php
/**
 * Cấu hình cơ bản cho WordPress
 *
 * Trong quá trình cài đặt, file "wp-config.php" sẽ được tạo dựa trên nội dung 
 * mẫu của file này. Bạn không bắt buộc phải sử dụng giao diện web để cài đặt, 
 * chỉ cần lưu file này lại với tên "wp-config.php" và điền các thông tin cần thiết.
 *
 * File này chứa các thiết lập sau:
 *
 * * Thiết lập MySQL
 * * Các khóa bí mật
 * * Tiền tố cho các bảng database
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** Thiết lập MySQL - Bạn có thể lấy các thông tin này từ host/server ** //
/** Tên database MySQL */
define( 'DB_NAME', 'lmht' );

/** Username của database */
define( 'DB_USER', 'root' );

/** Mật khẩu của database */
define( 'DB_PASSWORD', '' );

/** Hostname của database */
define( 'DB_HOST', 'localhost' );

/** Database charset sử dụng để tạo bảng database. */
define( 'DB_CHARSET', 'utf8mb4' );

/** Kiểu database collate. Đừng thay đổi nếu không hiểu rõ. */
define('DB_COLLATE', '');

/**#@+
 * Khóa xác thực và salt.
 *
 * Thay đổi các giá trị dưới đây thành các khóa không trùng nhau!
 * Bạn có thể tạo ra các khóa này bằng công cụ
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * Bạn có thể thay đổi chúng bất cứ lúc nào để vô hiệu hóa tất cả
 * các cookie hiện có. Điều này sẽ buộc tất cả người dùng phải đăng nhập lại.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'B8.T ou$:p-H-@u-Zr=N-)ueaL{0jbVjxkH*:)bJe{2knSlqL77x@c}C?F}!sV4/' );
define( 'SECURE_AUTH_KEY',  '(Ire~<9+d }._sKUdk0()$nkEvZ?ck|!#?2}Jez*mKtVL*OCya)maYxHa1crkCy~' );
define( 'LOGGED_IN_KEY',    'm~`:Z2Q&eEvn[D{Ne L(H%JXk0jDL/Z}<6I*A>`Q?JV~==,dcl6]#2iEJq0]%v%2' );
define( 'NONCE_KEY',        'C6-.4hx8 MpXM1!xhzk+f)7g=mqNzjx;:FX9S::~597G*ocz2y b!XQW/,(X5<p2' );
define( 'AUTH_SALT',        'fy%SqPDTDc]*([~!u$z;r%:mr(6IS1a?r67X2@QlsIDVJa$!L<JNKRdaNg.:vf@o' );
define( 'SECURE_AUTH_SALT', '!K1gR0ob|l^y;Yt 4Wjx}qwq?ot/bFkil3IB{ncgGZNe-M?$gE%]*@:-t%mMq,K|' );
define( 'LOGGED_IN_SALT',   '(+m]Jvl}J;}4rg44z_x`Q-h3`&jqO5m zenNj1>8vjzsvw!M3]z0&z?@,>D8?`rU' );
define( 'NONCE_SALT',       'Afl3:Ep06=5BC_u`@5W9:iC=OlD`+Jca}r;^W)+ooCyQ7Gu)`Y PB3S`Fh}iiw#$' );

/**#@-*/

/**
 * Tiền tố cho bảng database.
 *
 * Đặt tiền tố cho bảng giúp bạn có thể cài nhiều site WordPress vào cùng một database.
 * Chỉ sử dụng số, ký tự và dấu gạch dưới!
 */
$table_prefix = 'wp_';

/**
 * Dành cho developer: Chế độ debug.
 *
 * Thay đổi hằng số này thành true sẽ làm hiện lên các thông báo trong quá trình phát triển.
 * Chúng tôi khuyến cáo các developer sử dụng WP_DEBUG trong quá trình phát triển plugin và theme.
 *
 * Để có thông tin về các hằng số khác có thể sử dụng khi debug, hãy xem tại Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* Đó là tất cả thiết lập, ngưng sửa từ phần này trở xuống. Chúc bạn viết blog vui vẻ. */

/** Đường dẫn tuyệt đối đến thư mục cài đặt WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Thiết lập biến và include file. */
require_once(ABSPATH . 'wp-settings.php');
