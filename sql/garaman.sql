-- CSDL garaman: các bảng theo sơ đồ thiết kế CSDL trong báo cáo (Hình 12)
DROP DATABASE IF EXISTS garaman;
CREATE DATABASE garaman CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE garaman;

CREATE TABLE tblMember7 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(50) NOT NULL,
  fullname VARCHAR(100),
  dateofBirth DATE,
  address VARCHAR(255),
  email VARCHAR(100),
  tel VARCHAR(15),
  role VARCHAR(20) NOT NULL
);

CREATE TABLE tblStaff7 (
  tblMemberid INT PRIMARY KEY,
  position VARCHAR(50),
  FOREIGN KEY (tblMemberid) REFERENCES tblMember7(id)
);

CREATE TABLE tblCustomer7 (
  tblMemberid INT PRIMARY KEY,
  customercode VARCHAR(20),
  FOREIGN KEY (tblMemberid) REFERENCES tblMember7(id)
);

CREATE TABLE tblCar7 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  plateNumber VARCHAR(15),
  brand VARCHAR(50),
  model VARCHAR(50),
  description VARCHAR(255),
  tblCustomerid INT,
  FOREIGN KEY (tblCustomerid) REFERENCES tblCustomer7(tblMemberid)
);

CREATE TABLE tblAppointment7 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  datetime DATETIME,
  note VARCHAR(255),
  status VARCHAR(20),
  tblCustomerid INT,
  FOREIGN KEY (tblCustomerid) REFERENCES tblCustomer7(tblMemberid)
);

CREATE TABLE tblService7 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  price FLOAT,
  duration INT,
  description VARCHAR(255)
);

CREATE TABLE tblSparePart7 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  manufacturer VARCHAR(50),
  price FLOAT,
  description VARCHAR(255)
);

CREATE TABLE tblSupplier7 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  address VARCHAR(255),
  tel VARCHAR(15),
  email VARCHAR(100),
  description VARCHAR(255)
);

CREATE TABLE tblBill7 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  createdDate DATETIME,
  status VARCHAR(20),
  tblCustomerid INT,
  tblCarid INT,
  tblStaffid INT,
  FOREIGN KEY (tblCustomerid) REFERENCES tblCustomer7(tblMemberid),
  FOREIGN KEY (tblCarid) REFERENCES tblCar7(id),
  FOREIGN KEY (tblStaffid) REFERENCES tblStaff7(tblMemberid)
);

CREATE TABLE tblUsedService7 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  quantity INT,
  price FLOAT,
  tblBillid INT,
  tblStaffid INT,
  tblService7id INT,
  FOREIGN KEY (tblBillid) REFERENCES tblBill7(id),
  FOREIGN KEY (tblStaffid) REFERENCES tblStaff7(tblMemberid),
  FOREIGN KEY (tblService7id) REFERENCES tblService7(id)
);

CREATE TABLE tblUsedPart7 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  quantity INT,
  price FLOAT,
  tblBillid INT,
  tblSparePart7id INT,
  FOREIGN KEY (tblBillid) REFERENCES tblBill7(id),
  FOREIGN KEY (tblSparePart7id) REFERENCES tblSparePart7(id)
);

CREATE TABLE tblImportBill7 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  importDate DATETIME,
  note VARCHAR(255),
  tblSupplierid INT,
  tblStaffid INT,
  FOREIGN KEY (tblSupplierid) REFERENCES tblSupplier7(id),
  FOREIGN KEY (tblStaffid) REFERENCES tblStaff7(tblMemberid)
);

CREATE TABLE tblImportedPart7 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  quantity INT,
  price FLOAT,
  tblImportedBillid INT,
  tblSparePartid INT,
  FOREIGN KEY (tblImportedBillid) REFERENCES tblImportBill7(id),
  FOREIGN KEY (tblSparePartid) REFERENCES tblSparePart7(id)
);

-- ---------------------------------------------------------------- dữ liệu mẫu
INSERT INTO tblMember7 (username, password, fullname, dateofBirth, address, email, tel, role) VALUES
 ('an',    '123', 'Nguyễn Văn An',  '1995-03-12', 'Hà Đông, Hà Nội',  'an@gmail.com',    '0912000001', 'customer'),
 ('binh',  '123', 'Trần Văn Bình',  '1990-07-20', 'Thanh Xuân, Hà Nội', 'binh@garaman.vn', '0912000002', 'storekeeper'),
 ('cuong', '123', 'Lê Mạnh Cường',  '1985-11-02', 'Cầu Giấy, Hà Nội', 'cuong@garaman.vn','0912000003', 'manager'),
 ('dung',  '123', 'Phạm Thị Dung',  '1998-01-25', 'Đống Đa, Hà Nội',   'dung@garaman.vn', '0912000004', 'salestaff');
INSERT INTO tblCustomer7 VALUES (1, 'KH001');
INSERT INTO tblStaff7 VALUES (2, 'Nhân viên kho'), (3, 'Nhân viên quản lí'), (4, 'Nhân viên bán hàng');

INSERT INTO tblService7 (name, price, duration, description) VALUES
 ('Thay dầu động cơ', 150000, 30, 'Xả dầu cũ, thay dầu mới, kiểm tra rò rỉ'),
 ('Thay dầu hộp số', 250000, 45, 'Áp dụng cho hộp số tự động'),
 ('Bảo dưỡng định kỳ 10.000 km', 800000, 120, 'Kiểm tra tổng quát, thay dầu, vệ sinh lọc gió'),
 ('Cân chỉnh thước lái', 300000, 60, 'Cân chỉnh góc đặt bánh xe');

INSERT INTO tblSparePart7 (name, manufacturer, price, description) VALUES
 ('Dầu nhớt Castrol 5W-30 (4L)', 'Castrol', 650000, 'Dầu tổng hợp cho xe du lịch'),
 ('Lọc dầu Toyota Vios', 'Toyota', 120000, 'Lọc dầu chính hãng cho Vios 2014-2022'),
 ('Lọc gió động cơ Vios', 'Toyota', 120000, 'Lọc gió động cơ chính hãng'),
 ('Lọc gió điều hòa Vios', 'Toyota', 150000, 'Lọc gió điều hòa than hoạt tính');

INSERT INTO tblSupplier7 (name, address, tel, email, description) VALUES
 ('Cty PT ô tô Phú Thành', '12 Giải Phóng, Hà Nội', '0243862100', 'phuthanh@gmail.com', 'Phụ tùng Toyota, Honda'),
 ('Phú Gia Auto', '35 Láng Hạ, Hà Nội', '0912345000', 'phugia@gmail.com', 'Dầu nhớt, lọc các loại'),
 ('Hoàng Long Parts', '8 Nguyễn Trãi, Hà Nội', '0988111000', 'hoanglong@gmail.com', 'Phụ tùng gầm, phanh');
