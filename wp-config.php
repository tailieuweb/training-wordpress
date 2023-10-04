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
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress_v631' );

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
define( 'AUTH_KEY',         'rXs-h2=N6Z}tI654O,-uk<=ALp*g7S_E{%xZ4]q*XM~PGCf,ek!o8u>q)Y;?/Py`' );
define( 'SECURE_AUTH_KEY',  'jiN<mV{/N)f1X!/ZX)^O6(_g>)=JogVc_fV+5f2=0xcYzEc230={,X/c3$z MLo:' );
define( 'LOGGED_IN_KEY',    'J~OF%5-.vwljl?Uc-CzFN~-]WyAr3Ry-MP1/;LzjUiGmN$zCPRA#/qpEfQx#GG4Z' );
define( 'NONCE_KEY',        '7?pV!2|Pu&]^o{a?+5BT#^LM1w?503W.]g4Zb)>MLpR;NnKP]W {il:%|*3|2flo' );
define( 'AUTH_SALT',        'u9Sblh%Frzb`D!)K*{1.sofRghY1S_yOTyMO@;%P]LPiw CA>w/He|c<6rj[:T83' );
define( 'SECURE_AUTH_SALT', '!xv{6ivUP(AJ!@=oXT&=C0~.=we{cL9JzKy#8:G`aJ2uYHF$0~,/<Ag4Rx~AsUL6' );
define( 'LOGGED_IN_SALT',   'j?sUUFY,zuUuq><aolJ$qP8ghKY;v1()R(okTv%41L/w>I`z]~-cD}I-E}f8,,dY' );
define( 'NONCE_SALT',       '%1ix]aV!)&BT6BFZH^r|?IzAIM>puEpjh6MMIS>Dzni}u/&9(,T8)aOcg#dF*A b' );

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
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
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
