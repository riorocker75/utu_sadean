-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2020 at 09:53 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `utu_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `core_rating`
--

CREATE TABLE `core_rating` (
  `rating_id` int(24) NOT NULL,
  `rating_product_id` text NOT NULL,
  `rating_user_id` text NOT NULL,
  `rating_star` text NOT NULL,
  `rating_komen` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dah_category`
--

CREATE TABLE `dah_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_url` varchar(255) NOT NULL,
  `category_parent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dah_category`
--

INSERT INTO `dah_category` (`category_id`, `category_name`, `category_url`, `category_parent`) VALUES
(1, 'Uncategorized', 'uncategorized', 0);

-- --------------------------------------------------------

--
-- Table structure for table `dah_menu`
--

CREATE TABLE `dah_menu` (
  `menu_id` int(11) NOT NULL,
  `menu_mother` varchar(100) NOT NULL,
  `menu_name` varchar(100) NOT NULL,
  `menu_url` text NOT NULL,
  `menu_parent` int(11) NOT NULL,
  `menu_sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dah_menu`
--

INSERT INTO `dah_menu` (`menu_id`, `menu_mother`, `menu_name`, `menu_url`, `menu_parent`, `menu_sort`) VALUES
(1, 'menu-satu', '0', '0', 0, 0),
(12, 'menu-dua', '0', '0', 0, 0),
(33, 'menu-satu', 'Home', 'http://shop.malasngoding.com/', 0, 0),
(35, 'menu-satu', 'Privacy Policy', '#', 0, 4),
(36, 'undefined', 'Home', 'HOme', 0, 0),
(44, 'menu-dua', 'Tutorial Pemrograman', 'http://www.malasngoding.com/', 0, 0),
(50, 'menu-dua', 'Tracking Resi', 'http://shop.malasngoding.com/index/tracking', 0, 1),
(53, 'menu-satu', 'Testimonial', '#', 0, 4),
(54, 'menu-dua', 'Testimonial', '#', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `dah_options`
--

CREATE TABLE `dah_options` (
  `option_id` int(11) NOT NULL,
  `option_name` varchar(60) NOT NULL,
  `option_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dah_options`
--

INSERT INTO `dah_options` (`option_id`, `option_name`, `option_value`) VALUES
(1, 'blog_name', 'Serbaumbi'),
(2, 'blog_description', 'ecommercenya para petani lokal penghasil umbi-umbian '),
(3, 'blog_logo', '884488349_logoutu1.png'),
(4, 'show_post_image', '1'),
(5, 'show_menu_satu', '1'),
(6, 'show_menu_dua', '1'),
(7, 'widget_social_facebook', 'https://www.facebook.com/malasngodingpage'),
(8, 'widget_social_twitter', 'https://twitter.com/malasngoding'),
(9, 'widget_social_google_plus', 'https://plus.google.com/+MalasNgoding'),
(10, 'widget_social_instagram', 'https://www.instagram.com/malasngoding/'),
(11, 'widget_social_youtube', 'https://www.youtube.com/channel/UCry0-mTjkfyPBR-u6XNR4gw');

-- --------------------------------------------------------

--
-- Table structure for table `dah_pages`
--

CREATE TABLE `dah_pages` (
  `page_id` int(11) NOT NULL,
  `page_tittle` text NOT NULL,
  `page_url` text NOT NULL,
  `page_content` text NOT NULL,
  `page_status` varchar(10) NOT NULL,
  `page_cover` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dah_pages`
--

INSERT INTO `dah_pages` (`page_id`, `page_tittle`, `page_url`, `page_content`, `page_status`, `page_cover`) VALUES
(29, 'Tentang SHOP', 'tentang-shop', '<p>MalasNgoding SHOP adalah E-Commerse yang bergerak di bidang penjualan barang-barang kebutuhan penggila dunia IT. contohnya seperti DVD tutorial pemrograman, T-Shirt, Stiker dan banyak lagi yang lainnya.</p>\n\n<p>MalasNgoding SHOP menyediakan Tutorial Pemrograman yang bersifat gratis dan premium. untuk tutorial pemrograman gratis kamu bisa langsung baca <a href=\"http://www.malasngoding.com/\">di sini</a>. dan untuk tutorial pemrograman premium yang berbentuk Video kamu bisa membelinya <a href=\"http://shop.malasngoding.com\">di sini</a>.</p>\n\n<p>MalasNgoding SHOP juga menyediakan promo-promo menarik di setiap akhir minggu. nantikan promo menarik nya untuk mendapatkan potongan harga yang gila-gilaan.</p>\n', 'publish', ''),
(32, 'Pasang Iklan Murah', 'pasang-iklan-murah', '<p>Pasang Iklan murah di malasngoding.com</p>\n', 'publish', ''),
(45, 'Cara Pemesanan', 'cara-pemesanan', '<h2>Cara Memesan Produk Di MalasNgoding SHOP</h2>\n\n<p>Berikut adalah panduan untuk cara memesan produk di MalasNgoding SHOP. yang bisa kamu ikuti tanpa ribet.</p>\n\n<ol>\n	<li>Cari barang/produk yang kamu inginkan. kemudian klik.</li>\n	<li>Akan muncul halaman tentang detail produk yang kamu pilih.</li>\n	<li>Setelah membaca detail produk, kamu langsung bisa memilih pembelian melalui BukaLapak atau Tokopedia.</li>\n	<li>Klik pada tombol Beli Via Bukalapak atau Beli Via Tokopedia (Sesuai keinginan kamu).</li>\n	<li>Selanjutnya kamu tinggal meneruskan proses pembelian melalui toko MalasNgoding di BukaLapak atau Tokopedia.</li>\n</ol>\n\n<h3>Kenapa menggunakan BukaLapak atau Tokopedia ?</h3>\n\n<p>MalasNgoding menggunakan bukalapak atau tokopedia sebagai tempat pembayaran/pemesanan dengan alasan keamanan untuk kedua belah pihak. baik itu pihak pembeli (anda) dan pihak penjual (MalasNgoding).</p>\n\n<p>Sekian lah cara mudah memesan produk di MalasNgoding SHOP.<br />\n<br />\nHappy Shopping ..</p>\n\n<p>&nbsp;</p>\n', 'publish', ''),
(48, 'Bonus Setiap Pembelian', 'bonus-setiap-pembelian', '<p>Malasngoding.com memberikan bonus ebook belajar jquery dasar untuk setiap pembelian produk APAPUN di shop malasngoding.com. dan nantikan bonus lainnya di shop malasngoding.com</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n', 'publish', 'gratis_ebook_jquery_dasar.png'),
(49, 'Waspada Penipuan', 'waspada-penipuan', '<p>Waspadalah terhadap penipuan yang mengatas namakan Malasngoding.com. malasngoding.com hanya menjual produk melalui website shop malasngoding.com ini. dan marketplace yang di antara nya adalah :</p>\n\n<p>Bukalapak :&nbsp;<a href=\"https://www.bukalapak.com/tutorialpemrograman\">https://www.bukalapak.com/tutorialpemrograman</a></p>\n\n<p>Tokopedia :&nbsp;<a href=\"https://www.tokopedia.com/malasngoding\">https://www.tokopedia.com/malasngoding</a></p>\n', 'publish', NULL),
(50, 'Kontak Shop Malasngoding.com', 'kontak-shop-malasngodingcom', '<p>Jika ada kendala atau yang ingin kamu tanyakan, kamu bisa menghubungi tim Shop Malasngoding.com. kamu bebas konsultasi atau sekedar ingin bertanya tentang cara pembelian produk.</p>\n\n<table border=\"0\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\n	<tbody>\n		<tr>\n			<td>Wa / HP</td>\n			<td>0853-6008-0642</td>\n		</tr>\n		<tr>\n			<td>Email</td>\n			<td>shop@malasngoding.com / moezanni@gmail.com</td>\n		</tr>\n	</tbody>\n</table>\n', 'publish', NULL),
(51, 'Pelanggan Bahagia', 'pelanggan-bahagia', '<p>Kamu bisa melihat atau membaca review dari pelanggan SHOP Malasngoding.com yang bahagia</p>\n\n<h3><br />\n<a href=\"https://www.tokopedia.com/malasngoding/review\" target=\"_blank\">Tokopedia</a></h3>\n\n<h3><a href=\"https://www.bukalapak.com/tutorialpemrograman/feedback?user_id=11482473&amp;filter_by=all&amp;feedback_as=all\" target=\"_blank\">BukaLapak</a></h3>\n', 'publish', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dah_posts`
--

CREATE TABLE `dah_posts` (
  `post_id` int(11) NOT NULL,
  `post_author` int(11) NOT NULL,
  `post_date` date NOT NULL,
  `post_tittle` text NOT NULL,
  `post_url` text NOT NULL,
  `post_content` text NOT NULL,
  `post_cover` text,
  `post_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dah_posts`
--

INSERT INTO `dah_posts` (`post_id`, `post_author`, `post_date`, `post_tittle`, `post_url`, `post_content`, `post_cover`, `post_status`) VALUES
(29, 1, '2016-12-02', 'tes', 'tes', '', NULL, 'Publish');

-- --------------------------------------------------------

--
-- Table structure for table `dah_products`
--

CREATE TABLE `dah_products` (
  `prod_id` int(11) NOT NULL,
  `prod_author` int(11) NOT NULL,
  `prod_date` date NOT NULL,
  `prod_name` varchar(200) NOT NULL,
  `prod_desc` text NOT NULL,
  `prod_berat` int(11) NOT NULL,
  `prod_qty` int(11) DEFAULT NULL,
  `prod_img1` varchar(255) DEFAULT NULL,
  `prod_img2` varchar(255) DEFAULT NULL,
  `prod_img3` varchar(255) DEFAULT NULL,
  `prod_img4` varchar(255) DEFAULT NULL,
  `prod_price` int(11) NOT NULL,
  `prod_bukalapak` text NOT NULL,
  `prod_tokopedia` text NOT NULL,
  `prod_kirim` text NOT NULL,
  `prod_lokasi` text NOT NULL,
  `prod_terjual` text NOT NULL,
  `prod_jasa_kirim` text NOT NULL,
  `prod_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dah_products`
--

INSERT INTO `dah_products` (`prod_id`, `prod_author`, `prod_date`, `prod_name`, `prod_desc`, `prod_berat`, `prod_qty`, `prod_img1`, `prod_img2`, `prod_img3`, `prod_img4`, `prod_price`, `prod_bukalapak`, `prod_tokopedia`, `prod_kirim`, `prod_lokasi`, `prod_terjual`, `prod_jasa_kirim`, `prod_status`) VALUES
(65, 1, '2019-09-20', 'Wortel Segar ', 'Wortel segar dipanen langsung dari kebun,\r\nminimal pembelian 1 KG\r\n\r\nKhusus pemesanan area Lhokseumawe, gratis onkir dengan syarat pembelian minimal 5 KG', 1000, 50, '1136755971wartel.jpg', '1783327273_Carrots_2014_1.jpg', '1783327273_Carrots_2014_11.jpg', NULL, 8500, '#', '#', '', 'Lhokseumawe', '', 'JNE', 'Publish'),
(66, 1, '2019-09-20', 'Bawang Merah Kampung', 'Bawang Merah kampung atau dikenal juga dengan bawang merah Aceh.\r\nPerbedaan bisa di lihat di ukuran. Ukuran bawang merah kampung lebih kecil dari ukuran bawang lainnya.\r\nSyarat pembelian :\r\n1. Minimal order 1 KG\r\n2. Khusus area Lhokseumawe gratis ongkir dengan pembelian minimum 5 KG.\r\n', 1000, 50, '979228716_cara-menanam-bawang-merah-640x393.jpg', NULL, NULL, NULL, 28000, '#', '#', 'Dikirim hari pembelian', 'Lhokseumawe', '', 'JNE, POS, TIKI,J&T, Jasa ', 'Publish'),
(67, 1, '2019-09-20', 'Talas Pontianak Ungu', 'Talas Pontianak Ungu,\r\n\r\n\r\nHalo buyer talas pontianak.\r\nKami adalah supplier talas pontianak, domisili kota Lhokseumawe, Aceh. Kami bisa memenuhi permintaan market anda perminggu atau pun per bulan, dengan manimal order 10 kg.\r\n', 10000, 100, '4412212541001157talas-bogor-20160514-150614780x390.jpg', NULL, NULL, NULL, 35000, '#', '#', 'Dikirim hari pembelian', 'Lhokseumawe', '', 'JNE, POS, TIKI,J&T, Jasa ', 'Publish'),
(68, 1, '2019-09-20', 'Ubi Talas Segar', 'Ubi talas atau mbote merupakan jenis umbi-umbian yang tumbuh subur di tanah gembur dan berudara sejuk. Umbi ini mengandung tepung yang membuat kenyang ketika dikonsumsi.\r\nKandungan kalori yang tinggi dalam ubi talas bisa menjadikannya alternatif makanan pokok pengganti nasi. Ubi talas baik bagi kesehatan karena kaya akan kandungan vitamin A dan vitamin C.\r\n', 1000, 100, '206104775_038-04-Ubi-Talas.jpg', NULL, NULL, NULL, 10500, '#', '#', 'Dikirim hari pembelian', 'Lhokseumawe', '', 'JNE, POS, TIKI,J&T, Jasa ', 'Publish'),
(69, 1, '2019-09-20', 'Lobak Gayo Segar', 'Aslinya tanaman lobak berasal dari daratan China. Mirip dengan wortel, jenis sayuran akar ini warnanya bermacam-macam. Tapi yang paling umum dijual di pasaran adalah yang berwarna putih.\r\n\r\nLobak putih memiliki banyak manfaat untuk kesehatan. Lobak putih mengandung vitamin A, B1, B2, C dan vitamin E, minyak atsiri, beta karoten, mangan, kolin dan asam folik. Juga kaya akan serat, kalsium, zat besi, fosfor serta asam oksalat.', 1000, 100, '9385357038-05-Lobak.jpg', NULL, NULL, NULL, 15000, '#', '#', 'Dikirim hari pembelian', 'Lhokseumawe', '', 'JNE, POS, TIKI,J&T, Jasa ', 'Publish'),
(70, 1, '2019-09-20', 'Ubi Jalar Madu', 'ubi jalar madu kualitas terbaik,siap melayani pesanan wilayah Aceh.', 1000, 100, '15812678194-cara-ubi-jalar-bantu-turunkan-berat-badan.jpg', NULL, NULL, NULL, 5300, '#', '#', 'Dikirim hari pembelian', 'Sare', '', 'JNE, POS,, Jasa', 'Publish'),
(71, 1, '2019-09-20', 'Jaual Ubi Jalar ( Ketela Rambat ) ', 'kami menjual ubi jalar berbagai varian ( jenis ) untuk kebutuhan pasar maupun supllay pabrik ', 1000, 100, '1595802324panen-ubi-jalar-o6c3kd-prv.jpg', NULL, NULL, NULL, 4300, '#', '#', 'Dikirim hari pembelian', 'Sare', '', 'JNE, POS,, Jasa', 'Publish'),
(72, 1, '2019-09-20', 'Kentang Granola (super/a/b/c) Kualitas Bersaing', 'KENTANG GRANOLA YANG DI PRODUKSI PARA PETANI TAKENGON. TERSEDIA BERBAGAI GRADE DARI SUPER HINGGA C. MUTU PRODUK YANG TERJAMIN DENGAN QC YANG KETAT. MENGHASILKAN BARANG YANG DIKIRIM MEMILIKI MUTU YANG BAIK.', 1000, 100, '314600664-_180716061323-967.jpg', NULL, NULL, NULL, 12300, '#', '#', 'Dikirim hari pembelian', 'Takengon', '', 'JNE, POS,, Jasa', 'Publish'),
(73, 1, '2019-09-20', 'Bengkoang Mungil', 'Bengkoang Mungil asli panen dari Sare', 1000, 100, '570082390khasiat-bengkuang.jpg', NULL, NULL, NULL, 13200, '#', '#', 'Dikirim hari pembelian', 'Sare', '', 'JNE, POS, Jasa', 'Publish');

-- --------------------------------------------------------

--
-- Table structure for table `dah_product_category`
--

CREATE TABLE `dah_product_category` (
  `pcat_id` int(11) NOT NULL,
  `pcat_name` text NOT NULL,
  `pcat_sub` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dah_product_category`
--

INSERT INTO `dah_product_category` (`pcat_id`, `pcat_name`, `pcat_sub`) VALUES
(1, 'Uncategorized', 0),
(6, 'Kentang', 0),
(17, 'Ubi-ubian', 0),
(29, 'Bawang', 0),
(30, 'Wortel', 0),
(31, 'Garut', 0),
(32, 'Lobak', 0),
(33, 'Bengkuang', 0),
(34, 'Talas', 0);

-- --------------------------------------------------------

--
-- Table structure for table `dah_taxonomy`
--

CREATE TABLE `dah_taxonomy` (
  `taxonomy_id` int(11) NOT NULL,
  `taxonomy_parent` int(11) NOT NULL,
  `taxonomy_child` text NOT NULL,
  `taxonomy` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dah_taxonomy`
--

INSERT INTO `dah_taxonomy` (`taxonomy_id`, `taxonomy_parent`, `taxonomy_child`, `taxonomy`) VALUES
(70, 0, '1', 'product_category'),
(103, 29, '1', 'post_category'),
(264, 65, '30', 'product_category'),
(269, 66, '29', 'product_category'),
(270, 67, '34', 'product_category'),
(273, 68, '17', 'product_category'),
(274, 68, '34', 'product_category'),
(275, 69, '30', 'product_category'),
(276, 70, '17', 'product_category'),
(277, 71, '17', 'product_category'),
(278, 72, '6', 'product_category'),
(279, 73, '33', 'product_category');

-- --------------------------------------------------------

--
-- Table structure for table `dah_users`
--

CREATE TABLE `dah_users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(225) NOT NULL,
  `user_email` varchar(225) NOT NULL,
  `user_login` varchar(225) NOT NULL,
  `user_pass` varchar(225) NOT NULL,
  `user_level` varchar(20) NOT NULL,
  `user_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dah_users`
--

INSERT INTO `dah_users` (`user_id`, `user_name`, `user_email`, `user_login`, `user_pass`, `user_level`, `user_status`) VALUES
(1, 'Ferdian Alghazali', 'ferdian@gmail.com', 'diki', '43b93443937ea642a9a43e77fd5d8f77', 'admin', 1),
(2, 'muzanni', 'moezanni@gmail.com', 'muzanni', '0192023a7bbd73250516f069df18b500', 'admin', 1),
(3, 'Azizi', 'tesdaftar@admin.com', 'pembeli', 'd8578edf8458ce06fbc5bb76a58c5ca4', 'author', 1),
(4, 'musliadi', 'akun@gmail.com', 'akun', 'ef9b53e0cf5c33b09139e641fee8bd96', 'author', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dah_visitor`
--

CREATE TABLE `dah_visitor` (
  `id` int(11) NOT NULL,
  `time_visit` datetime NOT NULL,
  `user_ip` text NOT NULL,
  `user_browser` text NOT NULL,
  `user_os` text NOT NULL,
  `user_device` text NOT NULL,
  `page` text NOT NULL,
  `user_referrer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dah_visitor`
--

INSERT INTO `dah_visitor` (`id`, `time_visit`, `user_ip`, `user_browser`, `user_os`, `user_device`, `page`, `user_referrer`) VALUES
(1, '2016-10-19 15:01:10', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(2, '2016-10-19 15:01:26', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/users'),
(3, '2016-10-19 15:01:28', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/users'),
(4, '2016-10-19 15:02:44', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(5, '2016-10-19 15:02:47', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(6, '2016-10-19 15:02:58', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts'),
(7, '2016-10-19 15:03:07', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/post_add'),
(8, '2016-10-19 15:04:01', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts/?alert=post-saved'),
(9, '2016-10-19 15:04:04', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(10, '2016-10-19 15:04:16', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/page'),
(11, '2016-10-19 15:04:23', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/page_add'),
(12, '2016-10-19 15:04:33', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/page/?alert=page-saved'),
(13, '2016-10-19 15:04:40', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/page_add'),
(14, '2016-10-19 15:04:45', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/page/?alert=page-saved'),
(15, '2016-10-19 15:04:49', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/page/?alert=page-delete'),
(16, '2016-10-19 15:04:52', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/page/?alert=page-delete'),
(17, '2016-10-19 15:04:55', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/page/?alert=page-delete'),
(18, '2016-10-19 15:04:57', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/page/?alert=page-delete'),
(19, '2016-10-19 15:05:00', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/page/?alert=page-delete'),
(20, '2016-10-19 15:05:02', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/page/?alert=page-delete'),
(21, '2016-10-19 15:05:09', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/page_add'),
(22, '2016-10-19 15:05:17', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/page/?alert=page-saved'),
(23, '2016-10-19 15:05:19', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu'),
(24, '2016-10-19 15:05:36', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget'),
(25, '2016-10-19 15:06:11', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget'),
(26, '2016-10-19 15:06:35', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/settings'),
(27, '2016-10-19 15:06:38', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/settings/?alert=setting-update'),
(28, '2016-10-19 15:06:41', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(29, '2016-10-19 15:07:10', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(30, '2016-10-19 15:07:12', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget'),
(31, '2016-10-19 15:13:53', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget/?alert=widget-delete'),
(32, '2016-10-19 15:26:07', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu'),
(33, '2016-10-19 15:37:59', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(34, '2016-10-19 15:38:23', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget'),
(35, '2016-10-19 15:39:00', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu'),
(36, '2016-10-19 16:04:09', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(37, '2016-10-19 16:04:15', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu'),
(38, '2016-10-19 16:04:25', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu_item_edit/38'),
(39, '2016-10-19 16:05:01', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-saved'),
(40, '2016-10-19 16:05:19', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-saved'),
(41, '2016-10-19 16:05:29', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-saved'),
(42, '2016-10-19 16:05:37', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-saved'),
(43, '2016-10-19 16:05:46', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-saved'),
(44, '2016-10-19 16:05:57', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-saved'),
(45, '2016-10-19 16:06:31', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-delete'),
(46, '2016-10-19 16:06:40', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget'),
(47, '2016-10-19 16:06:50', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget/?alert=widget-delete'),
(48, '2016-10-19 16:06:59', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget/?alert=widget-delete'),
(49, '2016-10-19 16:07:05', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget/?alert=widget-delete'),
(50, '2016-10-19 16:11:51', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget/?alert=widget-delete'),
(51, '2016-10-19 16:12:12', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/settings'),
(52, '2016-10-19 16:14:13', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/settings/?alert=setting-update'),
(53, '2016-10-19 16:16:03', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/settings/?alert=setting-update'),
(54, '2016-10-19 16:18:46', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/settings/?alert=setting-update'),
(55, '2016-10-19 16:18:55', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/settings/?alert=setting-update'),
(56, '2016-10-19 16:19:26', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/settings/?alert=setting-update'),
(57, '2016-10-19 16:19:33', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/settings/?alert=setting-update'),
(58, '2016-10-19 16:21:00', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/settings/?alert=setting-update'),
(59, '2016-10-19 16:21:23', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/settings/?alert=setting-update'),
(60, '2016-10-19 16:21:35', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/settings/?alert=setting-update'),
(61, '2016-10-19 16:23:07', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/settings/?alert=setting-update'),
(62, '2016-10-19 16:26:41', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/page_add'),
(63, '2016-10-19 16:31:44', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(64, '2016-10-19 16:32:40', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu'),
(65, '2016-10-19 16:33:02', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget'),
(66, '2016-10-19 16:33:14', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget/?alert=widget-delete'),
(67, '2016-10-19 16:33:35', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget/?alert=widget-delete'),
(68, '2016-10-19 16:34:25', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget/?alert=widget-delete'),
(69, '2016-10-19 16:38:33', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget/?alert=widget-delete'),
(70, '2016-10-19 16:38:43', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/page_add'),
(71, '2016-10-19 18:13:47', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/page/?alert=page-saved'),
(72, '2016-10-19 18:14:01', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/page/?alert=page-saved'),
(73, '2016-10-19 18:16:33', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/page/?alert=page-saved'),
(74, '2016-10-19 18:25:40', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(75, '2016-10-19 18:26:02', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts'),
(76, '2016-10-19 18:26:04', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts_draft'),
(77, '2016-10-19 18:26:07', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts_trash'),
(78, '2016-10-19 19:40:56', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts_trash'),
(79, '2016-10-19 19:41:05', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts_trash'),
(80, '2016-10-19 19:41:10', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts'),
(81, '2016-10-19 19:46:01', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts'),
(82, '2016-10-19 19:46:09', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/post_add'),
(83, '2016-10-19 19:46:51', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/post_add'),
(84, '2016-10-19 19:46:57', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/post_add'),
(85, '2016-10-19 19:47:09', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/post_add'),
(86, '2016-10-19 19:53:10', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(87, '2016-10-19 19:53:28', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(88, '2016-10-19 19:53:55', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(89, '2016-10-19 19:54:08', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(90, '2016-10-19 19:54:23', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(91, '2016-10-19 19:54:26', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(92, '2016-10-19 19:54:43', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(93, '2016-10-19 19:55:41', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(94, '2016-10-19 19:55:55', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(95, '2016-10-19 19:56:31', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(96, '2016-10-19 19:57:10', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(97, '2016-10-19 20:00:34', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(98, '2016-10-19 20:00:55', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(99, '2016-10-19 20:01:56', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(100, '2016-10-19 20:03:48', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(101, '2016-10-19 20:04:19', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(102, '2016-10-19 20:06:12', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(103, '2016-10-19 20:07:31', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(104, '2016-10-19 20:07:43', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category_edit/1'),
(105, '2016-10-19 20:08:43', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category_edit/1'),
(106, '2016-10-19 20:08:48', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category_edit/1'),
(107, '2016-10-19 20:09:17', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category_edit/1'),
(108, '2016-10-19 20:09:26', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category_edit/1'),
(109, '2016-10-19 20:09:42', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category_edit/1'),
(110, '2016-10-19 20:09:47', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category_edit/2'),
(111, '2016-10-19 20:10:53', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category_edit/2'),
(112, '2016-10-19 20:13:14', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category_edit/2'),
(113, '2016-10-19 20:13:16', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category_edit/3'),
(114, '2016-10-19 20:13:20', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category_edit/2'),
(115, '2016-10-19 20:13:23', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category_edit/2'),
(116, '2016-10-19 20:13:34', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category_edit/3'),
(117, '2016-10-19 20:13:56', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=update'),
(118, '2016-10-19 20:14:01', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category_edit/3'),
(119, '2016-10-19 20:14:04', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=update'),
(120, '2016-10-19 20:14:42', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=update'),
(121, '2016-10-19 20:14:46', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category_edit/3'),
(122, '2016-10-19 20:14:55', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=update'),
(123, '2016-10-19 20:15:07', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category_edit/3'),
(124, '2016-10-19 20:15:18', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=update'),
(125, '2016-10-19 20:15:44', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=update'),
(126, '2016-10-19 20:15:49', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category_edit/3'),
(127, '2016-10-19 20:16:52', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=update'),
(128, '2016-10-19 20:17:22', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=update'),
(129, '2016-10-19 20:17:46', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=update'),
(130, '2016-10-19 20:18:03', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=update'),
(131, '2016-10-19 20:18:12', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(132, '2016-10-19 20:21:14', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(133, '2016-10-19 20:21:25', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(134, '2016-10-19 20:21:50', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=delete'),
(135, '2016-10-19 20:23:31', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=delete'),
(136, '2016-10-19 20:23:38', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(137, '2016-10-19 20:27:32', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(138, '2016-10-19 20:34:28', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(139, '2016-10-19 20:34:41', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(140, '2016-10-19 20:35:02', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(141, '2016-10-19 20:35:48', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(142, '2016-10-19 20:35:54', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(143, '2016-10-19 20:36:05', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(144, '2016-10-19 20:36:24', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(145, '2016-10-19 20:36:33', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(146, '2016-10-19 20:36:41', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(147, '2016-10-19 20:36:57', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(148, '2016-10-19 20:37:12', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(149, '2016-10-19 20:38:26', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(150, '2016-10-19 20:50:28', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(151, '2016-10-19 20:50:41', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(152, '2016-10-19 20:55:10', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(153, '2016-10-19 20:58:22', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(154, '2016-10-19 20:58:31', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(155, '2016-10-19 20:59:31', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(156, '2016-10-19 20:59:45', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(157, '2016-10-19 21:02:03', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(158, '2016-10-19 21:02:18', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(159, '2016-10-19 21:02:29', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(160, '2016-10-19 21:02:39', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(161, '2016-10-19 21:08:15', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(162, '2016-10-19 21:08:28', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(163, '2016-10-19 21:09:33', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(164, '2016-10-19 21:09:59', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(165, '2016-10-19 21:11:21', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(166, '2016-10-19 21:11:43', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(167, '2016-10-19 21:11:56', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(168, '2016-10-19 21:12:17', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(169, '2016-10-19 21:12:25', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(170, '2016-10-19 21:13:57', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(171, '2016-10-19 21:14:27', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(172, '2016-10-19 21:14:46', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(173, '2016-10-19 21:14:58', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(174, '2016-10-19 21:15:13', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(175, '2016-10-19 21:19:50', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(176, '2016-10-19 21:20:02', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(177, '2016-10-19 21:20:36', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(178, '2016-10-19 21:21:06', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(179, '2016-10-19 21:21:40', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(180, '2016-10-19 21:21:45', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(181, '2016-10-19 21:21:49', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/post_add'),
(182, '2016-10-19 21:21:52', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(183, '2016-10-19 21:23:07', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(184, '2016-10-19 21:23:45', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(185, '2016-10-19 21:23:51', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(186, '2016-10-19 21:24:20', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(187, '2016-10-19 21:26:06', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(188, '2016-10-19 21:26:29', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(189, '2016-10-19 21:26:40', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(190, '2016-10-19 21:26:49', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(191, '2016-10-19 21:27:37', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(192, '2016-10-19 21:28:41', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(193, '2016-10-19 21:28:47', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(194, '2016-10-19 21:29:29', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(195, '2016-10-19 21:29:58', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(196, '2016-10-19 21:30:15', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(197, '2016-10-19 21:30:23', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(198, '2016-10-19 21:30:32', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(199, '2016-10-19 21:30:37', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(200, '2016-10-19 21:31:17', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(201, '2016-10-19 21:32:06', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(202, '2016-10-19 21:34:10', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(203, '2016-10-19 21:34:33', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(204, '2016-10-19 21:43:38', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(205, '2016-10-19 21:43:49', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(206, '2016-10-19 21:43:54', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(207, '2016-10-19 21:43:56', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(208, '2016-10-19 21:44:09', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(209, '2016-10-19 21:44:19', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(210, '2016-10-19 21:45:10', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(211, '2016-10-19 21:46:37', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(212, '2016-10-19 21:46:52', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(213, '2016-10-19 21:49:32', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(214, '2016-10-19 21:49:36', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(215, '2016-10-19 21:52:11', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(216, '2016-10-20 16:40:44', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/login'),
(217, '2016-10-20 16:40:52', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(218, '2016-10-20 16:40:56', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts'),
(219, '2016-10-20 16:42:39', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/post_add'),
(220, '2016-10-20 16:42:49', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(221, '2016-10-20 16:43:33', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(222, '2016-10-20 16:44:55', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(223, '2016-10-20 16:45:01', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(224, '2016-10-20 16:45:11', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(225, '2016-10-20 16:46:14', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(226, '2016-10-20 16:46:35', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(227, '2016-10-20 16:46:50', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(228, '2016-10-20 16:46:59', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(229, '2016-10-20 16:52:28', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(230, '2016-10-20 16:52:41', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(231, '2016-10-20 16:52:56', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(232, '2016-10-20 16:56:50', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(233, '2016-10-20 16:56:55', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(234, '2016-10-20 16:57:09', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(235, '2016-10-20 17:00:53', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/post_add_act'),
(236, '2016-10-20 17:00:55', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(237, '2016-10-20 17:01:11', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(238, '2016-10-20 17:01:19', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(239, '2016-10-20 17:03:54', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(240, '2016-10-20 17:12:06', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(241, '2016-10-20 17:13:09', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(242, '2016-10-20 17:14:35', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(243, '2016-10-20 17:14:52', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(244, '2016-10-20 17:15:02', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(245, '2016-10-20 17:15:24', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(246, '2016-10-20 17:15:53', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(247, '2016-10-20 17:19:40', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(248, '2016-10-20 17:20:14', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(249, '2016-10-20 17:20:22', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(250, '2016-10-20 17:31:00', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(251, '2016-10-20 17:31:38', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(252, '2016-10-20 17:33:03', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(253, '2016-10-20 17:36:06', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(254, '2016-10-20 17:50:59', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(255, '2016-10-20 17:51:47', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(256, '2016-10-20 17:58:12', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(257, '2016-10-20 18:18:30', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(258, '2016-10-20 18:19:20', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(259, '2016-10-20 18:20:27', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(260, '2016-10-20 18:20:46', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(261, '2016-10-20 18:21:00', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(262, '2016-10-20 18:21:25', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(263, '2016-10-20 18:28:25', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(264, '2016-10-20 18:28:54', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(265, '2016-10-20 18:29:10', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(266, '2016-10-20 18:29:36', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(267, '2016-10-20 18:29:50', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(268, '2016-10-20 18:31:38', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(269, '2016-10-20 18:38:54', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(270, '2016-10-20 18:39:38', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(271, '2016-10-20 18:39:58', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(272, '2016-10-20 18:40:21', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(273, '2016-10-20 18:42:04', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(274, '2016-10-20 18:42:37', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(275, '2016-10-20 18:42:41', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(276, '2016-10-20 18:45:21', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(277, '2016-10-20 18:45:37', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(278, '2016-10-20 18:46:47', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(279, '2016-10-20 18:47:03', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(280, '2016-10-20 18:48:24', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(281, '2016-10-20 18:48:59', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(282, '2016-10-20 18:53:26', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(283, '2016-10-20 18:53:39', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(284, '2016-10-20 18:53:53', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(285, '2016-10-20 18:54:27', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(286, '2016-10-20 18:55:14', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(287, '2016-10-20 18:56:44', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(288, '2016-10-20 18:57:04', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(289, '2016-10-20 18:57:28', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(290, '2016-10-20 18:57:34', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(291, '2016-10-20 18:57:43', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(292, '2016-10-20 18:59:44', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(293, '2016-10-20 19:00:02', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(294, '2016-10-20 19:01:30', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(295, '2016-10-20 19:01:52', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(296, '2016-10-20 19:03:13', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(297, '2016-10-20 19:03:57', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(298, '2016-10-20 19:04:23', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(299, '2016-10-20 19:06:17', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(300, '2016-10-20 19:06:40', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(301, '2016-10-20 19:08:21', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(302, '2016-10-20 19:09:06', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(303, '2016-10-20 19:09:40', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(304, '2016-10-20 19:10:52', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(305, '2016-10-20 19:11:03', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(306, '2016-10-20 19:11:39', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(307, '2016-10-20 19:12:28', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(308, '2016-10-20 19:14:41', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(309, '2016-10-20 19:16:26', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(310, '2016-10-26 16:23:17', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/login/?alert=login-failed'),
(311, '2016-10-26 16:23:24', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(312, '2016-10-26 16:29:04', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(313, '2016-10-26 16:30:24', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(314, '2016-10-26 16:30:51', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(315, '2016-10-26 16:34:57', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(316, '2016-10-26 16:35:42', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(317, '2016-10-26 16:35:54', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(318, '2016-10-26 16:46:25', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(319, '2016-10-26 16:51:59', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(320, '2016-10-26 16:53:25', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(321, '2016-10-26 17:01:55', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(322, '2016-10-26 17:12:26', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(323, '2016-10-26 17:13:11', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(324, '2016-10-26 17:26:26', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(325, '2016-10-26 17:30:10', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(326, '2016-10-26 17:30:31', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(327, '2016-11-24 21:04:36', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/login/?alert=login-failed'),
(328, '2016-11-24 21:04:43', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(329, '2016-11-24 21:04:52', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(330, '2016-11-24 21:05:18', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(331, '2016-11-24 21:05:42', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(332, '2016-11-24 21:06:02', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(333, '2016-11-24 21:06:36', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/post_add'),
(334, '2016-11-24 21:06:44', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu'),
(335, '2016-11-24 21:06:52', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/settings'),
(336, '2016-11-24 21:07:32', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(337, '2016-11-24 21:07:36', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin');
INSERT INTO `dah_visitor` (`id`, `time_visit`, `user_ip`, `user_browser`, `user_os`, `user_device`, `page`, `user_referrer`) VALUES
(338, '2016-11-24 21:08:37', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(339, '2016-11-24 21:13:03', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(340, '2016-11-24 21:13:45', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(341, '2016-11-24 21:16:17', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(342, '2016-11-24 21:16:45', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(343, '2016-11-24 21:16:59', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu'),
(344, '2016-11-24 21:17:13', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/settings'),
(345, '2016-11-24 21:17:39', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(346, '2016-11-24 21:19:12', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(347, '2016-11-24 21:20:32', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(348, '2016-11-24 21:21:08', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(349, '2016-11-24 21:22:01', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(350, '2016-11-24 21:22:13', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(351, '2016-11-24 21:22:17', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=delete'),
(352, '2016-11-24 21:22:21', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=delete'),
(353, '2016-11-24 21:22:25', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=delete'),
(354, '2016-11-24 21:22:28', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=delete'),
(355, '2016-11-24 21:22:31', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=delete'),
(356, '2016-11-24 21:22:34', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=delete'),
(357, '2016-11-24 21:22:38', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=delete'),
(358, '2016-11-24 21:22:40', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=delete'),
(359, '2016-11-24 21:22:43', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=delete'),
(360, '2016-11-24 21:22:45', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=delete'),
(361, '2016-11-24 21:22:53', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category_edit/6'),
(362, '2016-11-24 21:22:57', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=update'),
(363, '2016-11-24 21:23:03', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category_edit/6'),
(364, '2016-11-24 21:25:46', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=update'),
(365, '2016-11-24 21:25:56', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(366, '2016-11-24 21:27:46', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=delete'),
(367, '2016-11-24 21:27:54', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=delete'),
(368, '2016-11-24 21:27:57', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(369, '2016-11-24 21:28:14', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(370, '2016-11-24 21:31:11', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=delete'),
(371, '2016-11-25 10:42:23', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/login'),
(372, '2016-11-25 10:42:52', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(373, '2016-11-25 10:43:05', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts'),
(374, '2016-11-25 10:43:09', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(375, '2016-11-25 10:44:04', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(376, '2016-11-25 10:44:06', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts_draft'),
(377, '2016-11-25 10:44:07', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts_trash'),
(378, '2016-11-25 10:44:08', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts'),
(379, '2016-11-25 10:44:11', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts_draft'),
(380, '2016-11-25 10:44:30', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts'),
(381, '2016-11-25 10:45:22', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts'),
(382, '2016-11-25 10:49:03', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts'),
(383, '2016-11-25 10:51:20', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts'),
(384, '2016-11-25 10:51:38', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts'),
(385, '2016-11-25 10:53:35', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts'),
(386, '2016-11-25 10:53:56', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts'),
(387, '2016-11-25 10:54:28', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts'),
(388, '2016-11-25 10:54:50', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts'),
(389, '2016-11-25 10:56:58', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts'),
(390, '2016-11-25 10:59:17', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts'),
(391, '2016-11-25 10:59:40', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts'),
(392, '2016-11-25 11:00:16', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts'),
(393, '2016-11-25 11:00:29', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/posts'),
(394, '2016-11-25 11:15:01', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(395, '2016-11-25 11:30:17', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(396, '2016-11-25 11:30:28', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(397, '2016-11-25 11:30:52', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(398, '2016-11-25 11:38:47', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(399, '2016-11-25 11:39:07', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(400, '2016-11-25 11:40:09', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(401, '2016-11-25 11:41:29', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(402, '2016-11-25 11:41:44', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(403, '2016-11-25 11:41:53', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/post_add'),
(404, '2016-11-25 11:47:50', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/post_add'),
(405, '2016-11-25 11:48:18', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/post_add'),
(406, '2016-11-25 11:48:29', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/post_add'),
(407, '2016-11-25 11:48:43', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/post_add'),
(408, '2016-11-25 11:48:49', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/post_add'),
(409, '2016-11-25 11:49:10', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/post_add'),
(410, '2016-11-25 11:49:22', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/post_add'),
(411, '2016-11-25 11:53:17', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/post_add'),
(412, '2016-11-25 11:55:40', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/post_add'),
(413, '2016-11-25 11:56:03', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/post_add'),
(414, '2016-11-25 11:56:39', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/post_add'),
(415, '2016-11-25 12:02:18', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(416, '2016-11-25 12:04:53', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(417, '2016-11-25 12:04:59', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(418, '2016-11-25 12:18:02', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(419, '2016-11-25 12:21:53', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(420, '2016-11-25 12:22:03', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add_act'),
(421, '2016-11-25 12:22:11', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(422, '2016-11-25 12:22:21', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(423, '2016-11-25 12:22:30', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add_act'),
(424, '2016-11-25 12:24:37', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(425, '2016-11-25 12:25:02', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(426, '2016-11-25 12:25:22', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(427, '2016-11-25 12:26:36', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(428, '2016-11-25 12:26:46', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(429, '2016-11-25 12:27:23', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(430, '2016-11-25 12:27:26', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(431, '2016-11-25 12:27:37', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(432, '2016-11-25 12:29:07', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(433, '2016-11-25 12:29:43', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(434, '2016-11-25 12:30:17', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(435, '2016-11-25 12:30:39', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(436, '2016-11-25 12:30:59', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add_act'),
(437, '2016-11-25 12:31:38', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add_act'),
(438, '2016-11-25 12:31:40', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(439, '2016-11-25 12:31:56', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(440, '2016-11-25 12:32:14', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(441, '2016-11-25 12:32:39', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(442, '2016-11-25 12:42:22', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(443, '2016-11-25 12:42:50', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(444, '2016-11-25 12:43:03', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(445, '2016-11-25 12:44:53', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(446, '2016-11-25 12:45:03', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(447, '2016-11-25 12:45:43', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(448, '2016-11-25 12:46:08', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(449, '2016-11-25 12:46:15', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(450, '2016-11-25 12:46:39', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(451, '2016-11-25 12:46:49', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(452, '2016-11-25 12:54:45', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(453, '2016-11-25 13:00:13', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(454, '2016-11-25 13:05:21', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(455, '2016-11-25 13:06:04', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(456, '2016-11-25 13:06:07', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(457, '2016-11-25 13:06:13', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-delete'),
(458, '2016-11-25 13:06:16', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-delete'),
(459, '2016-11-25 13:06:19', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-delete'),
(460, '2016-11-25 13:06:22', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-delete'),
(461, '2016-11-25 13:06:25', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-delete'),
(462, '2016-11-25 13:06:29', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-delete'),
(463, '2016-11-25 13:06:32', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-delete'),
(464, '2016-11-25 13:06:35', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-delete'),
(465, '2016-11-25 13:06:39', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-delete'),
(466, '2016-11-25 13:06:41', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-delete'),
(467, '2016-11-25 13:06:44', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-delete'),
(468, '2016-11-25 13:06:47', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-delete'),
(469, '2016-11-25 13:06:50', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-delete'),
(470, '2016-11-25 13:06:55', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-delete'),
(471, '2016-11-25 13:06:58', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-delete'),
(472, '2016-11-25 13:07:01', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-delete'),
(473, '2016-11-25 13:07:04', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-delete'),
(474, '2016-11-25 13:07:07', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-delete'),
(475, '2016-11-25 13:07:11', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-delete'),
(476, '2016-11-25 13:07:13', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-delete'),
(477, '2016-11-25 13:07:45', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-delete'),
(478, '2016-11-25 13:10:29', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(479, '2016-11-25 13:12:47', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(480, '2016-11-25 13:12:56', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(481, '2016-11-25 13:13:35', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(482, '2016-11-25 13:13:40', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(483, '2016-11-25 13:16:24', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(484, '2016-11-25 13:16:41', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(485, '2016-11-25 13:17:26', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(486, '2016-11-25 13:18:17', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(487, '2016-11-25 13:18:35', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(488, '2016-11-25 13:19:03', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(489, '2016-11-25 13:19:18', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(490, '2016-11-25 13:20:22', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(491, '2016-11-25 13:20:39', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(492, '2016-11-25 13:21:06', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(493, '2016-11-25 13:21:37', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(494, '2016-11-25 13:22:39', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(495, '2016-11-25 13:23:20', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(496, '2016-11-25 13:23:43', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(497, '2016-11-25 13:23:59', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(498, '2016-11-25 13:24:34', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(499, '2016-11-25 13:27:59', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(500, '2016-11-25 13:28:03', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(501, '2016-11-25 13:28:15', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(502, '2016-11-25 13:28:57', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(503, '2016-11-25 13:30:06', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(504, '2016-11-25 13:40:41', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/24'),
(505, '2016-11-25 13:40:57', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(506, '2016-11-25 13:42:06', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(507, '2016-11-25 13:42:48', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(508, '2016-11-25 13:42:57', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(509, '2016-11-25 13:43:00', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(510, '2016-11-25 13:43:05', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(511, '2016-11-25 13:43:25', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(512, '2016-11-25 13:43:31', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(513, '2016-11-25 13:44:17', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(514, '2016-11-25 13:44:22', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(515, '2016-11-25 13:44:40', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(516, '2016-11-25 13:45:18', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(517, '2016-11-25 13:45:22', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(518, '2016-11-25 13:45:29', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(519, '2016-11-25 13:46:04', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(520, '2016-11-25 13:46:56', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(521, '2016-11-25 13:47:23', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(522, '2016-11-25 13:47:32', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(523, '2016-11-25 13:47:54', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(524, '2016-11-25 13:48:00', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(525, '2016-11-25 13:49:11', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(526, '2016-11-25 13:49:14', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(527, '2016-11-25 13:49:21', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(528, '2016-11-25 13:49:27', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(529, '2016-11-25 13:49:54', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(530, '2016-11-25 13:49:59', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products'),
(531, '2016-11-25 13:50:04', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(532, '2016-11-25 13:50:11', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(533, '2016-11-25 13:50:38', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_update'),
(534, '2016-11-25 13:50:43', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(535, '2016-11-25 13:51:13', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(536, '2016-11-25 13:52:10', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(537, '2016-11-25 13:52:15', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(538, '2016-11-25 13:53:31', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(539, '2016-11-25 13:53:38', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(540, '2016-11-25 13:53:45', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(541, '2016-11-25 13:53:59', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(542, '2016-11-25 13:54:24', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(543, '2016-11-25 13:55:11', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(544, '2016-11-25 13:57:05', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(545, '2016-11-25 13:57:26', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(546, '2016-11-25 13:57:33', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(547, '2016-11-25 13:57:39', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(548, '2016-11-25 13:57:51', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(549, '2016-11-25 13:58:08', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(550, '2016-11-25 13:58:18', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(551, '2016-11-25 13:58:56', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(552, '2016-11-25 13:59:36', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(553, '2016-11-25 14:00:01', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(554, '2016-11-25 14:00:29', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(555, '2016-11-25 14:00:44', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(556, '2016-11-25 14:01:00', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(557, '2016-11-25 14:01:17', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(558, '2016-11-25 14:01:41', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(559, '2016-11-25 14:02:12', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(560, '2016-11-25 14:02:21', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(561, '2016-11-25 14:02:45', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(562, '2016-11-25 14:02:55', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(563, '2016-11-25 14:03:03', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(564, '2016-11-25 14:03:12', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(565, '2016-11-25 14:05:13', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(566, '2016-11-25 14:05:41', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(567, '2016-11-25 14:09:45', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(568, '2016-11-25 14:09:48', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(569, '2016-11-25 14:10:14', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(570, '2016-11-25 14:14:02', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(571, '2016-11-25 14:14:23', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(572, '2016-11-25 14:14:28', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(573, '2016-11-25 14:14:44', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(574, '2016-11-25 14:14:50', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(575, '2016-11-25 14:15:39', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(576, '2016-11-25 14:15:52', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(577, '2016-11-25 14:15:55', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(578, '2016-11-25 14:17:25', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(579, '2016-11-25 14:17:33', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(580, '2016-11-25 14:17:37', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(581, '2016-11-25 14:18:20', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(582, '2016-11-25 14:25:19', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(583, '2016-11-25 14:25:27', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(584, '2016-11-25 14:25:44', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(585, '2016-11-25 14:25:59', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(586, '2016-11-25 14:27:20', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(587, '2016-11-25 14:27:37', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(588, '2016-11-25 14:28:16', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(589, '2016-11-25 14:28:43', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(590, '2016-11-25 14:29:25', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(591, '2016-11-25 14:30:24', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(592, '2016-11-25 14:30:53', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(593, '2016-11-25 14:31:07', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(594, '2016-11-25 14:31:24', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(595, '2016-11-25 14:31:56', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(596, '2016-11-25 14:32:03', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_edit/23'),
(597, '2016-11-25 14:36:18', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(598, '2016-11-25 14:37:35', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(599, '2016-11-25 14:38:02', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(600, '2016-11-25 14:41:05', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(601, '2016-11-25 14:44:35', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-delete'),
(602, '2016-11-25 14:44:43', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget'),
(603, '2016-11-25 14:45:51', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/users'),
(604, '2016-11-25 14:46:28', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/settings'),
(605, '2016-11-25 14:48:34', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/settings/?alert=setting-update'),
(606, '2016-11-25 14:48:39', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu'),
(607, '2016-11-25 15:32:07', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget'),
(608, '2016-11-25 15:33:46', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/settings'),
(609, '2016-11-25 15:53:19', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/settings/?alert=setting-update'),
(610, '2016-11-25 15:56:23', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget'),
(611, '2016-11-25 15:56:36', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu'),
(612, '2016-11-25 15:56:40', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-delete'),
(613, '2016-11-25 15:56:47', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-delete'),
(614, '2016-11-25 15:56:53', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-delete'),
(615, '2016-11-25 15:56:55', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-delete'),
(616, '2016-11-25 15:56:58', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-delete'),
(617, '2016-11-25 15:57:04', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-delete'),
(618, '2016-11-25 15:57:18', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu_item_edit/44'),
(619, '2016-11-25 15:57:24', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-saved'),
(620, '2016-11-25 15:57:37', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu_item_edit/50'),
(621, '2016-11-25 15:57:40', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-saved'),
(622, '2016-11-25 15:57:47', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu_item_edit/50'),
(623, '2016-11-25 15:57:51', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-saved'),
(624, '2016-11-25 15:58:01', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu_item_edit/48'),
(625, '2016-11-25 15:58:04', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-saved'),
(626, '2016-11-25 15:58:13', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu_item_edit/47'),
(627, '2016-11-25 15:59:40', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu_item_edit/47'),
(628, '2016-11-25 16:40:04', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu_item_edit/47'),
(629, '2016-11-25 17:01:47', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-saved'),
(630, '2016-11-25 17:48:57', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(631, '2016-11-25 17:49:47', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category'),
(632, '2016-11-25 17:49:59', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category_edit/17'),
(633, '2016-11-25 17:50:05', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=update'),
(634, '2016-11-25 17:50:23', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(635, '2016-11-25 17:50:35', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(636, '2016-11-25 17:50:53', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(637, '2016-11-25 17:51:01', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(638, '2016-11-25 17:55:48', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(639, '2016-11-25 17:56:01', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(640, '2016-11-25 17:56:09', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(641, '2016-11-25 17:56:27', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(642, '2016-11-25 17:59:06', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(643, '2016-11-25 17:59:36', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(644, '2016-11-25 18:21:01', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_category/?alert=add'),
(645, '2016-11-25 18:21:10', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget'),
(646, '2016-11-25 18:21:20', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget/?alert=widget-delete'),
(647, '2016-11-25 18:21:23', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget/?alert=widget-delete'),
(648, '2016-11-25 18:22:08', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget/?alert=widget-delete'),
(649, '2016-11-25 18:48:34', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget/?alert=widget-delete'),
(650, '2016-11-25 18:49:27', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu'),
(651, '2016-11-25 18:49:42', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-delete'),
(652, '2016-11-25 18:50:09', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-delete'),
(653, '2016-11-25 18:50:15', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-delete'),
(654, '2016-11-25 18:50:32', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-delete'),
(655, '2016-11-25 19:25:51', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(656, '2016-11-25 19:25:54', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', '');
INSERT INTO `dah_visitor` (`id`, `time_visit`, `user_ip`, `user_browser`, `user_os`, `user_device`, `page`, `user_referrer`) VALUES
(657, '2016-11-25 19:25:59', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(658, '2016-11-25 20:19:46', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(659, '2016-11-26 11:13:41', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/login'),
(660, '2016-11-26 11:13:46', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(661, '2016-11-26 11:13:52', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/post_add'),
(662, '2016-11-26 11:16:17', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(663, '2016-11-26 11:17:20', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(664, '2016-11-26 11:18:22', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(665, '2016-11-26 11:18:27', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(666, '2016-11-26 11:19:07', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(667, '2016-11-26 11:19:57', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(668, '2016-11-26 11:21:20', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(669, '2016-11-26 11:21:22', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(670, '2016-11-26 11:22:05', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(671, '2016-11-26 11:23:03', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(672, '2016-11-26 11:23:26', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(673, '2016-11-26 11:23:29', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/products/?alert=post-saved'),
(674, '2016-11-26 11:24:06', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/product_add'),
(675, '2016-11-26 13:37:17', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/login'),
(676, '2016-11-26 13:37:24', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(677, '2016-11-26 13:37:29', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu'),
(678, '2016-11-26 13:37:52', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-delete'),
(679, '2016-11-26 13:37:57', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu_item_edit/48'),
(680, '2016-11-26 13:45:06', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-saved'),
(681, '2016-11-26 13:53:41', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu/?alert=menu-delete'),
(682, '2016-11-26 13:53:44', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/page'),
(683, '2016-11-26 13:54:01', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/page_edit/5'),
(684, '2016-11-26 13:56:12', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/page/?alert=page-saved'),
(685, '2016-11-26 13:56:32', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/page_edit/5'),
(686, '2016-11-26 16:51:57', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(687, '2016-11-29 23:28:12', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/login'),
(688, '2016-11-29 23:28:52', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(689, '2016-11-29 23:29:10', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', ''),
(690, '2016-11-29 23:29:30', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(691, '2016-11-29 23:30:16', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/menu'),
(692, '2016-11-30 12:56:34', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/login'),
(693, '2016-11-30 12:56:43', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin'),
(694, '2016-11-30 12:56:49', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget'),
(695, '2016-11-30 13:07:43', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/admin/widget'),
(696, '2016-11-30 16:08:59', '::1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://localhost/mycms/', 'http://localhost/mycms/xlog/?alert=login-failed'),
(697, '2016-11-30 19:15:06', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(698, '2016-11-30 19:15:38', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(699, '2016-11-30 19:15:44', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(700, '2016-11-30 19:15:48', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(701, '2016-11-30 19:15:51', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/users'),
(702, '2016-11-30 19:16:08', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/user_edit/1'),
(703, '2016-11-30 19:16:12', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/users/?alert=user-update'),
(704, '2016-11-30 19:16:23', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/user_edit/2'),
(705, '2016-11-30 19:16:34', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/users/?alert=user-update'),
(706, '2016-11-30 19:16:47', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/user_edit/2'),
(707, '2016-11-30 19:16:50', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/users/?alert=user-update'),
(708, '2016-11-30 19:18:35', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(709, '2016-11-30 19:29:30', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(710, '2016-11-30 19:29:35', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/menu'),
(711, '2016-11-30 19:29:40', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/menu_item_edit/35'),
(712, '2016-11-30 19:29:44', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/menu/?alert=menu-saved'),
(713, '2016-11-30 19:29:50', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/menu_item_edit/53'),
(714, '2016-11-30 19:29:54', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/menu/?alert=menu-saved'),
(715, '2016-11-30 19:30:09', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/menu_item_edit/54'),
(716, '2016-11-30 19:31:19', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/menu/?alert=menu-saved'),
(717, '2016-11-30 19:31:24', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/menu_item_edit/33'),
(718, '2016-11-30 19:48:59', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/menu_item_edit/33'),
(719, '2016-11-30 19:49:10', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/menu_item_edit/33'),
(720, '2016-11-30 19:49:52', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/menu_item_edit/33'),
(721, '2016-11-30 19:50:44', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/menu_item_edit/33'),
(722, '2016-11-30 19:50:48', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/menu/?alert=menu-saved'),
(723, '2016-11-30 19:51:27', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', ''),
(724, '2016-11-30 19:51:32', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(725, '2016-11-30 19:51:37', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page'),
(726, '2016-11-30 19:51:59', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_edit/45'),
(727, '2016-11-30 19:52:25', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-saved'),
(728, '2016-11-30 19:52:34', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_edit/45'),
(729, '2016-11-30 19:52:37', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-saved'),
(730, '2016-11-30 19:52:56', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_edit/44'),
(731, '2016-11-30 19:53:00', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-saved'),
(732, '2016-11-30 19:53:08', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_edit/32'),
(733, '2016-11-30 19:53:17', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-saved'),
(734, '2016-11-30 19:55:21', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_edit/29'),
(735, '2016-11-30 19:55:38', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-saved'),
(736, '2016-11-30 19:56:08', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-delete'),
(737, '2016-11-30 20:01:39', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_edit/45'),
(738, '2016-11-30 20:02:52', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-saved'),
(739, '2016-11-30 20:03:25', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_edit/32'),
(740, '2016-11-30 20:03:33', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-saved'),
(741, '2016-11-30 20:07:29', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_edit/29'),
(742, '2016-11-30 20:07:42', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-saved'),
(743, '2016-11-30 20:11:57', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-delete'),
(744, '2016-11-30 20:12:01', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts'),
(745, '2016-11-30 20:12:05', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts/?alert=post-trash'),
(746, '2016-11-30 20:12:09', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts/?alert=post-trash'),
(747, '2016-11-30 20:12:13', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts/?alert=post-trash'),
(748, '2016-11-30 20:12:17', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts/?alert=post-trash'),
(749, '2016-11-30 20:12:21', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts/?alert=post-trash'),
(750, '2016-11-30 20:12:26', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts/?alert=post-trash'),
(751, '2016-11-30 20:12:30', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts/?alert=post-trash'),
(752, '2016-11-30 20:12:34', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/category'),
(753, '2016-11-30 20:12:37', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/category/?alert=delete'),
(754, '2016-11-30 20:12:40', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/category/?alert=delete'),
(755, '2016-11-30 20:12:43', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/category/?alert=delete'),
(756, '2016-11-30 20:12:47', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/category/?alert=delete'),
(757, '2016-11-30 20:12:49', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/category/?alert=delete'),
(758, '2016-11-30 20:12:53', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/category/?alert=delete'),
(759, '2016-11-30 20:12:56', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/category/?alert=delete'),
(760, '2016-11-30 20:13:02', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/category/?alert=delete'),
(761, '2016-11-30 20:13:04', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts'),
(762, '2016-11-30 20:13:08', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts_trash'),
(763, '2016-11-30 20:13:11', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts_trash/?alert=post-delete'),
(764, '2016-11-30 20:13:14', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts_trash/?alert=post-delete'),
(765, '2016-11-30 20:13:17', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts_trash/?alert=post-delete'),
(766, '2016-11-30 20:13:20', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts_trash/?alert=post-delete'),
(767, '2016-11-30 20:13:23', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts_trash/?alert=post-delete'),
(768, '2016-11-30 20:13:26', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts_trash/?alert=post-delete'),
(769, '2016-11-30 20:13:36', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts_trash/?alert=post-delete'),
(770, '2016-11-30 20:13:38', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts'),
(771, '2016-11-30 20:15:17', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/post_add'),
(772, '2016-11-30 20:15:56', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts'),
(773, '2016-11-30 20:16:01', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page'),
(774, '2016-11-30 20:19:17', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(775, '2016-11-30 20:19:21', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(776, '2016-11-30 20:21:50', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_category'),
(777, '2016-11-30 20:21:59', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(778, '2016-11-30 20:22:09', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-delete'),
(779, '2016-11-30 20:22:12', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-delete'),
(780, '2016-11-30 20:22:26', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-delete'),
(781, '2016-11-30 20:22:30', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-delete'),
(782, '2016-11-30 20:22:33', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-delete'),
(783, '2016-11-30 20:22:40', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-delete'),
(784, '2016-11-30 20:23:06', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-delete'),
(785, '2016-11-30 20:23:11', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-delete'),
(786, '2016-11-30 20:23:15', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-delete'),
(787, '2016-11-30 20:23:18', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-delete'),
(788, '2016-11-30 20:23:29', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/26'),
(789, '2016-11-30 20:24:18', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(790, '2016-11-30 21:02:33', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(791, '2016-11-30 21:04:51', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(792, '2016-11-30 21:05:26', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(793, '2016-11-30 21:05:31', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/33'),
(794, '2016-11-30 21:43:44', '36.76.148.204', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/33'),
(795, '2016-12-02 12:42:04', '36.84.225.233', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog/?alert=login-failed'),
(796, '2016-12-02 12:42:15', '36.84.225.233', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(797, '2016-12-02 12:42:19', '36.84.225.233', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts'),
(798, '2016-12-02 12:42:25', '36.84.225.233', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(799, '2016-12-02 12:42:51', '36.84.225.233', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page'),
(800, '2016-12-02 22:04:46', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(801, '2016-12-02 22:04:52', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(802, '2016-12-02 22:04:57', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/post_add'),
(803, '2016-12-02 22:09:09', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/post_add_act'),
(804, '2016-12-02 22:09:19', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/post_add_act'),
(805, '2016-12-02 22:09:21', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts/?alert=post-saved'),
(806, '2016-12-02 22:09:23', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts_trash'),
(807, '2016-12-02 22:09:25', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts_draft'),
(808, '2016-12-02 22:09:49', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts'),
(809, '2016-12-02 22:10:14', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/category'),
(810, '2016-12-02 22:10:31', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/category_act'),
(811, '2016-12-02 22:10:54', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/category/?alert=add'),
(812, '2016-12-02 22:11:02', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/category/?alert=delete'),
(813, '2016-12-02 22:11:08', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(814, '2016-12-02 22:21:07', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', ''),
(815, '2016-12-02 22:21:18', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(816, '2016-12-02 22:21:26', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/post_add'),
(817, '2016-12-02 22:21:31', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_add'),
(818, '2016-12-02 22:22:05', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_add_act'),
(819, '2016-12-02 22:22:30', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_add_act'),
(820, '2016-12-02 22:22:39', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-saved'),
(821, '2016-12-02 22:22:56', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-delete'),
(822, '2016-12-02 22:23:15', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/settings'),
(823, '2016-12-02 22:23:24', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(824, '2016-12-02 22:26:46', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_category'),
(825, '2016-12-02 22:30:07', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', ''),
(826, '2016-12-02 22:30:43', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_category_act'),
(827, '2016-12-02 22:31:02', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_category/?alert=add'),
(828, '2016-12-02 22:39:07', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_category/?alert=add'),
(829, '2016-12-03 12:34:09', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(830, '2016-12-03 12:36:05', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(831, '2016-12-03 12:36:11', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts'),
(832, '2016-12-03 12:36:13', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page'),
(833, '2016-12-03 12:36:20', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_add'),
(834, '2016-12-03 12:36:22', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-saved'),
(835, '2016-12-03 12:36:24', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_edit/47'),
(836, '2016-12-03 12:36:27', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-saved'),
(837, '2016-12-03 12:36:47', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-delete'),
(838, '2016-12-03 12:36:51', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/menu'),
(839, '2016-12-03 12:36:56', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/settings'),
(840, '2016-12-03 12:36:59', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/settings/?alert=setting-update'),
(841, '2016-12-03 12:37:08', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(842, '2016-12-03 12:44:02', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(843, '2016-12-03 12:45:18', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(844, '2016-12-03 12:47:53', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(845, '2016-12-03 12:48:45', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(846, '2016-12-03 12:48:52', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-delete'),
(847, '2016-12-03 12:48:54', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/settings'),
(848, '2016-12-03 12:48:58', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/users'),
(849, '2016-12-03 12:49:01', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/menu'),
(850, '2016-12-03 20:34:16', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(851, '2016-12-03 20:34:31', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(852, '2016-12-03 20:34:55', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(853, '2016-12-03 21:32:26', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', ''),
(854, '2016-12-03 21:49:51', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/26'),
(855, '2016-12-03 21:53:47', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(856, '2016-12-03 21:55:48', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(857, '2016-12-03 21:55:54', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-delete'),
(858, '2016-12-03 22:27:18', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', ''),
(859, '2016-12-03 22:27:22', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/'),
(860, '2016-12-03 23:15:36', '112.215.175.41', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(861, '2016-12-03 23:17:16', '112.215.174.57', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(862, '2016-12-03 23:18:24', '112.215.175.41', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(863, '2016-12-03 23:45:48', '112.215.175.41', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(864, '2016-12-03 23:46:07', '112.215.174.57', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(865, '2016-12-03 23:47:13', '112.215.174.57', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/36'),
(866, '2016-12-04 09:30:49', '112.215.174.87', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(867, '2016-12-04 09:31:35', '112.215.175.11', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(868, '2016-12-04 09:31:45', '112.215.175.11', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(869, '2016-12-04 09:34:14', '112.215.175.11', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(870, '2016-12-04 09:34:27', '112.215.174.87', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(871, '2016-12-04 09:45:05', '112.215.174.87', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(872, '2016-12-04 09:50:18', '112.215.174.87', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(873, '2016-12-04 10:01:16', '112.215.175.11', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(874, '2016-12-04 19:28:25', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(875, '2016-12-04 19:31:13', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(876, '2016-12-04 19:31:27', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts'),
(877, '2016-12-04 19:31:32', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts_trash'),
(878, '2016-12-04 19:31:43', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts'),
(879, '2016-12-04 19:52:23', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(880, '2016-12-04 20:31:54', '36.84.225.72', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/36'),
(881, '2016-12-04 20:38:27', '36.76.82.1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(882, '2016-12-04 20:54:43', '36.76.82.1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/39'),
(883, '2016-12-04 20:56:58', '36.76.82.1', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(884, '2016-12-04 21:51:37', '180.241.9.22', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/38'),
(885, '2016-12-04 21:51:49', '180.241.9.22', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(886, '2016-12-04 22:01:53', '36.76.78.31', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/37'),
(887, '2016-12-04 22:02:01', '36.76.78.31', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(888, '2016-12-04 22:02:15', '36.76.78.31', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(889, '2016-12-04 22:33:01', '36.76.78.31', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(890, '2016-12-04 22:45:43', '36.76.78.31', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(891, '2016-12-05 14:15:47', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(892, '2016-12-05 14:15:52', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(893, '2016-12-05 14:15:58', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts'),
(894, '2016-12-05 14:42:17', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', ''),
(895, '2016-12-05 14:43:03', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(896, '2016-12-05 14:43:35', '125.165.24.243', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog/?alert=login-failed'),
(897, '2016-12-05 14:45:15', '125.165.24.243', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(898, '2016-12-05 14:45:31', '125.165.24.243', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(899, '2016-12-05 14:58:21', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(900, '2016-12-05 15:13:18', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', ''),
(901, '2016-12-05 15:29:52', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/'),
(902, '2016-12-05 15:29:56', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page'),
(903, '2016-12-05 15:31:38', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_add'),
(904, '2016-12-05 15:31:54', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-saved'),
(905, '2016-12-05 15:32:12', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_edit/48'),
(906, '2016-12-05 15:32:26', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-saved'),
(907, '2016-12-05 15:32:54', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_edit/48'),
(908, '2016-12-05 15:33:50', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-saved'),
(909, '2016-12-05 15:36:07', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_add'),
(910, '2016-12-05 15:36:11', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-saved'),
(911, '2016-12-05 15:38:15', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_add'),
(912, '2016-12-05 15:38:39', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-saved'),
(913, '2016-12-05 15:39:17', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_edit/50'),
(914, '2016-12-05 15:39:23', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-saved'),
(915, '2016-12-05 15:40:14', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_edit/50'),
(916, '2016-12-05 15:44:59', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-saved'),
(917, '2016-12-05 15:47:31', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_add'),
(918, '2016-12-05 15:48:17', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-saved'),
(919, '2016-12-05 15:48:49', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_edit/51'),
(920, '2016-12-05 15:50:24', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-saved'),
(921, '2016-12-05 15:51:31', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_edit/51'),
(922, '2016-12-05 15:51:48', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-saved'),
(923, '2016-12-05 15:52:07', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_edit/51'),
(924, '2016-12-05 15:52:14', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-saved'),
(925, '2016-12-05 15:52:54', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_edit/51'),
(926, '2016-12-05 15:53:06', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page/?alert=page-saved'),
(927, '2016-12-05 15:53:58', '125.165.24.243', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/page_edit/51'),
(928, '2016-12-07 11:54:39', '180.251.33.76', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(929, '2016-12-07 11:54:52', '180.251.33.76', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(930, '2016-12-07 12:13:12', '125.162.28.234', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(931, '2016-12-07 12:13:44', '125.162.28.234', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(932, '2016-12-07 12:14:23', '125.162.28.234', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', ''),
(933, '2016-12-07 12:16:16', '125.162.28.234', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/'),
(934, '2016-12-07 12:48:40', '125.162.28.234', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(935, '2016-12-07 15:55:03', '125.162.28.234', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(936, '2016-12-07 15:59:06', '125.162.28.234', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(937, '2016-12-07 15:59:15', '125.162.28.234', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts'),
(938, '2016-12-07 15:59:39', '125.162.28.234', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts'),
(939, '2016-12-07 21:24:58', '36.76.83.62', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(940, '2016-12-07 21:25:20', '36.76.83.62', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(941, '2016-12-07 21:25:50', '36.76.83.62', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(942, '2016-12-07 21:27:29', '36.76.83.62', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(943, '2016-12-08 07:43:21', '37.59.37.41', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(944, '2016-12-08 07:44:14', '37.59.37.41', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin');
INSERT INTO `dah_visitor` (`id`, `time_visit`, `user_ip`, `user_browser`, `user_os`, `user_device`, `page`, `user_referrer`) VALUES
(945, '2016-12-08 11:30:17', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(946, '2016-12-08 11:30:34', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(947, '2016-12-08 11:30:37', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(948, '2016-12-08 11:30:39', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(949, '2016-12-08 11:32:38', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(950, '2016-12-08 11:36:09', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(951, '2016-12-08 11:36:56', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(952, '2016-12-08 11:55:56', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(953, '2016-12-08 11:56:12', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(954, '2016-12-08 11:56:16', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts'),
(955, '2016-12-08 11:56:21', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(956, '2016-12-08 11:56:25', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(957, '2016-12-08 11:56:41', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(958, '2016-12-08 11:56:43', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts'),
(959, '2016-12-08 11:56:51', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts_draft'),
(960, '2016-12-08 11:56:56', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts_trash'),
(961, '2016-12-08 12:56:40', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(962, '2016-12-08 13:40:52', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(963, '2016-12-08 13:41:37', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(964, '2016-12-08 13:43:38', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/45'),
(965, '2016-12-08 13:46:27', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/45'),
(966, '2016-12-08 13:48:23', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(967, '2016-12-08 14:11:07', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(968, '2016-12-08 14:12:20', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(969, '2016-12-08 14:22:54', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(970, '2016-12-08 14:25:17', '36.84.225.133', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(971, '2016-12-09 07:50:47', '180.251.8.6', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(972, '2016-12-09 07:51:04', '180.251.8.6', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(973, '2016-12-09 07:54:28', '180.251.8.6', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(974, '2016-12-09 08:09:52', '180.251.8.6', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(975, '2016-12-09 08:11:33', '180.251.8.6', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(976, '2016-12-09 09:33:46', '36.76.91.221', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(977, '2016-12-09 10:58:40', '36.76.100.144', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(978, '2016-12-09 10:58:50', '36.76.100.144', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(979, '2016-12-09 10:58:57', '36.76.100.144', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts'),
(980, '2016-12-09 10:59:03', '36.76.100.144', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts_draft'),
(981, '2016-12-09 10:59:58', '36.76.100.144', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(982, '2016-12-09 11:20:05', '36.76.100.144', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(983, '2016-12-09 11:20:34', '36.76.100.144', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(984, '2016-12-09 11:35:19', '36.76.100.144', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(985, '2016-12-09 11:35:26', '36.76.100.144', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/post_add'),
(986, '2016-12-09 11:35:29', '36.76.100.144', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(987, '2016-12-09 11:42:50', '36.76.100.144', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(988, '2016-12-09 11:44:17', '36.76.100.144', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(989, '2016-12-09 12:06:08', '36.76.100.144', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(990, '2016-12-09 14:06:49', '36.76.100.144', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(991, '2016-12-09 15:10:32', '36.76.100.144', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(992, '2016-12-09 15:11:55', '36.76.100.144', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(993, '2016-12-09 15:47:41', '36.76.70.186', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(994, '2016-12-09 15:54:51', '36.76.70.186', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(995, '2016-12-09 16:35:21', '36.76.70.186', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(996, '2016-12-09 16:36:41', '36.76.70.186', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(997, '2016-12-09 16:47:57', '36.76.70.186', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/53'),
(998, '2016-12-09 16:55:38', '36.76.70.186', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(999, '2016-12-09 17:07:12', '36.76.70.186', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(1000, '2016-12-09 17:09:01', '36.76.70.186', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(1001, '2016-12-09 17:10:02', '36.76.70.186', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', ''),
(1002, '2016-12-09 17:10:06', '36.76.70.186', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1003, '2016-12-09 17:12:41', '36.76.70.186', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1004, '2016-12-09 17:41:27', '36.76.70.186', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(1005, '2016-12-09 20:51:05', '36.76.70.186', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(1006, '2016-12-09 20:51:08', '36.76.70.186', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', ''),
(1007, '2016-12-13 14:31:24', '180.251.64.137', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(1008, '2016-12-13 16:18:27', '180.251.64.137', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1009, '2016-12-15 21:24:30', '36.68.87.127', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(1010, '2016-12-16 10:57:56', '36.68.98.222', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(1011, '2016-12-16 10:58:03', '36.68.98.222', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1012, '2016-12-16 11:05:07', '36.68.98.222', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1013, '2016-12-16 11:36:02', '36.68.98.222', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(1014, '2016-12-16 11:43:08', '36.68.98.222', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(1015, '2016-12-16 11:59:19', '36.68.98.222', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(1016, '2016-12-16 12:36:29', '36.68.98.222', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(1017, '2016-12-16 12:46:14', '36.68.98.222', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(1018, '2016-12-16 12:46:16', '36.68.98.222', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(1019, '2016-12-16 12:57:38', '36.68.98.222', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(1020, '2016-12-16 12:58:04', '36.68.98.222', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(1021, '2016-12-16 13:07:34', '36.68.98.222', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(1022, '2016-12-16 13:09:06', '36.68.98.222', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(1023, '2016-12-16 13:17:36', '36.68.98.222', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(1024, '2016-12-16 13:21:36', '36.68.98.222', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(1025, '2016-12-16 13:23:03', '36.68.98.222', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1026, '2016-12-16 13:35:33', '36.68.98.222', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(1027, '2016-12-16 13:41:03', '36.68.98.222', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(1028, '2016-12-16 13:41:16', '36.68.98.222', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/users'),
(1029, '2016-12-16 13:41:25', '36.68.98.222', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/menu'),
(1030, '2016-12-16 13:41:34', '36.68.98.222', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/settings'),
(1031, '2016-12-16 13:41:53', '36.68.98.222', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1032, '2016-12-16 13:43:27', '36.68.98.222', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1033, '2016-12-16 15:26:31', '36.76.73.47', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(1034, '2016-12-16 15:26:52', '36.76.73.47', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', ''),
(1035, '2016-12-16 15:31:04', '36.76.73.47', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', ''),
(1036, '2016-12-16 15:31:05', '36.76.73.47', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', ''),
(1037, '2016-12-17 11:02:20', '180.241.49.62', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(1038, '2016-12-17 11:03:35', '180.241.49.62', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1039, '2016-12-17 11:03:40', '180.241.49.62', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts'),
(1040, '2016-12-17 11:04:48', '180.241.49.62', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1041, '2016-12-17 11:05:03', '180.241.49.62', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1042, '2016-12-17 11:05:24', '180.241.49.62', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1043, '2016-12-17 11:05:51', '180.241.49.62', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1044, '2016-12-17 11:06:15', '180.241.49.62', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1045, '2016-12-17 11:06:16', '180.241.49.62', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1046, '2016-12-17 11:07:03', '180.241.49.62', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/posts'),
(1047, '2016-12-21 00:13:15', '180.241.66.24', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(1048, '2016-12-21 00:13:19', '180.241.66.24', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1049, '2016-12-21 00:13:37', '180.241.66.24', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1050, '2016-12-21 00:14:53', '180.241.66.24', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', ''),
(1051, '2016-12-21 00:14:58', '180.241.66.24', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/'),
(1052, '2016-12-21 00:16:28', '180.241.66.24', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1053, '2016-12-21 00:18:10', '180.241.66.24', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', ''),
(1054, '2016-12-21 00:19:16', '180.241.66.24', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/'),
(1055, '2016-12-21 00:19:33', '180.241.66.24', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1056, '2016-12-21 00:42:44', '180.241.66.24', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1057, '2016-12-21 00:42:44', '180.241.66.24', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1058, '2016-12-23 10:53:51', '180.241.8.106', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(1059, '2016-12-23 13:57:34', '180.241.66.24', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(1060, '2016-12-23 13:57:52', '180.241.66.24', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1061, '2016-12-23 13:58:07', '180.241.66.24', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1062, '2016-12-23 20:06:00', '180.241.8.106', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(1063, '2016-12-24 15:11:36', '180.251.61.73', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(1064, '2016-12-25 14:19:20', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(1065, '2016-12-25 14:19:24', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1066, '2016-12-25 14:19:40', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1067, '2016-12-25 14:25:13', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1068, '2016-12-25 14:27:29', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1069, '2016-12-25 14:27:35', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/60'),
(1070, '2016-12-25 14:27:38', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/60'),
(1071, '2016-12-25 14:30:25', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1072, '2016-12-25 14:32:58', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1073, '2016-12-25 14:41:43', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1074, '2016-12-25 14:41:43', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1075, '2016-12-25 14:41:45', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1076, '2016-12-25 14:42:32', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1077, '2016-12-25 14:42:39', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/57'),
(1078, '2016-12-25 14:42:42', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/57'),
(1079, '2016-12-25 14:43:52', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1080, '2016-12-25 14:46:22', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1081, '2016-12-25 14:49:41', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1082, '2016-12-25 14:50:16', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1083, '2016-12-25 14:50:57', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1084, '2016-12-25 14:51:45', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/59'),
(1085, '2016-12-25 14:51:47', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/59'),
(1086, '2016-12-25 14:52:47', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1087, '2016-12-25 14:53:19', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1088, '2016-12-25 14:53:47', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/58'),
(1089, '2016-12-25 14:53:49', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/58'),
(1090, '2016-12-25 14:54:30', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1091, '2016-12-25 14:56:57', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1092, '2016-12-25 14:57:01', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/56'),
(1093, '2016-12-25 14:57:04', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/56'),
(1094, '2016-12-25 15:19:40', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(1095, '2016-12-25 15:19:48', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1096, '2016-12-25 15:19:59', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1097, '2016-12-25 15:20:20', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(1098, '2016-12-25 15:22:24', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(1099, '2016-12-25 15:22:30', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(1100, '2016-12-25 15:22:40', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1101, '2016-12-25 15:35:07', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_add'),
(1102, '2016-12-25 15:43:05', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-saved'),
(1103, '2016-12-25 15:44:56', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', ''),
(1104, '2016-12-25 15:45:00', '180.251.51.155', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/'),
(1105, '2016-12-28 15:17:32', '36.84.68.211', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog/?alert=login-failed'),
(1106, '2016-12-28 15:18:36', '36.84.68.211', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1107, '2017-01-04 15:53:40', '139.192.51.134', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog/?alert=login-failed'),
(1108, '2017-01-04 15:54:31', '139.192.51.134', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1109, '2017-01-04 15:54:45', '139.192.51.134', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_category'),
(1110, '2017-01-04 15:54:57', '139.192.51.134', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_category/?alert=delete'),
(1111, '2017-01-04 15:55:05', '139.192.51.134', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_category/?alert=delete'),
(1112, '2017-01-04 15:55:18', '139.192.51.134', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_category/?alert=delete'),
(1113, '2017-01-04 15:55:26', '139.192.51.134', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_category/?alert=delete'),
(1114, '2017-01-04 15:55:54', '139.192.51.134', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_category/?alert=delete'),
(1115, '2017-01-05 11:40:50', '36.84.225.101', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(1116, '2017-01-11 14:31:46', '36.76.108.107', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(1117, '2017-01-17 19:21:50', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(1118, '2017-01-17 19:23:58', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1119, '2017-01-17 19:24:36', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1120, '2017-01-17 19:24:55', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-delete'),
(1121, '2017-01-17 19:25:13', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-delete'),
(1122, '2017-01-17 19:26:02', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-delete'),
(1123, '2017-01-17 19:26:12', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-delete'),
(1124, '2017-01-17 19:26:22', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-delete'),
(1125, '2017-01-17 19:26:28', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-delete'),
(1126, '2017-01-17 19:26:34', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-delete'),
(1127, '2017-01-17 19:26:40', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-delete'),
(1128, '2017-01-17 20:08:16', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products/?alert=post-delete'),
(1129, '2017-01-17 20:13:08', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/33'),
(1130, '2017-01-17 20:13:29', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', ''),
(1131, '2017-01-17 20:13:56', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/'),
(1132, '2017-01-17 20:14:01', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1133, '2017-01-17 20:24:11', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/41'),
(1134, '2017-01-17 20:29:12', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', ''),
(1135, '2017-01-17 20:29:24', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/'),
(1136, '2017-01-17 20:29:30', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1137, '2017-01-17 20:32:39', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/43'),
(1138, '2017-01-17 20:33:01', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', ''),
(1139, '2017-01-17 20:33:28', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/'),
(1140, '2017-01-17 20:33:35', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1141, '2017-01-18 00:50:05', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(1142, '2017-01-18 00:50:46', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1143, '2017-01-18 00:53:46', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1144, '2017-01-18 01:04:44', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/42'),
(1145, '2017-01-18 01:13:48', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1146, '2017-01-18 01:19:29', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/36'),
(1147, '2017-01-18 01:20:38', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1148, '2017-01-18 01:27:31', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/35'),
(1149, '2017-01-18 01:30:21', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1150, '2017-01-18 01:32:50', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/39'),
(1151, '2017-01-18 01:33:48', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1152, '2017-01-18 01:34:39', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/38'),
(1153, '2017-01-18 01:35:29', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1154, '2017-01-18 01:36:22', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/37'),
(1155, '2017-01-18 01:37:12', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1156, '2017-01-18 01:39:28', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/47'),
(1157, '2017-01-18 01:42:05', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1158, '2017-01-18 01:42:18', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1159, '2017-01-18 01:44:06', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/46'),
(1160, '2017-01-18 01:45:24', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1161, '2017-01-18 01:47:07', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/45'),
(1162, '2017-01-18 01:48:47', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/45'),
(1163, '2017-01-18 01:49:10', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1164, '2017-01-18 01:51:15', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/44'),
(1165, '2017-01-18 01:52:15', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/44'),
(1166, '2017-01-18 01:53:03', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1167, '2017-01-18 01:56:40', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/55'),
(1168, '2017-01-18 01:57:13', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/55'),
(1169, '2017-01-18 01:57:30', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1170, '2017-01-18 01:59:15', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/54'),
(1171, '2017-01-18 02:00:29', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1172, '2017-01-18 02:01:51', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/53'),
(1173, '2017-01-18 02:02:27', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1174, '2017-01-18 02:03:29', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/52'),
(1175, '2017-01-18 02:03:51', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1176, '2017-01-18 02:05:29', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/51'),
(1177, '2017-01-18 02:06:01', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1178, '2017-01-18 02:07:33', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/50'),
(1179, '2017-01-18 02:08:29', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1180, '2017-01-18 02:10:31', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/49'),
(1181, '2017-01-18 02:10:55', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1182, '2017-01-18 02:12:30', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/48'),
(1183, '2017-01-18 02:13:09', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1184, '2017-01-18 02:13:15', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1185, '2017-01-18 02:14:00', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/47'),
(1186, '2017-01-18 02:14:24', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', ''),
(1187, '2017-01-18 02:14:29', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/'),
(1188, '2017-01-18 02:14:37', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/products'),
(1189, '2017-01-18 02:16:33', '180.251.1.191', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/product_edit/54'),
(1190, '2017-01-18 11:54:30', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(1191, '2017-01-18 11:55:07', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', ''),
(1192, '2017-01-18 11:55:18', '36.76.64.226', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1193, '2017-01-23 19:38:09', '180.241.92.10', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(1194, '2017-01-23 19:38:16', '180.241.92.10', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1195, '2017-01-23 23:10:38', '180.241.92.10', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog/?alert=login-failed'),
(1196, '2017-01-23 23:10:54', '180.241.92.10', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1197, '2017-01-23 23:11:08', '180.241.92.10', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/menu'),
(1198, '2017-01-23 23:11:13', '180.241.92.10', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/menu_item_edit/50'),
(1199, '2017-01-23 23:11:23', '180.241.92.10', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/menu/?alert=menu-saved'),
(1200, '2017-01-23 23:11:36', '180.241.92.10', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/menu_item_edit/44'),
(1201, '2017-01-23 23:11:46', '180.241.92.10', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/menu/?alert=menu-saved'),
(1202, '2017-01-23 23:29:35', '180.241.92.10', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/menu/?alert=menu-saved'),
(1203, '2017-01-24 12:32:39', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog/?alert=login-failed'),
(1204, '2017-01-24 12:32:43', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1205, '2017-01-24 14:47:23', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(1206, '2017-01-24 14:47:29', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1207, '2017-01-24 14:49:08', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice'),
(1208, '2017-01-24 14:49:14', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice/?alert=delete'),
(1209, '2017-01-24 14:49:44', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/pembeli'),
(1210, '2017-01-24 15:32:08', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(1211, '2017-01-24 15:33:25', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1212, '2017-01-24 15:33:30', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice'),
(1213, '2017-01-24 15:49:26', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice_detail/13'),
(1214, '2017-01-24 15:49:34', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice'),
(1215, '2017-01-24 15:49:37', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice/?alert=delete'),
(1216, '2017-01-24 15:49:45', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice_edit/13'),
(1217, '2017-01-24 15:49:59', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice_edit/13'),
(1218, '2017-01-24 15:50:02', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice'),
(1219, '2017-01-24 15:50:20', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice_edit/13'),
(1220, '2017-01-24 15:51:19', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice_edit/13'),
(1221, '2017-01-24 15:51:44', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice/?alert=update'),
(1222, '2017-01-24 15:51:53', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice_edit/13'),
(1223, '2017-01-24 15:52:13', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice/?alert=update'),
(1224, '2017-01-24 15:52:26', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice_edit/13'),
(1225, '2017-01-24 15:54:19', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice/?alert=update'),
(1226, '2017-01-24 15:54:41', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice_detail/13'),
(1227, '2017-01-24 15:55:45', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1228, '2017-01-24 16:37:03', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(1229, '2017-01-24 16:37:07', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1230, '2017-01-24 16:37:12', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice');
INSERT INTO `dah_visitor` (`id`, `time_visit`, `user_ip`, `user_browser`, `user_os`, `user_device`, `page`, `user_referrer`) VALUES
(1231, '2017-01-24 16:37:12', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice'),
(1232, '2017-01-24 16:37:42', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice'),
(1233, '2017-01-24 16:37:42', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice'),
(1234, '2017-01-24 16:38:11', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice'),
(1235, '2017-01-24 16:38:40', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice/?alert=delete'),
(1236, '2017-01-24 16:39:16', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice/?alert=delete'),
(1237, '2017-01-24 16:39:23', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/pembeli'),
(1238, '2017-01-24 16:39:37', '180.241.56.3', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/pembeli/?alert=delete'),
(1239, '2017-01-25 09:14:28', '36.76.88.202', 'Chrome', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog/?alert=login-failed'),
(1240, '2017-01-25 20:46:58', '180.241.52.255', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog/?alert=login-failed'),
(1241, '2017-01-25 20:47:06', '180.241.52.255', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin'),
(1242, '2017-01-25 20:47:11', '180.241.52.255', 'Firefox', 'Unknown Windows OS', 'Unidentified', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin/invoice'),
(1243, '2017-01-26 09:33:25', '180.251.54.138', 'Chrome', 'Linux', 'Generic Mobile', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(1244, '2017-01-26 09:33:42', '180.251.54.138', 'Chrome', 'Linux', 'Generic Mobile', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/xlog'),
(1245, '2017-01-26 09:33:52', '180.251.54.138', 'Chrome', 'Linux', 'Generic Mobile', 'http://shop.malasngoding.com/', 'http://shop.malasngoding.com/admin');

-- --------------------------------------------------------

--
-- Table structure for table `dah_widget`
--

CREATE TABLE `dah_widget` (
  `widget_id` int(11) NOT NULL,
  `widget_name` varchar(225) NOT NULL,
  `widget_position` varchar(10) NOT NULL,
  `widget_sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dah_widget`
--

INSERT INTO `dah_widget` (`widget_id`, `widget_name`, `widget_position`, `widget_sort`) VALUES
(10, 'related_post', 'footer', 1),
(43, 'pages', 'footer', 2),
(46, 'pages', 'sidebar', 2),
(68, 'category', 'footer', 4),
(69, 'text', 'footer', 4),
(70, 'slider', 'content', 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `no` varchar(255) DEFAULT NULL,
  `tgl` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `telp` varchar(255) DEFAULT NULL,
  `email` text NOT NULL,
  `metode` varchar(20) DEFAULT NULL,
  `alamat` text NOT NULL,
  `kurir` varchar(255) DEFAULT NULL,
  `pembayaran` int(11) NOT NULL,
  `rek_bank` text NOT NULL,
  `ongkir` int(11) NOT NULL,
  `resi` varchar(255) DEFAULT NULL,
  `slip` text,
  `status` int(11) NOT NULL,
  `kota` varchar(255) DEFAULT NULL,
  `kecamatan` varchar(255) DEFAULT NULL,
  `provinsi` varchar(255) DEFAULT NULL,
  `kodepos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `no`, `tgl`, `user_id`, `nama`, `telp`, `email`, `metode`, `alamat`, `kurir`, `pembayaran`, `rek_bank`, `ongkir`, `resi`, `slip`, `status`, `kota`, `kecamatan`, `provinsi`, `kodepos`) VALUES
(17, '#UMBI-0017', '2019-09-20', 75, 'hasan', '092271141611', '', NULL, 'hagu teungah, kota lhokseumawe', 'pos - Paket Kilat Khusus', 73000, 'bm1', 52000, NULL, NULL, 0, '235', 'Banda Sakti', '21', 24253),
(18, '#UMBI-0018', '2019-09-26', 76, 'Muhammad Syah', '098765432112', '', NULL, 'Jalan Kenari nomer 5 Banda Sakti', 'pos - Paket Kilat Khusus', 64300, 'bm1', 52000, NULL, NULL, 0, '235', 'Banda Sakti', '21', 2431);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_invoice` int(11) NOT NULL,
  `order_produk` int(11) NOT NULL,
  `order_harga` int(11) NOT NULL,
  `order_jumlah` int(11) NOT NULL,
  `order_berat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_invoice`, `order_produk`, `order_harga`, `order_jumlah`, `order_berat`) VALUES
(1, 1, 53, 85000, 1, NULL),
(2, 2, 55, 145000, 1, NULL),
(3, 2, 44, 75000, 1, NULL),
(4, 3, 35, 80000, 1, NULL),
(5, 4, 53, 85000, 1, NULL),
(6, 5, 52, 78000, 1, NULL),
(7, 6, 47, 100000, 1, NULL),
(8, 7, 41, 100000, 1, NULL),
(9, 8, 41, 100000, 1, NULL),
(10, 9, 64, 95000, 1, NULL),
(11, 10, 42, 80000, 1, NULL),
(12, 10, 33, 135000, 1, NULL),
(13, 11, 64, 95000, 1, NULL),
(14, 12, 48, 90000, 1, NULL),
(15, 12, 47, 100000, 1, NULL),
(16, 12, 44, 75000, 1, NULL),
(17, 12, 41, 100000, 1, NULL),
(18, 12, 35, 80000, 1, NULL),
(19, 13, 36, 90000, 1, NULL),
(20, 14, 64, 95000, 1, NULL),
(23, 17, 68, 10500, 2, NULL),
(24, 18, 72, 12300, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `telp` varchar(255) DEFAULT NULL,
  `alamat` text,
  `provinsi` varchar(255) DEFAULT NULL,
  `kota` varchar(255) DEFAULT NULL,
  `kecamatan` varchar(255) DEFAULT NULL,
  `kelurahan` varchar(255) DEFAULT NULL,
  `kodepos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `nama`, `password`, `status`, `telp`, `alamat`, `provinsi`, `kota`, `kecamatan`, `kelurahan`, `kodepos`) VALUES
(9, 'fraidian651@gmail.com', 'Fraidian Atqwa', '40c77f720c382abc9c99bf8abbfc39c3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'diki@gmail.com', 'diki', 'dffaa4c60a250f19dc4a79b1d05c8d53', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'malasthat@gmail.com', 'malas', '521cc77d6a5786aa4d7db5097238abd8', 1, '085360080642', 'jl listrik gg palem no 1', 'aceh', 'lhokseumawe', 'banda sakti', NULL, 23256),
(13, 'edowaykristovel@yahoo.co.id', 'Kristovel Edoway', '448375fb8ccc5d8f3af6c855cc3a6156', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'malas@gmail.com', 'pemalas', '6e413ea6a2bb937b9106fa21004965da', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'arifmuhamad1337@gmail.com', 'Arif Muhammad', '557ba50239fcd2b4f813c76cf9c3efd2', 1, '081295085279', 'Perumahan papan mas Jalan Merpati 3 Blok G 62 no.13 rt 06 rw 09', 'Jawa Barat', 'Bekasi', 'Tambun Selatan', NULL, 17510),
(16, 'zamzamfahrurozi12@gmail.com', 'zamzamfahrurozi', '85648fb0a9baf7d34e410c17cc648ac0', 1, '089', 'kp.nangkelan', 'jawabarat', 'garut', 'samarang', NULL, 41466),
(17, 'hasruldani6@gmail.com', 'hasruldani', 'd063d02b3d3397c343b041c03145092c', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'gunawanr14@gmail.com', 'Gunawan Raharjo', 'e35ab3185502ced60146a8d6310f2f19', 1, '083837388547', 'Jala Temanggung No 34 Rt/Rw 03/06', 'Jawa Tengah', 'Tegal', 'Margadana', NULL, 52143),
(19, 'reynaldiaznan450@gmail.com', 'Reynaldi Aznan', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'rayhanprima99@gmail.com', 'Ahmed Rayhan Primadedas', 'f3d54339f3ac215649a1233127c04f30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'avenged.dody@gmail.com', 'Ath Thoriq dody ath mansyah', '0546456e0f33398ad7b11e214c2c5b37', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'arf.pnp.amd@gmail.com', 'Arif', 'ab9b9195d1adda8e7aedc41235dd2e59', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'yolsak30@gmail.com', 'Yolsa Kolosra', '069c546d1d97fd9648d8142b3e0fd3a3', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'Nafan.San1709@gmail.com', 'Nafasansono Harefa', 'cc568c3d81f3e13063a7f2cbd1b7ccb2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'the.sun.007@gmail.com', 'Surya fajar', 'f20e310901d63285ba4a709312ee3aad', 1, '085246515452', 'Jl. Padat Karya No. 12 Sempaja Utara (jalan masuk ke Perum Bengkuring, Seberang Klinik dr. Wilsa)', 'Kalimantan Timur', 'Samarinda', 'Samarinda Utara', NULL, 75123),
(26, 'hasank.smart@gmail.com', 'Hasanudin ', '45ada73995520c52540d472626e1d494', 1, '087875875047', 'jalan lingkungan kaliwadas Rt 03 Rw 06 Perbatasan Cimuncang Serang-Banten', 'Banten', 'Serang ', 'Serang ', NULL, 42111),
(27, 'umarro@gmail.com', 'umar harjanto', 'b3abdf7ac27b8b2393f013081cde8560', 1, '081511135905', 'd.a. pt. indogravure, jl. pahlawan no. 8 rempoa', 'banten', 'tangerang selatan', 'ciputat', NULL, 15412),
(28, 'aulajaa15@gmail.com', 'Aulia Rahman', '6176bfc198db8efa988c3d23501e43d5', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'bayu.fs20@gmail.com', 'Bayu Fitri Sopyan', 'd0b7fe98b37aa7d75770703f407121f6', 1, '081563111604', 'Jl.Tititmplik Dalam No. 102 RT/01. RW/06 Kel.Sadang Serang ', 'Jawa Barat', 'Bandung', 'Coblong', NULL, 40133),
(30, 'vincen.olaf91@gmail.com', 'Vicencius Olaflia Rosantono', 'bc3625c37b208bd2ceafb4b7eb838a53', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'abdasispif@gmail.com', 'Abd Asis', '7657f3205b3749482500a17ad88a657b', 1, '083852411183', 'Dsn. Bandungan, Ds. Rongdurin', 'Jawa Timur', 'Bangkalan', 'TanahMerah', NULL, 69172),
(32, 'okyunus60@gmail.com', 'yunus', 'bf5e67c968161d8fbb0a4172d4aa2cd4', 1, '082234905751', 'jne kraksaan', 'jawa timur', 'kraksaan', 'kecamatan', NULL, 67282),
(33, 'damasangga9@gmail.com', 'damas angga', '6ccf929934691710135f3f0df7cc43c5', 1, '089694553552', 'Jalan Tanjung Sanyang RT 006/08 No. 38', 'DKI Jakarta', 'Jakarta Timur', 'Kramat Jati', NULL, 13630),
(34, 'Ma.gm.indramayu@gmail.com', 'Muflihuddin ahmad', '00e750b1f2eea354fcc530dc8d639e33', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'radhitsukamoto@gmail.com', 'Rachmad Hidayat', 'ece235401d994b11c656b19fa4befb4e', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'farkhanm23@yahoo.com', 'muhammad fakhan imfrozin febrian putra', '68f993348daf277e0c29d64eec68d4a8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'imfrozin15@gmail.com', 'farkhantokae', '68f993348daf277e0c29d64eec68d4a8', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'sukkunonsu@gmail.com', 'Sukkun Aritonang', 'b2af2f7e6b4cb735da1efb5ab5ca31d9', 1, '085338529896', 'Perumahan Melati Garden Blok I No. 03', 'Kepulauan Riau', 'Batam', 'Sekupang', NULL, 29426),
(39, 'tasdiq.bmth@gmail.com', 'tasdiq siregar', 'fcc38bbf485107f6eca2093e542f339d', 1, '085249783762', 'JL.SWADAYA 4 KARANGASEM, CONDONGCATUR, DEPOK, SLEMAN', 'D.I YOGYAKARTA', 'kabupaten Sleman', 'Condongcatur', NULL, 55283),
(40, 'suwino204@gmail.com', 'Suwino', '05daef6c8f67742973e7314420d6c0e7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'ryanwicida@gmail.com', 'Ryan', '4411787e47cec21af45421c9554a1d7c', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'david.andriyan@gmail.com', 'David Andriyan S.', '9dbebf664dc054459496e1ed5a306ec8', 1, '082122251270', 'KPPN Denpasar GKN I Jl. Dr. Kusuma Atmaja Nitimandala Renon', 'Bali', 'Denpasar', 'Denpasar Timur', NULL, 80235),
(43, 'demensinden@yandex.com', 'demensinden', '8ea9b666b4a617a28fdc8623605d08b2', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'meandobe@gmail.com', 'mean ', 'e4d60ca72739c99324f249a8196363e6', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'carimodal@gmail.com', 'carimodal', 'd831fbcac7da252319aacac5350c9f55', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'popovshbrynt@gmail.com', 'Muhammad Popov Shabriyanto', '2ec0532b4522c53146649106340f53fe', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'ryuzakki009@gmail.com', 'ahmad ramadhan', '6501f3b02a84b543f47a0cde377acc8b', 1, '082316663189', 'larangan', 'jawa barat', 'indramayu', 'lohbener', NULL, 45252),
(48, '2311fadli@gmail.com', 'Fadli Muhlisiin', '11dcbef3d14dfce594612b15884da83a', 1, '08998535153', 'Puspanegara Citeureup Rt03/03', 'Jawa barat', 'Bogor', 'Citeureup', NULL, 16810),
(49, 'desyramadhani477@gmail.com', 'Desy Ramadani', '6782c740311b55cfa21e8a405e3a118b', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 'muhammadkhaidhir@linuxmail.org', 'Muhammad Khaidhir', '95eef42b904a343d9459b33679a31afe', 1, '082253046959', 'JL.Mas Negara Tembus Perumnas RT.43', 'Kalimantan Selatan', 'Banjarmasin', 'Banjarmasin Utara', NULL, 70123),
(51, 'iqballsiddik7777@gmail.com', 'iqbal siddik', '4ac03ad3ae277c7c09221ee9fdfb4042', 1, '085720277508', 'Jalan Jurang Gg.masjid sabilulhuda No.610 Rt.04 Rw.05 Kel.pasteur Kec.Sukajadi', 'Jawa Barat', 'Bandung', 'Sukajadi', NULL, 40616),
(52, 'befryloy@gmail.com', 'Maxmilianus Befry Loy', '6ca917da06ae3500ec1e849929ab3915', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 'gnugraha5@gmail.com', 'Gugah Nugraha', 'fd8316d6eeb248e8d600a8587b5f3775', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 'christofelmichael26@gmail.com', 'christofel michael', 'ad0f048882b380c6d9e5741f75027ceb', 1, '085361501718', 'Jl.Pembangunan III NO.45 ', 'Sumatera Utara', 'Medan', 'Medan Timur', NULL, 20238),
(55, 'kampusmuhammadiyah@gmail.com', 'Yudi Prasetyo', 'e172dd95f4feb21412a692e73929961e', 1, '08123749003', 'JL. KH AHMAD DAHLAN NO.17 KOTA KUPANG NTT', 'NUSA TENGGARA TIMUR', 'KUPANG', 'OEBOBO', NULL, 8111),
(56, 'dody.cpm@gmail.com', 'Dody Tanuwijaya', '162b84f420fd4b1e57d6e8865fa1bf5d', 1, '081383051440', 'jl.bungur raya no.12 rt.013/rw 06 kel.kebayoran lama utara', 'dki jakarta', 'jaksel', 'kebayoran lama', NULL, 12240),
(57, 'angga.cadullah@gmail.com', 'angga', '48f52a052d924e8c53c184043c48aefa', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 'defalt_404@yahoo.co.id', 'Mr.Wahyu', '95fa39ea437f858ae443b1b4d808bfb4', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'hery.fajar.isnawan@gmail.com', 'hery fajar isnawan', 'ee7d8c3595f71ee7c2c1f7b5c803065d', 1, '081273636600', 'Jl. Teratai no.50, Mulyojati 16c', 'lampung', 'kota metro', 'metro barat', NULL, 34111),
(60, 'dadirosadi117@gmail.com', 'Dadi Rosadi', '1fa88aa70c15c6639c687203e7f77a41', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 'dulkiyemfamily@gmail.com', 'angga chrisna widyanto', '4f8c6c43d5b9ebb3bc817691ae610eb7', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 'Ibrahimbaim170@gmail.com', 'Ibrahimbaim', '57ac992cf4a8b01a22958a5d9f4a4286', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 'dupanks@gmail.com', 'Erfan Gumelar', '6b4228fe3be6aec2c25d6cc8ab838d7a', 1, '085956656176', 'Jl. Margacinta Gang Iman 1 No. 68 A RT 002 / RW 002 Margasari Buah Batu Bandung', 'Jawa Barat', 'Bandung', 'Buah Batu', NULL, 40286),
(64, 'business.afdhalul@gmail.com', 'Afdhalul Ichsan Yourdan', '624d93e21326410c4067323788c866d5', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 'novia7a24@gmail.com', 'Novia RKS', '03dbc123137612a230b72b06382c45dd', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 'reza.afrizal@gmail.com', 'reza afrizal', '9964c19b22a0700f351050f9cd2be4af', 1, '089690888005', 'Jalan Tabrani Ahmad Gang Gunung Tidar No. 18', 'Kalimantan Barat', 'Pontianak', 'Pontianak Barat', NULL, 78113),
(67, 'vhidhie89@gmail.com', 'adi iman saputra', '4cbbf5ab74a69ca5ecd9edd70b084cdb', 1, '085768125959', 'Jalan Imam Bonjol Gang Lebak Budi 2 No.28 Kelurahan Sukajawa Baru', 'Lampung', 'Bandar Lampung', 'Tanjung Karang Barat', NULL, 35151),
(68, 'Imron.saefulloh28@gmail.com', 'Imron saefulloh', '136d15a423600ea7f9c423023d10d969', 1, '082214394959', 'Dusun Lampeni Rt/Rw 18/004, Desa Tanjungsari Timur', 'Jawa barat', 'Subang', 'Cikaum', NULL, 41253),
(69, 'ahmad.tabroni@outlook.com', 'Ahmad Tabroni', '7fbbeec8c5117133f2862d2d0a8bd65d', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 'sukma.irawan@gmail.com', 'Sukma Irawan', 'ac8f9c49a75cf30c8786072e0af5e9e3', 1, '081519415333', 'Wisma GKBI lt 17 suite 1710, Jl Jend Sudirman No 28', 'DKI Jakarta', 'Jakarta Pusat', 'Tanah Abang', NULL, 10210),
(71, 'alfatihmubarok@yahoo.co.id', 'alfatihmubarok', 'f10a7d6688dcd12bac6c66e74993cf2a', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 'admin@admin.com', 'nama_ja', '3fc0a7acf087f549ac2b266baf94b8b1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 'tesdaftar@admin.com', 'qwerssssss', 'd8578edf8458ce06fbc5bb76a58c5ca4', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 'tesdaftarlagi@admin.com', 'Shalan Nasution', '3fc0a7acf087f549ac2b266baf94b8b1', 1, '085287990', 'Jalan Aksarsf', 'Aceh Tenggara', 'Blangkejeren', 'Aceh tenggara', NULL, 321344),
(75, 'admin@gmail.com', 'admin', '0192023a7bbd73250516f069df18b500', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 'jamalpdh@gmail.com', 'jalamal', '325077d1d7b6fa325b095fb212f3bc42', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, 'indra.ib.budi@gmail.com', 'ib', 'df8f614e30e694c4670859a5f6368734', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 'tesdulu@tes.com', 'cobacuy', 'd8578edf8458ce06fbc5bb76a58c5ca4', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `core_rating`
--
ALTER TABLE `core_rating`
  ADD PRIMARY KEY (`rating_id`);

--
-- Indexes for table `dah_category`
--
ALTER TABLE `dah_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `dah_menu`
--
ALTER TABLE `dah_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `dah_options`
--
ALTER TABLE `dah_options`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `dah_pages`
--
ALTER TABLE `dah_pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `dah_posts`
--
ALTER TABLE `dah_posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `dah_products`
--
ALTER TABLE `dah_products`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `dah_product_category`
--
ALTER TABLE `dah_product_category`
  ADD PRIMARY KEY (`pcat_id`);

--
-- Indexes for table `dah_taxonomy`
--
ALTER TABLE `dah_taxonomy`
  ADD PRIMARY KEY (`taxonomy_id`);

--
-- Indexes for table `dah_users`
--
ALTER TABLE `dah_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `dah_visitor`
--
ALTER TABLE `dah_visitor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dah_widget`
--
ALTER TABLE `dah_widget`
  ADD PRIMARY KEY (`widget_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `core_rating`
--
ALTER TABLE `core_rating`
  MODIFY `rating_id` int(24) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dah_category`
--
ALTER TABLE `dah_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dah_menu`
--
ALTER TABLE `dah_menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `dah_options`
--
ALTER TABLE `dah_options`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `dah_pages`
--
ALTER TABLE `dah_pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `dah_posts`
--
ALTER TABLE `dah_posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `dah_products`
--
ALTER TABLE `dah_products`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `dah_product_category`
--
ALTER TABLE `dah_product_category`
  MODIFY `pcat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `dah_taxonomy`
--
ALTER TABLE `dah_taxonomy`
  MODIFY `taxonomy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=280;

--
-- AUTO_INCREMENT for table `dah_users`
--
ALTER TABLE `dah_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dah_visitor`
--
ALTER TABLE `dah_visitor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1246;

--
-- AUTO_INCREMENT for table `dah_widget`
--
ALTER TABLE `dah_widget`
  MODIFY `widget_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
