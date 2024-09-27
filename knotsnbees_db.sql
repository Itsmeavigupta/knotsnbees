-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 23, 2024 at 08:44 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `knotsnbees_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(50) NOT NULL,
  `permissions` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart_items`
--

CREATE TABLE `tbl_cart_items` (
  `cart_item_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categories`
--

CREATE TABLE `tbl_categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_support_tickets`
--

CREATE TABLE `tbl_customer_support_tickets` (
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(50) DEFAULT 'Open',
  `priority` varchar(50) DEFAULT 'Medium',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_discounts`
--

CREATE TABLE `tbl_discounts` (
  `discount_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `discount_percentage` decimal(5,2) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `usage_limit` int(11) DEFAULT NULL,
  `used_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inventory`
--

CREATE TABLE `tbl_inventory` (
  `inventory_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `order_status` varchar(50) NOT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `shipping_address` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_items`
--

CREATE TABLE `tbl_order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payments`
--

CREATE TABLE `tbl_payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `transaction_id` varchar(100) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE `tbl_products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `tax_rate` decimal(5,2) NOT NULL DEFAULT 0.00,
  `discount_rate` decimal(5,2) NOT NULL DEFAULT 0.00,
  `discount_price` decimal(10,2) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT NULL,
  `sku` varchar(50) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_images`
--

CREATE TABLE `tbl_product_images` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `alt_text` varchar(255) DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT 0,
  `order` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_tax`
--

CREATE TABLE `tbl_product_tax` (
  `product_tax_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `tax_rate` decimal(5,2) NOT NULL,
  `tax_description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reviews`
--

CREATE TABLE `tbl_reviews` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shipping`
--

CREATE TABLE `tbl_shipping` (
  `shipping_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `shipping_method` varchar(50) DEFAULT NULL,
  `tracking_number` varchar(100) DEFAULT NULL,
  `shipping_status` varchar(50) DEFAULT NULL,
  `estimated_delivery` date DEFAULT NULL,
  `shipped_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shopping_cart`
--

CREATE TABLE `tbl_shopping_cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL,
  `user_fname` varchar(100) NOT NULL,
  `user_lname` varchar(100) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_gender` enum('Male','Female','Other') DEFAULT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `user_alternate_phone` varchar(20) DEFAULT NULL,
  `is_whatsapp` tinyint(1) DEFAULT 0,
  `user_city` varchar(100) DEFAULT NULL,
  `user_active` tinyint(1) DEFAULT 1,
  `user_role` int(4) DEFAULT NULL,
  `user_image` varchar(255) DEFAULT NULL,
  `mobile_valid` tinyint(1) DEFAULT 0,
  `email_valid` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `user_fname`, `user_lname`, `user_email`, `user_password`, `user_gender`, `user_phone`, `user_alternate_phone`, `is_whatsapp`, `user_city`, `user_active`, `user_role`, `user_image`, `mobile_valid`, `email_valid`, `created_at`, `updated_at`) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 'password123', NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 0, 0, '2024-08-21 06:27:58', '2024-08-21 06:27:58'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 'securePass456', NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 0, 0, '2024-08-21 06:27:58', '2024-08-21 06:27:58'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', 'alicePass789', NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 0, 0, '2024-08-21 06:27:58', '2024-08-21 06:27:58'),
(4, 'Bob', 'Williams', 'bob.williams@example.com', 'bobPassword012', NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 0, 0, '2024-08-21 06:27:58', '2024-08-21 06:27:58'),
(5, 'Charlie', 'Brown', 'charlie.brown@example.com', 'charliePass345', NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 0, 0, '2024-08-21 06:27:58', '2024-08-21 06:27:58');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wishlist`
--

CREATE TABLE `tbl_wishlist` (
  `wishlist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wishlist_items`
--

CREATE TABLE `tbl_wishlist_items` (
  `wishlist_item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_cart_items`
--
ALTER TABLE `tbl_cart_items`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `tbl_customer_support_tickets`
--
ALTER TABLE `tbl_customer_support_tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_discounts`
--
ALTER TABLE `tbl_discounts`
  ADD PRIMARY KEY (`discount_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `tbl_inventory`
--
ALTER TABLE `tbl_inventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_order_items`
--
ALTER TABLE `tbl_order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_payments`
--
ALTER TABLE `tbl_payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `tbl_product_images`
--
ALTER TABLE `tbl_product_images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_product_tax`
--
ALTER TABLE `tbl_product_tax`
  ADD PRIMARY KEY (`product_tax_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_reviews`
--
ALTER TABLE `tbl_reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  ADD PRIMARY KEY (`shipping_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `tbl_shopping_cart`
--
ALTER TABLE `tbl_shopping_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- Indexes for table `tbl_wishlist`
--
ALTER TABLE `tbl_wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_wishlist_items`
--
ALTER TABLE `tbl_wishlist_items`
  ADD PRIMARY KEY (`wishlist_item_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cart_items`
--
ALTER TABLE `tbl_cart_items`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_customer_support_tickets`
--
ALTER TABLE `tbl_customer_support_tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_discounts`
--
ALTER TABLE `tbl_discounts`
  MODIFY `discount_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_inventory`
--
ALTER TABLE `tbl_inventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_order_items`
--
ALTER TABLE `tbl_order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_payments`
--
ALTER TABLE `tbl_payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_product_images`
--
ALTER TABLE `tbl_product_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_product_tax`
--
ALTER TABLE `tbl_product_tax`
  MODIFY `product_tax_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_reviews`
--
ALTER TABLE `tbl_reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  MODIFY `shipping_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_shopping_cart`
--
ALTER TABLE `tbl_shopping_cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_wishlist`
--
ALTER TABLE `tbl_wishlist`
  MODIFY `wishlist_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_wishlist_items`
--
ALTER TABLE `tbl_wishlist_items`
  MODIFY `wishlist_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD CONSTRAINT `tbl_admin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`);

--
-- Constraints for table `tbl_cart_items`
--
ALTER TABLE `tbl_cart_items`
  ADD CONSTRAINT `tbl_cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `tbl_shopping_cart` (`cart_id`),
  ADD CONSTRAINT `tbl_cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`product_id`);

--
-- Constraints for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  ADD CONSTRAINT `tbl_categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tbl_categories` (`category_id`);

--
-- Constraints for table `tbl_customer_support_tickets`
--
ALTER TABLE `tbl_customer_support_tickets`
  ADD CONSTRAINT `tbl_customer_support_tickets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`);

--
-- Constraints for table `tbl_inventory`
--
ALTER TABLE `tbl_inventory`
  ADD CONSTRAINT `tbl_inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`product_id`);

--
-- Constraints for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD CONSTRAINT `tbl_orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`);

--
-- Constraints for table `tbl_order_items`
--
ALTER TABLE `tbl_order_items`
  ADD CONSTRAINT `tbl_order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tbl_orders` (`order_id`),
  ADD CONSTRAINT `tbl_order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`product_id`);

--
-- Constraints for table `tbl_payments`
--
ALTER TABLE `tbl_payments`
  ADD CONSTRAINT `tbl_payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tbl_orders` (`order_id`);

--
-- Constraints for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD CONSTRAINT `tbl_products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `tbl_categories` (`category_id`);

--
-- Constraints for table `tbl_product_images`
--
ALTER TABLE `tbl_product_images`
  ADD CONSTRAINT `tbl_product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`product_id`);

--
-- Constraints for table `tbl_product_tax`
--
ALTER TABLE `tbl_product_tax`
  ADD CONSTRAINT `tbl_product_tax_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`product_id`);

--
-- Constraints for table `tbl_reviews`
--
ALTER TABLE `tbl_reviews`
  ADD CONSTRAINT `tbl_reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`product_id`),
  ADD CONSTRAINT `tbl_reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`);

--
-- Constraints for table `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  ADD CONSTRAINT `tbl_shipping_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tbl_orders` (`order_id`);

--
-- Constraints for table `tbl_shopping_cart`
--
ALTER TABLE `tbl_shopping_cart`
  ADD CONSTRAINT `tbl_shopping_cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`),
  ADD CONSTRAINT `tbl_shopping_cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`product_id`);

--
-- Constraints for table `tbl_wishlist`
--
ALTER TABLE `tbl_wishlist`
  ADD CONSTRAINT `tbl_wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`),
  ADD CONSTRAINT `tbl_wishlist_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`product_id`);

--
-- Constraints for table `tbl_wishlist_items`
--
ALTER TABLE `tbl_wishlist_items`
  ADD CONSTRAINT `tbl_wishlist_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`),
  ADD CONSTRAINT `tbl_wishlist_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
