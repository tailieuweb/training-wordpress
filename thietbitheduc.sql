-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 03, 2020 lúc 08:14 AM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `thietbitheduc`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_actionscheduler_actions`
--

CREATE TABLE `wp_actionscheduler_actions` (
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `hook` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheduled_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `args` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `last_attempt_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `extended_args` varchar(8000) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_actionscheduler_actions`
--

INSERT INTO `wp_actionscheduler_actions` (`action_id`, `hook`, `status`, `scheduled_date_gmt`, `scheduled_date_local`, `args`, `schedule`, `group_id`, `attempts`, `last_attempt_gmt`, `last_attempt_local`, `claim_id`, `extended_args`) VALUES
(6, 'action_scheduler/migration_hook', 'complete', '2020-10-19 15:29:05', '2020-10-19 15:29:05', '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1603121345;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1603121345;}', 1, 1, '2020-10-19 15:29:13', '2020-10-19 15:29:13', 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_actionscheduler_claims`
--

CREATE TABLE `wp_actionscheduler_claims` (
  `claim_id` bigint(20) UNSIGNED NOT NULL,
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_actionscheduler_groups`
--

CREATE TABLE `wp_actionscheduler_groups` (
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_actionscheduler_groups`
--

INSERT INTO `wp_actionscheduler_groups` (`group_id`, `slug`) VALUES
(1, 'action-scheduler-migration');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_actionscheduler_logs`
--

CREATE TABLE `wp_actionscheduler_logs` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_actionscheduler_logs`
--

INSERT INTO `wp_actionscheduler_logs` (`log_id`, `action_id`, `message`, `log_date_gmt`, `log_date_local`) VALUES
(1, 6, 'hành động được tạo', '2020-10-19 15:28:05', '2020-10-19 15:28:05'),
(2, 6, 'action started via Async Request', '2020-10-19 15:29:13', '2020-10-19 15:29:13'),
(3, 6, 'action complete via Async Request', '2020-10-19 15:29:13', '2020-10-19 15:29:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Một người bình luận WordPress', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2020-10-19 15:19:58', '2020-10-19 15:19:58', 'Xin chào, đây là một bình luận\nĐể bắt đầu với quản trị bình luận, chỉnh sửa hoặc xóa bình luận, vui lòng truy cập vào khu vực Bình luận trong trang quản trị.\nAvatar của người bình luận sử dụng <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', 'comment', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/thietbitheduc', 'yes'),
(2, 'home', 'http://localhost/thietbitheduc', 'yes'),
(3, 'blogname', 'Thiết bị thể dục', 'yes'),
(4, 'blogdescription', 'Một trang web mới sử dụng WordPress', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'ringbackaround357@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j F, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'j F, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:156:{s:24:\"^wc-auth/v([1]{1})/(.*)?\";s:63:\"index.php?wc-auth-version=$matches[1]&wc-auth-route=$matches[2]\";s:22:\"^wc-api/v([1-3]{1})/?$\";s:51:\"index.php?wc-api-version=$matches[1]&wc-api-route=/\";s:24:\"^wc-api/v([1-3]{1})(.*)?\";s:61:\"index.php?wc-api-version=$matches[1]&wc-api-route=$matches[2]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:32:\"category/(.+?)/wc-api(/(.*))?/?$\";s:54:\"index.php?category_name=$matches[1]&wc-api=$matches[3]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:29:\"tag/([^/]+)/wc-api(/(.*))?/?$\";s:44:\"index.php?tag=$matches[1]&wc-api=$matches[3]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:56:\"danh-muc-san-pham/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:51:\"danh-muc-san-pham/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:32:\"danh-muc-san-pham/(.+?)/embed/?$\";s:44:\"index.php?product_cat=$matches[1]&embed=true\";s:44:\"danh-muc-san-pham/(.+?)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_cat=$matches[1]&paged=$matches[2]\";s:26:\"danh-muc-san-pham/(.+?)/?$\";s:33:\"index.php?product_cat=$matches[1]\";s:57:\"tu-khoa-san-pham/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:52:\"tu-khoa-san-pham/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:33:\"tu-khoa-san-pham/([^/]+)/embed/?$\";s:44:\"index.php?product_tag=$matches[1]&embed=true\";s:45:\"tu-khoa-san-pham/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_tag=$matches[1]&paged=$matches[2]\";s:27:\"tu-khoa-san-pham/([^/]+)/?$\";s:33:\"index.php?product_tag=$matches[1]\";s:40:\"sản phẩm/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:50:\"sản phẩm/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:70:\"sản phẩm/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"sản phẩm/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"sản phẩm/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:46:\"sản phẩm/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:29:\"sản phẩm/([^/]+)/embed/?$\";s:40:\"index.php?product=$matches[1]&embed=true\";s:33:\"sản phẩm/([^/]+)/trackback/?$\";s:34:\"index.php?product=$matches[1]&tb=1\";s:41:\"sản phẩm/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&paged=$matches[2]\";s:48:\"sản phẩm/([^/]+)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&cpage=$matches[2]\";s:38:\"sản phẩm/([^/]+)/wc-api(/(.*))?/?$\";s:48:\"index.php?product=$matches[1]&wc-api=$matches[3]\";s:44:\"sản phẩm/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:55:\"sản phẩm/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:37:\"sản phẩm/([^/]+)(?:/([0-9]+))?/?$\";s:46:\"index.php?product=$matches[1]&page=$matches[2]\";s:29:\"sản phẩm/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:39:\"sản phẩm/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:59:\"sản phẩm/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"sản phẩm/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"sản phẩm/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:35:\"sản phẩm/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:39:\"index.php?&page_id=30&cpage=$matches[1]\";s:17:\"wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:26:\"comments/wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:29:\"search/(.+)/wc-api(/(.*))?/?$\";s:42:\"index.php?s=$matches[1]&wc-api=$matches[3]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:32:\"author/([^/]+)/wc-api(/(.*))?/?$\";s:52:\"index.php?author_name=$matches[1]&wc-api=$matches[3]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:54:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:82:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc-api=$matches[5]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:41:\"([0-9]{4})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:66:\"index.php?year=$matches[1]&monthnum=$matches[2]&wc-api=$matches[4]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:28:\"([0-9]{4})/wc-api(/(.*))?/?$\";s:45:\"index.php?year=$matches[1]&wc-api=$matches[3]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:62:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/wc-api(/(.*))?/?$\";s:99:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&wc-api=$matches[6]\";s:62:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:73:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:25:\"(.?.+?)/wc-api(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&wc-api=$matches[3]\";s:28:\"(.?.+?)/order-pay(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&order-pay=$matches[3]\";s:33:\"(.?.+?)/order-received(/(.*))?/?$\";s:57:\"index.php?pagename=$matches[1]&order-received=$matches[3]\";s:25:\"(.?.+?)/orders(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&orders=$matches[3]\";s:29:\"(.?.+?)/view-order(/(.*))?/?$\";s:53:\"index.php?pagename=$matches[1]&view-order=$matches[3]\";s:28:\"(.?.+?)/downloads(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&downloads=$matches[3]\";s:31:\"(.?.+?)/edit-account(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-account=$matches[3]\";s:31:\"(.?.+?)/edit-address(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-address=$matches[3]\";s:34:\"(.?.+?)/payment-methods(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&payment-methods=$matches[3]\";s:32:\"(.?.+?)/lost-password(/(.*))?/?$\";s:56:\"index.php?pagename=$matches[1]&lost-password=$matches[3]\";s:34:\"(.?.+?)/customer-logout(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&customer-logout=$matches[3]\";s:37:\"(.?.+?)/add-payment-method(/(.*))?/?$\";s:61:\"index.php?pagename=$matches[1]&add-payment-method=$matches[3]\";s:40:\"(.?.+?)/delete-payment-method(/(.*))?/?$\";s:64:\"index.php?pagename=$matches[1]&delete-payment-method=$matches[3]\";s:45:\"(.?.+?)/set-default-payment-method(/(.*))?/?$\";s:69:\"index.php?pagename=$matches[1]&set-default-payment-method=$matches[3]\";s:31:\".?.+?/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\".?.+?/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '48748', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '30', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '25', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '1', 'yes'),
(93, 'initial_db_version', '44719', 'yes'),
(94, 'wp_user_roles', 'a:7:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:114:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:8:\"customer\";a:2:{s:4:\"name\";s:8:\"Customer\";s:12:\"capabilities\";a:1:{s:4:\"read\";b:1;}}s:12:\"shop_manager\";a:2:{s:4:\"name\";s:12:\"Shop manager\";s:12:\"capabilities\";a:92:{s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:4:\"read\";b:1;s:18:\"read_private_pages\";b:1;s:18:\"read_private_posts\";b:1;s:10:\"edit_posts\";b:1;s:10:\"edit_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:20:\"edit_published_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:17:\"edit_others_pages\";b:1;s:13:\"publish_posts\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_posts\";b:1;s:12:\"delete_pages\";b:1;s:20:\"delete_private_pages\";b:1;s:20:\"delete_private_posts\";b:1;s:22:\"delete_published_pages\";b:1;s:22:\"delete_published_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:19:\"delete_others_pages\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:17:\"moderate_comments\";b:1;s:12:\"upload_files\";b:1;s:6:\"export\";b:1;s:6:\"import\";b:1;s:10:\"list_users\";b:1;s:18:\"edit_theme_options\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;}}}', 'yes'),
(95, 'fresh_site', '0', 'yes'),
(96, 'WPLANG', 'vi', 'yes'),
(97, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_recent-posts', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_recent-comments', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'sidebars_widgets', 'a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:0:{}s:6:\"slider\";a:1:{i:0;s:13:\"custom_html-2\";}s:13:\"array_version\";i:3;}', 'yes'),
(103, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_custom_html', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:7:\"content\";s:1373:\"<div id=\"carouselExampleIndicators\" class=\"carousel slide\" data-ride=\"carousel\">\r\n  <ol class=\"carousel-indicators\">\r\n    <li data-target=\"#carouselExampleIndicators\" data-slide-to=\"0\" class=\"active\"></li>\r\n    <li data-target=\"#carouselExampleIndicators\" data-slide-to=\"1\"></li>\r\n    <li data-target=\"#carouselExampleIndicators\" data-slide-to=\"2\"></li>\r\n  </ol>\r\n  <div class=\"carousel-inner\">\r\n    <div class=\"carousel-item active\">\r\n      <img src=\"http://localhost/thietbitheduc/wp-content/uploads/2020/10/TRANG-CHU-1.jpg\" class=\"d-block w-100\" alt=\"#\">\r\n    </div>\r\n    <div class=\"carousel-item\">\r\n      <img src=\"http://localhost/thietbitheduc/wp-content/uploads/2020/10/TRANG-CHU-4.jpg\" class=\"d-block w-100\" alt=\"#\">\r\n    </div>\r\n    <div class=\"carousel-item\">\r\n      <img src=\"http://localhost/thietbitheduc/wp-content/uploads/2020/10/TRANG-CHU-7.jpg\" class=\"d-block w-100\" alt=\"#\">\r\n    </div>\r\n  </div>\r\n  <a class=\"carousel-control-prev\" href=\"#carouselExampleIndicators\" role=\"button\" data-slide=\"prev\">\r\n    <span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>\r\n    <span class=\"sr-only\">Previous</span>\r\n  </a>\r\n  <a class=\"carousel-control-next\" href=\"#carouselExampleIndicators\" role=\"button\" data-slide=\"next\">\r\n    <span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>\r\n    <span class=\"sr-only\">Next</span>\r\n  </a>\r\n</div>\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'cron', 'a:17:{i:1604386657;a:1:{s:26:\"action_scheduler_run_queue\";a:1:{s:32:\"0d04ed39571b55704c122d726248bbac\";a:3:{s:8:\"schedule\";s:12:\"every_minute\";s:4:\"args\";a:1:{i:0;s:7:\"WP Cron\";}s:8:\"interval\";i:60;}}}i:1604387999;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1604388117;a:1:{s:21:\"ai1wm_storage_cleanup\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1604388484;a:1:{s:33:\"wc_admin_process_orders_milestone\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1604388491;a:1:{s:29:\"wc_admin_unsnooze_admin_notes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1604388650;a:1:{s:32:\"woocommerce_cancel_unpaid_orders\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}}i:1604395682;a:1:{s:28:\"woocommerce_cleanup_sessions\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1604416799;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1604416843;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1604416846;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1604417086;a:2:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1604417285;a:1:{s:14:\"wc_admin_daily\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1604417292;a:2:{s:33:\"woocommerce_cleanup_personal_data\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:30:\"woocommerce_tracker_send_event\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1604417342;a:1:{s:25:\"woocommerce_geoip_updater\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:11:\"fifteendays\";s:4:\"args\";a:0:{}s:8:\"interval\";i:1296000;}}}i:1604428082;a:1:{s:24:\"woocommerce_cleanup_logs\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1604448000;a:1:{s:27:\"woocommerce_scheduled_sales\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(139, 'theme_mods_twentynineteen', 'a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1603120857;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}', 'yes'),
(140, 'current_theme', 'thietbitheduc', 'yes'),
(141, 'theme_mods_theme_thietbitheduc', 'a:5:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:6:\"menu-1\";i:23;}s:18:\"custom_css_post_id\";i:-1;s:11:\"custom_logo\";i:23;s:16:\"background_image\";s:0:\"\";}', 'yes'),
(142, 'theme_switched', '', 'yes'),
(144, 'auto_core_update_notified', 'a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:27:\"ringbackaround357@gmail.com\";s:7:\"version\";s:5:\"5.1.6\";s:9:\"timestamp\";i:1603120870;}', 'no'),
(148, 'admin_email_lifespan', '1604556393', 'yes'),
(149, 'disallowed_keys', '', 'no'),
(150, 'comment_previously_approved', '1', 'yes'),
(151, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(152, 'finished_updating_comment_type', '1', 'yes'),
(153, 'db_upgraded', '', 'yes'),
(157, 'recovery_keys', 'a:0:{}', 'yes'),
(160, 'can_compress_scripts', '1', 'no'),
(169, 'action_scheduler_hybrid_store_demarkation', '5', 'yes'),
(170, 'schema-ActionScheduler_StoreSchema', '3.0.1603121278', 'yes'),
(171, 'schema-ActionScheduler_LoggerSchema', '2.0.1603121278', 'yes'),
(174, 'woocommerce_schema_version', '430', 'yes'),
(175, 'woocommerce_store_address', 'Cao Đẳng công nghệ Thủ Đức, phường Linh Chiểu, Thủ Đức, TP.HCM', 'yes'),
(176, 'woocommerce_store_address_2', '', 'yes'),
(177, 'woocommerce_store_city', 'Tp. Hồ Chí Minh', 'yes'),
(178, 'woocommerce_default_country', 'VN', 'yes'),
(179, 'woocommerce_store_postcode', '71200', 'yes'),
(180, 'woocommerce_allowed_countries', 'all', 'yes'),
(181, 'woocommerce_all_except_countries', 'a:0:{}', 'yes'),
(182, 'woocommerce_specific_allowed_countries', 'a:0:{}', 'yes'),
(183, 'woocommerce_ship_to_countries', '', 'yes'),
(184, 'woocommerce_specific_ship_to_countries', 'a:0:{}', 'yes'),
(185, 'woocommerce_default_customer_address', 'base', 'yes'),
(186, 'woocommerce_calc_taxes', 'no', 'yes'),
(187, 'woocommerce_enable_coupons', 'yes', 'yes'),
(188, 'woocommerce_calc_discounts_sequentially', 'no', 'no'),
(189, 'woocommerce_currency', 'VND', 'yes'),
(190, 'woocommerce_currency_pos', 'right', 'yes'),
(191, 'woocommerce_price_thousand_sep', '.', 'yes'),
(192, 'woocommerce_price_decimal_sep', ',', 'yes'),
(193, 'woocommerce_price_num_decimals', '1', 'yes'),
(194, 'woocommerce_shop_page_id', '6', 'yes'),
(195, 'woocommerce_cart_redirect_after_add', 'no', 'yes'),
(196, 'woocommerce_enable_ajax_add_to_cart', 'no', 'yes'),
(197, 'woocommerce_placeholder_image', '5', 'yes'),
(198, 'woocommerce_weight_unit', 'kg', 'yes'),
(199, 'woocommerce_dimension_unit', 'cm', 'yes'),
(200, 'woocommerce_enable_reviews', 'no', 'yes'),
(201, 'woocommerce_review_rating_verification_label', 'yes', 'no'),
(202, 'woocommerce_review_rating_verification_required', 'no', 'no'),
(203, 'woocommerce_enable_review_rating', 'yes', 'yes'),
(204, 'woocommerce_review_rating_required', 'yes', 'no'),
(205, 'woocommerce_manage_stock', 'yes', 'yes'),
(206, 'woocommerce_hold_stock_minutes', '60', 'no'),
(207, 'woocommerce_notify_low_stock', 'yes', 'no'),
(208, 'woocommerce_notify_no_stock', 'yes', 'no'),
(209, 'woocommerce_stock_email_recipient', 'ringbackaround357@gmail.com', 'no'),
(210, 'woocommerce_notify_low_stock_amount', '2', 'no'),
(211, 'woocommerce_notify_no_stock_amount', '0', 'yes'),
(212, 'woocommerce_hide_out_of_stock_items', 'no', 'yes'),
(213, 'woocommerce_stock_format', '', 'yes'),
(214, 'woocommerce_file_download_method', 'force', 'no'),
(215, 'woocommerce_downloads_require_login', 'no', 'no'),
(216, 'woocommerce_downloads_grant_access_after_payment', 'yes', 'no'),
(217, 'woocommerce_downloads_add_hash_to_filename', 'yes', 'yes'),
(218, 'woocommerce_prices_include_tax', 'no', 'yes'),
(219, 'woocommerce_tax_based_on', 'shipping', 'yes'),
(220, 'woocommerce_shipping_tax_class', 'inherit', 'yes'),
(221, 'woocommerce_tax_round_at_subtotal', 'no', 'yes'),
(222, 'woocommerce_tax_classes', '', 'yes'),
(223, 'woocommerce_tax_display_shop', 'excl', 'yes'),
(224, 'woocommerce_tax_display_cart', 'excl', 'yes'),
(225, 'woocommerce_price_display_suffix', '', 'yes'),
(226, 'woocommerce_tax_total_display', 'itemized', 'no'),
(227, 'woocommerce_enable_shipping_calc', 'yes', 'no'),
(228, 'woocommerce_shipping_cost_requires_address', 'no', 'yes'),
(229, 'woocommerce_ship_to_destination', 'billing', 'no'),
(230, 'woocommerce_shipping_debug_mode', 'no', 'yes'),
(231, 'woocommerce_enable_guest_checkout', 'yes', 'no'),
(232, 'woocommerce_enable_checkout_login_reminder', 'no', 'no'),
(233, 'woocommerce_enable_signup_and_login_from_checkout', 'no', 'no'),
(234, 'woocommerce_enable_myaccount_registration', 'no', 'no'),
(235, 'woocommerce_registration_generate_username', 'yes', 'no'),
(236, 'woocommerce_registration_generate_password', 'yes', 'no'),
(237, 'woocommerce_erasure_request_removes_order_data', 'no', 'no'),
(238, 'woocommerce_erasure_request_removes_download_data', 'no', 'no'),
(239, 'woocommerce_allow_bulk_remove_personal_data', 'no', 'no'),
(240, 'woocommerce_registration_privacy_policy_text', 'Thông tin cá nhân của bạn sẽ được sử dụng để tăng trải nghiệm sử dụng website, quản lý truy cập vào tài khoản của bạn, và cho các mục đích cụ thể khác được mô tả trong [privacy_policy].', 'yes'),
(241, 'woocommerce_checkout_privacy_policy_text', 'Thông tin cá nhân của bạn sẽ được sử dụng để xử lý đơn hàng, tăng trải nghiệm sử dụng website, và cho các mục đích cụ thể khác đã được mô tả trong [privacy_policy].', 'yes'),
(242, 'woocommerce_delete_inactive_accounts', 'a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}', 'no'),
(243, 'woocommerce_trash_pending_orders', '', 'no'),
(244, 'woocommerce_trash_failed_orders', '', 'no'),
(245, 'woocommerce_trash_cancelled_orders', '', 'no'),
(246, 'woocommerce_anonymize_completed_orders', 'a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}', 'no'),
(247, 'woocommerce_email_from_name', 'Thiết bị thể dục', 'no'),
(248, 'woocommerce_email_from_address', 'ringbackaround357@gmail.com', 'no'),
(249, 'woocommerce_email_header_image', '', 'no'),
(250, 'woocommerce_email_footer_text', '{site_title} &mdash; Built with {WooCommerce}', 'no'),
(251, 'woocommerce_email_base_color', '#96588a', 'no'),
(252, 'woocommerce_email_background_color', '#f7f7f7', 'no'),
(253, 'woocommerce_email_body_background_color', '#ffffff', 'no'),
(254, 'woocommerce_email_text_color', '#3c3c3c', 'no'),
(255, 'woocommerce_cart_page_id', '7', 'no'),
(256, 'woocommerce_checkout_page_id', '8', 'no'),
(257, 'woocommerce_myaccount_page_id', '9', 'no'),
(258, 'woocommerce_terms_page_id', '', 'no'),
(259, 'woocommerce_force_ssl_checkout', 'no', 'yes'),
(260, 'woocommerce_unforce_ssl_checkout', 'no', 'yes'),
(261, 'woocommerce_checkout_pay_endpoint', 'order-pay', 'yes'),
(262, 'woocommerce_checkout_order_received_endpoint', 'order-received', 'yes'),
(263, 'woocommerce_myaccount_add_payment_method_endpoint', 'add-payment-method', 'yes'),
(264, 'woocommerce_myaccount_delete_payment_method_endpoint', 'delete-payment-method', 'yes'),
(265, 'woocommerce_myaccount_set_default_payment_method_endpoint', 'set-default-payment-method', 'yes'),
(266, 'woocommerce_myaccount_orders_endpoint', 'orders', 'yes'),
(267, 'woocommerce_myaccount_view_order_endpoint', 'view-order', 'yes'),
(268, 'woocommerce_myaccount_downloads_endpoint', 'downloads', 'yes'),
(269, 'woocommerce_myaccount_edit_account_endpoint', 'edit-account', 'yes'),
(270, 'woocommerce_myaccount_edit_address_endpoint', 'edit-address', 'yes'),
(271, 'woocommerce_myaccount_payment_methods_endpoint', 'payment-methods', 'yes'),
(272, 'woocommerce_myaccount_lost_password_endpoint', 'lost-password', 'yes'),
(273, 'woocommerce_logout_endpoint', 'customer-logout', 'yes'),
(274, 'woocommerce_api_enabled', 'no', 'yes'),
(275, 'woocommerce_allow_tracking', 'yes', 'no'),
(276, 'woocommerce_show_marketplace_suggestions', 'yes', 'no'),
(277, 'woocommerce_single_image_width', '600', 'yes'),
(278, 'woocommerce_thumbnail_image_width', '300', 'yes'),
(279, 'woocommerce_checkout_highlight_required_fields', 'yes', 'yes'),
(280, 'woocommerce_demo_store', 'no', 'no'),
(281, 'woocommerce_permalinks', 'a:5:{s:12:\"product_base\";s:12:\"sản phẩm\";s:13:\"category_base\";s:17:\"danh-muc-san-pham\";s:8:\"tag_base\";s:16:\"tu-khoa-san-pham\";s:14:\"attribute_base\";s:0:\"\";s:22:\"use_verbose_page_rules\";b:0;}', 'yes'),
(282, 'current_theme_supports_woocommerce', 'no', 'yes'),
(283, 'woocommerce_queue_flush_rewrite_rules', 'no', 'yes'),
(286, 'default_product_cat', '15', 'yes'),
(289, 'woocommerce_version', '4.6.0', 'yes'),
(290, 'woocommerce_db_version', '4.6.0', 'yes'),
(293, 'recently_activated', 'a:0:{}', 'yes'),
(294, 'action_scheduler_lock_async-request-runner', '1604385123', 'yes'),
(295, 'woocommerce_admin_notices', 'a:1:{i:0;s:20:\"no_secure_connection\";}', 'yes'),
(296, 'woocommerce_maxmind_geolocation_settings', 'a:1:{s:15:\"database_prefix\";s:32:\"XcjJsSQ7COhiP1iQzmHoVoWe83T9sESk\";}', 'yes'),
(298, 'widget_woocommerce_widget_cart', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(299, 'widget_woocommerce_layered_nav_filters', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(300, 'widget_woocommerce_layered_nav', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(301, 'widget_woocommerce_price_filter', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(302, 'widget_woocommerce_product_categories', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(303, 'widget_woocommerce_product_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(304, 'widget_woocommerce_product_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(305, 'widget_woocommerce_products', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(306, 'widget_woocommerce_recently_viewed_products', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(307, 'widget_woocommerce_top_rated_products', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(308, 'widget_woocommerce_recent_reviews', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(309, 'widget_woocommerce_rating_filter', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(312, 'woocommerce_admin_version', '1.6.1', 'yes'),
(313, 'woocommerce_admin_install_timestamp', '1603121285', 'yes'),
(317, 'wc_admin_note_home_screen_feedback_homescreen_accessed', '1603121285', 'yes'),
(319, 'wc_remote_inbox_notifications_specs', 'a:3:{s:37:\"ecomm-need-help-setting-up-your-store\";O:8:\"stdClass\":8:{s:4:\"slug\";s:37:\"ecomm-need-help-setting-up-your-store\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:32:\"Need help setting up your Store?\";s:7:\"content\";s:350:\"Schedule a free 30-min <a href=\"https://wordpress.com/support/concierge-support/\">quick start session</a> and get help from our specialists. We’re happy to walk through setup steps, show you around the WordPress.com dashboard, troubleshoot any issues you may have, and help you the find the features you need to accomplish your goals for your site.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:16:\"set-up-concierge\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:21:\"Schedule free session\";}}s:3:\"url\";s:34:\"https://wordpress.com/me/concierge\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:3:{i:0;s:35:\"woocommerce-shipping-australia-post\";i:1;s:32:\"woocommerce-shipping-canada-post\";i:2;s:30:\"woocommerce-shipping-royalmail\";}}}}s:20:\"woocommerce-services\";O:8:\"stdClass\":8:{s:4:\"slug\";s:20:\"woocommerce-services\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:26:\"WooCommerce Shipping & Tax\";s:7:\"content\";s:255:\"WooCommerce Shipping & Tax helps get your store “ready to sell” as quickly as possible. You create your products. We take care of tax calculation, payment processing, and shipping label printing! Learn more about the extension that you just installed.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:10:\"learn-more\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:10:\"Learn more\";}}s:3:\"url\";s:84:\"https://docs.woocommerce.com/document/woocommerce-shipping-and-tax/?utm_source=inbox\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:10:\"unactioned\";}}s:5:\"rules\";a:2:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:20:\"woocommerce-services\";}}i:1;O:8:\"stdClass\":3:{s:4:\"type\";s:18:\"wcadmin_active_for\";s:9:\"operation\";s:1:\"<\";s:4:\"days\";i:2;}}}s:32:\"ecomm-unique-shopping-experience\";O:8:\"stdClass\":8:{s:4:\"slug\";s:32:\"ecomm-unique-shopping-experience\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:53:\"For a shopping experience as unique as your customers\";s:7:\"content\";s:274:\"Product Add-Ons allow your customers to personalize products while they’re shopping on your online store. No more follow-up email requests—customers get what they want, before they’re done checking out. Learn more about this extension that comes included in your plan.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:43:\"learn-more-ecomm-unique-shopping-experience\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:10:\"Learn more\";}}s:3:\"url\";s:71:\"https://docs.woocommerce.com/document/product-add-ons/?utm_source=inbox\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:2:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:3:{i:0;s:35:\"woocommerce-shipping-australia-post\";i:1;s:32:\"woocommerce-shipping-canada-post\";i:2;s:30:\"woocommerce-shipping-royalmail\";}}i:1;O:8:\"stdClass\":3:{s:4:\"type\";s:18:\"wcadmin_active_for\";s:9:\"operation\";s:1:\"<\";s:4:\"days\";i:2;}}}}', 'yes'),
(320, 'wc_remote_inbox_notifications_stored_state', 'O:8:\"stdClass\":2:{s:22:\"there_were_no_products\";b:1;s:22:\"there_are_now_products\";b:1;}', 'yes'),
(322, 'wc_blocks_db_schema_version', '260', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(323, 'woocommerce_meta_box_errors', 'a:0:{}', 'yes'),
(349, 'action_scheduler_migration_status', 'complete', 'yes'),
(350, 'woocommerce_onboarding_profile', 'a:9:{s:12:\"setup_client\";b:0;s:8:\"industry\";a:1:{i:0;a:1:{s:4:\"slug\";s:13:\"health-beauty\";}}s:13:\"product_types\";a:1:{i:0;s:8:\"physical\";}s:13:\"product_count\";s:6:\"11-100\";s:14:\"selling_venues\";s:2:\"no\";s:19:\"business_extensions\";a:0:{}s:5:\"theme\";s:19:\"theme_thietbitheduc\";s:7:\"plugins\";s:7:\"skipped\";s:9:\"completed\";b:1;}', 'yes'),
(357, 'woocommerce_task_list_tracked_completed_tasks', 'a:1:{i:0;s:13:\"store_details\";}', 'yes'),
(360, 'woocommerce_task_list_welcome_modal_dismissed', 'yes', 'yes'),
(379, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(390, 'category_children', 'a:0:{}', 'yes'),
(398, 'woocommerce_maybe_regenerate_images_hash', '991b1ca641921cf0f5baf7a2fe85861b', 'yes'),
(531, 'woocommerce_cod_settings', 'a:6:{s:7:\"enabled\";s:3:\"yes\";s:5:\"title\";s:35:\"Trả tiền mặt khi nhận hàng\";s:11:\"description\";s:33:\"Trả tiền mặt khi giao hàng\";s:12:\"instructions\";s:33:\"Trả tiền mặt khi giao hàng\";s:18:\"enable_for_methods\";a:0:{}s:18:\"enable_for_virtual\";s:3:\"yes\";}', 'yes'),
(532, 'woocommerce_gateway_order', 'a:4:{s:4:\"bacs\";i:0;s:6:\"cheque\";i:1;s:3:\"cod\";i:2;s:6:\"paypal\";i:3;}', 'yes'),
(607, 'woocommerce_tracker_ua', 'a:3:{i:0;s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36\";i:1;s:135:\"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/90.0.148 Chrome/84.0.4147.148 Safari/537.36\";i:2;s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36\";}', 'yes'),
(729, 'jetpack_active_modules', 'a:0:{}', 'yes'),
(760, 'ai1wm_updater', 'a:0:{}', 'yes'),
(796, 'product_cat_children', 'a:1:{i:17;a:2:{i:0;i:20;i:1;i:21;}}', 'yes'),
(868, 'woocommerce_tracker_last_send', '1604296229', 'yes'),
(1181, 'core_updater.lock', '1604296167', 'no'),
(1266, 'active_plugins', 'a:2:{i:0;s:51:\"all-in-one-wp-migration/all-in-one-wp-migration.php\";i:1;s:27:\"woocommerce/woocommerce.php\";}', 'yes'),
(1267, 'ai1wm_secret_key', 'tUPg14g7XNTZ', 'yes'),
(1268, 'ai1wm_backups_labels', 'a:0:{}', 'yes'),
(1269, 'ai1wm_sites_links', 'a:0:{}', 'yes'),
(1271, 'ai1wm_status', 'a:3:{s:4:\"type\";s:4:\"done\";s:5:\"title\";s:58:\"Dữ liệu của bạn đã được nhập thành công!\";s:7:\"message\";s:412:\"» <a class=\"ai1wm-no-underline\" href=\"http://localhost/thietbitheduc/wp-admin/options-permalink.php#submit\" target=\"_blank\">Lưu cấu trúc liên kết</a>.</strong> (mở tab mới)<br />» <a class=\"ai1wm-no-underline\" href=\"https://wordpress.org/support/view/plugin-reviews/all-in-one-wp-migration?rate=5#postform\" target=\"_blank\">Ngoài ra, có thể viết đánh giá 5 sao</a>.</strong> (mở tab mới)\";}', 'yes'),
(1272, 'template', 'theme_thietbitheduc', 'yes'),
(1273, 'stylesheet', 'theme_thietbitheduc', 'yes'),
(1274, '_transient_woocommerce_webhook_ids_status_active', 'a:0:{}', 'yes'),
(1275, '_transient_wc_attribute_taxonomies', 'a:0:{}', 'yes'),
(1277, '_transient_timeout_wc_term_counts', '1606891673', 'no'),
(1278, '_transient_wc_term_counts', 'a:2:{i:17;s:1:\"1\";i:16;s:1:\"1\";}', 'no'),
(1279, '_transient_product_query-transient-version', '1604299673', 'yes'),
(1280, '_transient_timeout_wc_product_loop_872503d9b0e0aa8001752703f27523a5', '1606891673', 'no'),
(1281, '_transient_wc_product_loop_872503d9b0e0aa8001752703f27523a5', 'a:2:{s:7:\"version\";s:10:\"1604299673\";s:5:\"value\";O:8:\"stdClass\":5:{s:3:\"ids\";a:1:{i:0;i:33;}s:5:\"total\";i:1;s:11:\"total_pages\";i:1;s:8:\"per_page\";i:8;s:12:\"current_page\";i:1;}}', 'no'),
(1282, '_transient_timeout_wc_product_loop_c8d06cd4bd3fb8510ac9acbfb3fcbdde', '1606891673', 'no'),
(1283, '_transient_wc_product_loop_c8d06cd4bd3fb8510ac9acbfb3fcbdde', 'a:2:{s:7:\"version\";s:10:\"1604299673\";s:5:\"value\";O:8:\"stdClass\":5:{s:3:\"ids\";a:1:{i:0;i:47;}s:5:\"total\";i:1;s:11:\"total_pages\";i:1;s:8:\"per_page\";i:10;s:12:\"current_page\";i:1;}}', 'no'),
(1284, '_transient_timeout_wc_related_47', '1604388320', 'no'),
(1285, '_transient_wc_related_47', 'a:1:{s:50:\"limit=4&exclude_ids%5B0%5D=0&exclude_ids%5B1%5D=47\";a:0:{}}', 'no'),
(1289, '_transient_wc_count_comments', 'O:8:\"stdClass\":7:{s:14:\"total_comments\";i:1;s:3:\"all\";i:1;s:8:\"approved\";s:1:\"1\";s:9:\"moderated\";i:0;s:4:\"spam\";i:0;s:5:\"trash\";i:0;s:12:\"post-trashed\";i:0;}', 'yes'),
(1290, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.5.3.zip\";s:6:\"locale\";s:2:\"vi\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.5.3.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.5.3-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.5.3-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"5.5.3\";s:7:\"version\";s:5:\"5.5.3\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1604385051;s:15:\"version_checked\";s:5:\"5.5.3\";s:12:\"translations\";a:0:{}}', 'no'),
(1298, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1604385057;s:7:\"checked\";a:2:{s:19:\"theme_thietbitheduc\";s:5:\"1.0.0\";s:12:\"twentytwenty\";s:3:\"1.5\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:1:{s:12:\"twentytwenty\";a:6:{s:5:\"theme\";s:12:\"twentytwenty\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:42:\"https://wordpress.org/themes/twentytwenty/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/twentytwenty.1.5.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}}s:12:\"translations\";a:0:{}}', 'no'),
(1299, '_site_transient_timeout_browser_3a39a1d66137823f367d0482940bd7b8', '1604905774', 'no'),
(1300, '_site_transient_browser_3a39a1d66137823f367d0482940bd7b8', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"86.0.4240.111\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(1301, '_site_transient_timeout_php_check_6a93f292d9a273c004fc36e1f86d97b3', '1604905777', 'no'),
(1302, '_site_transient_php_check_6a93f292d9a273c004fc36e1f86d97b3', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:0;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(1303, '_transient_timeout_wc_low_stock_count', '1606892977', 'no'),
(1304, '_transient_wc_low_stock_count', '0', 'no'),
(1305, '_transient_timeout_wc_outofstock_count', '1606892977', 'no'),
(1306, '_transient_wc_outofstock_count', '0', 'no'),
(1307, '_transient_timeout_wc_report_sales_by_date', '1604387377', 'no'),
(1308, '_transient_wc_report_sales_by_date', 'a:8:{s:32:\"ab5d94681aee515351a7760e6ac6931b\";a:0:{}s:32:\"ababd044442e57390ea2bcd28c6ea254\";a:0:{}s:32:\"5aacb33a9f9c57d824289cc8a5db2da7\";a:0:{}s:32:\"d881a3f39950c9e4becaf918ca39f777\";N;s:32:\"6d0f2c7d151bde988431afb81541cb6f\";a:0:{}s:32:\"583b146c81aba30c455b8bfc3ef1ab9a\";a:0:{}s:32:\"d359f5354f5159dce3a758034a9520b9\";a:0:{}s:32:\"af0cdd31a99a972cc52483b33532367c\";a:0:{}}', 'no'),
(1309, '_transient_timeout_wc_admin_report', '1604387377', 'no'),
(1310, '_transient_wc_admin_report', 'a:1:{s:32:\"44bd80a2d442cd83f6f2c622cf0bf445\";a:0:{}}', 'no'),
(1312, '_transient_shipping-transient-version', '1604300979', 'yes'),
(1313, '_transient_timeout_wc_shipping_method_count_legacy', '1606892979', 'no'),
(1314, '_transient_wc_shipping_method_count_legacy', 'a:2:{s:7:\"version\";s:10:\"1604300979\";s:5:\"value\";i:0;}', 'no'),
(1343, '_transient_timeout__woocommerce_helper_subscriptions', '1604385954', 'no'),
(1344, '_transient__woocommerce_helper_subscriptions', 'a:0:{}', 'no'),
(1345, '_site_transient_timeout_theme_roots', '1604386854', 'no'),
(1346, '_site_transient_theme_roots', 'a:2:{s:19:\"theme_thietbitheduc\";s:7:\"/themes\";s:12:\"twentytwenty\";s:7:\"/themes\";}', 'no'),
(1347, '_transient_timeout__woocommerce_helper_updates', '1604428254', 'no'),
(1348, '_transient__woocommerce_helper_updates', 'a:4:{s:4:\"hash\";s:32:\"d751713988987e9331980363e24189ce\";s:7:\"updated\";i:1604385054;s:8:\"products\";a:0:{}s:6:\"errors\";a:1:{i:0;s:10:\"http-error\";}}', 'no'),
(1349, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1604385059;s:7:\"checked\";a:5:{s:19:\"akismet/akismet.php\";s:5:\"4.1.1\";s:51:\"all-in-one-wp-migration/all-in-one-wp-migration.php\";s:4:\"7.28\";s:9:\"hello.php\";s:5:\"1.7.1\";s:21:\"ladipage/ladipage.php\";s:3:\"2.5\";s:27:\"woocommerce/woocommerce.php\";s:5:\"4.6.0\";}s:8:\"response\";a:4:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.7\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.7.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.5.3\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:51:\"all-in-one-wp-migration/all-in-one-wp-migration.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:37:\"w.org/plugins/all-in-one-wp-migration\";s:4:\"slug\";s:23:\"all-in-one-wp-migration\";s:6:\"plugin\";s:51:\"all-in-one-wp-migration/all-in-one-wp-migration.php\";s:11:\"new_version\";s:4:\"7.29\";s:3:\"url\";s:54:\"https://wordpress.org/plugins/all-in-one-wp-migration/\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/plugin/all-in-one-wp-migration.7.29.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:76:\"https://ps.w.org/all-in-one-wp-migration/assets/icon-256x256.png?rev=2409765\";s:2:\"1x\";s:76:\"https://ps.w.org/all-in-one-wp-migration/assets/icon-128x128.png?rev=2409765\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:79:\"https://ps.w.org/all-in-one-wp-migration/assets/banner-1544x500.png?rev=2409765\";s:2:\"1x\";s:78:\"https://ps.w.org/all-in-one-wp-migration/assets/banner-772x250.png?rev=2409765\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.5.3\";s:12:\"requires_php\";s:6:\"5.2.17\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:9:\"hello.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.5.3\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:27:\"woocommerce/woocommerce.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:25:\"w.org/plugins/woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:6:\"plugin\";s:27:\"woocommerce/woocommerce.php\";s:11:\"new_version\";s:5:\"4.6.1\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/woocommerce/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/woocommerce.4.6.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-256x256.png?rev=2366418\";s:2:\"1x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-128x128.png?rev=2366418\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/woocommerce/assets/banner-1544x500.png?rev=2366418\";s:2:\"1x\";s:66:\"https://ps.w.org/woocommerce/assets/banner-772x250.png?rev=2366418\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.5.3\";s:12:\"requires_php\";s:3:\"7.0\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:1:{s:21:\"ladipage/ladipage.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:22:\"w.org/plugins/ladipage\";s:4:\"slug\";s:8:\"ladipage\";s:6:\"plugin\";s:21:\"ladipage/ladipage.php\";s:11:\"new_version\";s:3:\"2.5\";s:3:\"url\";s:39:\"https://wordpress.org/plugins/ladipage/\";s:7:\"package\";s:51:\"https://downloads.wordpress.org/plugin/ladipage.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:61:\"https://ps.w.org/ladipage/assets/icon-256x256.png?rev=2118484\";s:2:\"1x\";s:61:\"https://ps.w.org/ladipage/assets/icon-256x256.png?rev=2118484\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:63:\"https://ps.w.org/ladipage/assets/banner-772x250.png?rev=1911351\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 5, '_wp_attached_file', 'woocommerce-placeholder.png'),
(4, 5, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1200;s:6:\"height\";i:1200;s:4:\"file\";s:27:\"woocommerce-placeholder.png\";s:5:\"sizes\";a:7:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:35:\"woocommerce-placeholder-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:35:\"woocommerce-placeholder-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:35:\"woocommerce-placeholder-600x600.png\";s:5:\"width\";i:600;s:6:\"height\";i:600;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:35:\"woocommerce-placeholder-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:37:\"woocommerce-placeholder-1024x1024.png\";s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:35:\"woocommerce-placeholder-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:35:\"woocommerce-placeholder-768x768.png\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(5, 10, '_menu_item_type', 'custom'),
(6, 10, '_menu_item_menu_item_parent', '0'),
(7, 10, '_menu_item_object_id', '10'),
(8, 10, '_menu_item_object', 'custom'),
(9, 10, '_menu_item_target', ''),
(10, 10, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(11, 10, '_menu_item_xfn', ''),
(12, 10, '_menu_item_url', 'http://localhost/thietbitheduc/'),
(14, 11, '_menu_item_type', 'post_type'),
(15, 11, '_menu_item_menu_item_parent', '0'),
(16, 11, '_menu_item_object_id', '6'),
(17, 11, '_menu_item_object', 'page'),
(18, 11, '_menu_item_target', ''),
(19, 11, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(20, 11, '_menu_item_xfn', ''),
(21, 11, '_menu_item_url', ''),
(23, 12, '_menu_item_type', 'post_type'),
(24, 12, '_menu_item_menu_item_parent', '0'),
(25, 12, '_menu_item_object_id', '7'),
(26, 12, '_menu_item_object', 'page'),
(27, 12, '_menu_item_target', ''),
(28, 12, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(29, 12, '_menu_item_xfn', ''),
(30, 12, '_menu_item_url', ''),
(32, 13, '_menu_item_type', 'post_type'),
(33, 13, '_menu_item_menu_item_parent', '0'),
(34, 13, '_menu_item_object_id', '9'),
(35, 13, '_menu_item_object', 'page'),
(36, 13, '_menu_item_target', ''),
(37, 13, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(38, 13, '_menu_item_xfn', ''),
(39, 13, '_menu_item_url', ''),
(41, 14, '_menu_item_type', 'post_type'),
(42, 14, '_menu_item_menu_item_parent', '0'),
(43, 14, '_menu_item_object_id', '8'),
(44, 14, '_menu_item_object', 'page'),
(45, 14, '_menu_item_target', ''),
(46, 14, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(47, 14, '_menu_item_xfn', ''),
(48, 14, '_menu_item_url', ''),
(50, 15, '_menu_item_type', 'post_type'),
(51, 15, '_menu_item_menu_item_parent', '0'),
(52, 15, '_menu_item_object_id', '2'),
(53, 15, '_menu_item_object', 'page'),
(54, 15, '_menu_item_target', ''),
(55, 15, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(56, 15, '_menu_item_xfn', ''),
(57, 15, '_menu_item_url', ''),
(59, 16, '_menu_item_type', 'taxonomy'),
(60, 16, '_menu_item_menu_item_parent', '0'),
(61, 16, '_menu_item_object_id', '19'),
(62, 16, '_menu_item_object', 'product_cat'),
(63, 16, '_menu_item_target', ''),
(64, 16, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(65, 16, '_menu_item_xfn', ''),
(66, 16, '_menu_item_url', ''),
(68, 17, '_menu_item_type', 'taxonomy'),
(69, 17, '_menu_item_menu_item_parent', '0'),
(70, 17, '_menu_item_object_id', '17'),
(71, 17, '_menu_item_object', 'product_cat'),
(72, 17, '_menu_item_target', ''),
(73, 17, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(74, 17, '_menu_item_xfn', ''),
(75, 17, '_menu_item_url', ''),
(77, 18, '_menu_item_type', 'taxonomy'),
(78, 18, '_menu_item_menu_item_parent', '17'),
(79, 18, '_menu_item_object_id', '20'),
(80, 18, '_menu_item_object', 'product_cat'),
(81, 18, '_menu_item_target', ''),
(82, 18, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(83, 18, '_menu_item_xfn', ''),
(84, 18, '_menu_item_url', ''),
(86, 19, '_menu_item_type', 'taxonomy'),
(87, 19, '_menu_item_menu_item_parent', '17'),
(88, 19, '_menu_item_object_id', '21'),
(89, 19, '_menu_item_object', 'product_cat'),
(90, 19, '_menu_item_target', ''),
(91, 19, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(92, 19, '_menu_item_xfn', ''),
(93, 19, '_menu_item_url', ''),
(95, 20, '_menu_item_type', 'taxonomy'),
(96, 20, '_menu_item_menu_item_parent', '0'),
(97, 20, '_menu_item_object_id', '18'),
(98, 20, '_menu_item_object', 'product_cat'),
(99, 20, '_menu_item_target', ''),
(100, 20, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(101, 20, '_menu_item_xfn', ''),
(102, 20, '_menu_item_url', ''),
(104, 21, '_menu_item_type', 'taxonomy'),
(105, 21, '_menu_item_menu_item_parent', '0'),
(106, 21, '_menu_item_object_id', '16'),
(107, 21, '_menu_item_object', 'product_cat'),
(108, 21, '_menu_item_target', ''),
(109, 21, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(110, 21, '_menu_item_xfn', ''),
(111, 21, '_menu_item_url', ''),
(113, 22, '_wp_attached_file', '2020/10/logo-viet-hung.png'),
(114, 22, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:200;s:6:\"height\";i:92;s:4:\"file\";s:26:\"2020/10/logo-viet-hung.png\";s:5:\"sizes\";a:3:{s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:25:\"logo-viet-hung-100x92.png\";s:5:\"width\";i:100;s:6:\"height\";i:92;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:25:\"logo-viet-hung-150x92.png\";s:5:\"width\";i:150;s:6:\"height\";i:92;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:25:\"logo-viet-hung-100x92.png\";s:5:\"width\";i:100;s:6:\"height\";i:92;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(115, 22, '_wp_attachment_is_custom_background', 'theme_thietbitheduc'),
(116, 23, '_wp_attached_file', '2020/10/cropped-logo-viet-hung.png'),
(117, 23, '_wp_attachment_context', 'custom-logo'),
(118, 23, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:200;s:6:\"height\";i:92;s:4:\"file\";s:34:\"2020/10/cropped-logo-viet-hung.png\";s:5:\"sizes\";a:3:{s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:33:\"cropped-logo-viet-hung-100x92.png\";s:5:\"width\";i:100;s:6:\"height\";i:92;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:33:\"cropped-logo-viet-hung-150x92.png\";s:5:\"width\";i:150;s:6:\"height\";i:92;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:33:\"cropped-logo-viet-hung-100x92.png\";s:5:\"width\";i:100;s:6:\"height\";i:92;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(119, 24, '_edit_lock', '1603123227:1'),
(120, 24, '_wp_trash_meta_status', 'publish'),
(121, 24, '_wp_trash_meta_time', '1603123237'),
(122, 25, '_wp_attached_file', '2020/10/cropped-logo-viet-hung-1.png'),
(123, 25, '_wp_attachment_context', 'site-icon'),
(124, 25, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:36:\"2020/10/cropped-logo-viet-hung-1.png\";s:5:\"sizes\";a:10:{s:6:\"medium\";a:4:{s:4:\"file\";s:36:\"cropped-logo-viet-hung-1-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:36:\"cropped-logo-viet-hung-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:36:\"cropped-logo-viet-hung-1-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:36:\"cropped-logo-viet-hung-1-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:36:\"cropped-logo-viet-hung-1-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:36:\"cropped-logo-viet-hung-1-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-270\";a:4:{s:4:\"file\";s:36:\"cropped-logo-viet-hung-1-270x270.png\";s:5:\"width\";i:270;s:6:\"height\";i:270;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-192\";a:4:{s:4:\"file\";s:36:\"cropped-logo-viet-hung-1-192x192.png\";s:5:\"width\";i:192;s:6:\"height\";i:192;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-180\";a:4:{s:4:\"file\";s:36:\"cropped-logo-viet-hung-1-180x180.png\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"site_icon-32\";a:4:{s:4:\"file\";s:34:\"cropped-logo-viet-hung-1-32x32.png\";s:5:\"width\";i:32;s:6:\"height\";i:32;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(125, 26, '_wp_trash_meta_status', 'publish'),
(126, 26, '_wp_trash_meta_time', '1603123254'),
(127, 27, '_wp_attached_file', '2020/10/TRANG-CHU-1.jpg'),
(128, 27, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:875;s:6:\"height\";i:423;s:4:\"file\";s:23:\"2020/10/TRANG-CHU-1.jpg\";s:5:\"sizes\";a:9:{s:6:\"medium\";a:4:{s:4:\"file\";s:23:\"TRANG-CHU-1-300x145.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:145;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"TRANG-CHU-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:23:\"TRANG-CHU-1-768x371.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:371;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:23:\"TRANG-CHU-1-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:23:\"TRANG-CHU-1-600x290.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:290;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:23:\"TRANG-CHU-1-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:23:\"TRANG-CHU-1-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:23:\"TRANG-CHU-1-600x290.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:290;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:23:\"TRANG-CHU-1-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:9:\"Text-dctt\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(129, 28, '_wp_attached_file', '2020/10/TRANG-CHU-4.jpg'),
(130, 28, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:875;s:6:\"height\";i:423;s:4:\"file\";s:23:\"2020/10/TRANG-CHU-4.jpg\";s:5:\"sizes\";a:9:{s:6:\"medium\";a:4:{s:4:\"file\";s:23:\"TRANG-CHU-4-300x145.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:145;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"TRANG-CHU-4-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:23:\"TRANG-CHU-4-768x371.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:371;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:23:\"TRANG-CHU-4-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:23:\"TRANG-CHU-4-600x290.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:290;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:23:\"TRANG-CHU-4-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:23:\"TRANG-CHU-4-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:23:\"TRANG-CHU-4-600x290.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:290;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:23:\"TRANG-CHU-4-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:9:\"Text-dctt\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(131, 29, '_wp_attached_file', '2020/10/TRANG-CHU-7.jpg'),
(132, 29, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:875;s:6:\"height\";i:423;s:4:\"file\";s:23:\"2020/10/TRANG-CHU-7.jpg\";s:5:\"sizes\";a:9:{s:6:\"medium\";a:4:{s:4:\"file\";s:23:\"TRANG-CHU-7-300x145.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:145;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"TRANG-CHU-7-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:23:\"TRANG-CHU-7-768x371.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:371;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:23:\"TRANG-CHU-7-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:23:\"TRANG-CHU-7-600x290.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:290;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:23:\"TRANG-CHU-7-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:23:\"TRANG-CHU-7-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:23:\"TRANG-CHU-7-600x290.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:290;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:23:\"TRANG-CHU-7-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:9:\"Text-dctt\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(133, 30, '_edit_lock', '1604299115:1'),
(134, 34, '_wp_attached_file', '2020/10/3-2.jpg'),
(135, 34, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1198;s:6:\"height\";i:350;s:4:\"file\";s:15:\"2020/10/3-2.jpg\";s:5:\"sizes\";a:10:{s:6:\"medium\";a:4:{s:4:\"file\";s:14:\"3-2-300x88.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:88;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:16:\"3-2-1024x299.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:299;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:15:\"3-2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:15:\"3-2-768x224.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:224;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:15:\"3-2-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:15:\"3-2-600x175.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:175;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:15:\"3-2-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:15:\"3-2-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:15:\"3-2-600x175.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:175;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:15:\"3-2-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(136, 33, '_edit_last', '1'),
(137, 33, '_edit_lock', '1603130136:1'),
(138, 37, '_wp_attached_file', '2020/10/may-rung-bung-dung-.jpg'),
(139, 37, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:750;s:6:\"height\";i:750;s:4:\"file\";s:31:\"2020/10/may-rung-bung-dung-.jpg\";s:5:\"sizes\";a:8:{s:6:\"medium\";a:4:{s:4:\"file\";s:31:\"may-rung-bung-dung--300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:31:\"may-rung-bung-dung--150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:31:\"may-rung-bung-dung--300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:31:\"may-rung-bung-dung--600x600.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:600;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:31:\"may-rung-bung-dung--100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:31:\"may-rung-bung-dung--300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:31:\"may-rung-bung-dung--600x600.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:600;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:31:\"may-rung-bung-dung--100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(140, 38, '_wp_attached_file', '2020/10/may-rung-queen-f1.png'),
(141, 38, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:740;s:6:\"height\";i:708;s:4:\"file\";s:29:\"2020/10/may-rung-queen-f1.png\";s:5:\"sizes\";a:8:{s:6:\"medium\";a:4:{s:4:\"file\";s:29:\"may-rung-queen-f1-300x287.png\";s:5:\"width\";i:300;s:6:\"height\";i:287;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:29:\"may-rung-queen-f1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:29:\"may-rung-queen-f1-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:29:\"may-rung-queen-f1-600x574.png\";s:5:\"width\";i:600;s:6:\"height\";i:574;s:9:\"mime-type\";s:9:\"image/png\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:29:\"may-rung-queen-f1-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:29:\"may-rung-queen-f1-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:29:\"may-rung-queen-f1-600x574.png\";s:5:\"width\";i:600;s:6:\"height\";i:574;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:29:\"may-rung-queen-f1-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(142, 33, '_thumbnail_id', '38'),
(143, 33, '_regular_price', '4890000'),
(144, 33, '_sale_price', '4290000'),
(145, 33, 'total_sales', '0'),
(146, 33, '_tax_status', 'taxable'),
(147, 33, '_tax_class', ''),
(148, 33, '_manage_stock', 'no'),
(149, 33, '_backorders', 'no'),
(150, 33, '_sold_individually', 'no'),
(151, 33, '_virtual', 'no'),
(152, 33, '_downloadable', 'no'),
(153, 33, '_download_limit', '-1'),
(154, 33, '_download_expiry', '-1'),
(155, 33, '_stock', NULL),
(156, 33, '_stock_status', 'instock'),
(157, 33, '_wc_average_rating', '0'),
(158, 33, '_wc_review_count', '0'),
(159, 33, '_product_version', '4.6.0'),
(160, 33, '_price', '4290000'),
(161, 33, '_product_image_gallery', '37,38'),
(162, 43, '_wp_attached_file', '2020/10/2-1.jpg'),
(163, 43, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1198;s:6:\"height\";i:350;s:4:\"file\";s:15:\"2020/10/2-1.jpg\";s:5:\"sizes\";a:10:{s:6:\"medium\";a:4:{s:4:\"file\";s:14:\"2-1-300x88.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:88;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:16:\"2-1-1024x299.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:299;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:15:\"2-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:15:\"2-1-768x224.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:224;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:15:\"2-1-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:15:\"2-1-600x175.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:175;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:15:\"2-1-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:15:\"2-1-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:15:\"2-1-600x175.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:175;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:15:\"2-1-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(164, 30, '_edit_last', '1'),
(165, 47, '_edit_last', '1'),
(166, 47, '_edit_lock', '1603131824:1'),
(167, 48, '_wp_attached_file', '2020/10/5-1.jpg'),
(168, 48, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:700;s:6:\"height\";i:750;s:4:\"file\";s:15:\"2020/10/5-1.jpg\";s:5:\"sizes\";a:8:{s:6:\"medium\";a:4:{s:4:\"file\";s:15:\"5-1-280x300.jpg\";s:5:\"width\";i:280;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:15:\"5-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:15:\"5-1-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:15:\"5-1-600x643.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:643;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:15:\"5-1-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:15:\"5-1-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:15:\"5-1-600x643.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:643;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:15:\"5-1-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(169, 49, '_wp_attached_file', '2020/10/6.jpg'),
(170, 49, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:700;s:6:\"height\";i:750;s:4:\"file\";s:13:\"2020/10/6.jpg\";s:5:\"sizes\";a:8:{s:6:\"medium\";a:4:{s:4:\"file\";s:13:\"6-280x300.jpg\";s:5:\"width\";i:280;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:13:\"6-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:13:\"6-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:13:\"6-600x643.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:643;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:13:\"6-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:13:\"6-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:13:\"6-600x643.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:643;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:13:\"6-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(171, 47, '_thumbnail_id', '48'),
(172, 47, '_regular_price', '4250000'),
(173, 47, 'total_sales', '0'),
(174, 47, '_tax_status', 'taxable'),
(175, 47, '_tax_class', ''),
(176, 47, '_manage_stock', 'no'),
(177, 47, '_backorders', 'no'),
(178, 47, '_sold_individually', 'no'),
(179, 47, '_virtual', 'no'),
(180, 47, '_downloadable', 'no'),
(181, 47, '_download_limit', '-1'),
(182, 47, '_download_expiry', '-1'),
(183, 47, '_stock', NULL),
(184, 47, '_stock_status', 'instock'),
(185, 47, '_wc_average_rating', '0'),
(186, 47, '_wc_review_count', '0'),
(187, 47, '_product_version', '4.6.0'),
(188, 47, '_price', '4250000'),
(189, 47, '_product_image_gallery', '49'),
(190, 56, '_wp_attached_file', '2020/10/z2135781144264_1651be293f7027d4df5ccf993c246bc0.jpg'),
(191, 56, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:735;s:4:\"file\";s:59:\"2020/10/z2135781144264_1651be293f7027d4df5ccf993c246bc0.jpg\";s:5:\"sizes\";a:11:{s:6:\"medium\";a:4:{s:4:\"file\";s:59:\"z2135781144264_1651be293f7027d4df5ccf993c246bc0-300x115.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:115;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:60:\"z2135781144264_1651be293f7027d4df5ccf993c246bc0-1024x392.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:392;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:59:\"z2135781144264_1651be293f7027d4df5ccf993c246bc0-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:59:\"z2135781144264_1651be293f7027d4df5ccf993c246bc0-768x294.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:294;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:60:\"z2135781144264_1651be293f7027d4df5ccf993c246bc0-1536x588.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:588;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:59:\"z2135781144264_1651be293f7027d4df5ccf993c246bc0-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:59:\"z2135781144264_1651be293f7027d4df5ccf993c246bc0-600x230.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:230;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:59:\"z2135781144264_1651be293f7027d4df5ccf993c246bc0-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"shop_catalog\";a:4:{s:4:\"file\";s:59:\"z2135781144264_1651be293f7027d4df5ccf993c246bc0-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:11:\"shop_single\";a:4:{s:4:\"file\";s:59:\"z2135781144264_1651be293f7027d4df5ccf993c246bc0-600x230.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:230;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:59:\"z2135781144264_1651be293f7027d4df5ccf993c246bc0-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2020-10-19 15:19:58', '2020-10-19 15:19:58', '<!-- wp:paragraph -->\n<p>Cảm ơn vì đã sử dụng WordPress. Đây là bài viết đầu tiên của bạn. Sửa hoặc xóa nó, và bắt đầu bài viết của bạn nhé!</p>\n<!-- /wp:paragraph -->', 'Chào tất cả mọi người!', '', 'publish', 'open', 'open', '', 'chao-moi-nguoi', '', '', '2020-10-19 15:19:58', '2020-10-19 15:19:58', '', 0, 'http://localhost/thietbitheduc/?p=1', 0, 'post', '', 1),
(2, 1, '2020-10-19 15:19:58', '2020-10-19 15:19:58', '<!-- wp:paragraph -->\n<p>Đây là trang mẫu. Nó khác với bài viết bởi vì nó thường cố định và hiển thị trong menu của bạn. Nhiều người bắt đầu với trang Giới thiệu nơi bạn chia sẻ thông tin cho những ai ghé thăm. Nó có thể bắt đầu như thế này:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Chào bạn! Tôi là một người bán hàng, và đây là website của tôi. Tôi sống ở Hà Nội, có một gia đình nhỏ, và tôi thấy cách sử dụng WordPress rất thú vị.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>... hoặc cái gì đó như thế này:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Công ty chúng tôi được thành lập năm 2010, và cung cấp dịch vụ chất lượng cho rất nhiều sự kiện tại khắp Việt Nam. Với văn phòng đặt tại Hà Nội, TP. Hồ Chí Minh cùng hơn 40 nhân sự, chúng tôi là nơi nhiều đối tác tin tưởng giao cho tổ chức các sự kiện lớn.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Là một người dùng WordPress mới, bạn nên ghé thăm <a href=\"http://localhost/thietbitheduc/wp-admin/\">bảng tin</a> để xóa trang này và tạo trang mới cho nội dung của chính bạn. Chúc bạn vui vẻ!</p>\n<!-- /wp:paragraph -->', 'Trang Mẫu', '', 'publish', 'closed', 'open', '', 'Trang mẫu', '', '', '2020-10-19 15:19:58', '2020-10-19 15:19:58', '', 0, 'http://localhost/thietbitheduc/?page_id=2', 0, 'page', '', 0),
(3, 1, '2020-10-19 15:19:58', '2020-10-19 15:19:58', '<!-- wp:heading --><h2>Chúng tôi là ai</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Địa chỉ website là: http://localhost/thietbitheduc.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Thông tin cá nhân nào bị thu thập và tại sao thu thập</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Bình luận</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Khi khách truy cập để lại bình luận trên trang web, chúng tôi thu thập dữ liệu được hiển thị trong biểu mẫu bình luận và cũng là địa chỉ IP của người truy cập và chuỗi user agent của người dùng trình duyệt để giúp phát hiện spam</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Một chuỗi ẩn danh được tạo từ địa chỉ email của bạn (còn được gọi là hash) có thể được cung cấp cho dịch vụ Gravatar để xem bạn có đang sử dụng nó hay không. Chính sách bảo mật của dịch vụ Gravatar có tại đây: https://automattic.com/privacy/. Sau khi chấp nhận bình luận của bạn, ảnh tiểu sử của bạn được hiển thị công khai trong ngữ cảnh bình luận của bạn.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Thư viện</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Nếu bạn tải hình ảnh lên trang web, bạn nên tránh tải lên hình ảnh có dữ liệu vị trí được nhúng (EXIF GPS) đi kèm. Khách truy cập vào trang web có thể tải xuống và giải nén bất kỳ dữ liệu vị trí nào từ hình ảnh trên trang web.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Thông tin liên hệ</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Nếu bạn viết bình luận trong website, bạn có thể cung cấp cần nhập tên, email địa chỉ website trong cookie. Các thông tin này nhằm giúp bạn không cần nhập thông tin nhiều lần khi viết bình luận khác. Cookie này sẽ được lưu giữ trong một năm.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Nếu bạn có tài khoản và đăng nhập và website, chúng tôi sẽ thiết lập một cookie tạm thời để xác định nếu trình duyệt cho phép sử dụng cookie. Cookie này không bao gồm thông tin cá nhân và sẽ được gỡ bỏ khi bạn đóng trình duyệt.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Khi bạn đăng nhập, chúng tôi sẽ thiết lập một vài cookie để lưu thông tin đăng nhập và lựa chọn hiển thị. Thông tin đăng nhập gần nhất lưu trong hai ngày, và lựa chọn hiển thị gần nhất lưu trong một năm. Nếu bạn chọn &quot;Nhớ tôi&quot;, thông tin đăng nhập sẽ được lưu trong hai tuần. Nếu bạn thoát tài khoản, thông tin cookie đăng nhập sẽ bị xoá.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Nếu bạn sửa hoặc công bố bài viết, một bản cookie bổ sung sẽ được lưu trong trình duyệt. Cookie này không chứa thông tin cá nhân và chỉ đơn giản bao gồm ID của bài viết bạn đã sửa. Nó tự động hết hạn sau 1 ngày.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Nội dung nhúng từ website khác</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Các bài viết trên trang web này có thể bao gồm nội dung được nhúng (ví dụ: video, hình ảnh, bài viết, v.v.). Nội dung được nhúng từ các trang web khác hoạt động theo cùng một cách chính xác như khi khách truy cập đã truy cập trang web khác.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Những website này có thể thu thập dữ liệu về bạn, sử dụng cookie, nhúng các trình theo dõi của bên thứ ba và giám sát tương tác của bạn với nội dung được nhúng đó, bao gồm theo dõi tương tác của bạn với nội dung được nhúng nếu bạn có tài khoản và đã đăng nhập vào trang web đó.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Phân tích</h3><!-- /wp:heading --><!-- wp:heading --><h2>Chúng tôi chia sẻ dữ liệu của bạn với ai</h2><!-- /wp:heading --><!-- wp:heading --><h2>Dữ liệu của bạn tồn tại bao lâu</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Nếu bạn để lại bình luận, bình luận và siêu dữ liệu của nó sẽ được giữ lại vô thời hạn. Điều này là để chúng tôi có thể tự động nhận ra và chấp nhận bất kỳ bình luận nào thay vì giữ chúng trong khu vực đợi kiểm duyệt.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Đối với người dùng đăng ký trên trang web của chúng tôi (nếu có), chúng tôi cũng lưu trữ thông tin cá nhân mà họ cung cấp trong hồ sơ người dùng của họ. Tất cả người dùng có thể xem, chỉnh sửa hoặc xóa thông tin cá nhân của họ bất kỳ lúc nào (ngoại trừ họ không thể thay đổi tên người dùng của họ). Quản trị viên trang web cũng có thể xem và chỉnh sửa thông tin đó.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Các quyền nào của bạn với dữ liệu của mình</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Nếu bạn có tài khoản trên trang web này hoặc đã để lại nhận xét, bạn có thể yêu cầu nhận tệp xuất dữ liệu cá nhân mà chúng tôi lưu giữ về bạn, bao gồm mọi dữ liệu bạn đã cung cấp cho chúng tôi. Bạn cũng có thể yêu cầu chúng tôi xóa mọi dữ liệu cá nhân mà chúng tôi lưu giữ về bạn. Điều này không bao gồm bất kỳ dữ liệu nào chúng tôi có nghĩa vụ giữ cho các mục đích hành chính, pháp lý hoặc bảo mật.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Các dữ liệu của bạn được gửi tới đâu</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Các bình luận của khách (không phải là thành viên) có thể được kiểm tra thông qua dịch vụ tự động phát hiện spam.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Thông tin liên hệ của bạn</h2><!-- /wp:heading --><!-- wp:heading --><h2>Thông tin bổ sung</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cách chúng tôi bảo vệ dữ liệu của bạn</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Các quá trình tiết lộ dữ liệu mà chúng tôi thực hiện</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Những bên thứ ba chúng tôi nhận dữ liệu từ đó</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Việc quyết định và/hoặc thu thập thông tin tự động mà chúng tôi áp dụng với dữ liệu người dùng</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Các yêu cầu công bố thông tin được quản lý</h3><!-- /wp:heading -->', 'Chính sách bảo mật', '', 'draft', 'closed', 'open', '', 'chinh-sach-bao-mat', '', '', '2020-10-19 15:19:58', '2020-10-19 15:19:58', '', 0, 'http://localhost/thietbitheduc/?page_id=3', 0, 'page', '', 0),
(5, 1, '2020-10-19 15:28:02', '2020-10-19 15:28:02', '', 'woocommerce-placeholder', '', 'inherit', 'open', 'closed', '', 'woocommerce-placeholder', '', '', '2020-10-19 15:28:02', '2020-10-19 15:28:02', '', 0, 'http://localhost/thietbitheduc/wp-content/uploads/2020/10/woocommerce-placeholder.png', 0, 'attachment', 'image/png', 0),
(6, 1, '2020-10-19 15:28:03', '2020-10-19 15:28:03', '', 'Cửa hàng', '', 'publish', 'closed', 'closed', '', 'mua', '', '', '2020-10-19 15:28:03', '2020-10-19 15:28:03', '', 0, 'http://localhost/thietbitheduc/mua/', 0, 'page', '', 0),
(7, 1, '2020-10-19 15:28:03', '2020-10-19 15:28:03', '<!-- wp:shortcode -->[woocommerce_cart]<!-- /wp:shortcode -->', 'Giỏ hàng', '', 'publish', 'closed', 'closed', '', 'gio-hang', '', '', '2020-10-19 15:28:03', '2020-10-19 15:28:03', '', 0, 'http://localhost/thietbitheduc/gio-hang/', 0, 'page', '', 0),
(8, 1, '2020-10-19 15:28:03', '2020-10-19 15:28:03', '<!-- wp:shortcode -->[woocommerce_checkout]<!-- /wp:shortcode -->', 'Thanh toán', '', 'publish', 'closed', 'closed', '', 'thanh-toan', '', '', '2020-10-19 15:28:03', '2020-10-19 15:28:03', '', 0, 'http://localhost/thietbitheduc/thanh-toan/', 0, 'page', '', 0),
(9, 1, '2020-10-19 15:28:03', '2020-10-19 15:28:03', '<!-- wp:shortcode -->[woocommerce_my_account]<!-- /wp:shortcode -->', 'Tài khoản', '', 'publish', 'closed', 'closed', '', 'tai-khoan', '', '', '2020-10-19 15:28:03', '2020-10-19 15:28:03', '', 0, 'http://localhost/thietbitheduc/tai-khoan/', 0, 'page', '', 0),
(10, 1, '2020-10-19 15:44:07', '2020-10-19 15:44:07', '', 'Trang chủ', '', 'publish', 'closed', 'closed', '', 'trang-chu', '', '', '2020-10-19 15:44:07', '2020-10-19 15:44:07', '', 0, 'http://localhost/thietbitheduc/?p=10', 1, 'nav_menu_item', '', 0),
(11, 1, '2020-10-19 15:44:07', '2020-10-19 15:44:07', ' ', '', '', 'publish', 'closed', 'closed', '', '11', '', '', '2020-10-19 15:44:07', '2020-10-19 15:44:07', '', 0, 'http://localhost/thietbitheduc/?p=11', 2, 'nav_menu_item', '', 0),
(12, 1, '2020-10-19 15:44:07', '2020-10-19 15:44:07', ' ', '', '', 'publish', 'closed', 'closed', '', '12', '', '', '2020-10-19 15:44:07', '2020-10-19 15:44:07', '', 0, 'http://localhost/thietbitheduc/?p=12', 3, 'nav_menu_item', '', 0),
(13, 1, '2020-10-19 15:44:07', '2020-10-19 15:44:07', ' ', '', '', 'publish', 'closed', 'closed', '', '13', '', '', '2020-10-19 15:44:07', '2020-10-19 15:44:07', '', 0, 'http://localhost/thietbitheduc/?p=13', 4, 'nav_menu_item', '', 0),
(14, 1, '2020-10-19 15:44:07', '2020-10-19 15:44:07', ' ', '', '', 'publish', 'closed', 'closed', '', '14', '', '', '2020-10-19 15:44:07', '2020-10-19 15:44:07', '', 0, 'http://localhost/thietbitheduc/?p=14', 5, 'nav_menu_item', '', 0),
(15, 1, '2020-10-19 15:44:07', '2020-10-19 15:44:07', ' ', '', '', 'publish', 'closed', 'closed', '', '15', '', '', '2020-10-19 15:44:07', '2020-10-19 15:44:07', '', 0, 'http://localhost/thietbitheduc/?p=15', 6, 'nav_menu_item', '', 0),
(16, 1, '2020-10-19 15:46:51', '2020-10-19 15:46:51', ' ', '', '', 'publish', 'closed', 'closed', '', '16', '', '', '2020-10-19 15:46:51', '2020-10-19 15:46:51', '', 0, 'http://localhost/thietbitheduc/?p=16', 6, 'nav_menu_item', '', 0),
(17, 1, '2020-10-19 15:46:50', '2020-10-19 15:46:50', ' ', '', '', 'publish', 'closed', 'closed', '', '17', '', '', '2020-10-19 15:46:50', '2020-10-19 15:46:50', '', 0, 'http://localhost/thietbitheduc/?p=17', 1, 'nav_menu_item', '', 0),
(18, 1, '2020-10-19 15:46:51', '2020-10-19 15:46:51', ' ', '', '', 'publish', 'closed', 'closed', '', '18', '', '', '2020-10-19 15:46:51', '2020-10-19 15:46:51', '', 17, 'http://localhost/thietbitheduc/?p=18', 2, 'nav_menu_item', '', 0),
(19, 1, '2020-10-19 15:46:51', '2020-10-19 15:46:51', ' ', '', '', 'publish', 'closed', 'closed', '', '19', '', '', '2020-10-19 15:46:51', '2020-10-19 15:46:51', '', 17, 'http://localhost/thietbitheduc/?p=19', 3, 'nav_menu_item', '', 0),
(20, 1, '2020-10-19 15:46:51', '2020-10-19 15:46:51', ' ', '', '', 'publish', 'closed', 'closed', '', '20', '', '', '2020-10-19 15:46:51', '2020-10-19 15:46:51', '', 0, 'http://localhost/thietbitheduc/?p=20', 4, 'nav_menu_item', '', 0),
(21, 1, '2020-10-19 15:46:51', '2020-10-19 15:46:51', ' ', '', '', 'publish', 'closed', 'closed', '', '21', '', '', '2020-10-19 15:46:51', '2020-10-19 15:46:51', '', 0, 'http://localhost/thietbitheduc/?p=21', 5, 'nav_menu_item', '', 0),
(22, 1, '2020-10-19 15:59:47', '2020-10-19 15:59:47', '', 'logo-viet-hung', '', 'inherit', 'open', 'closed', '', 'logo-viet-hung', '', '', '2020-10-19 15:59:47', '2020-10-19 15:59:47', '', 0, 'http://localhost/thietbitheduc/wp-content/uploads/2020/10/logo-viet-hung.png', 0, 'attachment', 'image/png', 0),
(23, 1, '2020-10-19 16:00:08', '2020-10-19 16:00:08', 'http://localhost/thietbitheduc/wp-content/uploads/2020/10/cropped-logo-viet-hung.png', 'cropped-logo-viet-hung.png', '', 'inherit', 'open', 'closed', '', 'cropped-logo-viet-hung-png', '', '', '2020-10-19 16:00:08', '2020-10-19 16:00:08', '', 0, 'http://localhost/thietbitheduc/wp-content/uploads/2020/10/cropped-logo-viet-hung.png', 0, 'attachment', 'image/png', 0),
(24, 1, '2020-10-19 16:00:36', '2020-10-19 16:00:36', '{\n    \"theme_thietbitheduc::custom_logo\": {\n        \"value\": 23,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-10-19 16:00:16\"\n    },\n    \"theme_thietbitheduc::background_image\": {\n        \"value\": \"\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-10-19 16:00:16\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'e5ad06d2-cffe-47e8-b209-b7a13ec3236a', '', '', '2020-10-19 16:00:36', '2020-10-19 16:00:36', '', 0, 'http://localhost/thietbitheduc/?p=24', 0, 'customize_changeset', '', 0),
(25, 1, '2020-10-19 16:00:51', '2020-10-19 16:00:51', 'http://localhost/thietbitheduc/wp-content/uploads/2020/10/cropped-logo-viet-hung-1.png', 'cropped-logo-viet-hung-1.png', '', 'inherit', 'open', 'closed', '', 'cropped-logo-viet-hung-1-png', '', '', '2020-10-19 16:00:51', '2020-10-19 16:00:51', '', 0, 'http://localhost/thietbitheduc/wp-content/uploads/2020/10/cropped-logo-viet-hung-1.png', 0, 'attachment', 'image/png', 0),
(26, 1, '2020-10-19 16:00:54', '2020-10-19 16:00:54', '{\n    \"site_icon\": {\n        \"value\": 25,\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-10-19 16:00:54\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'eda87c51-15ab-4ad1-9c0f-e7a79c2210b0', '', '', '2020-10-19 16:00:54', '2020-10-19 16:00:54', '', 0, 'http://localhost/thietbitheduc/2020/10/19/eda87c51-15ab-4ad1-9c0f-e7a79c2210b0/', 0, 'customize_changeset', '', 0),
(27, 1, '2020-10-19 17:06:00', '2020-10-19 17:06:00', '', 'Text-dctt', '', 'inherit', 'open', 'closed', '', 'text-dctt', '', '', '2020-10-19 17:06:00', '2020-10-19 17:06:00', '', 0, 'http://localhost/thietbitheduc/wp-content/uploads/2020/10/TRANG-CHU-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(28, 1, '2020-10-19 17:06:01', '2020-10-19 17:06:01', '', 'Text-dctt', '', 'inherit', 'open', 'closed', '', 'text-dctt-2', '', '', '2020-10-19 17:06:01', '2020-10-19 17:06:01', '', 0, 'http://localhost/thietbitheduc/wp-content/uploads/2020/10/TRANG-CHU-4.jpg', 0, 'attachment', 'image/jpeg', 0),
(29, 1, '2020-10-19 17:06:02', '2020-10-19 17:06:02', '', 'Text-dctt', '', 'inherit', 'open', 'closed', '', 'text-dctt-3', '', '', '2020-10-19 17:06:02', '2020-10-19 17:06:02', '', 0, 'http://localhost/thietbitheduc/wp-content/uploads/2020/10/TRANG-CHU-7.jpg', 0, 'attachment', 'image/jpeg', 0),
(30, 1, '2020-10-19 17:35:20', '2020-10-19 17:35:20', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<div class=\"product-1 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Máy Massage</h2></div>\n     <div class=\"product-readmore pull-right\"><a href=\"http://localhost/thietbitheduc/danh-muc-san-pham/may-massage/\">Xem Thêm</a></div>\n     \n</div>\n<div class=\"bg-product-1\">\n</div>\n<div class=\"product-main\">\n[products limit=\"8\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-massage\"]\n</div>\n</div>\n\n<div class=\"product-2 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Xe đạp tập thể dục</h2></div>\n     <div class=\"product-readmore pull-right\"><a href=\"http://localhost/thietbitheduc/danh-muc-san-pham/may-tap-the-duc/\">Xem Thêm</a></div>\n</div>\n<div class=\"bg-product-2\">\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-tap-the-duc\"]\n</div>\n</div>\n<!-- /wp:html -->', 'Trang chủ', '', 'publish', 'closed', 'closed', '', 'trang-chu', '', '', '2020-11-02 06:29:57', '2020-11-02 06:29:57', '', 0, 'http://localhost/thietbitheduc/?page_id=30', 0, 'page', '', 0),
(31, 1, '2020-10-19 17:35:20', '2020-10-19 17:35:20', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<div class=\"product-1\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\">Máy Massage</div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"5\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-massage\"]\n</div>\n</div>\n<!-- /wp:html -->', '', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2020-10-19 17:35:20', '2020-10-19 17:35:20', '', 30, 'http://localhost/thietbitheduc/2020/10/19/30-revision-v1/', 0, 'revision', '', 0),
(32, 1, '2020-10-19 17:35:28', '2020-10-19 17:35:28', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<div class=\"product-1\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\">Máy Massage</div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"5\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-massage\"]\n</div>\n</div>\n<!-- /wp:html -->', 'Trang chủ', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2020-10-19 17:35:28', '2020-10-19 17:35:28', '', 30, 'http://localhost/thietbitheduc/2020/10/19/30-revision-v1/', 0, 'revision', '', 0),
(33, 1, '2020-10-19 17:53:56', '2020-10-19 17:53:56', '<h3 class=\"amp-wp-cdd8ca0\" style=\"text-align: center;\" data-amp-original-style=\"text-align: center;\"><span class=\"amp-wp-57b7fc0\" data-amp-original-style=\"color: #008000;\"><strong><em>MÁY RUNG ĐỨNG QUEEN-F1.</em></strong></span></h3>\r\n<h4><strong><span class=\"amp-wp-5443cfc\" data-amp-original-style=\"color: #000000;\">MÁY RUNG QUEN F1. </span></strong><span class=\"amp-wp-5443cfc\" data-amp-original-style=\"color: #000000;\">thiết bị luyện tập được ưa chuộng  nhất trong các phòng GYM.bởi khả năng rung mạnh mẽ, giúp cho người tập giảm cân, giảm mỡ bụng, giảm vòng eo mông,… máy rung bụng đứng queen f1 còn thư giãn, xoa dịu đi mọi cơn đau nhức sau một ngày làm việc căng thẳng và mệt mỏi, hỗ trợ chức năng tiêu hóa, tăng cường tuần hoàn máu.</span></h4>', 'MÁY RUNG Massage QUEEN-F1', '<div class=\"row-info\">\r\n<div>Tình trạng                                   <span class=\"amp-wp-c85899d amp-wp-cc68ddc\" data-amp-original-style=\"color: #ff0000;\"><strong><span class=\"amp-wp-c85899d amp-wp-c85899d\"><span class=\"amp-wp-e0fc2d9\">CÒN HÀNG</span></span></strong></span></div>\r\n</div>\r\n<div class=\"row-info\">\r\n<div class=\"rowlef\">Mã sản phẩm                              <strong><span class=\"amp-wp-cc68ddc\" data-amp-original-style=\"color: #ff0000;\">QUEEN-F1</span></strong></div>\r\n<div>Hãng Sản Xuất                            KSV</div>\r\n</div>\r\n<div class=\"row-info\">\r\n<div class=\"rowlef\">Trọng lượng                                35kg</div>\r\n</div>\r\n<div class=\"row-info\">\r\n<div class=\"rowlef\">Kích Thước máy                        800*500*1150 mm</div>\r\n</div>\r\n<div class=\"row-info\">\r\n<div class=\"rowlef\">Điện áp                                       220v / 60HZ</div>\r\n<div>Công xuất                                   500W</div>\r\n<div>Tốc Độ                                        3.500 vòng/phút</div>\r\n<div>Xuất Xứ                                      Việt Nam</div>\r\n</div>\r\n<div class=\"row-info\">\r\n<div>Bảo hành                                    2 năm</div>\r\n<div><span class=\"amp-wp-c85899d amp-wp-c85899d amp-wp-c85899d amp-wp-c85899d amp-wp-cc68ddc\" data-amp-original-style=\"color: #ff0000;\"><strong>Tổng đài                                    1900 98 68 29</strong></span></div>\r\n<div><span class=\"amp-wp-c85899d amp-wp-c85899d amp-wp-c85899d amp-wp-c85899d amp-wp-cc68ddc\" data-amp-original-style=\"color: #ff0000;\"><strong>Hotline                                       0979 433 900</strong></span></div>\r\n</div>', 'publish', 'open', 'closed', '', 'may-rung-massage-queen-f1', '', '', '2020-10-19 17:53:56', '2020-10-19 17:53:56', '', 0, 'http://localhost/thietbitheduc/?post_type=product&#038;p=33', 0, 'product', '', 0),
(34, 1, '2020-10-19 17:42:44', '2020-10-19 17:42:44', '', '3-2', '', 'inherit', 'open', 'closed', '', '3-2', '', '', '2020-10-19 17:42:44', '2020-10-19 17:42:44', '', 0, 'http://localhost/thietbitheduc/wp-content/uploads/2020/10/3-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(35, 1, '2020-10-19 17:43:55', '2020-10-19 17:43:55', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<div class=\"product-1\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\">Máy Massage</div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n</div>\n<div class=\"bg-product-1\">\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"5\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-massage\"]\n</div>\n</div>\n<!-- /wp:html -->', 'Trang chủ', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2020-10-19 17:43:55', '2020-10-19 17:43:55', '', 30, 'http://localhost/thietbitheduc/2020/10/19/30-revision-v1/', 0, 'revision', '', 0),
(36, 1, '2020-10-19 17:49:11', '2020-10-19 17:49:11', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<div class=\"product-1\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Máy Massage</h2></div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n</div>\n<div class=\"bg-product-1\">\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"5\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-massage\"]\n</div>\n</div>\n<!-- /wp:html -->', 'Trang chủ', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2020-10-19 17:49:11', '2020-10-19 17:49:11', '', 30, 'http://localhost/thietbitheduc/2020/10/19/30-revision-v1/', 0, 'revision', '', 0),
(37, 1, '2020-10-19 17:52:17', '2020-10-19 17:52:17', '', 'máy-rung-bụng-đứng-', '', 'inherit', 'open', 'closed', '', 'may-rung-bung-dung', '', '', '2020-10-19 17:52:17', '2020-10-19 17:52:17', '', 33, 'http://localhost/thietbitheduc/wp-content/uploads/2020/10/may-rung-bung-dung-.jpg', 0, 'attachment', 'image/jpeg', 0),
(38, 1, '2020-10-19 17:52:18', '2020-10-19 17:52:18', '', 'máy-rung-queen-f1', '', 'inherit', 'open', 'closed', '', 'may-rung-queen-f1', '', '', '2020-10-19 17:52:18', '2020-10-19 17:52:18', '', 33, 'http://localhost/thietbitheduc/wp-content/uploads/2020/10/may-rung-queen-f1.png', 0, 'attachment', 'image/png', 0),
(39, 1, '2020-10-19 17:58:00', '2020-10-19 17:58:00', '<h3 class=\"amp-wp-cdd8ca0\" style=\"text-align: center;\" data-amp-original-style=\"text-align: center;\"><span class=\"amp-wp-57b7fc0\" data-amp-original-style=\"color: #008000;\"><strong><em>MÁY RUNG ĐỨNG QUEEN-F1.</em></strong></span></h3>\n<h4><strong><span class=\"amp-wp-5443cfc\" data-amp-original-style=\"color: #000000;\">MÁY RUNG QUEN F1. </span></strong><span class=\"amp-wp-5443cfc\" data-amp-original-style=\"color: #000000;\">thiết bị luyện tập được ưa chuộng  nhất trong các phòng GYM.bởi khả năng rung mạnh mẽ, giúp cho người tập giảm cân, giảm mỡ bụng, giảm vòng eo mông,… máy rung bụng đứng queen f1 còn thư giãn, xoa dịu đi mọi cơn đau nhức sau một ngày làm việc căng thẳng và mệt mỏi, hỗ trợ chức năng tiêu hóa, tăng cường tuần hoàn máu.</span></h4>', 'MÁY RUNG Massage QUEEN-F1', '<div class=\"row-info\"><div>Tình trạng&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=\"amp-wp-c85899d amp-wp-cc68ddc\" data-amp-original-style=\"color: #ff0000;\"><strong><span class=\"amp-wp-c85899d amp-wp-c85899d\"><span class=\"amp-wp-e0fc2d9\">CÒN HÀNG</span></span></strong></span></div></div><div class=\"row-info\"><div class=\"rowlef\">Mã sản phẩm&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<strong><span class=\"amp-wp-cc68ddc\" data-amp-original-style=\"color: #ff0000;\">QUEEN-F1</span></strong></div><div>Hãng Sản Xuất&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; KSV</div></div><div class=\"row-info\"><div class=\"rowlef\">Trọng lượng&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 35kg</div></div><div class=\"row-info\"><div class=\"rowlef\">Kích Thước máy&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 800*500*1150 mm</div></div><div class=\"row-info\"><div class=\"rowlef\">Điện áp&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;220v / 60HZ</div><div>Công xuất&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;500W</div><div>Tốc Độ&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 3.500 vòng/phút</div><div>Xuất Xứ&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Việt Nam</div></div><div class=\"row-info\"><div>Bảo hành&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2 năm</div><div><span class=\"amp-wp-c85899d amp-wp-c85899d amp-wp-c85899d amp-wp-c85899d amp-wp-cc68ddc\" data-amp-original-style=\"color: #ff0000;\"><strong>Tổng đài&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1900 98 68 29</strong></span></div><div><span class=\"amp-wp-c85899d amp-wp-c85899d amp-wp-c85899d amp-wp-c85899d amp-wp-cc68ddc\" data-amp-original-style=\"color: #ff0000;\"><strong>Hotline&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0979 433 900</strong></span></div></div>', 'inherit', 'closed', 'closed', '', '33-autosave-v1', '', '', '2020-10-19 17:58:00', '2020-10-19 17:58:00', '', 33, 'http://localhost/thietbitheduc/2020/10/19/33-autosave-v1/', 0, 'revision', '', 0),
(40, 1, '2020-10-19 18:06:45', '2020-10-19 18:06:45', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<div class=\"product-1\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Máy Massage</h2></div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n</div>\n<div class=\"bg-product-1\">\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-massage\"]\n</div>\n</div>\n<!-- /wp:html -->', 'Trang chủ', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2020-10-19 18:06:45', '2020-10-19 18:06:45', '', 30, 'http://localhost/thietbitheduc/2020/10/19/30-revision-v1/', 0, 'revision', '', 0),
(41, 1, '2020-10-19 18:11:14', '2020-10-19 18:11:14', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<div class=\"product-1 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Máy Massage</h2></div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n</div>\n<div class=\"bg-product-1\">\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-massage\"]\n</div>\n</div>\n\n<div class=\"product-2 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Xe đạp tập thể dục</h2></div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n</div>\n<div class=\"bg-product-1\">\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"xe-dap-tap-the-duc\"]\n</div>\n</div>\n<!-- /wp:html -->', 'Trang chủ', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2020-10-19 18:11:14', '2020-10-19 18:11:14', '', 30, 'http://localhost/thietbitheduc/2020/10/19/30-revision-v1/', 0, 'revision', '', 0),
(42, 1, '2020-10-19 18:11:25', '2020-10-19 18:11:25', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<div class=\"product-1\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Máy Massage</h2></div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n</div>\n<div class=\"bg-product-2\">\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"5\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-massage\"]\n</div>\n</div>\n<!-- /wp:html -->', 'Trang chủ', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2020-10-19 18:11:25', '2020-10-19 18:11:25', '', 30, 'http://localhost/thietbitheduc/2020/10/19/30-revision-v1/', 0, 'revision', '', 0),
(43, 1, '2020-10-19 18:12:11', '2020-10-19 18:12:11', '', '2-1', '', 'inherit', 'open', 'closed', '', '2-1', '', '', '2020-10-19 18:12:11', '2020-10-19 18:12:11', '', 0, 'http://localhost/thietbitheduc/wp-content/uploads/2020/10/2-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(44, 1, '2020-10-19 18:13:03', '2020-10-19 18:13:03', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<div class=\"product-1 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Máy Massage</h2></div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n</div>\n<div class=\"bg-product-1\">\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-massage\"]\n</div>\n</div>\n\n<div class=\"product-2 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Xe đạp tập thể dục</h2></div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n</div>\n<div class=\"bg-product-1\">\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"xe-dap-tap-the-duc\"]\n</div>\n</div>\n<!-- /wp:html -->', 'Trang chủ', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2020-10-19 18:13:03', '2020-10-19 18:13:03', '', 30, 'http://localhost/thietbitheduc/2020/10/19/30-revision-v1/', 0, 'revision', '', 0),
(45, 1, '2020-10-19 18:14:15', '2020-10-19 18:14:15', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<div class=\"product-1 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Máy Massage</h2></div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n</div>\n<div class=\"bg-product-1\">\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-massage\"]\n</div>\n</div>\n\n<div class=\"product-2 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Xe đạp tập thể dục</h2></div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n</div>\n<div class=\"bg-product-2\">\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"xe-dap-tap-the-duc\"]\n</div>\n</div>\n<!-- /wp:html -->', 'Trang chủ', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2020-10-19 18:14:15', '2020-10-19 18:14:15', '', 30, 'http://localhost/thietbitheduc/2020/10/19/30-revision-v1/', 0, 'revision', '', 0),
(47, 1, '2020-10-19 18:25:57', '2020-10-19 18:25:57', '<h2 style=\"text-align: center;\">XE ĐẠP TẬP THỂ DỤC ORBITRACK- Sport</h2>\r\nXe đạp tập Orbitrack-sport. Mang đến trải nghiệm quá trình luyện tập giúp giảm cân nhanh.săn chắc các vùng bụng- đùi- mông. Luyện tập mỗi ngày sẽ giúp cải thiện sức khỏe, tăng tuần hoàn máu,giúp phòng chống các bệnh về cột sống và xương khớp.', 'Xe đạp tập Orbitrack -Sport-Có xoay eo', '<div class=\"row-info\">\r\n<div>Tình trạng                                  <span class=\"amp-wp-c85899d amp-wp-c85899d amp-wp-c85899d amp-wp-c85899d amp-wp-c85899d amp-wp-cc68ddc amp-wp-57b7fc0\" data-amp-original-style=\"color: #008000;\"><strong>Còn hàng</strong></span></div>\r\n</div>\r\n<div class=\"row-info\">\r\n<div class=\"rowlef\">Mã sản phẩm                            <strong><span class=\"amp-wp-cc68ddc\" data-amp-original-style=\"color: #ff0000;\">Orbitrack-Sport</span></strong></div>\r\n<div>Hãng Sản Xuất                          Orbitrack</div>\r\n<div>Tải Trọng                                   120 kg</div>\r\n</div>\r\n<div class=\"row-info\">\r\n<div class=\"rowlef\">Trọng lượng                               39.5/kg</div>\r\n</div>\r\n<div class=\"row-info\">\r\n<div class=\"rowlef\">Kích Thước máy                       1500*860*470 mm</div>\r\n</div>\r\n<div class=\"row-info\">\r\n<div>Bảo hành                                   1 năm</div>\r\n<div><span class=\"amp-wp-c85899d amp-wp-c85899d amp-wp-c85899d amp-wp-c85899d amp-wp-cc68ddc amp-wp-cc68ddc\" data-amp-original-style=\"color: #ff0000;\"><strong>Tổng đài                                   1900 98 68 29</strong></span></div>\r\n<div><span class=\"amp-wp-c85899d amp-wp-c85899d amp-wp-c85899d amp-wp-c85899d amp-wp-cc68ddc amp-wp-cc68ddc\" data-amp-original-style=\"color: #ff0000;\"><strong>Hotline                                      0979 433 900</strong></span></div>\r\n</div>', 'publish', 'open', 'closed', '', 'xe-dap-tap-orbitrack-sport-co-xoay-eo', '', '', '2020-10-19 18:25:57', '2020-10-19 18:25:57', '', 0, 'http://localhost/thietbitheduc/?post_type=product&#038;p=47', 0, 'product', '', 0),
(48, 1, '2020-10-19 18:25:29', '2020-10-19 18:25:29', '', '5-1', '', 'inherit', 'open', 'closed', '', '5-1', '', '', '2020-10-19 18:25:29', '2020-10-19 18:25:29', '', 47, 'http://localhost/thietbitheduc/wp-content/uploads/2020/10/5-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(49, 1, '2020-10-19 18:25:40', '2020-10-19 18:25:40', '', '6', '', 'inherit', 'open', 'closed', '', '6', '', '', '2020-10-19 18:25:40', '2020-10-19 18:25:40', '', 47, 'http://localhost/thietbitheduc/wp-content/uploads/2020/10/6.jpg', 0, 'attachment', 'image/jpeg', 0),
(50, 1, '2020-10-19 18:26:25', '2020-10-19 18:26:25', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<div class=\"product-1 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Máy Massage</h2></div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n</div>\n<div class=\"bg-product-1\">\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-massage\"]\n</div>\n</div>\n\n<div class=\"product-2 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Xe đạp tập thể dục</h2></div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n</div>\n<div class=\"bg-product-1\">\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-tap-the-duc\"]\n</div>\n</div>\n<!-- /wp:html -->', 'Trang chủ', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2020-10-19 18:26:25', '2020-10-19 18:26:25', '', 30, 'http://localhost/thietbitheduc/2020/10/19/30-revision-v1/', 0, 'revision', '', 0),
(52, 1, '2020-10-20 06:23:01', '2020-10-20 06:23:01', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<div class=\"product-1 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Máy Massage</h2></div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n</div>\n<div class=\"bg-product-1\">\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-massage\"]\n</div>\n</div>\n\n<div class=\"product-2 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Xe đạp tập thể dục</h2></div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n</div>\n<div class=\"bg-product-2\">\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-tap-the-duc\"]\n</div>\n</div>\n<!-- /wp:html -->', 'Trang chủ', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2020-10-20 06:23:01', '2020-10-20 06:23:01', '', 30, 'http://localhost/thietbitheduc/2020/10/20/30-revision-v1/', 0, 'revision', '', 0),
(54, 1, '2020-10-20 08:36:35', '2020-10-20 08:36:35', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<div class=\"product-1 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Máy Massage</h2></div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n</div>\n<div class=\"bg-product-1\">\n</div>\n<div class=\"product-main\">\n[products limit=\"8\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-massage\"]\n</div>\n</div>\n\n<div class=\"product-2 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Xe đạp tập thể dục</h2></div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n</div>\n<div class=\"bg-product-2\">\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-tap-the-duc\"]\n</div>\n</div>\n\n<div class=\"product-1 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Máy Massage</h2></div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n</div>\n<div class=\"bg-product-1\">\n</div>\n<div class=\"product-main\">\n[products limit=\"8\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-massage\"]\n</div>\n</div>\n<!-- /wp:html -->', 'Trang chủ', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2020-10-20 08:36:35', '2020-10-20 08:36:35', '', 30, 'http://localhost/thietbitheduc/2020/10/20/30-revision-v1/', 0, 'revision', '', 0),
(55, 1, '2020-10-20 08:49:25', '2020-10-20 08:49:25', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<div class=\"product-1 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Máy Massage</h2></div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n     \n</div>\n<div class=\"bg-product-1\">\n</div>\n<div class=\"product-main\">\n[products limit=\"8\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-massage\"]\n</div>\n</div>\n\n<div class=\"product-2 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Xe đạp tập thể dục</h2></div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n</div>\n<div class=\"bg-product-2\">\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-tap-the-duc\"]\n</div>\n</div>\n\n\n<!-- /wp:html -->', 'Trang chủ', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2020-10-20 08:49:25', '2020-10-20 08:49:25', '', 30, 'http://localhost/thietbitheduc/2020/10/20/30-revision-v1/', 0, 'revision', '', 0),
(56, 1, '2020-10-20 08:55:08', '2020-10-20 08:55:08', '', 'z2135781144264_1651be293f7027d4df5ccf993c246bc0', '', 'inherit', 'open', 'closed', '', 'z2135781144264_1651be293f7027d4df5ccf993c246bc0', '', '', '2020-10-20 08:55:08', '2020-10-20 08:55:08', '', 0, 'http://localhost/thietbitheduc/wp-content/uploads/2020/10/z2135781144264_1651be293f7027d4df5ccf993c246bc0.jpg', 0, 'attachment', 'image/jpeg', 0),
(57, 1, '2020-11-02 05:57:37', '2020-11-02 05:57:37', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<div class=\"product-1 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Máy Massage</h2></div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n     \n</div>\n<div class=\"bg-product-1\">\n</div>\n<div class=\"product-main\">\n[products limit=\"8\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-massage\"]\n</div>\n</div>\n\n<div class=\"product-2 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Xe đạp tập thể dục</h2></div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n</div>\n<div class=\"bg-product-2\">\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-tap-the-duc\"]\n</div>\n</div>\n\n<div class=\"product-1 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Máy Massage</h2></div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n     \n</div>\n<div class=\"bg-product-1\">\n</div>\n<div class=\"product-main\">\n[products limit=\"8\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-massage\"]\n</div>\n</div>\n<!-- /wp:html -->', 'Trang chủ', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2020-11-02 05:57:37', '2020-11-02 05:57:37', '', 30, 'http://localhost/thietbitheduc/2020/11/02/30-revision-v1/', 0, 'revision', '', 0),
(58, 1, '2020-11-02 05:58:00', '2020-11-02 05:58:00', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<div class=\"product-1 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Máy Massage</h2></div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n     \n</div>\n<div class=\"bg-product-1\">\n</div>\n<div class=\"product-main\">\n[products limit=\"8\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-massage\"]\n</div>\n</div>\n\n<div class=\"product-2 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Xe đạp tập thể dục</h2></div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n</div>\n<div class=\"bg-product-2\">\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-tap-the-duc\"]\n</div>\n</div>\n<!-- /wp:html -->', 'Trang chủ', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2020-11-02 05:58:00', '2020-11-02 05:58:00', '', 30, 'http://localhost/thietbitheduc/2020/11/02/30-revision-v1/', 0, 'revision', '', 0),
(59, 1, '2020-11-02 06:06:39', '0000-00-00 00:00:00', '', 'Lưu bản nháp tự động', '', 'auto-draft', 'open', 'open', '', '', '', '', '2020-11-02 06:06:39', '0000-00-00 00:00:00', '', 0, 'http://localhost/thietbitheduc/?p=59', 0, 'post', '', 0),
(60, 1, '2020-11-02 06:25:18', '2020-11-02 06:25:18', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<div class=\"product-1 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Máy Massage</h2></div>\n     <div class=\"product-readmore pull-right\"><a href=\"http://localhost/thietbitheduc/danh-muc-san-pham/may-massage/\"></a>Xem thêm</div>\n     \n</div>\n<div class=\"bg-product-1\">\n</div>\n<div class=\"product-main\">\n[products limit=\"8\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-massage\"]\n</div>\n</div>\n\n<div class=\"product-2 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Xe đạp tập thể dục</h2></div>\n     <div class=\"product-readmore pull-right\">Xem thêm</div>\n</div>\n<div class=\"bg-product-2\">\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-tap-the-duc\"]\n</div>\n</div>\n<!-- /wp:html -->', 'Trang chủ', '', 'inherit', 'closed', 'closed', '', '30-autosave-v1', '', '', '2020-11-02 06:25:18', '2020-11-02 06:25:18', '', 30, 'http://localhost/thietbitheduc/2020/11/02/30-autosave-v1/', 0, 'revision', '', 0),
(61, 1, '2020-11-02 06:26:05', '2020-11-02 06:26:05', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<div class=\"product-1 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Máy Massage</h2></div>\n     <div class=\"product-readmore pull-right\"><a href=\"http://localhost/thietbitheduc/danh-muc-san-pham/may-massage/\"></a>Xem thêm</div>\n     \n</div>\n<div class=\"bg-product-1\">\n</div>\n<div class=\"product-main\">\n[products limit=\"8\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-massage\"]\n</div>\n</div>\n\n<div class=\"product-2 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Xe đạp tập thể dục</h2></div>\n     <div class=\"product-readmore pull-right\"><a href=\"http://localhost/thietbitheduc/danh-muc-san-pham/may-tap-the-duc/\"></a>Xem thêm</div>\n</div>\n<div class=\"bg-product-2\">\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-tap-the-duc\"]\n</div>\n</div>\n<!-- /wp:html -->', 'Trang chủ', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2020-11-02 06:26:05', '2020-11-02 06:26:05', '', 30, 'http://localhost/thietbitheduc/2020/11/02/30-revision-v1/', 0, 'revision', '', 0),
(62, 1, '2020-11-02 06:28:20', '2020-11-02 06:28:20', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<div class=\"product-1 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Máy Massage</h2></div>\n     <div class=\"product-readmore pull-right\"><a href=\"http://localhost/thietbitheduc/danh-muc-san-pham/may-massage/\">Xem thêm</a></div>\n     \n</div>\n<div class=\"bg-product-1\">\n</div>\n<div class=\"product-main\">\n[products limit=\"8\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-massage\"]\n</div>\n</div>\n\n<div class=\"product-2 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Xe đạp tập thể dục</h2></div>\n     <div class=\"product-readmore pull-right\"><a href=\"http://localhost/thietbitheduc/danh-muc-san-pham/may-tap-the-duc/\">Xem thêm</a></div>\n</div>\n<div class=\"bg-product-2\">\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-tap-the-duc\"]\n</div>\n</div>\n<!-- /wp:html -->', 'Trang chủ', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2020-11-02 06:28:20', '2020-11-02 06:28:20', '', 30, 'http://localhost/thietbitheduc/2020/11/02/30-revision-v1/', 0, 'revision', '', 0),
(63, 1, '2020-11-02 06:29:57', '2020-11-02 06:29:57', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<div class=\"product-1 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Máy Massage</h2></div>\n     <div class=\"product-readmore pull-right\"><a href=\"http://localhost/thietbitheduc/danh-muc-san-pham/may-massage/\">Xem Thêm</a></div>\n     \n</div>\n<div class=\"bg-product-1\">\n</div>\n<div class=\"product-main\">\n[products limit=\"8\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-massage\"]\n</div>\n</div>\n\n<div class=\"product-2 clearfix\">\n<div class=\"product-top\">\n     <div class=\"product-title pull-left\"><h2>Xe đạp tập thể dục</h2></div>\n     <div class=\"product-readmore pull-right\"><a href=\"http://localhost/thietbitheduc/danh-muc-san-pham/may-tap-the-duc/\">Xem Thêm</a></div>\n</div>\n<div class=\"bg-product-2\">\n</div>\n<div class=\"product-main\">\n[products limit=\"10\" columns=\"4\" orderby=\"date\" order=\"DESC\" visibility=\"visible\" category=\"may-tap-the-duc\"]\n</div>\n</div>\n<!-- /wp:html -->', 'Trang chủ', '', 'inherit', 'closed', 'closed', '', '30-revision-v1', '', '', '2020-11-02 06:29:57', '2020-11-02 06:29:57', '', 30, 'http://localhost/thietbitheduc/2020/11/02/30-revision-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_termmeta`
--

INSERT INTO `wp_termmeta` (`meta_id`, `term_id`, `meta_key`, `meta_value`) VALUES
(1, 16, 'order', '0'),
(2, 16, 'display_type', ''),
(3, 16, 'thumbnail_id', '0'),
(4, 17, 'order', '0'),
(5, 17, 'display_type', ''),
(6, 17, 'thumbnail_id', '0'),
(7, 18, 'order', '0'),
(8, 18, 'display_type', ''),
(9, 18, 'thumbnail_id', '0'),
(10, 19, 'order', '0'),
(11, 19, 'display_type', ''),
(12, 19, 'thumbnail_id', '0'),
(13, 20, 'order', '0'),
(14, 20, 'display_type', ''),
(15, 20, 'thumbnail_id', '0'),
(16, 21, 'order', '0'),
(17, 21, 'display_type', ''),
(18, 21, 'thumbnail_id', '0'),
(19, 17, 'product_count_product_cat', '1'),
(20, 16, 'product_count_product_cat', '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Chưa được phân loại', 'khong-phan-loai', 0),
(2, 'simple', 'simple', 0),
(3, 'grouped', 'grouped', 0),
(4, 'variable', 'variable', 0),
(5, 'external', 'external', 0),
(6, 'exclude-from-search', 'exclude-from-search', 0),
(7, 'exclude-from-catalog', 'exclude-from-catalog', 0),
(8, 'featured', 'featured', 0),
(9, 'outofstock', 'outofstock', 0),
(10, 'rated-1', 'rated-1', 0),
(11, 'rated-2', 'rated-2', 0),
(12, 'rated-3', 'rated-3', 0),
(13, 'rated-4', 'rated-4', 0),
(14, 'rated-5', 'rated-5', 0),
(15, 'Chưa phân loại', 'chua-phan-loai', 0),
(16, 'Máy tập thể dục', 'may-tap-the-duc', 0),
(17, 'Máy Massage', 'may-massage', 0),
(18, 'Máy tập nhóm cơ', 'may-tap-nhom-co', 0),
(19, 'Linh kiện - phụ kiện', 'linh-kien-phu-kien', 0),
(20, 'Máy Massage bụng', 'may-massage-bung', 0),
(21, 'Máy Massage tay - chân', 'may-massage-tay-chan', 0),
(22, 'Menu 1', 'menu-1', 0),
(23, 'Main menu', 'main-menu', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(10, 22, 0),
(11, 22, 0),
(12, 22, 0),
(13, 22, 0),
(14, 22, 0),
(15, 22, 0),
(16, 23, 0),
(17, 23, 0),
(18, 23, 0),
(19, 23, 0),
(20, 23, 0),
(21, 23, 0),
(33, 2, 0),
(33, 17, 0),
(47, 2, 0),
(47, 16, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'product_type', '', 0, 2),
(3, 3, 'product_type', '', 0, 0),
(4, 4, 'product_type', '', 0, 0),
(5, 5, 'product_type', '', 0, 0),
(6, 6, 'product_visibility', '', 0, 0),
(7, 7, 'product_visibility', '', 0, 0),
(8, 8, 'product_visibility', '', 0, 0),
(9, 9, 'product_visibility', '', 0, 0),
(10, 10, 'product_visibility', '', 0, 0),
(11, 11, 'product_visibility', '', 0, 0),
(12, 12, 'product_visibility', '', 0, 0),
(13, 13, 'product_visibility', '', 0, 0),
(14, 14, 'product_visibility', '', 0, 0),
(15, 15, 'product_cat', '', 0, 0),
(16, 16, 'product_cat', '', 0, 1),
(17, 17, 'product_cat', '', 0, 1),
(18, 18, 'product_cat', '', 0, 0),
(19, 19, 'product_cat', '', 0, 0),
(20, 20, 'product_cat', '', 17, 0),
(21, 21, 'product_cat', '', 17, 0),
(22, 22, 'nav_menu', '', 0, 6),
(23, 23, 'nav_menu', '', 0, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'wp496_privacy'),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:3:{s:64:\"85a64eb4ee99468d83abb932a8351bab5791b6637b8f5feeb187a0fed5b4e571\";a:4:{s:10:\"expiration\";i:1604390222;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:135:\"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/90.0.148 Chrome/84.0.4147.148 Safari/537.36\";s:5:\"login\";i:1603180622;}s:64:\"ecee489499c0bd37e7f7605b71a3d0f912aa73b40c2edfca3ae04986b17f7599\";a:4:{s:10:\"expiration\";i:1604469987;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36\";s:5:\"login\";i:1604297187;}s:64:\"2104c439220f6652af8c6f3459c78f259a4d919227d31e6d90265016c2d72272\";a:4:{s:10:\"expiration\";i:1604473769;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36\";s:5:\"login\";i:1604300969;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '59'),
(18, 1, '_woocommerce_tracks_anon_id', 'woo:V/ejD/MOy4VVpuXj2NPl4Fmu'),
(19, 1, 'last_update', '1603121293'),
(20, 1, 'woocommerce_admin_activity_panel_inbox_last_read', '1603121291627'),
(21, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(22, 1, 'metaboxhidden_nav-menus', 'a:3:{i:0;s:21:\"add-post-type-product\";i:1;s:12:\"add-post_tag\";i:2;s:15:\"add-product_tag\";}'),
(23, 1, 'nav_menu_recently_edited', '23'),
(24, 1, 'closedpostboxes_nav-menus', 'a:0:{}'),
(25, 1, 'wc_last_active', '1604275200'),
(26, 1, 'wp_user-settings', 'libraryContent=browse'),
(27, 1, 'wp_user-settings-time', '1603126957'),
(28, 1, '_order_count', '0'),
(33, 1, '_woocommerce_persistent_cart_1', 'a:1:{s:4:\"cart\";a:1:{s:32:\"182be0c5cdcd5072bb1864cdee4d3d6e\";a:11:{s:3:\"key\";s:32:\"182be0c5cdcd5072bb1864cdee4d3d6e\";s:10:\"product_id\";i:33;s:12:\"variation_id\";i:0;s:9:\"variation\";a:0:{}s:8:\"quantity\";i:2;s:9:\"data_hash\";s:32:\"b5c1d5ca8bae6d4896cf1807cdf763f0\";s:13:\"line_tax_data\";a:2:{s:8:\"subtotal\";a:0:{}s:5:\"total\";a:0:{}}s:13:\"line_subtotal\";d:4290000;s:17:\"line_subtotal_tax\";i:0;s:10:\"line_total\";d:4290000;s:8:\"line_tax\";i:0;}}}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$ByouaNlzCl8X2FxjUoIFQwgL06X0sH1', 'admin', 'ringbackaround357@gmail.com', '', '2020-10-19 15:19:58', '', 0, 'admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_wc_admin_notes`
--

CREATE TABLE `wp_wc_admin_notes` (
  `note_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_reminder` datetime DEFAULT NULL,
  `is_snoozable` tinyint(1) NOT NULL DEFAULT 0,
  `layout` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `icon` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'info'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_wc_admin_notes`
--

INSERT INTO `wp_wc_admin_notes` (`note_id`, `name`, `type`, `locale`, `title`, `content`, `content_data`, `status`, `source`, `date_created`, `date_reminder`, `is_snoozable`, `layout`, `image`, `is_deleted`, `icon`) VALUES
(1, 'wc-admin-onboarding-email-marketing', 'info', 'en_US', 'Tips, product updates, and inspiration', 'We\'re here for you - get tips, product updates and inspiration straight to your email box', '{}', 'unactioned', 'woocommerce-admin', '2020-10-19 15:28:05', NULL, 0, 'plain', '', 0, 'info'),
(2, 'wc-admin-marketing-intro', 'info', 'en_US', 'Connect with your audience', 'Grow your customer base and increase your sales with marketing tools built for WooCommerce.', '{}', 'unactioned', 'woocommerce-admin', '2020-10-19 15:28:05', NULL, 0, 'plain', '', 0, 'info'),
(3, 'ecomm-need-help-setting-up-your-store', 'info', 'en_US', 'Need help setting up your Store?', 'Schedule a free 30-min <a href=\"https://wordpress.com/support/concierge-support/\">quick start session</a> and get help from our specialists. We’re happy to walk through setup steps, show you around the WordPress.com dashboard, troubleshoot any issues you may have, and help you the find the features you need to accomplish your goals for your site.', '{}', 'pending', 'woocommerce.com', '2020-10-19 15:28:06', NULL, 0, 'plain', '', 0, 'info'),
(4, 'woocommerce-services', 'info', 'en_US', 'WooCommerce Shipping & Tax', 'WooCommerce Shipping &amp; Tax helps get your store “ready to sell” as quickly as possible. You create your products. We take care of tax calculation, payment processing, and shipping label printing! Learn more about the extension that you just installed.', '{}', 'pending', 'woocommerce.com', '2020-10-19 15:28:06', NULL, 0, 'plain', '', 0, 'info'),
(5, 'ecomm-unique-shopping-experience', 'info', 'en_US', 'For a shopping experience as unique as your customers', 'Product Add-Ons allow your customers to personalize products while they’re shopping on your online store. No more follow-up email requests—customers get what they want, before they’re done checking out. Learn more about this extension that comes included in your plan.', '{}', 'pending', 'woocommerce.com', '2020-10-19 15:28:06', NULL, 0, 'plain', '', 0, 'info'),
(6, 'wc-admin-wc-helper-connection', 'info', 'en_US', 'Connect to WooCommerce.com', 'Connect to get important product notifications and updates.', '{}', 'unactioned', 'woocommerce-admin', '2020-10-19 15:28:06', NULL, 0, 'plain', '', 0, 'info'),
(7, 'wc-admin-onboarding-profiler-reminder', 'update', 'en_US', 'Welcome to WooCommerce! Set up your store and start selling', 'We\'re here to help you going through the most important steps to get your store up and running.', '{}', 'actioned', 'woocommerce-admin', '2020-10-19 15:28:06', NULL, 0, 'plain', '', 0, 'info'),
(8, 'wc-admin-draw-attention', 'info', 'en_US', 'How to draw attention to your online store', 'To get you started, here are seven ways to boost your sales and avoid getting drowned out by similar, mass-produced products competing for the same buyers.', '{}', 'unactioned', 'woocommerce-admin', '2020-10-19 15:31:26', NULL, 0, 'plain', '', 0, 'info'),
(9, 'wc-admin-mobile-app', 'info', 'en_US', 'Install Woo mobile app', 'Install the WooCommerce mobile app to manage orders, receive sales notifications, and view key metrics — wherever you are.', '{}', 'unactioned', 'woocommerce-admin', '2020-10-26 05:55:21', NULL, 0, 'plain', '', 0, 'info'),
(10, 'wc-admin-need-some-inspiration', 'info', 'en_US', 'Do you need some inspiration?', 'Check some of our favorite customer stories from entrepreneurs, agencies, and developers in our global community.', '{}', 'unactioned', 'woocommerce-admin', '2020-10-26 05:55:22', NULL, 0, 'plain', '', 0, 'info'),
(11, 'wc-admin-store-notice-giving-feedback-2', 'info', 'en_US', 'Give feedback', 'Now that you’ve chosen us as a partner, our goal is to make sure we\'re providing the right tools to meet your needs. We\'re looking forward to having your feedback on the store setup experience so we can improve it in the future.', '{}', 'unactioned', 'woocommerce-admin', '2020-11-02 05:50:26', NULL, 0, 'plain', '', 0, 'info'),
(12, 'wc-admin-insight-first-sale', 'survey', 'en_US', 'Did you know?', 'A WooCommerce powered store needs on average 31 days to get the first sale. You\'re on the right track! Do you find this type of insight useful?', '{}', 'unactioned', 'woocommerce-admin', '2020-11-02 05:50:26', NULL, 0, 'plain', '', 0, 'info'),
(13, 'wc-admin-home-screen-feedback', 'info', 'en_US', 'Help us improve the WooCommerce Home screen', 'We\'d love your input to shape the future of the WooCommerce Home screen together. Feel free to share any feedback, ideas or suggestions that you have.', '{}', 'unactioned', 'woocommerce-admin', '2020-11-02 05:50:26', NULL, 0, 'plain', '', 0, 'info'),
(14, 'wc-admin-customize-store-with-blocks', 'info', 'en_US', 'Customize your online store with WooCommerce blocks', 'With our blocks, you can select and display products, categories, filters, and more virtually anywhere on your site — no need to use shortcodes or edit lines of code. Learn more about how to use each one of them.', '{}', 'unactioned', 'woocommerce-admin', '2020-11-03 06:31:00', NULL, 0, 'plain', '', 0, 'info');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_wc_admin_note_actions`
--

CREATE TABLE `wp_wc_admin_note_actions` (
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `note_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `actioned_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_wc_admin_note_actions`
--

INSERT INTO `wp_wc_admin_note_actions` (`action_id`, `note_id`, `name`, `label`, `query`, `status`, `is_primary`, `actioned_text`) VALUES
(1, 1, 'yes-please', 'Đồng ý!', 'https://woocommerce.us8.list-manage.com/subscribe/post?u=2c1434dc56f9506bf3c3ecd21&amp;id=13860df971&amp;SIGNUPPAGE=plugin', 'actioned', 0, ''),
(2, 2, 'open-marketing-hub', 'Open marketing hub', 'http://localhost/thietbitheduc/wp-admin/admin.php?page=wc-admin&path=/marketing', 'actioned', 0, ''),
(6, 6, 'connect', 'Kết nối', '?page=wc-addons&section=helper', 'unactioned', 0, ''),
(7, 7, 'continue-profiler', 'Continue Store Setup', 'http://localhost/thietbitheduc/wp-admin/admin.php?page=wc-admin&path=/setup-wizard', 'unactioned', 1, ''),
(8, 7, 'skip-profiler', 'Skip Setup', 'http://localhost/thietbitheduc/wp-admin/admin.php?page=wc-admin&reset_profiler=0', 'actioned', 0, ''),
(12, 8, 'learn-more', 'Tìm hiểu thêm', 'https://woocommerce.com/posts/how-to-make-your-online-store-stand-out/?utm_source=inbox', 'actioned', 1, ''),
(28, 9, 'learn-more', 'Tìm hiểu thêm', 'https://woocommerce.com/mobile/', 'actioned', 0, ''),
(29, 10, 'need-some-inspiration', 'See success stories', 'https://woocommerce.com/success-stories/?utm_source=inbox', 'actioned', 1, ''),
(36, 11, 'share-feedback', 'Share feedback', 'https://automattic.survey.fm/new-onboarding-survey', 'actioned', 0, ''),
(37, 12, 'affirm-insight-first-sale', 'Có', '', 'actioned', 0, 'Thanks for your feedback'),
(38, 12, 'deny-insight-first-sale', 'Không', '', 'actioned', 0, 'Thanks for your feedback'),
(39, 13, 'home-screen-feedback-share-feedback', 'Share feedback', 'https://automattic.survey.fm/home-screen-survey', 'actioned', 0, ''),
(43, 14, 'customize-store-with-blocks', 'Tìm hiểu thêm', 'https://woocommerce.com/posts/how-to-customize-your-online-store-with-woocommerce-blocks/?utm_source=inbox', 'actioned', 1, ''),
(44, 3, 'set-up-concierge', 'Schedule free session', 'https://wordpress.com/me/concierge', 'actioned', 1, ''),
(45, 4, 'learn-more', 'Learn more', 'https://docs.woocommerce.com/document/woocommerce-shipping-and-tax/?utm_source=inbox', 'unactioned', 1, ''),
(46, 5, 'learn-more-ecomm-unique-shopping-experience', 'Learn more', 'https://docs.woocommerce.com/document/product-add-ons/?utm_source=inbox', 'actioned', 1, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_wc_category_lookup`
--

CREATE TABLE `wp_wc_category_lookup` (
  `category_tree_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_wc_category_lookup`
--

INSERT INTO `wp_wc_category_lookup` (`category_tree_id`, `category_id`) VALUES
(15, 15);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_wc_customer_lookup`
--

CREATE TABLE `wp_wc_customer_lookup` (
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_last_active` timestamp NULL DEFAULT NULL,
  `date_registered` timestamp NULL DEFAULT NULL,
  `country` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `postcode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_wc_download_log`
--

CREATE TABLE `wp_wc_download_log` (
  `download_log_id` bigint(20) UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_ip_address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_wc_order_coupon_lookup`
--

CREATE TABLE `wp_wc_order_coupon_lookup` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `discount_amount` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_wc_order_product_lookup`
--

CREATE TABLE `wp_wc_order_product_lookup` (
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variation_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_qty` int(11) NOT NULL,
  `product_net_revenue` double NOT NULL DEFAULT 0,
  `product_gross_revenue` double NOT NULL DEFAULT 0,
  `coupon_amount` double NOT NULL DEFAULT 0,
  `tax_amount` double NOT NULL DEFAULT 0,
  `shipping_amount` double NOT NULL DEFAULT 0,
  `shipping_tax_amount` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_wc_order_stats`
--

CREATE TABLE `wp_wc_order_stats` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `num_items_sold` int(11) NOT NULL DEFAULT 0,
  `total_sales` double NOT NULL DEFAULT 0,
  `tax_total` double NOT NULL DEFAULT 0,
  `shipping_total` double NOT NULL DEFAULT 0,
  `net_total` double NOT NULL DEFAULT 0,
  `returning_customer` tinyint(1) DEFAULT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_wc_order_tax_lookup`
--

CREATE TABLE `wp_wc_order_tax_lookup` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shipping_tax` double NOT NULL DEFAULT 0,
  `order_tax` double NOT NULL DEFAULT 0,
  `total_tax` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_wc_product_meta_lookup`
--

CREATE TABLE `wp_wc_product_meta_lookup` (
  `product_id` bigint(20) NOT NULL,
  `sku` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `virtual` tinyint(1) DEFAULT 0,
  `downloadable` tinyint(1) DEFAULT 0,
  `min_price` decimal(19,4) DEFAULT NULL,
  `max_price` decimal(19,4) DEFAULT NULL,
  `onsale` tinyint(1) DEFAULT 0,
  `stock_quantity` double DEFAULT NULL,
  `stock_status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'instock',
  `rating_count` bigint(20) DEFAULT 0,
  `average_rating` decimal(3,2) DEFAULT 0.00,
  `total_sales` bigint(20) DEFAULT 0,
  `tax_status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'taxable',
  `tax_class` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_wc_product_meta_lookup`
--

INSERT INTO `wp_wc_product_meta_lookup` (`product_id`, `sku`, `virtual`, `downloadable`, `min_price`, `max_price`, `onsale`, `stock_quantity`, `stock_status`, `rating_count`, `average_rating`, `total_sales`, `tax_status`, `tax_class`) VALUES
(33, '', 0, 0, '4290000.0000', '4290000.0000', 1, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(47, '', 0, 0, '4250000.0000', '4250000.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_wc_reserved_stock`
--

CREATE TABLE `wp_wc_reserved_stock` (
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `stock_quantity` double NOT NULL DEFAULT 0,
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expires` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_wc_tax_rate_classes`
--

CREATE TABLE `wp_wc_tax_rate_classes` (
  `tax_rate_class_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_wc_tax_rate_classes`
--

INSERT INTO `wp_wc_tax_rate_classes` (`tax_rate_class_id`, `name`, `slug`) VALUES
(1, 'Reduced rate', 'reduced-rate'),
(2, 'Zero rate', 'zero-rate');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_wc_webhooks`
--

CREATE TABLE `wp_wc_webhooks` (
  `webhook_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_version` smallint(4) NOT NULL,
  `failure_count` smallint(10) NOT NULL DEFAULT 0,
  `pending_delivery` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_woocommerce_api_keys`
--

CREATE TABLE `wp_woocommerce_api_keys` (
  `key_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_key` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_secret` char(43) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonces` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `truncated_key` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_access` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_woocommerce_attribute_taxonomies`
--

CREATE TABLE `wp_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_label` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_orderby` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_public` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_woocommerce_downloadable_product_permissions`
--

CREATE TABLE `wp_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `download_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `order_key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `downloads_remaining` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_woocommerce_log`
--

CREATE TABLE `wp_woocommerce_log` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `level` smallint(4) NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_woocommerce_order_itemmeta`
--

CREATE TABLE `wp_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_woocommerce_order_items`
--

CREATE TABLE `wp_woocommerce_order_items` (
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_woocommerce_payment_tokenmeta`
--

CREATE TABLE `wp_woocommerce_payment_tokenmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `payment_token_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_woocommerce_payment_tokens`
--

CREATE TABLE `wp_woocommerce_payment_tokens` (
  `token_id` bigint(20) UNSIGNED NOT NULL,
  `gateway_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_woocommerce_sessions`
--

CREATE TABLE `wp_woocommerce_sessions` (
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `session_key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_expiry` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wp_woocommerce_sessions`
--

INSERT INTO `wp_woocommerce_sessions` (`session_id`, `session_key`, `session_value`, `session_expiry`) VALUES
(6, '1', 'a:9:{s:4:\"cart\";s:420:\"a:1:{s:32:\"182be0c5cdcd5072bb1864cdee4d3d6e\";a:11:{s:3:\"key\";s:32:\"182be0c5cdcd5072bb1864cdee4d3d6e\";s:10:\"product_id\";i:33;s:12:\"variation_id\";i:0;s:9:\"variation\";a:0:{}s:8:\"quantity\";i:2;s:9:\"data_hash\";s:32:\"b5c1d5ca8bae6d4896cf1807cdf763f0\";s:13:\"line_tax_data\";a:2:{s:8:\"subtotal\";a:0:{}s:5:\"total\";a:0:{}}s:13:\"line_subtotal\";d:8580000;s:17:\"line_subtotal_tax\";i:0;s:10:\"line_total\";d:8580000;s:8:\"line_tax\";i:0;}}\";s:11:\"cart_totals\";s:415:\"a:15:{s:8:\"subtotal\";s:9:\"8580000.0\";s:12:\"subtotal_tax\";d:0;s:14:\"shipping_total\";s:3:\"0.0\";s:12:\"shipping_tax\";i:0;s:14:\"shipping_taxes\";a:0:{}s:14:\"discount_total\";i:0;s:12:\"discount_tax\";i:0;s:19:\"cart_contents_total\";s:9:\"8580000.0\";s:17:\"cart_contents_tax\";i:0;s:19:\"cart_contents_taxes\";a:0:{}s:9:\"fee_total\";s:3:\"0.0\";s:7:\"fee_tax\";i:0;s:9:\"fee_taxes\";a:0:{}s:5:\"total\";s:9:\"8580000.0\";s:9:\"total_tax\";d:0;}\";s:15:\"applied_coupons\";s:6:\"a:0:{}\";s:22:\"coupon_discount_totals\";s:6:\"a:0:{}\";s:26:\"coupon_discount_tax_totals\";s:6:\"a:0:{}\";s:21:\"removed_cart_contents\";s:6:\"a:0:{}\";s:8:\"customer\";s:687:\"a:26:{s:2:\"id\";s:1:\"0\";s:13:\"date_modified\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:4:\"city\";s:0:\"\";s:9:\"address_1\";s:0:\"\";s:7:\"address\";s:0:\"\";s:9:\"address_2\";s:0:\"\";s:5:\"state\";s:0:\"\";s:7:\"country\";s:2:\"VN\";s:17:\"shipping_postcode\";s:0:\"\";s:13:\"shipping_city\";s:0:\"\";s:18:\"shipping_address_1\";s:0:\"\";s:16:\"shipping_address\";s:0:\"\";s:18:\"shipping_address_2\";s:0:\"\";s:14:\"shipping_state\";s:0:\"\";s:16:\"shipping_country\";s:2:\"VN\";s:13:\"is_vat_exempt\";s:0:\"\";s:19:\"calculated_shipping\";s:0:\"\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:7:\"company\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:5:\"email\";s:0:\"\";s:19:\"shipping_first_name\";s:0:\"\";s:18:\"shipping_last_name\";s:0:\"\";s:16:\"shipping_company\";s:0:\"\";}\";s:10:\"wc_notices\";N;s:21:\"chosen_payment_method\";s:3:\"cod\";}', 1604473779);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_woocommerce_shipping_zones`
--

CREATE TABLE `wp_woocommerce_shipping_zones` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `zone_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone_order` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_woocommerce_shipping_zone_locations`
--

CREATE TABLE `wp_woocommerce_shipping_zone_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_woocommerce_shipping_zone_methods`
--

CREATE TABLE `wp_woocommerce_shipping_zone_methods` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `instance_id` bigint(20) UNSIGNED NOT NULL,
  `method_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_order` bigint(20) UNSIGNED NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_woocommerce_tax_rates`
--

CREATE TABLE `wp_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_country` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT 0,
  `tax_rate_shipping` int(1) NOT NULL DEFAULT 1,
  `tax_rate_order` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_class` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wp_woocommerce_tax_rate_locations`
--

CREATE TABLE `wp_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `wp_actionscheduler_actions`
--
ALTER TABLE `wp_actionscheduler_actions`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `hook` (`hook`),
  ADD KEY `status` (`status`),
  ADD KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  ADD KEY `args` (`args`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `last_attempt_gmt` (`last_attempt_gmt`),
  ADD KEY `claim_id` (`claim_id`);

--
-- Chỉ mục cho bảng `wp_actionscheduler_claims`
--
ALTER TABLE `wp_actionscheduler_claims`
  ADD PRIMARY KEY (`claim_id`),
  ADD KEY `date_created_gmt` (`date_created_gmt`);

--
-- Chỉ mục cho bảng `wp_actionscheduler_groups`
--
ALTER TABLE `wp_actionscheduler_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `slug` (`slug`(191));

--
-- Chỉ mục cho bảng `wp_actionscheduler_logs`
--
ALTER TABLE `wp_actionscheduler_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `action_id` (`action_id`),
  ADD KEY `log_date_gmt` (`log_date_gmt`);

--
-- Chỉ mục cho bảng `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Chỉ mục cho bảng `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10)),
  ADD KEY `woo_idx_comment_type` (`comment_type`);

--
-- Chỉ mục cho bảng `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Chỉ mục cho bảng `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Chỉ mục cho bảng `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Chỉ mục cho bảng `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Chỉ mục cho bảng `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Chỉ mục cho bảng `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Chỉ mục cho bảng `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Chỉ mục cho bảng `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Chỉ mục cho bảng `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Chỉ mục cho bảng `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Chỉ mục cho bảng `wp_wc_admin_notes`
--
ALTER TABLE `wp_wc_admin_notes`
  ADD PRIMARY KEY (`note_id`);

--
-- Chỉ mục cho bảng `wp_wc_admin_note_actions`
--
ALTER TABLE `wp_wc_admin_note_actions`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `note_id` (`note_id`);

--
-- Chỉ mục cho bảng `wp_wc_category_lookup`
--
ALTER TABLE `wp_wc_category_lookup`
  ADD PRIMARY KEY (`category_tree_id`,`category_id`);

--
-- Chỉ mục cho bảng `wp_wc_customer_lookup`
--
ALTER TABLE `wp_wc_customer_lookup`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `email` (`email`);

--
-- Chỉ mục cho bảng `wp_wc_download_log`
--
ALTER TABLE `wp_wc_download_log`
  ADD PRIMARY KEY (`download_log_id`),
  ADD KEY `permission_id` (`permission_id`),
  ADD KEY `timestamp` (`timestamp`);

--
-- Chỉ mục cho bảng `wp_wc_order_coupon_lookup`
--
ALTER TABLE `wp_wc_order_coupon_lookup`
  ADD PRIMARY KEY (`order_id`,`coupon_id`),
  ADD KEY `coupon_id` (`coupon_id`),
  ADD KEY `date_created` (`date_created`);

--
-- Chỉ mục cho bảng `wp_wc_order_product_lookup`
--
ALTER TABLE `wp_wc_order_product_lookup`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `date_created` (`date_created`);

--
-- Chỉ mục cho bảng `wp_wc_order_stats`
--
ALTER TABLE `wp_wc_order_stats`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `date_created` (`date_created`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `status` (`status`(191));

--
-- Chỉ mục cho bảng `wp_wc_order_tax_lookup`
--
ALTER TABLE `wp_wc_order_tax_lookup`
  ADD PRIMARY KEY (`order_id`,`tax_rate_id`),
  ADD KEY `tax_rate_id` (`tax_rate_id`),
  ADD KEY `date_created` (`date_created`);

--
-- Chỉ mục cho bảng `wp_wc_product_meta_lookup`
--
ALTER TABLE `wp_wc_product_meta_lookup`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `virtual` (`virtual`),
  ADD KEY `downloadable` (`downloadable`),
  ADD KEY `stock_status` (`stock_status`),
  ADD KEY `stock_quantity` (`stock_quantity`),
  ADD KEY `onsale` (`onsale`),
  ADD KEY `min_max_price` (`min_price`,`max_price`);

--
-- Chỉ mục cho bảng `wp_wc_reserved_stock`
--
ALTER TABLE `wp_wc_reserved_stock`
  ADD PRIMARY KEY (`order_id`,`product_id`);

--
-- Chỉ mục cho bảng `wp_wc_tax_rate_classes`
--
ALTER TABLE `wp_wc_tax_rate_classes`
  ADD PRIMARY KEY (`tax_rate_class_id`),
  ADD UNIQUE KEY `slug` (`slug`(191));

--
-- Chỉ mục cho bảng `wp_wc_webhooks`
--
ALTER TABLE `wp_wc_webhooks`
  ADD PRIMARY KEY (`webhook_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `wp_woocommerce_api_keys`
--
ALTER TABLE `wp_woocommerce_api_keys`
  ADD PRIMARY KEY (`key_id`),
  ADD KEY `consumer_key` (`consumer_key`),
  ADD KEY `consumer_secret` (`consumer_secret`);

--
-- Chỉ mục cho bảng `wp_woocommerce_attribute_taxonomies`
--
ALTER TABLE `wp_woocommerce_attribute_taxonomies`
  ADD PRIMARY KEY (`attribute_id`),
  ADD KEY `attribute_name` (`attribute_name`(20));

--
-- Chỉ mục cho bảng `wp_woocommerce_downloadable_product_permissions`
--
ALTER TABLE `wp_woocommerce_downloadable_product_permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(16),`download_id`),
  ADD KEY `download_order_product` (`download_id`,`order_id`,`product_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `user_order_remaining_expires` (`user_id`,`order_id`,`downloads_remaining`,`access_expires`);

--
-- Chỉ mục cho bảng `wp_woocommerce_log`
--
ALTER TABLE `wp_woocommerce_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `level` (`level`);

--
-- Chỉ mục cho bảng `wp_woocommerce_order_itemmeta`
--
ALTER TABLE `wp_woocommerce_order_itemmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `order_item_id` (`order_item_id`),
  ADD KEY `meta_key` (`meta_key`(32));

--
-- Chỉ mục cho bảng `wp_woocommerce_order_items`
--
ALTER TABLE `wp_woocommerce_order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Chỉ mục cho bảng `wp_woocommerce_payment_tokenmeta`
--
ALTER TABLE `wp_woocommerce_payment_tokenmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `payment_token_id` (`payment_token_id`),
  ADD KEY `meta_key` (`meta_key`(32));

--
-- Chỉ mục cho bảng `wp_woocommerce_payment_tokens`
--
ALTER TABLE `wp_woocommerce_payment_tokens`
  ADD PRIMARY KEY (`token_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `wp_woocommerce_sessions`
--
ALTER TABLE `wp_woocommerce_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD UNIQUE KEY `session_key` (`session_key`);

--
-- Chỉ mục cho bảng `wp_woocommerce_shipping_zones`
--
ALTER TABLE `wp_woocommerce_shipping_zones`
  ADD PRIMARY KEY (`zone_id`);

--
-- Chỉ mục cho bảng `wp_woocommerce_shipping_zone_locations`
--
ALTER TABLE `wp_woocommerce_shipping_zone_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `location_type_code` (`location_type`(10),`location_code`(20));

--
-- Chỉ mục cho bảng `wp_woocommerce_shipping_zone_methods`
--
ALTER TABLE `wp_woocommerce_shipping_zone_methods`
  ADD PRIMARY KEY (`instance_id`);

--
-- Chỉ mục cho bảng `wp_woocommerce_tax_rates`
--
ALTER TABLE `wp_woocommerce_tax_rates`
  ADD PRIMARY KEY (`tax_rate_id`),
  ADD KEY `tax_rate_country` (`tax_rate_country`),
  ADD KEY `tax_rate_state` (`tax_rate_state`(2)),
  ADD KEY `tax_rate_class` (`tax_rate_class`(10)),
  ADD KEY `tax_rate_priority` (`tax_rate_priority`);

--
-- Chỉ mục cho bảng `wp_woocommerce_tax_rate_locations`
--
ALTER TABLE `wp_woocommerce_tax_rate_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `tax_rate_id` (`tax_rate_id`),
  ADD KEY `location_type_code` (`location_type`(10),`location_code`(20));

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `wp_actionscheduler_actions`
--
ALTER TABLE `wp_actionscheduler_actions`
  MODIFY `action_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `wp_actionscheduler_claims`
--
ALTER TABLE `wp_actionscheduler_claims`
  MODIFY `claim_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=631;

--
-- AUTO_INCREMENT cho bảng `wp_actionscheduler_groups`
--
ALTER TABLE `wp_actionscheduler_groups`
  MODIFY `group_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `wp_actionscheduler_logs`
--
ALTER TABLE `wp_actionscheduler_logs`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1358;

--
-- AUTO_INCREMENT cho bảng `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT cho bảng `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT cho bảng `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `wp_wc_admin_notes`
--
ALTER TABLE `wp_wc_admin_notes`
  MODIFY `note_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `wp_wc_admin_note_actions`
--
ALTER TABLE `wp_wc_admin_note_actions`
  MODIFY `action_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT cho bảng `wp_wc_customer_lookup`
--
ALTER TABLE `wp_wc_customer_lookup`
  MODIFY `customer_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_wc_download_log`
--
ALTER TABLE `wp_wc_download_log`
  MODIFY `download_log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_wc_tax_rate_classes`
--
ALTER TABLE `wp_wc_tax_rate_classes`
  MODIFY `tax_rate_class_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `wp_wc_webhooks`
--
ALTER TABLE `wp_wc_webhooks`
  MODIFY `webhook_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_woocommerce_api_keys`
--
ALTER TABLE `wp_woocommerce_api_keys`
  MODIFY `key_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_woocommerce_attribute_taxonomies`
--
ALTER TABLE `wp_woocommerce_attribute_taxonomies`
  MODIFY `attribute_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_woocommerce_downloadable_product_permissions`
--
ALTER TABLE `wp_woocommerce_downloadable_product_permissions`
  MODIFY `permission_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_woocommerce_log`
--
ALTER TABLE `wp_woocommerce_log`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_woocommerce_order_itemmeta`
--
ALTER TABLE `wp_woocommerce_order_itemmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_woocommerce_order_items`
--
ALTER TABLE `wp_woocommerce_order_items`
  MODIFY `order_item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_woocommerce_payment_tokenmeta`
--
ALTER TABLE `wp_woocommerce_payment_tokenmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_woocommerce_payment_tokens`
--
ALTER TABLE `wp_woocommerce_payment_tokens`
  MODIFY `token_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_woocommerce_sessions`
--
ALTER TABLE `wp_woocommerce_sessions`
  MODIFY `session_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `wp_woocommerce_shipping_zones`
--
ALTER TABLE `wp_woocommerce_shipping_zones`
  MODIFY `zone_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_woocommerce_shipping_zone_locations`
--
ALTER TABLE `wp_woocommerce_shipping_zone_locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_woocommerce_shipping_zone_methods`
--
ALTER TABLE `wp_woocommerce_shipping_zone_methods`
  MODIFY `instance_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_woocommerce_tax_rates`
--
ALTER TABLE `wp_woocommerce_tax_rates`
  MODIFY `tax_rate_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wp_woocommerce_tax_rate_locations`
--
ALTER TABLE `wp_woocommerce_tax_rate_locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
