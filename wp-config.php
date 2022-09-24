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
define( 'AUTH_KEY',         'iV$Csft&KJ;EL:v<L(u;o^hb@rzh,G]!34qnlft@=Jk3z5j=~O wLK|5nGa3otY3' );
define( 'SECURE_AUTH_KEY',  'O-N7a&6>/!Gei!u4=6 H/6]>HPT/{uJe)}3i-g$%#~@nd] J*A8R,_eZ~zPctIOZ' );
define( 'LOGGED_IN_KEY',    '>}S-&OW*GU5Bu^9s/L?8BzO:xqcF:D(UI&$F]{ZgFw2tSAz<FIJEv8rMQ5ySn8V+' );
define( 'NONCE_KEY',        'y[Nl9g#Ux%N-IOE,14PnITW!ZwU[Xmcl;ifc 3hbcR4EhL5j!|& Q Z2lkjtO6gy' );
define( 'AUTH_SALT',        'F.AO};1ou51q2C gsR{QUv9W!@2|}9_q}Mfb2i8y F>2ySV9>KA>[`SvTiCtK@yG' );
define( 'SECURE_AUTH_SALT', 'Zdh/m:U>v+RK/jL}mxXJmn[u@G_u)xR~cD,}2OS(?rtba5TIo(ya6cH$qOMeNCiy' );
define( 'LOGGED_IN_SALT',   'i/H{k>]j%pl?R<|_TM6OID^S:QTWGvquuVNgSPeLp1^l{!{G(aQ}Ul4wFbPLz7(7' );
define( 'NONCE_SALT',       '{<-%;<_C}Rh:-^mri8z7=jt{a8/q<|I:3wH3I:4N-(v/2SF; 1;<DlT5&Sa-2|lX' );

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
