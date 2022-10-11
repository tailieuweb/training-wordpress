<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress_v602' );

/** Database username */
define( 'DB_USER', 'root' );

/** Database password */
define( 'DB_PASSWORD', '' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'cu]%pj~/<SYFu8JLf.vpEn!Ff u,U%Q[^Q=wjVv(@tcyttna/i?Bn6E}FScfj]$f' );
define( 'SECURE_AUTH_KEY',  '.U[>D dZa@qsOtv`qeIVB6B?h[NQ{!TD~3X=WO1EX!UdN>|p%eJcHWeX]~NDU%$[' );
define( 'LOGGED_IN_KEY',    '+Z9^xZ?pz<rzrgO]DlZY^7a-ou@:TVuF2SOR-:6-{9@0Hod3&THw{*@qM7g%fzau' );
define( 'NONCE_KEY',        'h5_;%:C6rojQ4Kw{4F86--$!aX<7)-LJQtsTLTy(Jm8v,-v_{tBh-:|N.=9l(Xkp' );
define( 'AUTH_SALT',        'uDRhXBY;LL);;C`^PP&/*6#&Gy2,N|ol/V+]^9(!Q>m+w|_DhuvE]og[}e)z(_K`' );
define( 'SECURE_AUTH_SALT', 'KWwn$wN;3^7h8S~ujhlJxuxhZ=,U;a=f>gP+5b/-S=qs%4dNu0UemNk*U{D:> -p' );
define( 'LOGGED_IN_SALT',   'C;,f?}*YWtW0:zQ!M5g|i84UeH-8f_%hNDuoK1HKNZK4bwQpjiw3G*BqCght|7Mp' );
define( 'NONCE_SALT',       '1@tqU{{.[^En:m^e2%#5jgz$7}8dqWufrKzu3_!%8!4t|nU{-0k@lP%O4u-;Fksx' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
