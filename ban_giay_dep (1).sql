-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 12, 2023 lúc 06:08 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ban_giay_dep`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Giày Sneaker', '2023-12-12 14:58:20', '2023-12-12 14:58:20'),
(2, 'Giày Lười', '2023-12-12 14:58:20', '2023-12-12 14:58:20'),
(3, 'Dép Crocs', '2023-12-12 14:58:53', '2023-12-12 14:58:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `name`, `address`, `phone`, `total`, `status`, `UserId`, `createdAt`, `updatedAt`) VALUES
(1, 'Phan Tiến Huy', 'Hoài Đức- Hà Nội', '0986538387', 4127200, 2, 1, '2023-12-12 15:50:29', '2023-12-12 16:14:14'),
(2, 'Phan Tiến Huy', 'Hoài Đức- Hà Nội', '0986538387', 5535200, 1, 1, '2023-12-12 16:43:02', '2023-12-12 17:03:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_products`
--

CREATE TABLE `order_products` (
  `id` int(11) NOT NULL,
  `OrderId` int(11) DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_products`
--

INSERT INTO `order_products` (`id`, `OrderId`, `ProductId`, `quantity`, `size`, `createdAt`, `updatedAt`) VALUES
(1, 1, 6, 1, '36', '2023-12-12 15:50:29', '2023-12-12 15:50:29'),
(2, 2, 3, 1, '36', '2023-12-12 16:43:02', '2023-12-12 16:43:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `price`, `CategoryId`, `createdAt`, `updatedAt`) VALUES
(1, 'ECCO SOFT 7 W', '/images/products/sneaker_1.png', 4479200, 1, '2023-12-12 15:00:24', '2023-12-12 17:03:40'),
(2, 'ECCO STREET 720 W', '/images/products/sneaker_2.png', 5535200, 1, '2023-12-12 15:07:55', '2023-12-12 15:07:55'),
(3, 'ECCO STREET 720 W', '/images/products/sneaker_3.png', 5535200, 1, '2023-12-12 15:08:37', '2023-12-12 15:08:37'),
(4, 'ECCO SOFT 2.0 W', '/images/products/sneaker_4.png\r\n', 3511200, 1, '2023-12-12 15:09:57', '2023-12-12 15:09:57'),
(5, 'ECCO SOFT 2.0 W', '/images/products/sneaker_5.png', 3511200, 1, '2023-12-12 15:10:47', '2023-12-12 15:10:47'),
(6, 'ECCO STREET LITE W', '/images/products/sneaker_6.png\r\n', 4127200, 1, '2023-12-12 15:11:19', '2023-12-12 15:11:19'),
(7, 'ECCO STREET LITE W', '/images/products/sneaker_7.png', 4127200, 1, '2023-12-12 15:12:14', '2023-12-12 15:12:14'),
(8, 'ECCO STREET 720 W', '/images/products/sneaker_8.png', 5535200, 1, '2023-12-12 15:12:49', '2023-12-12 15:12:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Admin', '2023-12-12 14:57:29', '2023-12-12 14:57:29'),
(2, 'Khách Hàng', '2023-12-12 14:57:29', '2023-12-12 14:57:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20231211075852-create-user.js'),
('20231211075906-create-role.js'),
('20231211080241-create-product.js'),
('20231211080254-create-category.js'),
('20231211080308-create-order.js'),
('20231211080319-create-order-product.js');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `RoleId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `RoleId`, `createdAt`, `updatedAt`) VALUES
(1, 'Phan Tiến Huy', 'huyphan1232002@gmail.com', 'phantienhuy', '$2b$10$4xHBZnI3JQh9GC8pAmAUuOPOTF.99GVYdgDZBe2xoKd/4qE0BjUu.', 2, '2023-12-12 15:40:55', '2023-12-12 17:04:05'),
(2, 'Admin', 'admin@gmail.com', 'admin', '$2b$10$R4./XHDI60SS9SAO/bp3MO4H2bOD/GYIiEloFZoEGYxjqGarkJel.', 1, '2023-12-12 16:44:27', '2023-12-12 16:44:27');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
