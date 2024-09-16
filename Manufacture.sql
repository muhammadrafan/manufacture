	-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2023 at 12:59 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
-- mengirimPRIMARYPRIMARY

CREATE database MANUFACTURE;

use MANUFACTURE;

-- --------------------------------------------------------

--
-- Table structure for table `checker`
--

CREATE TABLE `checker` (
  `id_checker` int(11) NOT NULL,
  `id_karyawan_checker` int(11) NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gudang_mentah`
--

CREATE TABLE `gudang_mentah` (
  `id_gudang_mentah` int(11) NOT NULL,
  `id_checker` int(11) NOT NULL,
  `jenis_barang` varchar(30) NOT NULL,
  `masuk_keluar` varchar(6) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gudang_produksi`
--

CREATE TABLE `gudang_produksi` (
  `id_gudang_produksi` int(11) NOT NULL,
  `id_produksi` int(11) NOT NULL,
  `jenis_barang` varchar(30) NOT NULL,
  `masuk_keluar` varchar(6) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` int(11) NOT NULL,
  `nama_karyawan` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(1) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `nomor_telepon` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `karyawan_checker`
--

CREATE TABLE `karyawan_checker` (
  `id_karyawan_checker` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `jabatan` varchar(30) NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `karyawan_produksi`
--

CREATE TABLE `karyawan_produksi` (
  `id_karyawan_produksi` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `jabatan` varchar(30) NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menerima`
--

CREATE TABLE `menerima` (
  `id_checker` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mengirim`
--

CREATE TABLE `mengirim` (
  `id_gudang_produksi` int(11) NOT NULL,
  `id_pesanan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `tanggal_pesan` date NOT NULL,
  `jenis_produk` varchar(30) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produksi`
--

CREATE TABLE `produksi` (
  `id_produksi` int(11) NOT NULL,
  `jenis_produk` varchar(30) DEFAULT NULL,
  `id_gudang_mentah` int(11) NOT NULL,
  `id_karyawan_produksi` int(11) NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `jenis_barang` varchar(30) NOT NULL,
  `tanggal_kirim` date NOT NULL,
  `tanggal_sampai` date NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `checker`
--
ALTER TABLE `checker`
  ADD PRIMARY KEY (`id_checker`),
  ADD KEY `id_karyawan_checker` (`id_karyawan_checker`);

--
-- Indexes for table `gudang_mentah`
--
ALTER TABLE `gudang_mentah`
  ADD PRIMARY KEY (`id_gudang_mentah`),
  ADD KEY `id_checker` (`id_checker`);

--
-- Indexes for table `gudang_produksi`
--
ALTER TABLE `gudang_produksi`
  ADD PRIMARY KEY (`id_gudang_produksi`),
  ADD KEY `id_produksi` (`id_produksi`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indexes for table `karyawan_checker`
--
ALTER TABLE `karyawan_checker`
  ADD PRIMARY KEY (`id_karyawan_checker`),
  ADD KEY `id_karyawan` (`id_karyawan`);

--
-- Indexes for table `karyawan_produksi`
--
ALTER TABLE `karyawan_produksi`
  ADD PRIMARY KEY (`id_karyawan_produksi`),
  ADD KEY `id_karyawan` (`id_karyawan`);

--
-- Indexes for table `menerima`
--
ALTER TABLE `menerima`
  ADD PRIMARY KEY (`id_checker`,`id_supplier`),
  ADD KEY `id_supplier` (`id_supplier`),
  ADD KEY `id_checker` (`id_checker`);

--
-- Indexes for table `mengirim`
--
ALTER TABLE `mengirim`
  ADD PRIMARY KEY (`id_gudang_produksi`,`id_pesanan`),
  ADD KEY `id_pesanan` (`id_pesanan`),
  ADD KEY `id_gudang_produksi` (`id_gudang_produksi`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`);

--
-- Indexes for table `produksi`
--
ALTER TABLE `produksi`
  ADD PRIMARY KEY (`id_produksi`),
  ADD KEY `id_gudang_mentah` (`id_gudang_mentah`),
  ADD KEY `id_karyawan_produksi` (`id_karyawan_produksi`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `checker`
--
ALTER TABLE `checker`
  MODIFY `id_checker` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gudang_mentah`
--
ALTER TABLE `gudang_mentah`
  MODIFY `id_gudang_mentah` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gudang_produksi`
--
ALTER TABLE `gudang_produksi`
  MODIFY `id_gudang_produksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id_karyawan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `karyawan_checker`
--
ALTER TABLE `karyawan_checker`
  MODIFY `id_karyawan_checker` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `karyawan_produksi`
--
ALTER TABLE `karyawan_produksi`
  MODIFY `id_karyawan_produksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produksi`
--
ALTER TABLE `produksi`
  MODIFY `id_produksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `checker`
--
ALTER TABLE `checker`
  ADD CONSTRAINT `checker_ibfk_1` FOREIGN KEY (`id_karyawan_checker`) REFERENCES `karyawan_checker` (`id_karyawan_checker`);

--
-- Constraints for table `gudang_mentah`
--
ALTER TABLE `gudang_mentah`
  ADD CONSTRAINT `gudang_mentah_ibfk_1` FOREIGN KEY (`id_checker`) REFERENCES `checker` (`id_checker`);

--
-- Constraints for table `gudang_produksi`
--
ALTER TABLE `gudang_produksi`
  ADD CONSTRAINT `gudang_produksi_ibfk_1` FOREIGN KEY (`id_produksi`) REFERENCES `produksi` (`id_produksi`);

--
-- Constraints for table `karyawan_checker`
--
ALTER TABLE `karyawan_checker`
  ADD CONSTRAINT `karyawan_checker_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`);

--
-- Constraints for table `karyawan_produksi`
--
ALTER TABLE `karyawan_produksi`
  ADD CONSTRAINT `karyawan_produksi_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`);

--
-- Constraints for table `menerima`
--
ALTER TABLE `menerima`
  ADD CONSTRAINT `menerima_ibfk_1` FOREIGN KEY (`id_checker`) REFERENCES `checker` (`id_checker`),
  ADD CONSTRAINT `menerima_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`);

--
-- Constraints for table `mengirim`
--
ALTER TABLE `mengirim`
  ADD CONSTRAINT `mengirim_ibfk_1` FOREIGN KEY (`id_gudang_produksi`) REFERENCES `gudang_produksi` (`id_gudang_produksi`),
  ADD CONSTRAINT `mengirim_ibfk_2` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`);

--
-- Constraints for table `produksi`
--
ALTER TABLE `produksi`
  ADD CONSTRAINT `produksi_ibfk_1` FOREIGN KEY (`id_gudang_mentah`) REFERENCES `gudang_mentah` (`id_gudang_mentah`),
  ADD CONSTRAINT `produksi_ibfk_2` FOREIGN KEY (`id_karyawan_produksi`) REFERENCES `karyawan_produksi` (`id_karyawan_produksi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- Memasukan Data supplier

INSERT INTO supplier (id_supplier, jenis_barang, tanggal_kirim, tanggal_sampai, quantity) 
VALUES (1,'Timah','2022-05-04','2022-05-06',11000);

INSERT INTO supplier (id_supplier, jenis_barang, tanggal_kirim, tanggal_sampai, quantity) 
VALUES (2,'Nikel','2022-06-02','2022-06-06',10000);


INSERT INTO supplier (id_supplier, jenis_barang, tanggal_kirim, tanggal_sampai, quantity) 
VALUES (3,'Alumunium','2022-06-07','2022-06-12',11000);

INSERT INTO supplier (id_supplier, jenis_barang, tanggal_kirim, tanggal_sampai, quantity) 
VALUES (4,'Tembaga','2022-06-07','2022-06-11',9000);

INSERT INTO supplier (id_supplier, jenis_barang, tanggal_kirim, tanggal_sampai, quantity) 
VALUES (5,'IC','2022-06-28','2022-06-30',11500);

INSERT INTO supplier (id_supplier, jenis_barang, tanggal_kirim, tanggal_sampai, quantity) 
VALUES (6,'Baja','2022-07-02','2022-07-06',11000);

INSERT INTO supplier (id_supplier, jenis_barang, tanggal_kirim, tanggal_sampai, quantity) 
VALUES (7,'Resistir','2022-07-02','2022-07-07',10500);

INSERT INTO supplier (id_supplier, jenis_barang, tanggal_kirim, tanggal_sampai, quantity) 
VALUES (8,'Kapasitor','2022-07-05','2022-07-10',9500);

INSERT INTO supplier (id_supplier, jenis_barang, tanggal_kirim, tanggal_sampai, quantity) 
VALUES (9,'Transistor','2022-07-08','2022-07-12',12000);

INSERT INTO supplier (id_supplier, jenis_barang, tanggal_kirim, tanggal_sampai, quantity) 
VALUES (10,'Induktor','2022-07-10','2022-07-16',15000);

-- Memasukan data Karyawan

INSERT INTO karyawan (id_karyawan, nama_karyawan, jenis_kelamin, alamat, nomor_telepon)
VALUES
    (1, 'John Doe', 'L', 'Jl. ABC No. 123', '081234567890'),
    (2, 'Jane Smith', 'P', 'Jl. XYZ No. 456', '081345678901'),
    (3, 'David Johnson', 'L', 'Jl. PQR No. 789', '081456789012'),
    (4, 'Sarah Williams', 'P', 'Jl. MNO No. 012', '081567890123'),
    (5, 'Michael Brown', 'L', 'Jl. DEF No. 345', '081678901234'),
    (6, 'Emily Davis', 'P', 'Jl. UVW No. 678', '081789012345'),
    (7, 'Matthew Wilson', 'L', 'Jl. GHI No. 901', '081890123456'),
    (8, 'Olivia Taylor', 'P', 'Jl. STU No. 234', '081901234567'),
    (9, 'James Anderson', 'L', 'Jl. JKL No. 567', '081012345678'),
    (10, 'Sophia Martinez', 'P', 'Jl. EFG No. 890', '081123456789'),
    (11, 'William Thompson', 'L', 'Jl. HIJ No. 123', '081234567890'),
    (12, 'Isabella Garcia', 'P', 'Jl. NOP No. 456', '081345678901'),
    (13, 'Benjamin Davis', 'L', 'Jl. QRS No. 789', '081456789012'),
    (14, 'Mia Johnson', 'P', 'Jl. TUV No. 012', '081567890123'),
    (15, 'Ethan Martinez', 'L', 'Jl. WXY No. 345', '081678901234'),
    (16, 'Ava Wilson', 'P', 'Jl. ZAB No. 678', '081789012345'),
    (17, 'Jacob Smith', 'L', 'Jl. CDE No. 901', '081890123456'),
    (18, 'Emma Davis', 'P', 'Jl. GHI No. 234', '081901234567'),
    (19, 'Noah Anderson', 'L', 'Jl. KLM No. 567', '081012345678'),
    (20, 'Oliver Brown', 'L', 'Jl. UVW No. 890', '081123456789');
    
-- memasukan data karyawan_checkeer

INSERT INTO karyawan_checker (id_karyawan_checker, id_karyawan, jabatan, keterangan)
VALUES
    (1, 2, 'junior', '1 supplier'),
    (2, 4, 'senior', '2 supplier'),
    (3, 6, 'junior', '1 supplier'),
    (4, 8, 'senior', '2 supplier'),
    (5, 10, 'junior', '1 supplier'),
    (6, 12, 'senior', '2 supplier'),
    (7, 14, 'junior', '1 supplier'),
    (8, 16, 'senior', '2 supplier'),
    (9, 18, 'junior', '1 supplier'),
    (10, 20, 'senior', '2 supplier');
    
    -- Memasukan data karyawan produksi
    
INSERT INTO karyawan_produksi (id_karyawan_produksi, id_karyawan, jabatan, keterangan)
VALUES
    (1, 1, 'junior', '1 hari'),
    (2, 3, 'senior', '2 hari'),
    (3, 5, 'junior', '1 hari'),
    (4, 7, 'senior', '2 hari'),
    (5, 9, 'junior', '1 hari'),
    (6, 11, 'senior', '2 hari'),
    (7, 13, 'junior', '1 hari'),
    (8, 15, 'senior', '2 hari'),
    (9, 17, 'junior', '1 hari'),
    (10, 19, 'senior', '2 hari');

-- Menginput tabel checker
INSERT INTO manufacture.checker (id_checker, id_karyawan_checker, keterangan)
VALUES
	(1, 1, '450 barang rusak'),
    (2, 2, '300 barang rusak'),
    (3, 2, '300 barang rusak'),
    (4, 5, '450 barang rusak'),
    (5, 8, '300 barang rusak'),
    (6, 8, '450 barang rusak'),
    (7, 9, '300 barang rusak'),
    (8, 4, '450 barang rusak'),
    (9, 4, '450 barang rusak'),
    (10, 7, '450 barang rusak');

-- menginput tabel menerima
INSERT INTO manufacture.menerima (id_supplier, id_checker)
VALUES
	(1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);
    
-- menginput tabel gudang_mentah
INSERT INTO gudang_mentah (id_gudang_mentah, id_checker, jenis_barang, masuk_keluar, quantity)
VALUES
(1,1,'Timah','in',10650),
(2,2,'Nikel','in',9700),
(3,4,'Tembaga','in',8650),
(4,3,'Alumunium','in',10700),
(5,5,'IC','in',11200),
(6,6,'Baja','in',10650),
(7,7,'Resistor','in',10200),
(8,8,'Kapasitor','in',9050),
(9,9,'Transistor','in',11650),
(10,10,'Induktor','in',14650);

INSERT INTO gudang_mentah (id_gudang_mentah, id_checker, jenis_barang, masuk_keluar, quantity)
VALUES
(11,1,'Timah','out',500),
(12,2,'Nikel','out',700),
(13,4,'Tembaga','out',650),
(14,3,'Alumunium','out',700),
(15,5,'IC','out',200),
(16,6,'Baja','out',650),
(17,7,'Resistor','out',200),
(18,8,'Kapasitor','out',150),
(19,9,'Transistor','out',650),
(20,10,'Induktor','out',650);

-- menginput tabel produksi

INSERT INTO produksi (id_produksi,jenis_produk,id_gudang_mentah, id_karyawan_produksi, tanggal_mulai,tanggal_selesai)
VALUES
(1,'Kawat solder',11,1,'2023-01-15','2023-01-22'),
(2,'Baterai',12,2,'2023-01-17','2023-01-27'),
(3,'Kawat tembaga',13,2,'2023-01-20','2023-01-29'),
(4,'Alumunium Foil',14,5,'2023-02-11','2023-02-15'),
(5,'Arduino',15,4,'2023-02-15','2023-02-22'),
(6,'Paku baja',16,4,'2023-02-20','2023-01-28'),
(7,'Keyboard',17,3,'2023-02-22','2023-01-28'),
(8,'Tv',18,6,'2023-03-03','2023-03-10'),
(9,'CPU',19,6,'2023-03-05','2023-03-11'),
(10,'Kulkas',20,9,'2023-03-15','2023-03-22');

-- Menginput tabel gudang_produksi

INSERT INTO gudang_produksi (id_gudang_produksi,id_produksi,jenis_barang,masuk_keluar,quantity)
VALUES
(1,1,'Kawat solder','in',150),
(2,2,'Baterai','in',300),
(3,3,'Kawat tembaga','in',200),
(4,4,'Alumunium Foil','in',170),
(5,5,'Arduino','in',350),
(6,6,'Paku baja','in',250),
(7,7,'Keyboard','in',285),
(8,8,'Tv','in',35),
(9,9,'CPU','in',40),
(10,10,'Kulkas','in', 25);

INSERT INTO gudang_produksi (id_gudang_produksi,id_produksi,jenis_barang,masuk_keluar,quantity)
VALUES
(11,1,'Kawat solder','out',100),
(12,2,'Baterai','out',200),
(13,3,'Kawat tembaga','out',150),
(14,4,'Alumunium Foil','out',90),
(15,5,'Arduino','out',210),
(16,6,'Paku baja','out',110),
(17,7,'Keyboard','out',213),
(18,8,'Tv','out',20),
(19,9,'CPU','out',34),
(20,10,'Kulkas','out', 15);

-- menginput tabel pesanan

INSERT INTO pesanan (id_pesanan,tanggal_pesan,jenis_produk,quantity)
VALUES
(1,'2023-04-05','Kawat solder',100),
(2,'2023-04-07','Baterai',200),
(3,'2023-04-12','Kawat tembaga',150),
(4,'2023-04-15','Alumunium Foil',90),
(5,'2023-04-18','Arduino',210),
(6,'2023-04-23','Paku baja',110),
(7,'2023-04-24','Keyboard',213),
(8,'2023-04-26','Tv',20),
(9,'2023-04-29','CPU',34),
(10,'2023-04-30','Kulkas', 15);

-- menginputkan tabel mengirim

INSERT INTO mengirim (id_gudang_produksi,id_pesanan)
VALUES
(11,1),
(12,2),
(13,3),
(14,4),
(15,5),
(16,6),
(17,7),
(18,8),
(19,9),
(20,10);
SELECT * FROM mengirim;
