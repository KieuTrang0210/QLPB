-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.11.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for company
CREATE DATABASE IF NOT EXISTS `company` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `company`;

-- Dumping structure for table company.departments
CREATE TABLE IF NOT EXISTS `departments` (
  `D_No` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `location` varchar(255) NOT NULL,
  `manager_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`D_No`),
  KEY `departments_manager_id_foreign` (`manager_id`),
  CONSTRAINT `departments_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table company.departments: ~11 rows (approximately)
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` (`D_No`, `name`, `location`, `manager_id`) VALUES
	(1, 'Gilbert Stehr', '1816 Harry Meadows\nNew Ronburgh, MI 59102', 10),
	(2, 'Prof. Kristofer Connelly PhD', '3387 McLaughlin Common\nDonaldton, CO 73420', 4),
	(3, 'Prof. Jaden Swaniawski Jr.', '44309 Alfredo Mill Apt. 985\nEast Eulalia, MD 53147', 6),
	(4, 'Parker Aufderhar', '46601 Jazmin Mall Suite 646\nNew Annabell, OH 79308-8645', 2),
	(5, 'Prof. Thelma Doyle MD', '280 Connelly Lake\nWest Estel, MS 82800-7515', 1),
	(6, 'Kristin Becker', '587 Jacobson Forks\nMonahanchester, HI 04385', 7),
	(7, 'Eula Doyle', '8273 Renner Overpass\nSouth Maryam, ME 93243', 8),
	(8, 'Kareem Hansen', '20106 Frederik Brooks\nLake Lavinabury, PA 61177-7380', 9),
	(9, 'Weston Collier', '12097 Schaden Via\nCrooksfurt, OR 36910-9592', 3),
	(10, 'Elmer Price', '349 Fritsch Trail Suite 505\nNobleburgh, AR 84143', 5),
	(12, 'Phòng kế toán', 'Ha Noi', 16);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;

-- Dumping structure for table company.dependents
CREATE TABLE IF NOT EXISTS `dependents` (
  `employee_id` int(10) unsigned NOT NULL,
  `dependent_name` varchar(255) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `relationship` varchar(20) NOT NULL,
  PRIMARY KEY (`employee_id`,`dependent_name`),
  CONSTRAINT `dependents_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table company.dependents: ~30 rows (approximately)
/*!40000 ALTER TABLE `dependents` DISABLE KEYS */;
INSERT INTO `dependents` (`employee_id`, `dependent_name`, `gender`, `relationship`) VALUES
	(1, 'Brittany Volkman', 'Female', 'Wife'),
	(1, 'Jayden Luettgen', 'Female', 'Dad'),
	(1, 'Keon Larkin', 'Male', 'Husband'),
	(1, 'Mr. Tevin Tromp III', 'Male', 'Dad'),
	(1, 'Thad Brown', 'Female', 'Dad'),
	(2, 'Paula Brown', 'Male', 'Mom'),
	(3, 'Immanuel VonRueden', 'Male', 'Dad'),
	(3, 'Renee Grady', 'Male', 'Wife'),
	(4, 'Margaretta Feeney', 'Male', 'Mom'),
	(4, 'Novella Muller DVM', 'Female', 'Wife'),
	(5, 'Coralie Herzog', 'Male', 'Dad'),
	(5, 'Valentine Leuschke', 'Female', 'Dad'),
	(8, 'Jammie Mayert', 'Female', 'Wife'),
	(8, 'Jaylen Swift V', 'Female', 'Mom'),
	(10, 'Mr. Caesar Ritchie', 'Female', 'Husband'),
	(11, 'Reed Champlin PhD', 'Female', 'Wife'),
	(12, 'Alexzander Littel Jr.', 'Male', 'Dad'),
	(12, 'Ms. Heidi Will', 'Male', 'Wife'),
	(12, 'Whitney Douglas II', 'Female', 'Wife'),
	(13, 'Prof. Stephania Ritchie PhD', 'Male', 'Mom'),
	(14, 'Dr. Thaddeus Lubowitz', 'Female', 'Dad'),
	(15, 'Dr. Nova Paucek', 'Male', 'Dad'),
	(15, 'Mr. Ryan Gerhold', 'Female', 'Wife'),
	(16, 'Dr. Bettye Herman PhD', 'Male', 'Husband'),
	(17, 'Omer Baumbach', 'Female', 'Dad'),
	(19, 'Prof. Augustus Hills', 'Male', 'Husband'),
	(19, 'Rosetta Morissette', 'Female', 'Mom'),
	(19, 'Tia Hackett', 'Male', 'Wife'),
	(20, 'Maximo Nienow DVM', 'Male', 'Wife'),
	(20, 'Roman Pfeffer', 'Male', 'Dad');
/*!40000 ALTER TABLE `dependents` ENABLE KEYS */;

-- Dumping structure for table company.employees
CREATE TABLE IF NOT EXISTS `employees` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `dob` date NOT NULL,
  `doj` date NOT NULL,
  `department_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `employees_department_id_foreign` (`department_id`),
  CONSTRAINT `employees_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`D_No`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table company.employees: ~20 rows (approximately)
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`Id`, `name`, `address`, `gender`, `dob`, `doj`, `department_id`) VALUES
	(1, 'Nona Muller', '6943 Clyde Spring\nNew Gersonville, DC 98581-8935', 'Male', '1976-05-01', '2022-07-04', 1),
	(2, 'Alexis Kuhlman DVM', '69519 Amely Run\nKarolanntown, MI 20700', 'Female', '2015-05-09', '2005-05-16', 2),
	(3, 'Grant Cole', '393 Runolfsdottir Extensions Suite 160\nEast Marcel, ME 82662', 'Male', '2021-05-21', '2019-05-25', 3),
	(4, 'Leatha Abernathy', '13377 David Harbor Suite 345\nCreminview, DE 50478-8087', 'Female', '1972-12-07', '2001-04-11', 4),
	(5, 'Prof. Javonte Bode DVM', '71899 Alvera Village Suite 043\nEdburgh, MD 80379-9975', 'Male', '1979-09-28', '2020-02-06', 5),
	(6, 'Prof. Elvera Waters DDS', '36609 Beer Club\nHermistontown, MI 50556', 'Male', '2023-04-15', '1991-10-28', 6),
	(7, 'Lela Kunde', '239 Berta Streets\nNorth Floyd, MN 62253', 'Male', '2019-08-07', '1996-04-11', 7),
	(8, 'Felicita Bartoletti', '514 Rodger Field Apt. 078\nWest Roger, SC 64850', 'Male', '1976-04-02', '2021-08-11', 8),
	(9, 'Garfield OKon DDS', '3661 Martin Crescent Suite 891\nEast Carlo, IL 85309-7479', 'Male', '2010-06-02', '2003-05-21', 9),
	(10, 'Jessika Little Jr.', '521 Nikko Plaza\nPort Kathlynstad, FL 05891-0527', 'Female', '2002-12-21', '2014-10-19', 10),
	(11, 'Meagan Lakin', '82286 Fritz Mountain\nSchusterfurt, SC 67225', 'Male', '2019-08-16', '2004-02-21', 1),
	(12, 'Wilber Orn', '822 Iva Cliffs Suite 623\nNorth Zola, CA 37056-3735', 'Female', '2016-07-09', '2015-01-01', 6),
	(13, 'Prof. Brain Lockman V', '4096 Murray Plaza Apt. 596\nStromanport, TX 96871', 'Male', '2008-05-11', '1976-04-13', 8),
	(14, 'Daphney Carter', '8616 Kerluke Springs Apt. 581\nAnsleyland, MS 18094', 'Female', '2013-06-14', '1979-05-19', 7),
	(15, 'Misael Leffler', '8985 Colton Glens Apt. 304\nNorth Berniece, NE 63073', 'Female', '2005-08-19', '1979-04-29', 10),
	(16, 'Aidan Grimes', '4519 Sonny Center\nEast Charity, NM 42957', 'Female', '2006-10-25', '2018-09-06', 10),
	(17, 'Miss Rhianna Morissette', '32105 Beier Orchard Apt. 593\nGutkowskitown, RI 54335-5028', 'Female', '1978-11-06', '2000-12-27', 10),
	(18, 'Arlie Stiedemann DVM', '9477 Bogisich Track Apt. 948\nDavisland, FL 74865', 'Male', '2021-09-11', '2017-05-01', 1),
	(19, 'Dorthy Boyle', '15289 Kovacek Lakes Suite 772\nWest Rubenland, DE 60676', 'Male', '1980-05-10', '1985-01-25', 8),
	(20, 'Clementine Hegmann', '2215 Block Loaf\nHagenesside, FL 57910', 'Female', '2004-05-24', '2000-01-29', 5);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;

-- Dumping structure for table company.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table company.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table company.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table company.migrations: ~18 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2023_09_06_135513_create_departments_table', 1),
	(10, '2023_09_06_135721_create_employees_table', 2),
	(11, '2023_09_06_135807_create_projects_table', 2),
	(12, '2023_09_06_135855_create_dependents_table', 3),
	(14, '2023_09_06_142029_create_departments_table', 4),
	(15, '2023_09_06_142130_create_projects_table', 4),
	(18, '2023_09_06_143531_create_employees_table', 5),
	(19, '2023_09_06_143659_create_work_ons_table', 6),
	(20, '2023_09_06_143902_create_dependents_table', 7),
	(21, '2023_09_06_144644_add_foreign_key_to_department', 8),
	(22, '2023_09_06_145559_create_employees_table', 9),
	(23, '2023_09_06_145802_create_work_ons_table', 10),
	(24, '2023_09_06_145820_create_dependents_table', 11),
	(25, '2023_09_06_150227_add_foreign_key_to_employee', 12);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table company.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table company.password_reset_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;

-- Dumping structure for table company.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table company.personal_access_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Dumping structure for table company.projects
CREATE TABLE IF NOT EXISTS `projects` (
  `P_No` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `department_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`P_No`),
  KEY `projects_department_id_foreign` (`department_id`),
  CONSTRAINT `projects_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`D_No`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table company.projects: ~60 rows (approximately)
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` (`P_No`, `name`, `department_id`) VALUES
	(1, 'Voluptas sed eos et.', 4),
	(2, 'Velit voluptates nostrum labore omnis.', 8),
	(3, 'Et provident illo officiis omnis.', 4),
	(4, 'Qui ad alias.', 8),
	(5, 'Error quia non.', 9),
	(6, 'Distinctio cupiditate aut.', 2),
	(7, 'Iure soluta sapiente et.', 4),
	(8, 'Reiciendis tenetur rerum ab et.', 8),
	(9, 'Delectus sunt soluta aut.', 9),
	(10, 'Eligendi reiciendis temporibus adipisci.', 6),
	(11, 'Commodi occaecati quis iste.', 6),
	(12, 'Non quas eos et.', 7),
	(13, 'Voluptas tenetur et.', 9),
	(14, 'Dolorem aut assumenda.', 1),
	(15, 'Doloremque ut eum non.', 6),
	(16, 'Aspernatur blanditiis velit ea.', 10),
	(17, 'Est voluptatibus aut minus.', 10),
	(18, 'Laboriosam minus accusamus odio.', 2),
	(19, 'Sed debitis autem totam.', 9),
	(20, 'Exercitationem aut illo autem.', 5),
	(21, 'Hic laboriosam vel.', 1),
	(22, 'Nam magnam.', 10),
	(23, 'Repellat id consectetur ut.', 5),
	(24, 'Pariatur id consequatur repellat minima.', 10),
	(25, 'Quis ut est.', 6),
	(26, 'Et consequatur.', 10),
	(27, 'Voluptas qui magnam labore.', 8),
	(28, 'Ad suscipit aut.', 4),
	(29, 'Quo ipsam illo et sit.', 4),
	(30, 'Veritatis doloremque harum suscipit.', 6),
	(31, 'Tempore cupiditate.', 6),
	(32, 'Voluptatem eum quae.', 4),
	(33, 'Et ratione vero.', 2),
	(34, 'Nisi qui quia iste.', 5),
	(35, 'Quibusdam aut ipsa voluptates numquam.', 10),
	(36, 'Quia vero minus.', 5),
	(37, 'Vitae rerum quis.', 9),
	(38, 'Aspernatur optio consequatur.', 4),
	(39, 'Accusantium nihil et.', 1),
	(40, 'Ipsa distinctio saepe.', 10),
	(41, 'Qui eius.', 10),
	(42, 'Sit non odio.', 5),
	(43, 'Illo aperiam id.', 1),
	(44, 'Aut eaque doloribus.', 4),
	(45, 'Quia sint in.', 1),
	(46, 'Culpa aut dolorem tempora.', 5),
	(47, 'Ratione rerum ut.', 4),
	(48, 'Magni cupiditate tempore.', 4),
	(49, 'Earum dolore et nesciunt.', 9),
	(50, 'Quibusdam officia inventore.', 9),
	(51, 'Debitis omnis quibusdam.', 7),
	(52, 'Laboriosam aliquid quisquam.', 4),
	(53, 'Ex vel.', 9),
	(54, 'Tenetur illum fugit voluptatem.', 7),
	(55, 'Velit quis praesentium est error.', 3),
	(56, 'Beatae adipisci minus et.', 10),
	(57, 'Quia consequatur beatae.', 3),
	(58, 'Repudiandae odit.', 10),
	(59, 'Nostrum consequatur consectetur.', 5),
	(60, 'Expedita quos natus qui.', 6);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;

-- Dumping structure for table company.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table company.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table company.work_ons
CREATE TABLE IF NOT EXISTS `work_ons` (
  `employee_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `hour` int(11) NOT NULL,
  PRIMARY KEY (`employee_id`,`project_id`),
  KEY `work_ons_project_id_foreign` (`project_id`),
  CONSTRAINT `work_ons_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `work_ons_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`P_No`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table company.work_ons: ~50 rows (approximately)
/*!40000 ALTER TABLE `work_ons` DISABLE KEYS */;
INSERT INTO `work_ons` (`employee_id`, `project_id`, `hour`) VALUES
	(1, 9, 29),
	(2, 9, 47),
	(2, 22, 1),
	(2, 23, 33),
	(3, 23, 7),
	(5, 3, 47),
	(5, 13, 28),
	(6, 14, 45),
	(6, 20, 31),
	(6, 27, 6),
	(7, 5, 40),
	(8, 2, 16),
	(8, 3, 32),
	(9, 9, 35),
	(9, 11, 1),
	(9, 14, 18),
	(9, 15, 5),
	(10, 4, 24),
	(10, 13, 5),
	(10, 14, 43),
	(10, 19, 5),
	(11, 5, 44),
	(11, 6, 39),
	(11, 18, 3),
	(13, 2, 35),
	(13, 3, 46),
	(13, 6, 28),
	(13, 10, 3),
	(13, 20, 2),
	(13, 21, 41),
	(13, 24, 22),
	(13, 27, 20),
	(13, 29, 9),
	(14, 14, 47),
	(14, 21, 6),
	(14, 27, 26),
	(15, 13, 12),
	(15, 16, 19),
	(15, 28, 37),
	(16, 14, 45),
	(17, 15, 34),
	(17, 16, 26),
	(18, 5, 41),
	(19, 8, 7),
	(19, 9, 33),
	(19, 28, 17),
	(20, 9, 6),
	(20, 23, 46),
	(20, 24, 18),
	(20, 29, 38);
/*!40000 ALTER TABLE `work_ons` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
