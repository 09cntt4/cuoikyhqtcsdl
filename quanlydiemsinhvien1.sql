create database QuanlyDiemSinhVien1;
go
use QuanlyDiemSinhVien1;
--Tạo bảng:
create table HOCPHAN(
MaHP varchar(30) not null,
TenHP nvarchar(30),
SoTinChi int,
TongSoTiet int
);
go
create table SINHVIEN(
MaSV varchar(30) not null,
MaLop varchar(30) not null,
MaKhoa varchar(30) not null,
TenSV nvarchar(30),
GioiTinh bit,
NgaySinh date,
Quequan nvarchar(20),
SoDienThoai varchar(20),
Email varchar(30)
);
go
create table LOP(
MaLop varchar(30) not null,
MaKhoa varchar(30) not null,
TenLop nvarchar(30),
Khoa varchar(30)
)
create table KHOA(
MaKhoa varchar(30) not null,
TenKhoa nvarchar(30)
);
go
create table DIEM(
MaSV varchar(30) not null,
MaHP varchar(30) not null,
DiemChuyenCan float,
DiemGiuaKi float,
DiemThi float
);
--Tạo các khóa:
alter table HOCPHAN add constraint pk_MaHP primary
key(MaHP);
alter table KHOA add constraint pk_Makhoa primary
key(MaKhoa);
alter table LOP add constraint pk_Malop primary
key(MaLop),
constraint fk_Makhoa foreign key(MaKhoa) references
KHOA(MaKhoa);
alter table SINHVIEN add constraint pk_MaSV primary
key(MaSV),
constraint fk_Malop foreign key(MaLop) references
LOP(MaLop),
constraint fk_Makhoa1 foreign key(MaKhoa) references
Khoa(MaKhoa);
alter table DIEM add constraint fk_MaSV foreign key(MaSV)
references SINHVIEN(MaSV),
constraint fk_MaHP foreign key(MaHP) references
HOCPHAN(MaHP);
--Tạo các rằng buộc:
alter table DIEM add constraint df_diemchuyencan
default(0) for DiemChuyenCan,
constraint df_diemgiuaki default(0) for DiemGiuaKi,
constraint df_diemthi default(0) for DiemThi;
alter table DIEM add constraint ck_diemchuyencan
check(DiemChuyenCan between 0 and 10),
constraint ck_diemgiuaki check(DiemGiuaKi between 0 and
10),
constraint ck_diemthi check(DiemThi between 0 and 10);

--- Để tạo một tài khoản người dùng đăng nhập quyền SQL Server cho cơ sở dữ liệu quản lý công văn của một công ty, bạn có thể sử dụng câu lệnh CREATE LOGIN như sau:
CREATE LOGIN [Admin] WITH PASSWORD = '230422';

USE [QuanlyDiemSinhVien];
--- tạo tài khoản người dùng
CREATE USER [Admin] FOR LOGIN [Admin];
 --- xóa tài khoản người dùng
USE [QuanlyDiemSinhVien];
DROP USER [Admin];
DROP LOGIN [Admin];
--NHập dữ liệu cho các bảng:
insert HOCPHAN values
('IT1234', N'Lập trình căn bản', 3, 45),
('FL2344', N'Viễn thám ứng dụng', 2, 45),
('MI3212', N'Toán rời rạc', 3, 45),
('MI6253', N'Toán cao cấp', 3, 45),
('SS2635', N'Mã nguồn mở', 3, 45),
('SS6352', N'Hệ quản trị cở sở dữ liệu', 3, 45);
insert KHOA values
('CNTT', N'Công nghệ thông tin'),
('KT', N'Khí tượng'),
('QTKD', N'Quản lý đất đai');
insert LOP values
('CNTT1', 'CNTT', N'Công nghệ thông tin 1', 'K09'),
('K1QT2', 'QTKD', N'Quản lý đất đai', 'K1'),
('CNTT2', 'CNTT', N'Công nghệ thông tin 2', 'K09'),
('K2KT1', 'KT', N'Khí tượng', 'K2'),
('CNTT3', 'CNTT', N'Công nghệ thông tin 3', 'K09'),
('CNTT4', 'CNTT', N'Công nghệ thông tin 4', 'K09');
insert SINHVIEN values
('0950080126', 'CNTT4', 'CNTT', N'Nguyễn NAM KHỞI', 1,
'4/23/2022', N'TÂY NINH', '0963917701',
'namn56673@gmail.com'),
('0950080146', 'CNTT4', 'CNTT', N'Võ Nguyễn Đức Toàn', 1,
'4/12/2002', N'Tp.HCM', '01223455667',
'ductoan@gmail.com'),
('0950080124', 'CNTT4', 'CNTT', N'Trần Quốc Huy', 1,
'12/3/2002', N'Đắklak', '123456789',
'quochuy@gmail.com'),
('0950080123', 'CNTT2', 'CNTT', N'Nguyễn Nhật Minh', 1,
'3/13/2002', N'Tiền Giang', '123456221',
'nhatminh@gmail.com'),
('0950080145', 'CNTT1', 'CNTT', N'Trần Quốc Trung', 1,
'2/2/2002', N'Châu Đốc', '02467895675',
'quoctrunng@gmail.com'),
('0950090123', 'CNTT3', 'CNTT', N'Lê Quốc Khánh', 1,
'8/25/2002', N'Quãng Ngãi', '099565995',
'chaulee00@gmail.com'),
('095090393', 'K1QT2', 'QTKD', N'Lê Tiến Trung', 1,
'2/10/2002',N'Bắc Ninh', '0938465242', 'trung102@gmail.com'),
('095089322', 'K2KT1', 'KT', N'Nguyễn Minh Khải', 1,
'4/21/2002', N'Hà Nội', '0342143212',
'khaiminhnguyen21@gmail.com');
insert DIEM values
('0950080126', 'FL2344', 6.7, 3, 8),
('0950080126', 'SS2635', 7, 8.6, 7),
('0950080146', 'FL2344', 10, 8, 8),
('0950080124', 'FL2344', 6, 7.4, 4),
('0950080126', 'IT1234', 10, 8, 7.6),
('0950080124', 'MI6253', 9, 4.6, 7),
('0950080146', 'IT1234', 8, 7, 7.5),
('0950080124', 'IT1234', 10, 9, 8);
--Hiển thị dữ liệu của các bảng:
select*from HOCPHAN;
select*from LOP;
select*from SINHVIEN;
select*from KHOA;
select*from DIEM;
--Cập nhật dữ liệu cho bảng:
update DIEM set DiemThi=5 where MaSV='0950080126' and
MaHP='IT1234';
select*from DIEM;
--Xóa dữ liệu của bảng:
delete from DIEM where MaSV='0950080126' and MaHP='SS2635';
select*from DIEM;
---tạo một Stored Procedure để thêm khoa vào bảng khoa:
CREATE PROCEDURE AddKHOA
AS
BEGIN
    SELECT * FROM KHOA
    WHERE MaKhoa =N'TNN' and TenKhoa = N'Tài nguyên nước';
END;

EXEC AddKHOA;
---Tạo hàm tính tổng số lượng sinhvien theo người gửi:
CREATE FUNCTION sumdiem (@MaSV INT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @Result FLOAT
    SELECT @Result = AVG(DiemGiuaKi)
    FROM DIEM
    WHERE MaSV = @MaSV
    RETURN @Result
END

SELECT dbo.sumdiem(0950080126)
--------TRIGGER----------
CREATE TRIGGER ArchiveDeletedHOCPHAN
ON HOCPHAN
AFTER DELETE
AS
BEGIN
    INSERT INTO HOCPHAN(MaHP, TenHP)
    SELECT MaHP, TenHP
    FROM deleted
END


--tạo taì khoản đăng nhập và mật khẩu
Create login admin with password='12345'
--- tạo người dùng
create user admin for login admin
-- phân quyền
Grant select,insert,update,delete on quanlydiemsinhvien to admin
