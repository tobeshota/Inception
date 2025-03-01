<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

/** 「5分間インストール」を実行する
 * @see https://github.com/WordPress/WordPress/blob/master/wp-config-sample.php
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('DB_NAME') );

/** Database username */
define( 'DB_USER', getenv('DB_USER') );

/** Database password */
define( 'DB_PASSWORD', getenv('DB_PASSWORD') );

/** Database hostname */
define( 'DB_HOST', getenv('DB_HOST') );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', getenv('DB_CHARSET') );

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
define('AUTH_KEY',         '58o(57mzPno{sju5-<;Ka@:$O~kPp0&h/NMM.3J)^%?tZP6|_:F+l%)WoLKaB!mm');
define('SECURE_AUTH_KEY',  '[vV[~cID^p{r-.zDo}<2.^`0{y+j* D2Bz)6ydO(qNM?-E8n(f,{^}_RD@oPl^+l');
define('LOGGED_IN_KEY',    '0aS0d2M1c7XK,EPvgT~<;7p)^,CO[QN++7@UsM)HVM/B7`XXNH78zIPcfr}$LBwH');
define('NONCE_KEY',        'd%I[<lw8aUZTdt]YS^VO_G8LEaLcq)#TrUWUpr[6:/dubWGSDu(|SKOy^bxj_1HW');
define('AUTH_SALT',        'hf9gY 9 pp>Xa!>G>3V+fl2vaGXdgRj$3*4KpEBlV=3=Lr:60|T _I|sCf)+=p<;');
define('SECURE_AUTH_SALT', 'T0z[+79Gr}=}@Z}C +UA7002}[V|,41B2Qh/n(LQ+=cvcrd3#/eq.Phg)+!q6p=s');
define('LOGGED_IN_SALT',   '201t%+(=K%({2hcf(iF1@`7y$w2d_7];Ckvi^O&B:P_-gdlLMUjRUNDazroFIKM~');
define('NONCE_SALT',       'o-GH:+I-de$mp*pi+EDk>Fu|,<m2v/|Ax,KFa n%8-j+8weu{i7RB?2y1gd}C#NX');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 *
 * At the installation time, database tables are created with the specified prefix.
 * Changing this value after WordPress is installed will make your site think
 * it has not been installed.
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/#table-prefix
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
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
// define( 'WP_DEBUG', false );
define( 'WP_DEBUG', true );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
