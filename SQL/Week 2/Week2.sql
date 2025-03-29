CREATE DATABASE QLGV;
GO

USE QLGV;
GO

CREATE TABLE giaovien(
	magv varchar(10),
	hoten nvarchar(50),
	luong int,
	phai nvarchar(3),
	ngsinh date,
	diachi nvarchar(100),
	gvqlcm varchar(10),
	mabm nvarchar(10),
	primary key(magv)
);

create table nguoithan(
	magv varchar(10),
	ten nvarchar(50),
	ngsinh date,
	phai nvarchar(3),
	primary key(magv, ten)
);

create table gv_dt(
	magv varchar(10),
	dienthoai varchar(15),
	primary key(magv, dienthoai)
);

create table bomon(
	mabm nvarchar(10),
	tenbm nvarchar(50),
	phong varchar(5),
	dienthoai varchar(15),
	truongbm varchar(10),
	makhoa nvarchar(10),
	ngaynhanchuc date,
	primary key(mabm)
);

create table khoa(
	makhoa nvarchar(10),
	tenkhoa nvarchar(50),
	namtl int,
	phong varchar(5),
	dienthoai varchar(15),
	truongkhoa varchar(10),
	ngaynhanchuc date,
	primary key(makhoa)
);

create table thamgiadt(
	magv varchar(10),
	madt nvarchar(10),
	stt int,
	phucap float,
	ketqua nvarchar(10),
	primary key(magv, madt, stt)
);

create table congviec(
	madt nvarchar(10),
	sott int,
	tencv nvarchar(50),
	ngaybd date,
	ngaykt date,
	primary key(madt, sott)
);

create table detai(
	madt nvarchar(10),
	tendt nvarchar(50),
	capql nvarchar(10),
	kinhphi float,
	ngaybd date,
	ngaykt date,
	macd nvarchar(10),
	gvcndt varchar(10),
	primary key(madt)
);

create table chude(
	macd nvarchar(10),
	tencd nvarchar(50),
	primary key(macd)
);

alter table giaovien add constraint fk_gvqlcm_magv
foreign key (gvqlcm) references giaovien(magv)

alter table gv_dt add constraint fk_gvdt_giaovien
foreign key (magv) references giaovien(magv)

alter table nguoithan add constraint fk_nguoithan_giaovien
foreign key (magv) references giaovien(magv)

alter table khoa add constraint fk_khoa_giaovien
foreign key (truongkhoa) references giaovien(magv)

alter table bomon add constraint fk_bomon_khoa
foreign key (makhoa) references khoa(makhoa)

alter table bomon add constraint fk_bomon_giaovien
foreign key (truongbm) references giaovien(magv)

alter table giaovien add constraint fk_giaovien_bomon
foreign key (mabm) references bomon(mabm)

alter table thamgiadt add constraint fk_thamgiadt_giaovien
foreign key (magv) references giaovien(magv)

alter table thamgiadt add constraint fk_thamgiadt_congviec
foreign key (madt, stt) references congviec(madt, sott)

alter table congviec add constraint fk_congviec_detai
foreign key (madt) references detai(madt)

alter table detai add constraint fk_detai_giaovien
foreign key (gvcndt) references giaovien(magv)

alter table detai add constraint fk_detai_chude
foreign key (macd) references chude(macd)

alter table giaovien add constraint c_phai
check (phai in (N'Nam', N'Nữ'))

alter table thamgiadt add constraint c_ketqua
check (ketqua in (N'Đạt', N'Không đạt'))

-- GIAOVIEN table inserts
INSERT INTO GIAOVIEN (MAGV, HOTEN, LUONG, PHAI, NGSINH, DIACHI, GVQLCM) VALUES
('001', N'Nguyễn Hoài An', 2000.0, N'Nam', '1973-02-15', N'25/3 Lạc Long Quân, Q.10, TP HCM', NULL),
('002', N'Trần Trà Hương', 2500.0, N'Nữ', '1960-06-20', N'125 Trần Hưng Đạo, Q.1,TP HCM', NULL),
('003', N'Nguyễn Ngọc Ánh', 2200.0, N'Nữ', '1975-05-11', N'12/21 Võ Văn Ngân Thủ Đức, TP HCM', '002'),
('004', N'Trương Nam Sơn', 2300.0, N'Nam', '1959-06-20', N'215 Lý Thường Kiệt,TP Biên Hòa', NULL),
('005', N'Lý Hoàng Hà', 2500.0, N'Nam', '1954-10-23', N'22/5 Nguyễn Xí, Q.Bình Thạnh, TP HCM', NULL),
('006', N'Trần Bạch Tuyết', 1500.0, N'Nữ', '1980-05-20', N'127 Hùng Vương, TP Mỹ Tho', '004'),
('007', N'Nguyễn An Trung', 2100.0, N'Nam', '1976-06-05', N'234 3/2, TP Biên Hòa', NULL),
('008', N'Trần Trung Hiếu', 1800.0, N'Nam', '1977-08-06', N'22/11 Lý Thường Kiệt, TP Mỹ Tho', '007'),
('009', N'Trần Hoàng Nam', 2000.0, N'Nam', '1975-11-22', N'234 Trần Não, An Phú,TP HCM', '001'),
('010', N'Phạm Nam Thanh', 1500.0, N'Nam', '1980-12-12', N'221 Hùng Vương, Q.5, TP HCM', '007');

-- GV_DT table inserts
INSERT INTO GV_DT VALUES
('001', '0838912112'),
('001', '0903123123'),
('002', '0913454545'),
('003', '0838121212'),
('003', '0903656565'),
('003', '0937125125'),
('006', '0937888888'),
('008', '0653717171'),
('008', '0913232323');

-- NGUOITHAN table inserts
INSERT INTO NGUOITHAN VALUES
('001', N'Hùng', '1990-01-14', N'Nam'),
('001', N'Thúy', '1994-12-08', N'Nữ'),
('003', N'Hà', '1998-09-03', N'Nữ'),
('003', N'Thu', '1998-09-03', N'Nữ'),
('007', N'Mai', '2003-03-26', N'Nữ'),
('007', N'Vy', '2000-02-14', N'Nữ'),
('008', N'Nam', '1991-05-06', N'Nam'),
('009', N'An', '1996-08-19', N'Nam'),
('010', N'Nguyệt', '2006-01-14', N'Nữ');


-- KHOA table inserts
INSERT INTO KHOA VALUES
('CNTT', N'Công nghệ thông tin', 1995, 'B11', '0838123456', '002', '2005-02-20'),
('HH', N'Hóa học', 1980, 'B41', '0838456456', '007', '2001-10-15'),
('SH', N'Sinh học', 1980, 'B31', '0838454545', '004', '2000-10-11'),
('VL', N'Vật lý', 1976, 'B21', '0838223223', '005', '2003-09-18');

-- BOMON table inserts
INSERT INTO BOMON VALUES
('CNTT', N'Công nghệ tri thức', 'B15', '0838126126', NULL, 'CNTT', NULL),
('HHC', N'Hóa hữu cơ', 'B44', '838222222', NULL, 'HH', NULL),
('HL', N'Hóa lý', 'B42', '0838878787', NULL, 'HH', NULL),
('HPT', N'Hóa phân tích', 'B43', '0838777777', '007', 'HH', '2007-10-15'),
('HTTT', N'Hệ thống thông tin', 'B13', '0838125125', '002', 'CNTT', '2004-09-20'),
('MMT', N'Mạng máy tính', 'B16', '0838676767', '001', 'CNTT', '2005-05-15'),
('SH', N'Sinh hóa', 'B33', '0838898989', NULL, 'SH', NULL),
(N'VLĐT', N'Vật lý điện tử', 'B23', '0838234234', NULL, 'VL', NULL),
('VLUD', N'Vật lý ứng dụng', 'B24', '0838454545', '005', 'VL', '2006-02-18'),
('VS', N'Vi sinh', 'B32', '0838909090', '004', 'SH', '2007-01-01');

update giaovien
set mabm = 'MMT'
where magv = '001'

update giaovien
set mabm = 'HTTT'
where magv = '002'

update giaovien
set mabm = 'HTTT'
where magv = '003'

update giaovien
set mabm = 'VS'
where magv = '004'

update giaovien
set mabm = N'VLĐT'
where magv = '005'

update giaovien
set mabm = 'VS'
where magv = '006'

update giaovien
set mabm = 'HPT'
where magv = '007'

update giaovien
set mabm = 'HPT'
where magv = '008'

update giaovien
set mabm = 'MMT'
where magv = '009'

update giaovien
set mabm = 'HPT'
where magv = '010'


-- CHUDE table inserts
INSERT INTO CHUDE VALUES
('NCPT', N'Nghiên cứu phát triển'),
('QLGD', N'Quản lý giáo dục'),
('UDCN', N'Ứng dụng công nghệ');

-- DETAI table inserts
INSERT INTO DETAI VALUES
('001', N'HTTT quản lý các trường ĐH', N'ĐHQG', 20.0, '2007-10-20', '2008-10-20', 'QLGD', '002'),
('002', N'HTTT quản lý giáo vụ cho một Khoa', N'Trường', 20.0, '2000-10-12', '2001-10-12', 'QLGD', '002'),
('003', N'Nghiên cứu chế tạo sợi Nano Platin', N'ĐHQG', 300.0, '2008-05-15', '2010-05-15', 'NCPT', '005'),
('004', N'Tạo vật liệu sinh học bằng màng đi người', N'Nhà nước', 100.0, '2007-01-01', '2009-12-31', 'NCPT', '004'),
('005', N'Ứng dụng hóa học xanh', N'Trường', 200.0, '2003-10-10', '2004-12-10', 'UDCN', '007'),
('006', N'Nghiên cứu tế bào gốc', N'Nhà nước', 4000.0, '2006-10-20', '2009-10-20', 'NCPT', '004'),
('007', N'HTTT quản lý thư viện ở các trường ĐH', N'Trường', 20.0, '2009-05-10', '2010-05-10', 'QLGD', '001');


-- CONGVIEC table insert
INSERT INTO CONGVIEC VALUES
('001', 1, N'Khởi tạo và Lập kế hoạch', '2007-10-20', '2008-12-20'),
('001', 2, N'Xác định yêu cầu', '2008-12-21', '2008-03-21'),
('001', 3, N'Phân tích hệ thống', '2008-03-22', '2008-05-22'),
('001', 4, N'Thiết kế hệ thống', '2008-05-23', '2008-06-23'),
('001', 5, N'Cài đặt thử nghiệm', '2008-06-24', '2008-10-20'),
('002', 1, N'Khởi tạo và Lập kế hoạch', '2009-05-10', '2009-07-10'),
('002', 2, N'Xác định yêu cầu', '2009-07-11', '2009-10-11'),
('002', 3, N'Phân tích hệ thống', '2009-10-12', '2009-12-20'),
('002', 4, N'Thiết kế hệ thống', '2009-12-21', '2010-03-22'),
('002', 5, N'Cài đặt thử nghiệm', '2010-03-23', '2010-05-10'),
('006', 1, N'Lấy mẫu', '2006-10-20', '2007-02-20'),
('006', 2, N'Nuôi cấy', '2007-02-21', '2008-08-21');

-- THAMGIADT table inserts
INSERT INTO THAMGIADT VALUES
('001', '002', 1, 0.0, NULL),
('001', '002', 2, 2.0, NULL),
('002', '001', 4, 2.0, N'Đạt'),
('003', '001', 1, 1.0, N'Đạt'),
('003', '001', 2, 0.0, N'Đạt'),
('003', '001', 4, 1.0, N'Đạt'),
('003', '002', 2, 0.0, NULL),
('004', '006', 1, 0.0, N'Đạt'),
('004', '006', 2, 1.0, N'Đạt'),
('006', '006', 2, 1.5, N'Đạt'),
('009', '002', 3, 0.5, NULL),
('009', '002', 4, 1.5, NULL);
