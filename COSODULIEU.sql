CREATE DATABASE QUANLY35MM
GO

use QUANLY35MM

go
create table MON
(
	MaMon varchar(10) unique,  
	TenMon	nvarchar(50) not null, 
	DonGiaB int not null,
	primary key(MaMon)
)
go

create table HANG	
(
	MaHang	varchar(10) unique, 
	TenHang	nvarchar(50) not null,
	DonGiaN int not null,
	primary key(MaHang)
)
go
create table NHACUNGCAP
(
	MaNCC	varchar(10) unique,  
	TenNCC	nvarchar(50) not null,
	SDT varchar(12) not null,
	DChiNCC nvarchar(200),
	STK nvarchar(200),
	primary key(MaNCC)
	
)

go

Create table BAN
(
	SoBan varchar(10) primary key,
	TinhTrang nvarchar(20) --Bàn trống, bàn đã được đặt trước, bàn có khách ngồi
)
go

create table NHANVIEN
(
	MaNV varchar(10) unique, 
	TENNV nvarchar(50) not null, 
	SDT varchar(12) not null,
	LoaiNV nvarchar(50) not null, -- Nhân viên, quản lý
	primary key(MANV)
)
go


Create table TAIKHOAN
(
	MaTK varchar(50) primary key,
	MaNV varchar(10),
	TenDangNhap varchar(50) not null,
	MatKhau varchar(50) not null 
	foreign key (MaNV) references NHANVIEN
)
go


create table NHAP
(
	MaDNH varchar(10) primary key,  
	NgayNH date, 
	TongTien int,
	MaNCC varchar(10),
	MaNV varchar(10),
	foreign key (MaNV) references NHANVIEN,
	foreign key (MaNCC ) references NHACUNGCAP
)
go
create table NHAPCHITIET
(
	MaDNHChiTiet varchar(10),  
	MaDNH varchar(10), 
	MaHang	varchar(10),
	SoLuong int ,
	ThanhTien int,
	primary key(MaDNHChiTiet),
	foreign key (MaDNH) references NHAP,
	foreign key (MaHang) references HANG

)
go

create table THANHTOAN
(
	MaHD varchar(10),  
	NgayTT date,
	GioVao time,
	GioRa time,
	TongTien int ,
	ChietKhau float,
	MaNV varchar(10),
	SoBan varchar(10),
	primary key(MAHD),
	foreign key (SoBan)references BAN,
	foreign key (MaNV) references NHANVIEN
)
go
create table THANHTOANCHITIET
(
	MaHDChiTiet varchar(10),  
	MaHD varchar(10),
	ThanhTien int,
	MaMon varchar(10),
	SoLuong int
	primary key(MaHDChiTiet),
	foreign key (MaHD) references  THANHTOAN,
	foreign key (MaMon) references  MON
)
go

create nonclustered index NCI_TenMon on Mon(TenMon)
go

insert into MON values('001',N'Cà phê đen',13000)
insert into MON values('002',N'Cà phê sữa',15000)
insert into MON values('003',N'Bạc xỉu (Nóng/Đá)',20000)
insert into MON values('004',N'Cacao (Nóng/Đá)',22000)
insert into MON values('005',N'Cà phê kẹo đường',25000)
insert into MON values('006',N'Cà phê muối',25000)
insert into MON values('007',N'Sữa tươi kẹp đường',35000)
insert into MON values('008',N'Sữa chua đập',18000)
insert into MON values('009',N'Sữa chua hộp',12000)
insert into MON values('010',N'Sữa chua đá',20000)
insert into MON values('011',N'Sữa chua mix vị ',25000)
insert into MON values('012',N'Trà chanh',20000)
insert into MON values('013',N'Trà đào cam sả (Nóng/Đá)',30000)
insert into MON values('014',N'Trà gừng',20000)
insert into MON values('015',N'Trà dâu ổi hồng',30000)
insert into MON values('016',N'Trà việt quất thanh long',30000)
insert into MON values('017',N'Trà chanh dây cam bưởi',30000)
insert into MON values('018',N'Trà chanh dây dưa lưới',30000)
insert into MON values('019',N'Nước chanh (Nóng/Đá)',20000)
insert into MON values('020',N'Chanh xí muội (Nóng/Đá)',22000)
insert into MON values('021',N'Chanh nha đam hạt chia (Nóng/Đá)',25000)
insert into MON values('022',N'Ổi',25000)
insert into MON values('023',N'Cà rốt',25000)
insert into MON values('024',N'Thơm',25000)
insert into MON values('025',N'Cam',25000)
insert into MON values('026',N'Chanh dây',25000)
insert into MON values('027',N'Nước suối',12000)
insert into MON values('028',N'Khoáng lạt',15000)
insert into MON values('029',N'Sting',18000)
insert into MON values('030',N'Revive',18000)
insert into MON values('031',N'Coca',18000)
insert into MON values('032',N'Trà xanh không độ',18000)
insert into MON values('033',N'Bò húc',22000)
insert into MON values('034',N'Trà sữa truyền thống',25000)
insert into MON values('035',N'Trà sữa full thạch',30000)
insert into MON values('036',N'Trà sữa thái xanh truyền thống',25000)
insert into MON values('037',N'Trà sữa thái xanh đặc biệt',30000)
insert into MON values('038',N'Trà sữa thái xanh full thạch',30000)
insert into MON values('039',N'Trà sữa khoai môn truyền thống',30000)
insert into MON values('040',N'Trà sữa khoai môn đặc biệt',35000)
insert into MON values('041',N'Trà sữa khoai môn full thạch',35000)
insert into MON values('042',N'Trà sữa kem trứng dừa nướng',35000)
insert into MON values('043',N'Sữa tươi trân châu đường đen',25000)
insert into MON values('044',N'Sữa tươi kem trứng trân châu đường đen',30000)
insert into MON values('045',N'Sữa tươi trân châu đường đen matcha',30000)
insert into MON values('046',N'Sinh tố xoài',35000)
insert into MON values('047',N'Sinh tố bơ',35000)
insert into MON values('048',N'Sinh tố mãng cầu',35000)
insert into MON values('049',N'Sinh tố cà chua',30000)
insert into MON values('050',N'Sinh tố cà rốt',30000)
insert into MON values('051',N'Sinh tố thanh long',30000)
insert into MON values('052',N'Thạch nhà làm',10000)
insert into MON values('053',N'Banh flan',6000)
insert into MON values('054',N'Pudding',5000)
insert into MON values('055',N'Khúc bạch',5000)
insert into MON values('056',N'Nha đam',5000)
insert into MON values('057',N'Trân châu trắng',5000)
insert into MON values('058',N'Kem trứng',10000)
insert into MON values('059',N'Trà sữa kẹo đường',35000)
insert into MON values('060',N'Sữa chua dâu',30000)
insert into MON values('061',N'Hướng dương',50000)
insert into MON values('062',N'Trà đào cam sả',15000)

go
insert into HANG values ('001',N'Trân châu trắng' ,65000)
insert into HANG values ('002',N'Trân châu đen',  100000)
insert into HANG values ('003', N'Trà đen lộc xát',150000)
insert into HANG values ('004',N'Ca cao nguyên chất',75000)
insert into HANG values ('005',N'Đào lon',  40000)
insert into HANG values ('006',N'Cozy đào túi lọc',  35000)
insert into HANG values ('007',N'Cam thảo',  25000)
insert into HANG values ('008',N'Bione',70000)
insert into HANG values ('009',N'Đường đen',25000)
insert into HANG values ('010',N'Siro thái đào',65000)
insert into HANG values ('011',N'Siro dâu', 65000)
insert into HANG values ('012',N'Siro việt quất',  65000)
insert into HANG values ('013',N'Siro chanh',  60000)
insert into HANG values ('014',N'Siro táo',  60000)
insert into HANG values ('015',N'Siro cam',  60000)


go
insert into NHACUNGCAP VALUES ('001', N'Hùng Phú','0905966510',N'Kiốt 01 Hùng Vương Chợ Cồn, TP Đà Nẵng',N'19550487-ACB Đà Nẵng')
insert into NHACUNGCAP VALUES ('002', N'Xuân Hà', '0916221901', N'38 Trần Cao vân, Thanh Khê,TP Đà Nẵng',N'0905606720-VP Đà Nẵng')

go
insert into NHANVIEN values ('0001', N'Phan Văn Tài','0905333999','NV')
insert into NHANVIEN values ('0002', N'Nguyễn Văn Sang','0983256789','QL')
insert into NHANVIEN values ('0003', N'Ngô Văn Em','0904666777','NV')
insert into NHANVIEN values ('0004', N'Trần Văn Thế','0859256477','QL')
insert into NHANVIEN values ('0005', N'Nguyễn Quang Minh','0907888111','QL')
insert into NHANVIEN values ('0006', N'Nguyễn Minh An','0905167455','NV')
insert into NHANVIEN values ('0007', N'Nguyễn Xuân Minh','0378569126','QL')
insert into NHANVIEN values ('0008', N'Lê Quốc Khánh','0905257689','NV')
insert into NHANVIEN values ('0009', N'Lê Xuân Bách','0905257689','QL')
insert into NHANVIEN values ('0010', N'Nguyễn Tiến Đạt', '0932555478','NV')
insert into NHANVIEN values ('0011', N'Trần Quốc Anh', '0934658120','NV')

go
insert into  TAIKHOAN values('Nhanvien1','0001','phanvantai','0905333999')
insert into  TAIKHOAN values('Nhanvien10','0010','nguyentiendat','0932555478')
insert into  TAIKHOAN values('Quanly2','0002','nguyenvansang','0983256789')
insert into  TAIKHOAN values('Nhanvien3','0003','ngovanem','0904666777')
insert into  TAIKHOAN values('Quanly4','0004','tranvanthe','0859256477')
insert into  TAIKHOAN values('Quanly5','0005','nguyenquangminh','0907888111')
insert into  TAIKHOAN values('Nhanvien6','0006','nguyenminhan','0905167455')
insert into  TAIKHOAN values('Quanly7','0007','nguyenxuanminh','0378569126')
insert into  TAIKHOAN values('Nhanvien8','0008','lequockhanh','0905257689')
insert into  TAIKHOAN values('Quanly9','0009','lexuanbach','0905257689')
insert into  TAIKHOAN values('Nhanvien11','0011','tranquocanh','0934658120')
go


go
insert into BAN values('01',N'Trống')
insert into BAN values('02',N'Có')
insert into BAN values('03',N'Trống')
insert into BAN values('04',N'Trống')
insert into BAN values('05',N'Có')
insert into BAN values('06',N'Có')
insert into BAN values('07',N'Có')
insert into BAN values('08',N'Trống')
insert into BAN values('09',N'Trống')
insert into BAN values('10',N'Có')
insert into BAN values('11',N'Trống')
insert into BAN values('12',N'Trống')
insert into BAN values('13',N'Trống')
insert into BAN values('14',N'Có')
insert into BAN values('15',N'Trống')
insert into BAN values('16',N'Có')
insert into BAN values('17',N'Trống')
insert into BAN values('18',N'Trống')
insert into BAN values('19',N'Có')
insert into BAN values('20',N'Trống')
insert into BAN values('21',N'Trống')
insert into BAN values('22',N'Trống')
insert into BAN values('23',N'Trống')
insert into BAN values('24',N'Có')


go

insert into NHAP values ('N001','2021-05-25',NULL,'001','0001')
insert into NHAP values ('N002','2021-07-26',NULL,'002','0002')
insert into NHAP values ('N003','2021-09-05',NULL,'001','0003')
insert into NHAP values ('N004','2021-11-29',NULL,'002','0004')
insert into NHAP values ('N005','2022-03-30',NULL,'001','0005')
insert into NHAP values ('N006','2022-05-15',NULL,'001','0005')
insert into NHAP values ('N007','2022-07-20',NULL,'002','0006')
insert into NHAP values ('N008','2022-09-05',NULL,'001','0007')
insert into NHAP values ('N009','2022-10-08',NULL,'002','0008')
insert into NHAP values ('N010','2022-11-28',NULL,'002','0009')


go
insert into NHAPCHITIET values ('NCT001','N001','001',2,null)
insert into NHAPCHITIET values ('NCT002','N001','003',1,null)
insert into NHAPCHITIET values ('NCT003','N001','002',1,null)
insert into NHAPCHITIET values ('NCT004','N001','006',2,null)
insert into NHAPCHITIET values ('NCT005','N001','009',2,null)

insert into NHAPCHITIET values ('NCT006','N002','010',2,null)
insert into NHAPCHITIET values ('NCT007','N002','011',2,null)
insert into NHAPCHITIET values ('NCT008','N002','012',4,null)
insert into NHAPCHITIET values ('NCT009','N002','014',6,null)
insert into NHAPCHITIET values ('NCT010','N002','015',4,null)
insert into NHAPCHITIET values ('NCT011','N002','013',3,null)

insert into NHAPCHITIET values ('NCT013','N003','004',2,null)
insert into NHAPCHITIET values ('NCT014','N003','005',5,null)
insert into NHAPCHITIET values ('NCT015','N003','007',6,null)
insert into NHAPCHITIET values ('NCT016','N003','009',8,null)

insert into NHAPCHITIET values ('NCT017','N004','010',3,null)
insert into NHAPCHITIET values ('NCT018','N004','011',3,null)
insert into NHAPCHITIET values ('NCT019','N004','012',2,null)
insert into NHAPCHITIET values ('NCT020','N004','013',5,null)
insert into NHAPCHITIET values ('NCT021','N004','014',3,null)
insert into NHAPCHITIET values ('NCT022','N004','015',2,null)
insert into NHAPCHITIET values ('NCT023','N004','012',3,null)

insert into NHAPCHITIET values ('NCT024','N005','001',2,null)
insert into NHAPCHITIET values ('NCT025','N005','002',1,null)
insert into NHAPCHITIET values ('NCT026','N005','003',1,null)
insert into NHAPCHITIET values ('NCT027','N005','007',2,null)
insert into NHAPCHITIET values ('NCT028','N005','008',1,null)

insert into NHAPCHITIET values ('NCT029','N006','002',2,null)
insert into NHAPCHITIET values ('NCT030','N006','003',1,null)
insert into NHAPCHITIET values ('NCT031','N006','009',2,null)

insert into NHAPCHITIET values ('NCT032','N007','012',6,null)
insert into NHAPCHITIET values ('NCT033','N007','013',6,null)

insert into NHAPCHITIET values ('NCT034','N008','002',2,null)
insert into NHAPCHITIET values ('NCT035','N008','004',2,null)
insert into NHAPCHITIET values ('NCT036','N008','006',2,null)
insert into NHAPCHITIET values ('NCT037','N008','007',6,null)

insert into NHAPCHITIET values ('NCT038','N009','011',8,null)
insert into NHAPCHITIET values ('NCT039','N009','014',8,null)

insert into NHAPCHITIET values ('NCT040','N010','010',4,null)
insert into NHAPCHITIET values ('NCT041','N010','012',8,null)
insert into NHAPCHITIET values ('NCT042','N010','015',6,null)

go
insert into THANHTOAN values('HD001','2023-05-25','9:00','15:00',NULL,NULL,'0001','01')
insert into THANHTOAN values('HD002','2023-07-26','13:00','17:00',NULL,NULL,'0002','02')
insert into THANHTOAN values('HD003','2023-09-05','19:00','21:00',NULL,NULL,'0003','03')
insert into THANHTOAN values('HD004','2023-02-08','7:00','16:00',NULL,NULL,'0004','04')
insert into THANHTOAN values('HD005','2023-03-30','11:00','15:00',NULL,NULL,'0005','05')
insert into THANHTOAN values('HD006','2023-10-10','7:23','9:30',NULL,NULL,'0006','06')

go

insert into  THANHTOANCHITIET values('M002','HD001',null,'004',1)
insert into  THANHTOANCHITIET values('M003','HD001',null,'003',2)
insert into  THANHTOANCHITIET values('M004','HD001',null,'002',1)
insert into  THANHTOANCHITIET values('M005','HD001',null,'012',1)
insert into  THANHTOANCHITIET values('M001','HD001',null,'012',3)
insert into  THANHTOANCHITIET values('M006','HD001',null,'021',1)

insert into  THANHTOANCHITIET values('M007','HD002',null,'002',4)
insert into  THANHTOANCHITIET values('M008','HD002',null,'010',1)
insert into  THANHTOANCHITIET values('M009','HD002',null,'009',1)

insert into  THANHTOANCHITIET values('M010','HD003',null,'003',1)
insert into  THANHTOANCHITIET values('M011','HD003',null,'013',6)

insert into  THANHTOANCHITIET values('M012','HD004',null,'004',2)
insert into  THANHTOANCHITIET values('M013','HD004',null,'021',1)
insert into  THANHTOANCHITIET values('M014','HD004',null,'011',2)


insert into  THANHTOANCHITIET values('M015','HD005',null,'001',2)
insert into  THANHTOANCHITIET values('M016','HD005',null,'005',2)
insert into  THANHTOANCHITIET values('M017','HD005',null,'012',2)
insert into  THANHTOANCHITIET values('M018','HD005',null,'022',2)
insert into  THANHTOANCHITIET values('M019','HD005',null,'011',2)


insert into  THANHTOANCHITIET values('M020','HD006',null,'006',1)
insert into  THANHTOANCHITIET values('M021','HD006',null,'001',2)
insert into  THANHTOANCHITIET values('M022','HD006',null,'002',1)
insert into  THANHTOANCHITIET values('M023','HD006',null,'012',2)


go

alter table Mon
add Mon_thu varchar(1)

alter table Ban
add Ban_thu varchar(1)

alter table NhanVien
add NV_thu varchar(1)


update Mon
set Mon_thu = 0

update Ban
set Ban_thu = 0

update NhanVien
set NV_thu = 0
