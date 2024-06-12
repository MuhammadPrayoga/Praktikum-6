SHOW DATABASES;

USE Praktikum6;

SHOW TABLES;

DROP table departemen;

CREATE TABLE Perusahaan(
id_p VARCHAR(10) PRIMARY KEY NOT NULL,
nama VARCHAR(45),
alamat VARCHAR(45)
);

INSERT INTO Perusahaan VALUES
('P01', 'Kantor Pusat', NULL),
('P02', 'Cabang Bekasi', NULL);

SELECT * FROM Perusahaan;

DESC Perusahaan;


CREATE TABLE Departemen (
id_dept VARCHAR(10) PRIMARY KEY NOT NULL,
nama VARCHAR(45),
id_p VARCHAR(10),
manajer_nik VARCHAR(10),
FOREIGN KEY (id_p) REFERENCES perusahaan(id_p)
);

INSERT INTO Departemen VALUES
('D01', 'Produksi', 'P02', 'N01'),
('D02', 'Marketing', 'P01', 'N03'),
('D03', 'RnD', 'P02', NULL),
('D04', 'Logistik', 'P02', NULL);

SELECT * FROM Departemen;

DESC departemen;

CREATE TABLE karyawan (
nik VARCHAR(10) PRIMARY KEY NOT NULL,
nama VARCHAR(45),
id_dept VARCHAR(10),
sup_nik VARCHAR(10),
FOREIGN KEY (id_dept) REFERENCES departemen(id_dept)
);

INSERT INTO Karyawan VALUES 
('N01', 'Ari', 'D01', NULL),
('N02', 'Dina', 'D01', NULL),
('N03', 'Rika', 'D03', NULL),
('N04', 'Ratih', 'D01', 'N01'),
('N05', 'Riko', 'D01', 'N01'),
('N06', 'Dani', 'D02', NULL),
('N07', 'Anis', 'D02', 'N06'),
('N08', 'Dika', 'D02', 'N06');

SELECT * FROM Karyawan;

DESC karyawan;

CREATE TABLE project_detail (
id_proj VARCHAR(10) PRIMARY KEY NOT NULL,
nik VARCHAR(10),
FOREIGN KEY (nik) REFERENCES karyawan(nik)
); 

INSERT INTO Project_detail VALUES
('PJ01', 'N01'),
('PJ01', 'N02'),
('PJ01', 'N03'),
('PJ01', 'N04'),
('PJ01', 'N05'),
('PJ01', 'N06'),
('PJ01', 'N07'),
('PJ01', 'N08'),
('PJ02', 'N01'),
('PJ02', 'N03'),
('PJ02', 'N05'),
('PJ03', 'N03'),
('PJ03', 'N07'),
('PJ03', 'N08');

SELECT * FROM Project_detail;

DESC project_detail; 

CREATE TABLE project (
id_proj VARCHAR(10) PRIMARY KEY NOT NULL,
nama VARCHAR(45),
tgl_mulai DATETIME,
tgl_selesai DATETIME,
status TINYINT(1),
FOREIGN KEY (id_proj) REFERENCES project_detail(id_proj)
);

INSERT INTO Project VALUES
('PJ01', 'A', '2019-01-10', '2019-03-10', '1'),
('PJ02', 'B', '2019-02-15', '2019-04-10', '1'),
('PJ03', 'C', '2019-03-21', '2019-05-10', '1');

SELECT * FROM Project;

DESC project;