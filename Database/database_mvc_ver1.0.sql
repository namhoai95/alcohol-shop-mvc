USE [master]
GO
/****** Object:  Database [4teamwines]    Script Date: 07/06/2016 01:20:21 ******/
CREATE DATABASE [4teamwines]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'4teamwines', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.BQDAT\MSSQL\DATA\4teamwines.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'4teamwines_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.BQDAT\MSSQL\DATA\4teamwines_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [4teamwines] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [4teamwines].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [4teamwines] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [4teamwines] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [4teamwines] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [4teamwines] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [4teamwines] SET ARITHABORT OFF 
GO
ALTER DATABASE [4teamwines] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [4teamwines] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [4teamwines] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [4teamwines] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [4teamwines] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [4teamwines] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [4teamwines] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [4teamwines] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [4teamwines] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [4teamwines] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [4teamwines] SET  DISABLE_BROKER 
GO
ALTER DATABASE [4teamwines] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [4teamwines] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [4teamwines] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [4teamwines] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [4teamwines] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [4teamwines] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [4teamwines] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [4teamwines] SET RECOVERY FULL 
GO
ALTER DATABASE [4teamwines] SET  MULTI_USER 
GO
ALTER DATABASE [4teamwines] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [4teamwines] SET DB_CHAINING OFF 
GO
ALTER DATABASE [4teamwines] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [4teamwines] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [4teamwines]
GO
/****** Object:  StoredProcedure [dbo].[deleteTinhTrang]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteTinhTrang]
	@ID int
as
begin
	if(@ID is null  )
	begin
		return -1;
	end
	 
	delete from TinhTrang  where ID = @ID
					
end





GO
/****** Object:  StoredProcedure [dbo].[getSanPhamByID]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getSanPhamByID]
	@id int
as
begin
	if(@id is null or @id < 0 )
	begin
		return null;
	end
	select * from SanPham where ID = @id
end







GO
/****** Object:  StoredProcedure [dbo].[SqlQueryNotificationStoredProcedure-1e0f1c82-bf35-4a1a-bfa0-60c85601434f]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SqlQueryNotificationStoredProcedure-1e0f1c82-bf35-4a1a-bfa0-60c85601434f] AS BEGIN BEGIN TRANSACTION; RECEIVE TOP(0) conversation_handle FROM [SqlQueryNotificationService-1e0f1c82-bf35-4a1a-bfa0-60c85601434f]; IF (SELECT COUNT(*) FROM [SqlQueryNotificationService-1e0f1c82-bf35-4a1a-bfa0-60c85601434f] WHERE message_type_name = 'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer') > 0 BEGIN if ((SELECT COUNT(*) FROM sys.services WHERE name = 'SqlQueryNotificationService-1e0f1c82-bf35-4a1a-bfa0-60c85601434f') > 0)   DROP SERVICE [SqlQueryNotificationService-1e0f1c82-bf35-4a1a-bfa0-60c85601434f]; if (OBJECT_ID('SqlQueryNotificationService-1e0f1c82-bf35-4a1a-bfa0-60c85601434f', 'SQ') IS NOT NULL)   DROP QUEUE [SqlQueryNotificationService-1e0f1c82-bf35-4a1a-bfa0-60c85601434f]; DROP PROCEDURE [SqlQueryNotificationStoredProcedure-1e0f1c82-bf35-4a1a-bfa0-60c85601434f]; END COMMIT TRANSACTION; END



GO
/****** Object:  StoredProcedure [dbo].[usp_create_account_user]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_create_account_user]
@TenDangNhap varchar(255),
@MatKhau varchar(255),
@TenHienThi nvarchar(255),
@User_ID int output
as
begin

	if exists (select * from NguoiDung where TenDangNhap = @TenDangNhap)
		return -1;
	else
		

	SELECT @User_ID = MAX(ID) FROM NguoiDung
end





GO
/****** Object:  StoredProcedure [dbo].[usp_createInfoWeb]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_createInfoWeb]
	@sdt1 nvarchar(50),
	@sdt2 nvarchar(50),
	@email nvarchar(250),
	@skye nvarchar(250),
	@diachi nvarchar(250),
	@twitter nvarchar(250),
	@facebook nvarchar(250),
	@tenshop nvarchar(250),
	@googlemap nvarchar(250),
	@linkwebsite nvarchar(250),
	@favicon nvarchar(250),
	@ng nvarchar(250),
	@ghichu nvarchar(250),
	@id decimal(18,0)
as
begin
	update Website set TinhTrang = 0 where id <> @id
	insert into Website values(@sdt1,@sdt2,@email,@skye,@diachi,@twitter,@facebook,@tenshop,@googlemap,@linkwebsite,@favicon,GETDATE(),GETDATE(),@ng,@ghichu,1,@id)
end





GO
/****** Object:  StoredProcedure [dbo].[usp_createLienHe]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_createLienHe]
@id decimal(18,0),
@ip nvarchar(50),
@name nvarchar(MAX),
@email nvarchar(MAX),
@tieude nvarchar(MAX),
@noidung nvarchar(MAX)

as
begin
	if(@id is null or @name is null or @name is null or @email is null or @noidung is null or @tieude is null)
	begin
		return
	end
	insert into LienHe values(@id,@ip,GETDATE(),@name,@email,@tieude,@noidung,1)
end





GO
/****** Object:  StoredProcedure [dbo].[usp_createMessageNotication]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_createMessageNotication]
@m nvarchar(max),
@id decimal(18,0)
as
begin
	insert into Message2 VALUES(@m,GETDATE(),1,@id)
	delete from Message2 where id not in (select top 1000 id from Message2 order by id desc)
end



GO
/****** Object:  StoredProcedure [dbo].[usp_createNewDanhGia]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[usp_createNewDanhGia]
	@SanPhamID int,
	@DanhGia ntext,
	@Rate int,
	@TacGia nvarchar(255)
as
begin
	if @DanhGia is null
	begin
		set @DanhGia = ''
	end
	insert into DanhGia values(@SanPhamID, @DanhGia, @Rate, '', 1, @TacGia, getdate())
	declare @nrate float
	declare @nDanhGia float
	select @nrate = (sum(Rate)*1.0 / COUNT (*)), @nDanhGia = COUNT (*) from DanhGia where SanPham_ID = @SanPhamID
	update SanPham set NDanhGia = @nDanhGia, Nrate = @nrate where ID = @SanPhamID
end




GO
/****** Object:  StoredProcedure [dbo].[usp_createNewImage]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_createNewImage]
	@SanPham_ID int,
	@Url_img varchar(255),
	@TuKhoa varchar(255),
	@ViTriHinh int,
	@ChieuRong float,
	@TrangThai int,
	@ChieuCao float,
	@GhiChu nvarchar(255)


as
begin
	if(@SanPham_ID is null or @Url_img is null or @TuKhoa is null or @TrangThai is null)
	begin
		return -1;
	end
	if @GhiChu is null
		set @GhiChu = ''
	
	
	insert into HinhAnh values(@SanPham_ID,@Url_img,@TuKhoa,GETDATE(),@ViTriHinh,GETDATE(),@ChieuRong,@TrangThai,@ChieuCao,@GhiChu)
end





GO
/****** Object:  StoredProcedure [dbo].[usp_createNewKhachHang]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_createNewKhachHang]
@TenKH nvarchar(255),
@DiaChi nvarchar(255),
@SDT varchar(15),
@Email varchar(255),
@User_ID int,
@TrangThai int,
@GhiChu text,
@MaKH varchar(10) output
as
begin
	if(@TenKH is null)
	 return -1;
	declare @ma1 varchar(10)
	set @ma1 = (select top 1 MaKH  
					from KhachHang 
					order by MaKH desc)
	declare @stt int
	if(@ma1 is null)
		set @stt = 1
	else
		begin
			set @stt = cast(right(rtrim(@ma1), 8) as int)
		end
	set @MaKH = 'KH' + REPLICATE('0', 8 - len(@stt+1)) + cast(@stt+1 as varchar(8))
	insert into KhachHang values(@MaKH,@TenKH,@DiaChi,@SDT,@Email,@User_ID,@TrangThai,GETDATE(),GETDATE(),@GhiChu)
end







GO
/****** Object:  StoredProcedure [dbo].[usp_createNewLoaiSanPham]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_createNewLoaiSanPham]
	@TenLoai nvarchar(255),
	@TuKhoa nvarchar(255),
	@GhiChu nvarchar(MAX),
	@Ma varchar(10) out
as
begin
	if(@TenLoai is null or @TenLoai = '')
		begin
			return -1;
		end
	declare @ma1 varchar(10)
	set @ma1 = (select top 1 MaLoai  
					from LoaiSanPham 
					order by MaLoai desc)
	declare @stt int
	if(@ma1 is null)
		set @stt = 1
	else
		begin
			set @stt = cast(right(rtrim(@ma1), 4) as int)
		end
	set @Ma = 'WINECA' + REPLICATE('0', 4 - len(@stt+1)) + cast(@stt+1 as varchar(4))
	insert into LoaiSanPham values(@Ma, @TenLoai,@TuKhoa, 1,GETDATE(),GETDATE(),@GhiChu)
end




GO
/****** Object:  StoredProcedure [dbo].[usp_createNewNhaSanXuat]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_createNewNhaSanXuat]
	@TenNSX nvarchar(255),
	@DiaChi nvarchar(255),
	@SDT varchar(15),
	@TuKhoa nvarchar(255),
	@GhiChu nvarchar(MAX),
	@MaNSX varchar(10) output

as
begin
	if(@TenNSX is null or @SDT is null or @TuKhoa is null)
	begin
		return -1;
	end
	if @GhiChu is null
		set @GhiChu = ''
	if @DiaChi is null
	begin
		set @DiaChi = ''
	end
	declare @stt int
	declare @ma char(10)
	set @ma = (	select top 1 MaNSX
				from NhaSanXuat
				order by MaNSX desc)
	if(@ma is null)
	begin
		set @stt =1
	end
	else
	begin
		set @stt = cast(right(rtrim(@ma), 7) as int)
	end
	
	set @MaNSX = 'PNX' + REPLICATE('0', 7 - len(@stt+1)) + cast(@stt+1 as char(7))
	insert into NhaSanXuat values(@MaNSX,@TenNSX,@DiaChi,@SDT,@TuKhoa,1,GETDATE(),GETDATE(),@GhiChu)
end




GO
/****** Object:  StoredProcedure [dbo].[usp_createNewOrder]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_createNewOrder]
	@KH_ID int,
	@TenNguoiNhan nvarchar(255),
	@SoNha varchar(50),
	@Duong nvarchar(50),
	@Quan varchar(255),
	@TP nvarchar(255),
	@NgayGiaoHang datetime,
	@SoLuong int,
	@TongTien float,
	@GhiChu nvarchar(255),
	@MaGiamGia varchar(50),
	@TinhTrang int
as
begin
	if(@KH_ID is null or @TenNguoiNhan is null  or @SoNha is null
	or @Quan is null or @TP is null)
	begin
		return -1;
	end
	if @GhiChu is null
		set @GhiChu = ''
	if(@MaGiamGia is null)
	begin
		set @MaGiamGia = ''
	end
	declare @stt int
	declare @ma char(10)
	declare @MaHD varchar(255)
	set @ma = (	select top 1 MaHD
				from HoaDon
				order by MaHD desc)
	if(@ma is null)
	begin
		set @stt =1
	end
	else
	begin
		set @stt = cast(right(rtrim(@ma), 7) as int)
	end
	
	set @MaHD = 'HDW' + REPLICATE('0', 7 - len(@stt+1)) + cast(@stt+1 as char(7))
	insert into HoaDon values(@MaHD,@KH_ID,@TenNguoiNhan,@SoNha,@Duong,@Quan,@TP,GETDATE(),@NgayGiaoHang,@SoLuong,@TongTien,@GhiChu,@MaGiamGia,GETDATE(),@TinhTrang,GETDATE(),0)
	
end


GO
/****** Object:  StoredProcedure [dbo].[usp_createNewSanPham]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_createNewSanPham]
	@TenSanPham nvarchar(255),
	@LoaiSP int,
	@Gia float,
	@XuatXu nvarchar(255),
	@NongDo float,
	@DungTich float,
	@Tag nvarchar(255),
	@MoTa nvarchar(MAX),
	@SoLuongTon int,
	@GhiChu nvarchar(MAX),
	@NhaSanXuat int,
	@ThuongHieu int,
	@ChiTietBoSung nvarchar(MAX),
	@GiaKhuyenMai float,
	@NamSanXuat int,
	@TuKhoa nvarchar(255),
	@url_img varchar(255),
	@Seri varchar(255),
	@typeview int,
	@MaSanPham varchar(10) output
as
begin
	if(@TenSanPham is null or @LoaiSP is null or @Gia is null or @XuatXu is null or @SoLuongTon is null 
	or @NamSanXuat is null or @NhaSanXuat is null or @ThuongHieu is null or @TuKhoa is null 
	or @Gia < 0)
	begin
		return -1;
	end
	if(@NongDo is null)
	begin
		set @NongDo = 0
	end	
	if @DungTich is null
	begin
		set @DungTich = 0
	end
	if @ChiTietBoSung is null
	begin
		set @ChiTietBoSung = ''
	end
	if @MoTa is null
	begin
		set @MoTa = ''
	end
	if @Seri is null
	begin
		set @Seri = ''
	end
	if @GiaKhuyenMai is null
	begin
		set @GiaKhuyenMai = @Gia
	end
	if @GhiChu is null
		set @GhiChu = ''
	declare @stt int
	declare @ma char(10)
	set @ma = (	select top 1 MaSanPham
				from SanPham
				order by MaSanPham desc)
	if(@ma is null)
	begin
		set @stt =1
	end
	else
	begin
		set @stt = cast(right(rtrim(@ma), 7) as int)
	end
	
	set @MaSanPham = 'PWI' + REPLICATE('0', 7 - len(@stt+1)) + cast(@stt+1 as char(7))
	insert into SanPham values(@MaSanPham,@TenSanPham,@LoaiSP,@Gia,@XuatXu,@NongDo,@DungTich,0,1,@Tag,@MoTa,@SoLuongTon,@GhiChu,@NhaSanXuat,@ThuongHieu,@ChiTietBoSung,@GiaKhuyenMai,@NamSanXuat,GETDATE(),@TuKhoa,0,@url_img,@Seri,GETDATE(), @typeview, 0, 0)
	
end




GO
/****** Object:  StoredProcedure [dbo].[usp_createNewThuongHieu]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_createNewThuongHieu]
	@TenHangSanXuat varchar(255),
	@TuKhoa varchar(255),
	@TrangThai int,
	@GhiChu nvarchar(255),
	@Ma varchar(10) output

as
begin
	if(@TenHangSanXuat is null or @TrangThai is null)
	begin
		return -1;
	end
	if @GhiChu is null
		set @GhiChu = ''
	
	declare @stt int
	declare @ma1 char(10)
	set @ma1 = (	select top 1 Ma
				from ThuongHieu
				order by Ma desc)
	if(@ma1 is null)
	begin
		set @stt =1
	end
	else
	begin
		set @stt = cast(right(rtrim(@ma1), 7) as int)
	end
	
	set @Ma = 'PMA' + REPLICATE('0', 7 - len(@stt+1)) + cast(@stt+1 as char(7))
	insert into ThuongHieu values(@Ma,@TenHangSanXuat,@TuKhoa,GETDATE(),GETDATE(),@TrangThai,@GhiChu)
end




GO
/****** Object:  StoredProcedure [dbo].[usp_createNewTinhTrang]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_createNewTinhTrang]
	@TenTrangThai varchar(255),
	@GhiChu nvarchar(255)

as
begin
	if(@TenTrangThai is null )
	begin
		return -1;
	end
	if @GhiChu is null
		set @GhiChu = ''
	
	insert into TinhTrang values(@TenTrangThai,GETDATE(),GETDATE(),@GhiChu)
end





GO
/****** Object:  StoredProcedure [dbo].[usp_createTuyenDung]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_createTuyenDung]
@id decimal(18,0),
@title nvarchar(MAX),
@img nvarchar(MAX),
@tag nvarchar(MAX),
@cont text,
@userc nvarchar(MAX)
as
begin
	insert into TuyenDung values(@id,@title,@img,@tag,GETDATE(),0,0,0,@cont,GETDATE(),@userc,1)
end





GO
/****** Object:  StoredProcedure [dbo].[usp_createUaThich]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_createUaThich]
	@id decimal(18,0),
	@iduser int,
	@idsp int,
	@ip nvarchar(250)
as
begin
	if(@id is null or @iduser is null or @idsp is null)
	begin
		return
	end
	if(exists(select * from UaThich where iduser = @iduser and idsanpham = @idsp ))
	begin
		return
	end
	insert into UaThich values(@id,@iduser,@idsp,@ip)
end





GO
/****** Object:  StoredProcedure [dbo].[usp_deleteImage]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_deleteImage]
	@ID int
as
begin
	if(@ID is null  )
	begin
		return -1;
	end
	 
	delete from HinhAnh  where ID = @ID
					
end





GO
/****** Object:  StoredProcedure [dbo].[usp_deleteKhachHang]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_deleteKhachHang]
@ID int
as
begin
	if(@ID is null)
		return -1;
	delete from KhachHang where ID =  @ID
end







GO
/****** Object:  StoredProcedure [dbo].[usp_deleteLoaiSanPham]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_deleteLoaiSanPham]
	@ID int
as
begin
	if(@ID is null)
		return -1;
	delete from LoaiSanPham where ID = @ID
end




GO
/****** Object:  StoredProcedure [dbo].[usp_deleteNhaSanXuat]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_deleteNhaSanXuat]
	@ID int
as
begin
	if(@ID is null  )
	begin
		return -1;
	end
	 
	delete from NhaSanXuat  where ID = @ID
					
end




GO
/****** Object:  StoredProcedure [dbo].[usp_deleteOrder]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_deleteOrder]
	@ID int
as
begin
	if(@ID is null  )
	begin
		return -1;
	end

	declare @tinhtrang int
	select @tinhtrang = TinhTrang
	from HoaDon
	where ID = @ID;

	if(@tinhtrang = 2)
	begin
		delete from HoaDon  where ID = @ID
	end
	else
	begin
		return -1;
	end	
end





GO
/****** Object:  StoredProcedure [dbo].[usp_deleteSanPham]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_deleteSanPham]
	@ID int
as
begin
	if(@ID is null  )
	begin
		return -1;
	end
	 
	delete from SanPham  where ID = @ID
					
end




GO
/****** Object:  StoredProcedure [dbo].[usp_deleteThuongHieu]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_deleteThuongHieu]
@ID int
as
begin
	update ThuongHieu set TrangThai = 4 where ID = @ID
end




GO
/****** Object:  StoredProcedure [dbo].[usp_deleteUser]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_deleteUser]
	@ID int
as
begin
	if(@ID is null  )
	begin
		return -1;
	end
	 
	delete from NguoiDung  where ID = @ID
					
end





GO
/****** Object:  StoredProcedure [dbo].[usp_delTuyenDung]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_delTuyenDung]
	@id decimal(18,0)
as
begin
	if(@id is null)
	begin
		return -1;
	end
	update TuyenDung set TinhTrang = 0  where id = @id
end





GO
/****** Object:  StoredProcedure [dbo].[usp_delUaThich]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_delUaThich]
	@id int,
	@idsp int
as
begin
	if(@id is null or @idsp is null)
	begin
		return
	end
	delete from UaThich where iduser = @id and idsanpham = @idsp
end





GO
/****** Object:  StoredProcedure [dbo].[usp_getEmailById]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getEmailById]
@id decimal(18,0)
as
begin
	select * from LienHe where id = @id 
	update LienHe set trangthai = 0 where id = @id
end





GO
/****** Object:  StoredProcedure [dbo].[usp_getImageByID]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getImageByID]
	@id int
as
begin
	if(@id is null or @id < 0 )
	begin
		return null;
	end
	select * from HinhAnh where ID = @id
end





GO
/****** Object:  StoredProcedure [dbo].[usp_getInfoWeb]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getInfoWeb]
	
as
begin
	select top 1 * from Website order by id desc
end





GO
/****** Object:  StoredProcedure [dbo].[usp_getKhachHangByID]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getKhachHangByID]
@id int
as
begin
	if(@id is null)
		return null
	select * from KhachHang where ID = @id
end







GO
/****** Object:  StoredProcedure [dbo].[usp_getKhachHangByUser_ID]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getKhachHangByUser_ID]
@id_user int
as
begin
	select * from KhachHang where User_ID = @id_user
end





GO
/****** Object:  StoredProcedure [dbo].[usp_getLastedIdHoaDon]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getLastedIdHoaDon] @kq int out
as
begin
	select @kq = IDENT_CURRENT('HoaDon')
end





GO
/****** Object:  StoredProcedure [dbo].[usp_getListDanhGia]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[usp_getListDanhGia]
as
begin
	select * from DanhGia
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getListDanhGiaBySanPham]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[usp_getListDanhGiaBySanPham]
	@id int
as
begin
	select * from DanhGia where SanPham_ID = @id
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getListEmail]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListEmail]
as
begin
	select * from LienHe order by id desc
end





GO
/****** Object:  StoredProcedure [dbo].[usp_getListImage]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListImage]
as
begin
	
	select * from HinhAnh
end





GO
/****** Object:  StoredProcedure [dbo].[usp_getListImageByID]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListImageByID]
@ID int
as
begin
	
	select * from HinhAnh where SanPham_ID = @ID
end





GO
/****** Object:  StoredProcedure [dbo].[usp_getListInfoWeb]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListInfoWeb]
	
as
begin
	select * from TuyenDung where TinhTrang <> 0 order by id desc
end





GO
/****** Object:  StoredProcedure [dbo].[usp_getlistKhachHang]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getlistKhachHang]
as
begin
	select * from KhachHang
end






GO
/****** Object:  StoredProcedure [dbo].[usp_getlistLoaiSanPham]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getlistLoaiSanPham]
as
begin
	select * from LoaiSanPham where TinhTrang = 1
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getlistLoaiSanPhamAll]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getlistLoaiSanPhamAll]
as
begin
	select * from LoaiSanPham
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getListLoaiSanPhamByName]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[usp_getListLoaiSanPhamByName]
	@name nvarchar(255)
as
begin 
	if(@name is null)
		return null
	select * from LoaiSanPham where TenLoai like N'%'+@name+'%'
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getListNhaSanXuat]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListNhaSanXuat]
as
begin
	
	select * from NhaSanXuat where TrangThai = 1
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getListNhaSanXuatAll]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListNhaSanXuatAll]
as
begin
	
	select * from NhaSanXuat
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getListNhaSanXuatByName]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListNhaSanXuatByName]
	@name nvarchar(255)
as
begin
	if(@name is null )
	begin
		return null;
	end
	select * from NhaSanXuat where TenNSX like N'%'+@name+'%'
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getListOrder]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_getListOrder]
as
begin
	select o.ID, o.KH_ID, o.MaHD, o.TenNguoiNhan, o.SoNha, o.Duong, o.Quan_Huyen, o.TinhTrang,
			o.Tinh_TP, o.TongTien, s.TenTrangThai
	from HoaDon o, TinhTrang s
	where o.TinhTrang = s.ID
end





GO
/****** Object:  StoredProcedure [dbo].[usp_getListOrderDetailByMaDH]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[usp_getListOrderDetailByMaDH] @id varchar(255)
as
begin
	if(@id is null  )
	begin
		return null;
	end
	select p.TenSanPham, o.SoLuong, o.DonGia
	from ChiTietHoaDon o, SanPham p
	where o.HD_ID = @id AND o.SanPham_ID = p.ID
end







GO
/****** Object:  StoredProcedure [dbo].[usp_getListSanPham]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListSanPham]
as
begin
	
	select * from SanPham where TinhTrang = 1
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getListSanPhamAll]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListSanPhamAll]
as
begin
	
	select * from SanPham
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getListSanPhamByLoaiSanPham]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListSanPhamByLoaiSanPham]
	@id int
as
begin
	if(@id is null or @id < 0 )
	begin
		return null;
	end
	select * from SanPham where LoaiSP = @id and TinhTrang = 1
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getListSanPhamByName]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListSanPhamByName]
	@name nvarchar(255)
as
begin
	if(@name is null )
	begin
		return null;
	end
	select * from SanPham where TenSanPham like N'%'+@name+'%'
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getListSanPhamByNhaSanXuat]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListSanPhamByNhaSanXuat]
	@id int
as
begin
	if(@id is null or @id < 0 )
	begin
		return null;
	end
	select * from SanPham where NhaSanXuat = @id and TinhTrang = 1
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getListSanPhamBySearch]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListSanPhamBySearch]
	@name nvarchar(255),
	@cat int
as
begin
	select * from SanPham where TenSanPham like N'%'+@name+'%' and LoaiSP = @cat  and TinhTrang = 1
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getListSanPhamByThuongHieu]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListSanPhamByThuongHieu]
	@id int
as
begin
	if(@id is null or @id < 0 )
	begin
		return null;
	end
	select * from SanPham where ThuongHieu = @id and TinhTrang = 1
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getListSanPhamFuture]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListSanPhamFuture]
as
begin
	
	select top 5 * from SanPham where TypeView = 3 and TinhTrang = 1
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getListSanPhamNew]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListSanPhamNew]
as
begin
	
	select top 5 * from SanPham where TypeView = 0 and TinhTrang = 1
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getListSanPhamNomal]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListSanPhamNomal]
as
begin
	
	select top 5 * from SanPham where TypeView = 2 and TinhTrang = 1
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getListSanPhamRelated]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListSanPhamRelated]
as
begin
	
	select top 5 * from SanPham where TinhTrang = 1
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getListSanPhamSelles]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListSanPhamSelles]
as
begin
	
	select top 5 * from SanPham where TypeView = 1 and TinhTrang = 1
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getListSanPhamSpecial]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListSanPhamSpecial]
as
begin
	
	select top 5 * from SanPham where TypeView = 4 and TinhTrang = 1
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getListThuongHieu]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListThuongHieu]
as
begin
	select * from ThuongHieu where TrangThai = 1
end	




GO
/****** Object:  StoredProcedure [dbo].[usp_getListThuongHieuAll]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListThuongHieuAll]
as
begin
	select * from ThuongHieu where TrangThai != 4
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getListThuongHieuDeleted]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListThuongHieuDeleted]
as
begin
	select * from ThuongHieu where TrangThai = 4
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getListTinhTrang]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListTinhTrang]
as
begin
	
	select * from TinhTrang
end





GO
/****** Object:  StoredProcedure [dbo].[usp_getListUser]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getListUser]
as
begin
	
	select * from NguoiDung
end





GO
/****** Object:  StoredProcedure [dbo].[usp_getLoaiSanPhamByID]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[usp_getLoaiSanPhamByID]
	@id int
as
begin 
	if(@id is null)
		return null
	select * from LoaiSanPham where id = @id
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getNextSanPham]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getNextSanPham]
	@id int,
	@thuonghieu int
as
begin
	if(@id is null or @id < 0 or @thuonghieu is null or @thuonghieu < 0)
	begin
		return null;
	end
	select * from SanPham P where P.ID = (select min(Q.ID) from SanPham Q where Q.ID > @id and Q.ThuongHieu = @thuonghieu and Q.TinhTrang = 1)
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getNhaSanXuatByID]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getNhaSanXuatByID]
	@id int
as
begin
	if(@id is null or @id < 0 )
	begin
		return null;
	end
	select * from NhaSanXuat where ID = @id
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getOderByID]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getOderByID]
	@id int
as
begin
	if(@id is null or @id < 0 )
	begin
		return null;
	end
	select * from HoaDon where ID = @id
end







GO
/****** Object:  StoredProcedure [dbo].[usp_getOderByMaDH]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getOderByMaDH]
	@id varchar(255)
as
begin
	if(@id is null  )
	begin
		return null;
	end
	select * from HoaDon where MaHD = @id
end







GO
/****** Object:  StoredProcedure [dbo].[usp_getOrderByID]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getOrderByID]
	@id int
as
begin
	if(@id is null or @id < 0 )
	begin
		return null;
	end
	select * from HoaDon where ID = @id
end







GO
/****** Object:  StoredProcedure [dbo].[usp_getOrderByMaDH]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_getOrderByMaDH]
	@id varchar(255)
as
begin
	if(@id is null  )
	begin
		return null;
	end
	select * from HoaDon where MaHD = @id
end





GO
/****** Object:  StoredProcedure [dbo].[usp_getPreviousSanPham]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getPreviousSanPham]
	@id int,
	@thuonghieu int
as
begin
	if(@id is null or @id < 0 or @thuonghieu is null or @thuonghieu < 0)
	begin
		return null;
	end
	select * from SanPham P where P.ID = (select max(Q.ID) from SanPham Q where Q.ID < @id and Q.ThuongHieu = @thuonghieu and Q.TinhTrang = 1)
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getRanDomSanPham]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getRanDomSanPham]
as
begin
	select top 1 * from SanPham where TinhTrang = 1
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getSanPhamByID]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getSanPhamByID]
	@id int
as
begin
	if(@id is null or @id < 0 )
	begin
		return null;
	end
	select * from SanPham where ID = @id
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getSanPhamByMaSP]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getSanPhamByMaSP]
	@id varchar(10)
as
begin
	if(@id is null )
	begin
		return null;
	end
	select * from SanPham where MaSanPham = @id
end




GO
/****** Object:  StoredProcedure [dbo].[usp_getTinhTrangByID]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getTinhTrangByID]
	@id int
as
begin
	if(@id is null or @id < 0 )
	begin
		return null;
	end
	select * from TinhTrang where ID = @id
end





GO
/****** Object:  StoredProcedure [dbo].[usp_getTuyenDungbyid]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getTuyenDungbyid]
	@id decimal(18,0)
as
begin
	if(@id is null)
	begin
		return -1;
	end
	select * from TuyenDung where id = @id and TinhTrang <> 0
end





GO
/****** Object:  StoredProcedure [dbo].[usp_getUaThich]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getUaThich]
	@id int
as
begin
	if(@id is null)
	begin
		return
	end
	select * from UaThich where iduser = @id
end





GO
/****** Object:  StoredProcedure [dbo].[usp_getUserById]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getUserById]
	@id int
as
begin
	if(@id is null or @id < 0 )
	begin
		return null;
	end
	select * from NguoiDung where ID = @id
end





GO
/****** Object:  StoredProcedure [dbo].[usp_getUserByTenDangNhap]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getUserByTenDangNhap]
	@TenDangNhap varchar(255)
as
begin
	if(@TenDangNhap is null or @TenDangNhap  = '' )
	begin
		return null;
	end
	select * from NguoiDung where TenDangNhap = @TenDangNhap
end





GO
/****** Object:  StoredProcedure [dbo].[usp_getUserByUserNameAndPassWord]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_getUserByUserNameAndPassWord]
@TenDangNhap varchar(255),
@MatKhau varchar(50)
as
begin
	if not exists (select * from NguoiDung where TenDangNhap = @TenDangNhap and MatKhau = @MatKhau )
		return null;
	else
		select * from NguoiDung where TenDangNhap = @TenDangNhap and MatKhau = @MatKhau
end







GO
/****** Object:  StoredProcedure [dbo].[usp_lockKhachHang]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_lockKhachHang]
@ID int
as
begin
	if(@ID is null)
		return -1;
	update KhachHang set TrangThai = 3 where ID =  @ID
end






GO
/****** Object:  StoredProcedure [dbo].[usp_lockLoaiSanPham]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_lockLoaiSanPham]
	@ID int
as
begin
	update LoaiSanPham set TinhTrang = 3 where ID = @ID
end




GO
/****** Object:  StoredProcedure [dbo].[usp_lockNhaSanXuat]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_lockNhaSanXuat]
	@ID int
as
begin
	if(@ID is null  )
	begin
		return -1;
	end
	 
	update NhaSanXuat set TrangThai = 3 where ID = @ID
					
end




GO
/****** Object:  StoredProcedure [dbo].[usp_lockOrder]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_lockOrder]
	@ID int
as
begin
	if(@ID is null  )
	begin
		return -1;
	end
	 
	update HoaDon set TinhTrang = 3 where ID = @ID
					
end







GO
/****** Object:  StoredProcedure [dbo].[usp_lockSanPham]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_lockSanPham]
	@ID int
as
begin
	if(@ID is null  )
	begin
		return -1;
	end
	 
	update SanPham set TinhTrang = 3 where ID = @ID
					
end




GO
/****** Object:  StoredProcedure [dbo].[usp_lockThuongHieu]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_lockThuongHieu]
	@ID int
as
begin
	if(@ID is null  )
	begin
		return -1;
	end
	 
	update ThuongHieu set TrangThai = 3 where ID = @ID
					
end




GO
/****** Object:  StoredProcedure [dbo].[usp_lockUserById]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_lockUserById]
	@ID int
as
begin
	if(@ID is null  )
	begin
		return -1;
	end
	
	update NguoiDung set Quyen = 3 where ID = @ID
					
end





GO
/****** Object:  StoredProcedure [dbo].[usp_restoreThuongHieu]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_restoreThuongHieu]
@id int
as
begin
	update ThuongHieu set TrangThai = 2 where ID = @id
end




GO
/****** Object:  StoredProcedure [dbo].[usp_seachThuongHieu]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_seachThuongHieu]
@key nvarchar(255)
as
begin
	select * from ThuongHieu where TenHangSanXuat like '%'+ @key +'%' or TuKhoa like '%' + @key + '%'
end




GO
/****** Object:  StoredProcedure [dbo].[usp_tamnt_createUser]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_tamnt_createUser]
	@name nvarchar(255),
	@email nvarchar(255),
	@avartar nvarchar(255)

as
begin
	if(@name is null or @email is null or @avartar is null)
	begin
		return null;
	end
	if(exists(select * from NguoiDung where TenDangNhap like @name or GhiChu like @email))
	begin
		return -1
	end
	else
	begin
		insert into NguoiDung values(@name,'','',1,@email,GETDATE(),'4team',GETDATE(),1,GETDATE(),@avartar);
	end
	
end





GO
/****** Object:  StoredProcedure [dbo].[usp_tamnt_updateMessageNotification]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_tamnt_updateMessageNotification]
	@id decimal(18,0)
	

as
begin
	if(@id is null )
	begin
		return null;
	end
	if(exists(select * from Message2 where id  = @id))
	begin
		update Message2 set  TinhTrang = 0
		where id = @id
	end
	
	
end





GO
/****** Object:  StoredProcedure [dbo].[usp_tamnt_updateUser]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_tamnt_updateUser]
	@name nvarchar(255),
	@email nvarchar(255),
	@avartar nvarchar(255)

as
begin
	if(@name is null or @email is null or @avartar is null)
	begin
		return null;
	end
	if(exists(select * from NguoiDung where TenDangNhap like @name or GhiChu like @email))
	begin
		update NguoiDung set  GhiChu = @email,avatar = @avartar
		where TenDangNhap = @name
	end
	
	
end





GO
/****** Object:  StoredProcedure [dbo].[usp_ThuongHieuByID]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_ThuongHieuByID]
	@id int
as
begin
	if(@id is null or @id < 0 )
	begin
		return null;
	end
	select * from ThuongHieu where ID = @id
end




GO
/****** Object:  StoredProcedure [dbo].[usp_Update_KhachHang]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_Update_KhachHang]
@id int,
@DiaChi nvarchar(255),
@Email varchar(255),
@SDT varchar(15)
as
begin
	update KhachHang set DiaChi = @DiaChi,
						Email = @Email,
						SDT = @SDT
					where User_ID = @id
end






GO
/****** Object:  StoredProcedure [dbo].[usp_Update_User]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_Update_User]
@id int,
@TenHienThi nvarchar(255)
as
begin
	update NguoiDung set
					TenHienThi = @TenHienThi,
					NgayCapNhat = GETDATE()
					where ID = @id
end






GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateAvatar]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_UpdateAvatar]
@filename varchar(255)
as
begin
	update NguoiDung set avatar = @filename
end






GO
/****** Object:  StoredProcedure [dbo].[usp_updateImage]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_updateImage]
	
	@SanPham_ID int,
	@Url_img varchar(255),
	@TuKhoa varchar(255),
	@ViTriHinh int,
	@ChieuRong float,
	@TrangThai int,
	@ChieuCao float,
	@GhiChu nvarchar(255),
	@ID int

as
begin
	if(@SanPham_ID is null or @Url_img is null or @TuKhoa is null or @TrangThai is null)
	begin
		return -1;
	end
	
	
	
	update HinhAnh set SanPham_ID = @SanPham_ID,
						Url_img = @Url_img,
						TuKhoa = @TuKhoa,
						ViTriHinh = @ViTriHinh,
						ChieuCao = @ChieuCao,
						ChieuRong = @ChieuRong,
						TrangThai = @TrangThai,
						NgayCapNhat = GETDATE(),
						GhiChu = @GhiChu
					where ID = @ID
	
end





GO
/****** Object:  StoredProcedure [dbo].[usp_updateInfoWeb]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_updateInfoWeb]
	@sdt1 nvarchar(50),
	@sdt2 nvarchar(50),
	@email nvarchar(250),
	@skye nvarchar(250),
	@diachi nvarchar(250),
	@twitter nvarchar(250),
	@facebook nvarchar(250),
	@tenshop nvarchar(250),
	@googlemap nvarchar(250),
	@linkwebsite nvarchar(250),
	@favicon nvarchar(250),
	@ng nvarchar(250),
	@ghichu nvarchar(250),
	@id decimal(18,0)
as
begin
	update Website set TinhTrang = 0 where id <> @id
	insert into Website values(@sdt1,@sdt2,@email,@skye,@diachi,@twitter,@facebook,@tenshop,@googlemap,@linkwebsite,@favicon,GETDATE(),GETDATE(),@ng,@ghichu,1,@id)
end





GO
/****** Object:  StoredProcedure [dbo].[usp_updateKhachHang]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_updateKhachHang]
@ID int,
@TenKH nvarchar(255),
@DiaChi nvarchar(255),
@SDT varchar(15),
@Email varchar(255),
@User_ID int,
@TrangThai int,
@GhiChu text
as
begin
	update KhachHang set TenKH = @TenKH,
						DiaChi = @DiaChi,
						SDT = @SDT,
						Email = @Email,
						User_ID = @User_ID,
						TrangThai = @TrangThai,
						GhiChu  = @GhiChu,
						NgayCapNhat = GETDATE()
					where ID = @ID

end







GO
/****** Object:  StoredProcedure [dbo].[usp_updateLoaiSanPham]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_updateLoaiSanPham]
	@ID int,
	@TenLoai nvarchar(255),
	@TuKhoa nvarchar(255),
	@TinhTrang int,
	@GhiChu nvarchar(MAX)
as
begin
	if(@TenLoai is null or @TuKhoa is null or @TinhTrang is null)
		begin
			return -1;
		end
	update LoaiSanPham set TenLoai = @TenLoai,
						TuKhoa = @TuKhoa,
						TinhTrang = @TinhTrang,
						GhiChu = @GhiChu,
						NgayCapNhat = GETDATE()
						where id =  @ID
end




GO
/****** Object:  StoredProcedure [dbo].[usp_updateNhaSanXuat]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_updateNhaSanXuat]
	@ID int,
	@TenNSX nvarchar(255),
	@DiaChi nvarchar(255),
	@SDT varchar(15),
	@TuKhoa nvarchar(255),
	@TrangThai int,
	@GhiChu nvarchar(MAX)

as
begin
	if(@TenNSX is null or @SDT is null or @TuKhoa is null or @TrangThai is null)
	begin
		return -1;
	end
	update NhaSanXuat set	TenNSX = @TenNSX,
						DiaChi = @DiaChi,
						SDT  =@SDT,
						TuKhoa = @TuKhoa,
						TrangThai = @TrangThai,
						NgayCapNhat = GETDATE(),
						GhiChu = @GhiChu
					where ID = @ID
end




GO
/****** Object:  StoredProcedure [dbo].[usp_updateSanPham]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_updateSanPham]
	
	@TenSanPham nvarchar(255),
	@LoaiSP int,
	@Gia float,
	@XuatXu nvarchar(255),
	@NongDo float,
	@DungTich float,
	@Tag nvarchar(255),
	@MoTa nvarchar(MAX),
	@SoLuongTon int,
	@GhiChu nvarchar(MAX),
	@NhaSanXuat int,
	@ThuongHieu int,
	@ChiTietBoSung nvarchar(MAX),
	@GiaKhuyenMai float,
	@NamSanXuat int,
	@TuKhoa nvarchar(255),
	@url_img varchar(255),
	@Seri varchar(255),
	@TypeView int,
	@ID int,
	@TinhTrang int
as
begin
	if(@TenSanPham is null or @LoaiSP is null or @Gia is null or @XuatXu is null or @SoLuongTon is null 
	or @NamSanXuat is null or @NhaSanXuat is null or @ThuongHieu is null or @TuKhoa is null 
	or @Gia < 0 or @ID is null)
	begin
		return -1;
	end
	
	if @GiaKhuyenMai is null
	begin
		set @GiaKhuyenMai = @Gia
	end
	
	update SanPham set TenSanPham = @TenSanPham,
						LoaiSP = @LoaiSP,
						Gia = @Gia,
						XuatXu = @XuatXu,
						NongDo = @NongDo,
						DungTich = @DungTich,
						TinhTrang = @TinhTrang,
						Tag = @Tag,
						MoTa =  @MoTa,
						SoLuongTon = @SoLuongTon,
						GhiChu =  @GhiChu,
						NhaSanXuat = @NhaSanXuat,
						ThuongHieu = @ThuongHieu,
						ChiTietBoSung = @ChiTietBoSung,
						GiaKhuyenMai = @GiaKhuyenMai,
						NamSanXuat = @NamSanXuat,
						TuKhoa = @TuKhoa,
						url_img = @url_img,
						NgayCapNhat = GETDATE(),
						TypeView = @TypeView
				where ID = @ID
	
end




GO
/****** Object:  StoredProcedure [dbo].[usp_updateThuongHieu]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_updateThuongHieu]
	@ID int,
	@TenHangSanXuat varchar(255),
	@TuKhoa varchar(255),
	@TrangThai int,
	@GhiChu nvarchar(255)

as
begin
	if(@TenHangSanXuat is null or @TuKhoa is null or @TrangThai is null)
	begin
		return -1;
	end
	update ThuongHieu set
						TenHangSanXuat = @TenHangSanXuat,
						TuKhoa = @TuKhoa,
						TrangThai = @TrangThai,
						NgayCapNhat = GETDATE(),
						GhiChu = @GhiChu
					where ID = @ID
	
end




GO
/****** Object:  StoredProcedure [dbo].[usp_updateTinhTrang]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_updateTinhTrang]
	@ID int,
	@TenTrangThai varchar(255),
	@GhiChu nvarchar(255)

as
begin
	if(@ID is null or @TenTrangThai is null  )
	begin
		return -1;
	end
	
	update TinhTrang set TenTrangThai = @TenTrangThai,
					GhiChu = @GhiChu,
					NgayCapNhat = GETDATE()
				where ID = @ID
end





GO
/****** Object:  StoredProcedure [dbo].[usp_updateUser]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_updateUser]
	@ID int,
	@TenDangNhap varchar(255),
	@MatKhau varchar(50),
	@TenHienThi nvarchar(255),
	@Quyen int,
	@GhiChu nvarchar(255),
	@TinhTrang int
as
begin
	if(@ID is null or @TenDangNhap is null or @MatKhau is null or  @TenHienThi is null or @Quyen is null )
	begin
		return -1;
	end
	
	update NguoiDung set TenDangNhap = @TenDangNhap,
					MatKhau = @MatKhau,
					TenHienThi = @TenHienThi,
					Quyen = @Quyen,
					GhiChu = @GhiChu,
					TinhTrang = @TinhTrang,
					NgayCapNhat = GETDATE()
				where ID = @ID
end





GO
/****** Object:  StoredProcedure [dbo].[usp_updateViewSanPham]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_updateViewSanPham]
	@ID int
as
begin
	if(@ID is null  )
	begin
		return -1;
	end
	 
	update SanPham set SoLuotXem += 1 where ID = @ID
					
end




GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Banner]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[id] [decimal](18, 0) NULL,
	[img] [nvarchar](max) NULL,
	[content1] [nvarchar](max) NULL,
	[content2] [nvarchar](max) NULL,
	[content3] [nvarchar](max) NULL,
	[content4] [nvarchar](max) NULL,
	[btnContent] [nvarchar](max) NULL,
	[color1] [nvarchar](max) NULL,
	[color2] [nvarchar](max) NULL,
	[color3] [nvarchar](max) NULL,
	[color4] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaCha] [int] NULL,
	[NoiDung] [ntext] NULL,
	[TenBinhLuan] [nvarchar](255) NULL,
	[SanPham_ID] [int] NULL,
	[TrangThai] [int] NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[GhiChu] [ntext] NULL,
 CONSTRAINT [PK_BinhLuan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HD_ID] [int] NULL,
	[SanPham_ID] [int] NULL,
	[DonGia] [float] NULL,
	[SoLuong] [int] NULL,
	[TrangThai] [int] NULL,
	[NgayTao] [date] NULL,
	[NgayCapNhat] [date] NULL,
	[GhiChu] [ntext] NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhGia]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGia](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SanPham_ID] [int] NULL,
	[DanhGia] [ntext] NULL,
	[Rate] [int] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[TrangThai] [bit] NULL,
	[TacGia] [nvarchar](250) NULL,
	[NgayTao] [datetime] NULL,
 CONSTRAINT [PK_DanhGia] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HinhAnh]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HinhAnh](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SanPham_ID] [int] NULL,
	[Url_img] [varchar](255) NULL,
	[TuKhoa] [nvarchar](255) NULL,
	[NgayTao] [datetime] NULL,
	[ViTriHinh] [int] NULL,
	[NgayCapNhat] [datetime] NULL,
	[ChieuRong] [float] NULL,
	[TrangThai] [int] NULL,
	[ChieuCao] [float] NULL,
	[GhiChu] [ntext] NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaHD] [varchar](255) NOT NULL,
	[KH_ID] [int] NULL,
	[TenNguoiNhan] [nvarchar](255) NULL,
	[SoNha] [nvarchar](50) NULL,
	[Duong] [nvarchar](50) NULL,
	[Quan_Huyen] [varchar](255) NULL,
	[Tinh_TP] [nvarchar](255) NULL,
	[NgayDatHang] [date] NULL,
	[NgayGiaoHang] [date] NULL,
	[SoLuong] [int] NULL,
	[TongTien] [float] NULL,
	[GhiChu] [ntext] NULL,
	[MaGiamGia] [varchar](50) NULL,
	[NgayTao] [date] NULL,
	[TinhTrang] [int] NULL,
	[NgayCapNhat] [date] NULL,
	[XacNhan] [bit] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [varchar](10) NOT NULL,
	[TenKH] [nvarchar](255) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[SDT] [varchar](15) NULL,
	[Email] [varchar](255) NULL,
	[User_ID] [int] NULL,
	[TrangThai] [int] NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[GhiChu] [ntext] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LienHe]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LienHe](
	[id] [decimal](18, 0) NOT NULL,
	[ip] [nvarchar](50) NULL,
	[thoigian] [datetime] NULL,
	[name] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[tieude] [nvarchar](max) NULL,
	[noidung] [nvarchar](max) NULL,
	[trangthai] [bit] NULL,
 CONSTRAINT [PK_LienHe] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaLoai] [varchar](10) NOT NULL,
	[TenLoai] [nvarchar](255) NULL,
	[TuKhoa] [nvarchar](255) NULL,
	[TinhTrang] [int] NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[GhiChu] [ntext] NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Message2]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message2](
	[Message] [nvarchar](max) NULL,
	[thoigian] [datetime] NULL CONSTRAINT [DF_Message2_thoigian]  DEFAULT (getdate()),
	[TinhTrang] [bit] NULL,
	[id] [decimal](18, 0) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Messages1]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages1](
	[Message] [nvarchar](max) NULL,
	[thoigian] [date] NULL CONSTRAINT [DF_Messages1_thoigian]  DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [varchar](255) NOT NULL,
	[MatKhau] [varchar](50) NULL,
	[TenHienThi] [nvarchar](255) NULL,
	[Quyen] [int] NULL,
	[GhiChu] [ntext] NULL,
	[ThoiGiaDangNhapGanNhat] [datetime] NULL,
	[MaXacNhan] [varchar](50) NULL,
	[NgayTao] [datetime] NULL,
	[TinhTrang] [int] NULL,
	[NgayCapNhat] [datetime] NULL,
	[avatar] [nvarchar](250) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaNSX] [varchar](10) NOT NULL,
	[TenNSX] [nvarchar](255) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[SDT] [varchar](15) NULL,
	[TuKhoa] [nvarchar](255) NULL,
	[TrangThai] [int] NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[GhiChu] [ntext] NULL,
 CONSTRAINT [PK_NhaSanXuat] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanPham](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaSanPham] [varchar](10) NOT NULL,
	[TenSanPham] [nvarchar](255) NOT NULL,
	[LoaiSP] [int] NULL,
	[Gia] [float] NULL,
	[XuatXu] [nvarchar](255) NULL,
	[NongDo] [float] NULL,
	[DungTich] [float] NULL,
	[SoLuotXem] [int] NULL,
	[TinhTrang] [int] NULL,
	[Tag] [nvarchar](255) NULL,
	[MoTa] [ntext] NULL,
	[SoLuongTon] [int] NULL,
	[GhiChu] [ntext] NULL,
	[NhaSanXuat] [int] NULL,
	[ThuongHieu] [int] NULL,
	[ChiTietBoSung] [ntext] NULL,
	[GiaKhuyenMai] [float] NULL,
	[NamSanXuat] [int] NULL,
	[NgayTao] [datetime] NULL,
	[TuKhoa] [nvarchar](255) NULL,
	[SoLuotMua] [int] NULL,
	[url_img] [nvarchar](255) NULL,
	[Seri] [nvarchar](250) NULL,
	[NgayCapNhat] [date] NULL,
	[TypeView] [int] NULL,
	[Nrate] [float] NULL,
	[NDanhGia] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThongKe]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongKe](
	[ID] [int] NOT NULL,
	[Ngay] [int] NULL,
	[Thang] [int] NULL,
	[Nam] [int] NULL,
	[ID_SanPham] [int] NULL,
	[TenSanPham] [nvarchar](255) NULL,
	[SoLuong] [int] NULL,
	[TongTien] [float] NULL,
	[NgayTao] [date] NULL,
	[GhiChu] [ntext] NULL,
	[iduser] [int] NULL,
	[longid] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ThongKe] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ma] [varchar](10) NOT NULL,
	[TenHangSanXuat] [nvarchar](255) NULL,
	[TuKhoa] [nvarchar](50) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[TrangThai] [int] NULL,
	[GhiChu] [ntext] NULL,
 CONSTRAINT [PK_ThuongHieu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TinhTrang]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhTrang](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenTrangThai] [nvarchar](255) NULL,
	[NgayTao] [datetime] NULL,
	[NgayCapNhat] [datetime] NULL,
	[GhiChu] [ntext] NULL,
 CONSTRAINT [PK_TinhTrang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TuyenDung]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TuyenDung](
	[id] [decimal](18, 0) NULL,
	[title] [nvarchar](max) NULL,
	[img] [nvarchar](max) NULL,
	[tag] [nvarchar](max) NULL,
	[day] [datetime] NULL,
	[nview] [int] NULL,
	[rate] [float] NULL,
	[nrate] [int] NULL,
	[contents] [ntext] NULL,
	[dayupdate] [datetime] NULL,
	[usercreate] [nvarchar](max) NULL,
	[TinhTrang] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UaThich]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UaThich](
	[id] [decimal](18, 0) NOT NULL,
	[iduser] [int] NULL,
	[idsanpham] [int] NULL,
	[ip] [nvarchar](250) NULL,
 CONSTRAINT [PK_UaThich] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](56) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL DEFAULT ((0)),
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL DEFAULT ((0)),
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Website]    Script Date: 07/06/2016 01:20:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Website](
	[sdt1] [nvarchar](50) NULL,
	[sdt2] [nvarchar](50) NULL,
	[email] [nvarchar](250) NULL,
	[skype] [nvarchar](250) NULL,
	[diachi] [nvarchar](250) NULL,
	[twitter] [nvarchar](250) NULL,
	[facebook] [nvarchar](250) NULL,
	[tenshop] [nvarchar](250) NULL,
	[googlemap] [nvarchar](250) NULL,
	[linkwebsite] [nvarchar](250) NULL,
	[favaicon] [nvarchar](250) NULL,
	[thoigiantao] [datetime] NULL,
	[thoigiancapnhat] [datetime] NULL,
	[nguoichinhsua] [nvarchar](250) NULL,
	[ghichi] [nvarchar](250) NULL,
	[TinhTrang] [bit] NULL,
	[id] [decimal](18, 0) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201606061813334_InitialCreate', N'Web_MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C6D6FE33612FE7EC0FD07419F7A87D4CACBED622FB05BA44ED206B779C13ABBD76F012DD18EB012A54A549AA0E82FEB87FEA4FB0B379428597CD38BADD84EB1C0222287CF0C874372381CFA7F7FFC39FEFE390CAC279CA47E4426F6D1E8D0B6307123CF27CB899DD1C5B71FECEFBFFBFBDFC6175EF86C7D29E94E181DB424E9C47EA4343E759CD47DC4214A47A1EF26511A2DE8C88D42077991737C78F86FE7E8C8C100610396658D3F6584FA21CE3FE0731A1117C73443C175E4E120E5E55033CB51AD1B14E234462E9ED8FFC5F387EB2FD35141695B67818F408A190E16B685088928A220E3E9E714CF681291E52C860214DCBFC418E81628483197FD7445DEB51B87C7AC1BCEAA6109E566298DC29E8047275C2F8EDC7C2DEDDA95DE407317A061FAC27A9D6B6F625F79382FFA1405A00099E1E9344818F1C4BEAE589CA5F10DA6A3B2E1A880BC4C00EED728F93AAA231E589DDB1D5476743C3A64FF0EAC6916D02CC11382339AA0E0C0BACBE681EFFE07BFDC475F31999C1CCD17271FDEBD47DEC9FB7FE19377F59E425F814E2880A2BB248A7102B2E145D57FDB72C4768EDCB06A566B5368056C09A6846D5DA3E78F982CE9234C96E30FB675E93F63AF2CE1C6F599F83083A0114D32F8BCC98200CD035CD53B8D3CD9FF0D5C8FDFBD1F84EB0D7AF297F9D04BFC61E22430AF3EE120AF4D1FFDB8985EC2783F70B2CB240AD9B7685F45EDC32CCA129775263292DCA36489A928DDD859196F27936650C39B7589BAFFA6CD2455CD5B4BCA3AB4CE4C28596C7B3694F2BE2EDFCE167716C73078B969318D34199CB8518DA4960716AF5F99CC51579321D095BFF20A7811223F186009ECC0053C8F859F84B8EAE50F11181C22BD65BE43690A2B80F7134A1F1B44873F07107D86DD2C01C39C5114C6AFCEEDEE3122F8260BE7CCDEB7C76BB0A1B9FF35BA442E8D920BC25A6D8CF73172BF4619BD20DE39A2F833754B40F679EF87DD010611E7CC75719A5E8231636F1A81635D025E117A72DC1B8E2D4EBB7641A601F243BD0F222DA30F25E9CA0FD15328BE88814CE78F3489FA315AFAA49BA825A959D482A255544ED6575406D64D524E691634276895B3A01ACCC3CB476878172F87DD7F1F6FB3CDDBB416D4D438831512FF88094E6019F3EE10A53821AB11E8B26EECC259C8878F317DF5BD29E7F40505D9D0ACD69A0DF92230FC6CC861F77F36E46242F193EF31AFA4C3C1A72406F84EF4FA3355FB9C9324DBF67410BAB96DE6DB59034CD3E52C4D23D7CF678126E4C50316A2FCE0C359EDD18BA2377204043A0686EEB32D0F4AA06FB66C54B7E41C079862EBCC2D42825394BAC853D5081DF27A0856EEA81AC156911051B87F2A3CC1D271C21A2176084A61A6FA84AAD3C227AE1FA3A0554B52CB8E5B18EB7BC543AE39C731268C61AB26BA30D7073E9800151F6950DA3434766A16D76C8806AFD534E66D2EEC6ADC9578C4566CB2C57736D825F7DF5EC5309B35B605E36C564917018C41BC5D18283FAB743500F9E0B26F062A9D980C06CA5DAAAD18A8A8B11D18A8A8923767A0C511B5EBF84BE7D57D334FF1A0BCFD6DBD515D3BB04D411F7B669A85EF096D28B4C0896A9EE77356899FA9E6700672F2F359CA5D5DD94418F80C533164B3F277B57EA8D30C221B5113E0CAD05A40F9F59F02A44CA81EC295B1BC46E9B817D103B68CBB35C2F2B55F82ADD9808A5DBF06AD119A2F4B65E3EC74FAA87A56598362E49D0E0B351C8D41C88B97D8F10E4A31C56555C574F185FB78C3B58EF1C16850508BE76A5052D999C1B5549A66BB96740E591F976C232D49EE93414B656706D712B7D17625699C821E6EC1462A12B7F081265B19E9A8769BAA6EEC149951BC60EC1852A8C6D7288E7DB2ACA554F1126B56E4534DBF9DF54F360A0B0CC74D35394795B415271A256889A55A600D925EFA494ACF114573C4E23C532F54C8B47BAB61F92F59D6B74F7510CB7DA0A4667F172DA44B7B619F551D11DEFE127A17326F260FA16BC65EDFDC62E96D284089266A3F8D822C2466E7CADCBAB8BBABB72F4A5484B123C9AF384F8AA6141757547BA7415127C4000354F92DEB0F9219C2A4EAD2EBAC2BDBE4899A51CAC0541DC514ACDAD9A0991C98CE0325FB85FDC7A915E175E6134F46A903F0A29E18B57C0605AC56D71D554C39A9638A35DD11A5BC923AA454D543CA7AF6882064BD622D3C8346F514DD39A8F9227574B5B63BB22673A40EADA95E035B23B35CD71D55935C5207D65477C75E659AC80BE81EEF58C6D3CA5A5B567198DD6CCF3260BCCE6A38CC9657BBB3AF03D58A7B62F15B79058C97EFA525194F746B595211BFD8CC920C18E61547B8E916179CC6EB7933A6707D2D2CEA4DD7F766BC7EF6FAAA56A11CE664928A7B75A8930E6F637E906A7F24A39CAC0A12DB2AD5081BFA4B4A71386204A3D92FC134F0315BBE4B826B44FC054E6991B2611F1F1E1D4B6F6DF6E7DD8B93A65EA039889A1EBF8863B685EC2BF28412F711256A2EC4066F4356A04A98F98A78F87962FF96B73ACD2316ECAFBCF8C0BA4A3F13FF970C2AEE930C5BBFABB99DC3E4CA371FACF6F4654377AD5EFDFC50343DB06E139831A7D6A1A4CB7546587CEFD04B9AA2E906D2ACFD0AE2ED4E28E1A98116559A10EBBF2C98FB74905705A594DF84E8F91F7D45D3BE1CD80851F33A6028BC415468CAFE5F07CB98F9EFC127CD33FFFB7556FF12601DD18CAF007CD21F4C7E03D07D192A5BEE70ABD19C87B6B124E57A6ECDA1DE28A172D77B93926ABDD14457D3A97BC06D9032BD8665BCB16CE3C176474D32F160D8BB34ED57CF20DE97A4E1553AC76E7385B7991EDC7015F497CA0ADE833C364D5ECEEE737FB76D6BA618EE9E2750F6CBF0DD3363E3D95ABBCFE3DDB6B199C2BC7B6E6CBDB275F7CCD676B57FEED8D23A6FA13BCFBD55D3880C7731BA58705B6E6D11388713FE3C0223283CCAE249A43E99AB2911B585E18AC4CCD49C45263356268EC257A16866DBAFAF7CC36FEC2CA769666BC8BD6CE2CDD7FF46DE9CA699B721A3711759C1DA9C425DA676CB3AD694F8F496B280859EB4249DB7F9AC8D17EB6F29E97710A508B3C77047FC76727C0751C99053A7474EAF7ADD0B7B67ED971361FF4EFDE50A82FD8E22C1AEB06B5634576411959BB7245149224568AE31451E6CA96709F517C8A550CD62CCF99BEE3C6EC76E3AE6D8BB22B7198D330A5DC6E13C10025ECC0968E29F272E8B328F6FE3FCE74986E80288E9B3D8FC2DF921F303AF92FB521313324030EF824774D9585216D95DBE54483711E908C4D5573945F7388C03004B6FC90C3DE1756403F3FB8897C87D5945004D20ED0321AA7D7CEEA36582C29463ACDAC327D8B0173E7FF77F38B6BD0640540000, N'6.1.3-40302')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'62de39f2-2e12-4300-a79a-7273d6f18f53', N'bqdat.it@gmail.com', 0, N'APaH73DHEmGk6iZh4+RftWn+Bgb1e3Mfpd6grpxgYBmPFgCnUsXPLkQp6ByTz2te7g==', N'cbe9d467-6459-4a9f-bdce-b2e7f2917b49', NULL, 0, 0, NULL, 1, 0, N'bqdat.it@gmail.com')
SET IDENTITY_INSERT [dbo].[DanhGia] ON 

INSERT [dbo].[DanhGia] ([ID], [SanPham_ID], [DanhGia], [Rate], [GhiChu], [TrangThai], [TacGia], [NgayTao]) VALUES (1, 2, N'sản phẩm đẹp', 5, N'', 1, N'User', CAST(N'2016-05-18 07:42:41.187' AS DateTime))
INSERT [dbo].[DanhGia] ([ID], [SanPham_ID], [DanhGia], [Rate], [GhiChu], [TrangThai], [TacGia], [NgayTao]) VALUES (2, 2, N'sản phẩm đẹp', 5, N'', 1, N'User', CAST(N'2016-05-18 07:42:47.403' AS DateTime))
SET IDENTITY_INSERT [dbo].[DanhGia] OFF
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([ID], [MaHD], [KH_ID], [TenNguoiNhan], [SoNha], [Duong], [Quan_Huyen], [Tinh_TP], [NgayDatHang], [NgayGiaoHang], [SoLuong], [TongTien], [GhiChu], [MaGiamGia], [NgayTao], [TinhTrang], [NgayCapNhat], [XacNhan]) VALUES (1, N'HDW0000002      ', 1, N'sad', N'a', N'a', N'a', N'a', CAST(N'2016-06-02' AS Date), CAST(N'2016-06-01' AS Date), 1, 1, N'd', N'd', CAST(N'2016-06-02' AS Date), 1, CAST(N'2016-06-02' AS Date), 0)
INSERT [dbo].[HoaDon] ([ID], [MaHD], [KH_ID], [TenNguoiNhan], [SoNha], [Duong], [Quan_Huyen], [Tinh_TP], [NgayDatHang], [NgayGiaoHang], [SoLuong], [TongTien], [GhiChu], [MaGiamGia], [NgayTao], [TinhTrang], [NgayCapNhat], [XacNhan]) VALUES (2, N'HDW0000003      ', 1, N'sad', N'a', N'a', N'a', N'a', CAST(N'2016-06-02' AS Date), CAST(N'2016-06-01' AS Date), 1, 1, N'd', N'd', CAST(N'2016-06-02' AS Date), 1, CAST(N'2016-06-02' AS Date), 0)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([ID], [MaKH], [TenKH], [DiaChi], [SDT], [Email], [User_ID], [TrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (1, N'KH00000002', N'tamnt52', N'sdfhjbdbh', N'1535131531', N'tamthanh770@gmail.com', 2, 1, CAST(N'2016-05-17 03:45:19.247' AS DateTime), CAST(N'2016-05-17 03:45:19.247' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
INSERT [dbo].[LienHe] ([id], [ip], [thoigian], [name], [email], [tieude], [noidung], [trangthai]) VALUES (CAST(63598590751 AS Decimal(18, 0)), N'::1', CAST(N'2016-05-11 19:12:31.853' AS DateTime), N'thanh tam', N'tamthanh770@gmail.com', N'ajksbvjabv', N'jkdsjvbsjdbdss', 0)
INSERT [dbo].[LienHe] ([id], [ip], [thoigian], [name], [email], [tieude], [noidung], [trangthai]) VALUES (CAST(63598590871 AS Decimal(18, 0)), N'::1', CAST(N'2016-05-11 19:14:31.990' AS DateTime), N'gsdgsdgs', N'tamthanh770@gmail.com', N'sdsgsdg', N'dsgdsgsdg', 0)
INSERT [dbo].[LienHe] ([id], [ip], [thoigian], [name], [email], [tieude], [noidung], [trangthai]) VALUES (CAST(63598591465 AS Decimal(18, 0)), N'::1', CAST(N'2016-05-11 19:24:25.093' AS DateTime), N'van sine', N'tamthanh770@gmail.com', N'tieu de rong', N'sndkgnsdkjdnsnvsdvnsdvksdnvkjsdnvksbsdb', 0)
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON 

INSERT [dbo].[LoaiSanPham] ([ID], [MaLoai], [TenLoai], [TuKhoa], [TinhTrang], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (1, N'WINECA0002', N'loại 1', N'laooi', 3, CAST(N'2016-05-06 13:41:45.207' AS DateTime), CAST(N'2016-05-06 13:41:45.207' AS DateTime), N'jnvjcbvjhbfd')
INSERT [dbo].[LoaiSanPham] ([ID], [MaLoai], [TenLoai], [TuKhoa], [TinhTrang], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (2, N'WINECA0003', N'Rượu Ngoại', N'ruou_ngoai', 1, CAST(N'2016-05-09 22:17:58.633' AS DateTime), CAST(N'2016-05-09 22:17:58.633' AS DateTime), N'rượu nhập khẩu')
INSERT [dbo].[LoaiSanPham] ([ID], [MaLoai], [TenLoai], [TuKhoa], [TinhTrang], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (3, N'WINECA0004', N'Rượi Vang', N'ruou_vang', 1, CAST(N'2016-05-09 22:18:11.773' AS DateTime), CAST(N'2016-05-09 22:18:11.773' AS DateTime), N'')
INSERT [dbo].[LoaiSanPham] ([ID], [MaLoai], [TenLoai], [TuKhoa], [TinhTrang], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (4, N'WINECA0005', N'Rượu Nhật', N'ruou_nhat', 1, CAST(N'2016-05-09 22:18:21.540' AS DateTime), CAST(N'2016-05-09 22:18:21.540' AS DateTime), N'')
INSERT [dbo].[LoaiSanPham] ([ID], [MaLoai], [TenLoai], [TuKhoa], [TinhTrang], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (5, N'WINECA0006', N'Rượu Hàn', N'ruou_han', 1, CAST(N'2016-05-09 22:18:31.723' AS DateTime), CAST(N'2016-05-09 22:18:31.723' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
INSERT [dbo].[Message2] ([Message], [thoigian], [TinhTrang], [id]) VALUES (N'fgfgsdfg', CAST(N'2016-05-18 08:49:39.397' AS DateTime), 0, CAST(5555 AS Decimal(18, 0)))
INSERT [dbo].[Message2] ([Message], [thoigian], [TinhTrang], [id]) VALUES (N'jbsdjfusdj', CAST(N'2016-05-18 08:49:50.317' AS DateTime), 0, CAST(6666 AS Decimal(18, 0)))
INSERT [dbo].[Message2] ([Message], [thoigian], [TinhTrang], [id]) VALUES (N'tamtam vừa xoá role vbfgnfg', CAST(N'2016-05-18 12:45:25.060' AS DateTime), 0, CAST(63599172324993 AS Decimal(18, 0)))
INSERT [dbo].[Message2] ([Message], [thoigian], [TinhTrang], [id]) VALUES (N'tamtam vừa xoá role saaa', CAST(N'2016-05-18 12:45:27.407' AS DateTime), 0, CAST(63599172327388 AS Decimal(18, 0)))
INSERT [dbo].[Message2] ([Message], [thoigian], [TinhTrang], [id]) VALUES (N'tamtam vừa xoá role sa', CAST(N'2016-05-18 12:45:29.847' AS DateTime), 0, CAST(63599172329818 AS Decimal(18, 0)))
INSERT [dbo].[Message2] ([Message], [thoigian], [TinhTrang], [id]) VALUES (N'tamtam vừa tạo 1 role mới  adssd', CAST(N'2016-05-18 12:45:35.547' AS DateTime), 0, CAST(63599172335532 AS Decimal(18, 0)))
INSERT [dbo].[Message2] ([Message], [thoigian], [TinhTrang], [id]) VALUES (N'tamtam vừa tạo 1 role mới  sdfsdf', CAST(N'2016-05-18 12:45:37.837' AS DateTime), 0, CAST(63599172337837 AS Decimal(18, 0)))
INSERT [dbo].[Message2] ([Message], [thoigian], [TinhTrang], [id]) VALUES (N'tamtam vừa xoá role sdfsdf', CAST(N'2016-05-18 12:45:39.817' AS DateTime), 0, CAST(63599172339817 AS Decimal(18, 0)))
INSERT [dbo].[Message2] ([Message], [thoigian], [TinhTrang], [id]) VALUES (N'tamtam vừa xoá role bb', CAST(N'2016-05-18 12:45:40.390' AS DateTime), 1, CAST(63599172340389 AS Decimal(18, 0)))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'adfas', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'231afa', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'hjahfbhasbf', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'456sad', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'asasfasfas', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'asfasf4363', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'asfsafaf34643', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'asfasfasf', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'asgdsagfdgj', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'asfasfas', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'agdsgds', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'asfasfas', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'asfasfasf', CAST(N'2016-05-03' AS Date))
INSERT [dbo].[Messages1] ([Message], [thoigian]) VALUES (N'dgsdgdhmsdbv', CAST(N'2016-05-03' AS Date))
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([ID], [TenDangNhap], [MatKhau], [TenHienThi], [Quyen], [GhiChu], [ThoiGiaDangNhapGanNhat], [MaXacNhan], [NgayTao], [TinhTrang], [NgayCapNhat], [avatar]) VALUES (1, N'tamtam', N'', N'', 1, N'tamthanh771@gmail.com', CAST(N'2016-05-07 02:36:18.507' AS DateTime), N'4team', CAST(N'2016-05-07 02:36:18.507' AS DateTime), 1, CAST(N'2016-05-07 02:36:18.507' AS DateTime), N'HinhAnh/avatar/07052016_030216_AM_10626539_899656320153722_3599533380482127467_n.jpg')
INSERT [dbo].[NguoiDung] ([ID], [TenDangNhap], [MatKhau], [TenHienThi], [Quyen], [GhiChu], [ThoiGiaDangNhapGanNhat], [MaXacNhan], [NgayTao], [TinhTrang], [NgayCapNhat], [avatar]) VALUES (2, N'tamnt5293', N'123456789', N'tamnt52', 2, N'', CAST(N'2016-05-17 03:45:19.100' AS DateTime), N'', CAST(N'2016-05-17 03:45:19.100' AS DateTime), 1, CAST(N'2016-05-17 03:45:19.100' AS DateTime), N'../../App_Themes/FrontEnd/img/avart/default.png')
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
SET IDENTITY_INSERT [dbo].[NhaSanXuat] ON 

INSERT [dbo].[NhaSanXuat] ([ID], [MaNSX], [TenNSX], [DiaChi], [SDT], [TuKhoa], [TrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (1, N'PNX0000002', N'lambo', N'162 paster quận 3', N'0164 444 5555', N'lambo', 3, CAST(N'2016-05-09 10:11:16.263' AS DateTime), CAST(N'2016-05-09 10:11:16.263' AS DateTime), N'lambo')
INSERT [dbo].[NhaSanXuat] ([ID], [MaNSX], [TenNSX], [DiaChi], [SDT], [TuKhoa], [TrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (2, N'PNX0000003', N'Nhật', N'Tokyo', N'0123456789', N'nhat', 1, CAST(N'2016-05-09 22:12:57.117' AS DateTime), CAST(N'2016-05-09 22:16:02.243' AS DateTime), N'nhật bản')
INSERT [dbo].[NhaSanXuat] ([ID], [MaNSX], [TenNSX], [DiaChi], [SDT], [TuKhoa], [TrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (3, N'PNX0000004', N'Pháp', N'Pari', N'0123456789', N'phap', 1, CAST(N'2016-05-09 22:16:30.380' AS DateTime), CAST(N'2016-05-09 22:16:30.380' AS DateTime), N'Pháp ')
INSERT [dbo].[NhaSanXuat] ([ID], [MaNSX], [TenNSX], [DiaChi], [SDT], [TuKhoa], [TrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (4, N'PNX0000005', N'Việt Nam', N'Hồ chí minh', N'0123456789', N'vn', 1, CAST(N'2016-05-09 22:17:07.867' AS DateTime), CAST(N'2016-05-09 22:17:18.463' AS DateTime), N'Việt nam')
SET IDENTITY_INSERT [dbo].[NhaSanXuat] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([ID], [MaSanPham], [TenSanPham], [LoaiSP], [Gia], [XuatXu], [NongDo], [DungTich], [SoLuotXem], [TinhTrang], [Tag], [MoTa], [SoLuongTon], [GhiChu], [NhaSanXuat], [ThuongHieu], [ChiTietBoSung], [GiaKhuyenMai], [NamSanXuat], [NgayTao], [TuKhoa], [SoLuotMua], [url_img], [Seri], [NgayCapNhat], [TypeView], [Nrate], [NDanhGia]) VALUES (1, N'PWI0000002', N'chivas 1', 2, 450000, N'pháp', 30, 1, 2, 1, N'chivas', N'Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm ', 20, N'sản phẩm bán chạy', 3, 4, N'', 400000, 1990, CAST(N'2016-05-09 23:24:37.253' AS DateTime), N'', 0, N'../../App_Themes/FrontEnd/img/SanPhams/09052016_112437_PM_conmeo.jpg', N'', CAST(N'2016-05-09' AS Date), 1, 0, 0)
INSERT [dbo].[SanPham] ([ID], [MaSanPham], [TenSanPham], [LoaiSP], [Gia], [XuatXu], [NongDo], [DungTich], [SoLuotXem], [TinhTrang], [Tag], [MoTa], [SoLuongTon], [GhiChu], [NhaSanXuat], [ThuongHieu], [ChiTietBoSung], [GiaKhuyenMai], [NamSanXuat], [NgayTao], [TuKhoa], [SoLuotMua], [url_img], [Seri], [NgayCapNhat], [TypeView], [Nrate], [NDanhGia]) VALUES (2, N'PWI0000003', N'hennessy', 2, 300000, N'Đức', 40, 1.5, 5, 1, N'', N'Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm ', 10, N'sản phẩm mới', 3, 6, N'Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung ', 300000, 1990, CAST(N'2016-05-09 23:32:06.410' AS DateTime), N'', 0, N'../../App_Themes/FrontEnd/img/SanPhams/09052016_113206_PM_conmeo.jpg', N'', CAST(N'2016-05-09' AS Date), 0, 5, 2)
INSERT [dbo].[SanPham] ([ID], [MaSanPham], [TenSanPham], [LoaiSP], [Gia], [XuatXu], [NongDo], [DungTich], [SoLuotXem], [TinhTrang], [Tag], [MoTa], [SoLuongTon], [GhiChu], [NhaSanXuat], [ThuongHieu], [ChiTietBoSung], [GiaKhuyenMai], [NamSanXuat], [NgayTao], [TuKhoa], [SoLuotMua], [url_img], [Seri], [NgayCapNhat], [TypeView], [Nrate], [NDanhGia]) VALUES (3, N'PWI0000004', N'XO 1', 4, 1000000, N'Đức', 30, 2, 1, 1, N'', N'Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm ', 15, N'sản phẩm thường', 2, 5, N'Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung ', 1000000, 1990, CAST(N'2016-05-09 23:34:25.637' AS DateTime), N'', 0, N'../../App_Themes/FrontEnd/img/SanPhams/09052016_113425_PM_conmeo.jpg', N'', CAST(N'2016-05-09' AS Date), 2, 0, 0)
INSERT [dbo].[SanPham] ([ID], [MaSanPham], [TenSanPham], [LoaiSP], [Gia], [XuatXu], [NongDo], [DungTich], [SoLuotXem], [TinhTrang], [Tag], [MoTa], [SoLuongTon], [GhiChu], [NhaSanXuat], [ThuongHieu], [ChiTietBoSung], [GiaKhuyenMai], [NamSanXuat], [NgayTao], [TuKhoa], [SoLuotMua], [url_img], [Seri], [NgayCapNhat], [TypeView], [Nrate], [NDanhGia]) VALUES (4, N'PWI0000005', N'volka', 4, 200000, N'vn', 30, 1, 0, 1, N'', N'Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm ', 0, N'sản phẩm sắp bán', 4, 6, N'Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung ', 200000, 1990, CAST(N'2016-05-09 23:35:25.833' AS DateTime), N'', 0, N'../../App_Themes/FrontEnd/img/SanPhams/09052016_113525_PM_conmeo.jpg', N'', CAST(N'2016-05-09' AS Date), 3, 0, 0)
INSERT [dbo].[SanPham] ([ID], [MaSanPham], [TenSanPham], [LoaiSP], [Gia], [XuatXu], [NongDo], [DungTich], [SoLuotXem], [TinhTrang], [Tag], [MoTa], [SoLuongTon], [GhiChu], [NhaSanXuat], [ThuongHieu], [ChiTietBoSung], [GiaKhuyenMai], [NamSanXuat], [NgayTao], [TuKhoa], [SoLuotMua], [url_img], [Seri], [NgayCapNhat], [TypeView], [Nrate], [NDanhGia]) VALUES (5, N'PWI0000006', N'XO 2', 2, 200000, N'pháp', 30, 1, 0, 1, N'', N'Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm Mô tả sản phẩm ', 3, N'sản phẩm đặt biệt', 3, 5, N'Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung Chi tiết bổ sung ', 200000, 1999, CAST(N'2016-05-09 23:42:44.153' AS DateTime), N'', 0, N'../../App_Themes/FrontEnd/img/SanPhams/09052016_114244_PM_conmeo.jpg', N'', CAST(N'2016-05-09' AS Date), 4, 0, 0)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET IDENTITY_INSERT [dbo].[ThuongHieu] ON 

INSERT [dbo].[ThuongHieu] ([ID], [Ma], [TenHangSanXuat], [TuKhoa], [NgayTao], [NgayCapNhat], [TrangThai], [GhiChu]) VALUES (1, N'PMA0000002', N'cha mi ngu', N'asd', CAST(N'2016-05-06 14:36:20.040' AS DateTime), CAST(N'2016-05-09 22:50:29.263' AS DateTime), 3, N'')
INSERT [dbo].[ThuongHieu] ([ID], [Ma], [TenHangSanXuat], [TuKhoa], [NgayTao], [NgayCapNhat], [TrangThai], [GhiChu]) VALUES (2, N'PMA0000003', N'cha mi ngu', N'asd', CAST(N'2016-05-06 14:36:36.183' AS DateTime), CAST(N'2016-05-09 22:50:35.470' AS DateTime), 3, N'')
INSERT [dbo].[ThuongHieu] ([ID], [Ma], [TenHangSanXuat], [TuKhoa], [NgayTao], [NgayCapNhat], [TrangThai], [GhiChu]) VALUES (3, N'PMA0000004', N'cha mi ngu', N'asd', CAST(N'2016-05-06 14:36:46.543' AS DateTime), CAST(N'2016-05-09 22:50:46.227' AS DateTime), 3, N'')
INSERT [dbo].[ThuongHieu] ([ID], [Ma], [TenHangSanXuat], [TuKhoa], [NgayTao], [NgayCapNhat], [TrangThai], [GhiChu]) VALUES (4, N'PMA0000005', N'Chivas', N'chivas', CAST(N'2016-05-09 22:42:55.777' AS DateTime), CAST(N'2016-05-09 22:42:55.777' AS DateTime), 1, N'')
INSERT [dbo].[ThuongHieu] ([ID], [Ma], [TenHangSanXuat], [TuKhoa], [NgayTao], [NgayCapNhat], [TrangThai], [GhiChu]) VALUES (5, N'PMA0000006', N'XO', N'xo', CAST(N'2016-05-09 22:43:13.523' AS DateTime), CAST(N'2016-05-09 22:43:13.523' AS DateTime), 1, N'')
INSERT [dbo].[ThuongHieu] ([ID], [Ma], [TenHangSanXuat], [TuKhoa], [NgayTao], [NgayCapNhat], [TrangThai], [GhiChu]) VALUES (6, N'PMA0000007', N'Hennessy', N'hennessy', CAST(N'2016-05-09 22:43:34.040' AS DateTime), CAST(N'2016-05-09 22:43:34.040' AS DateTime), 1, N'')
INSERT [dbo].[ThuongHieu] ([ID], [Ma], [TenHangSanXuat], [TuKhoa], [NgayTao], [NgayCapNhat], [TrangThai], [GhiChu]) VALUES (7, N'PMA0000008', N'Chivas', N'', CAST(N'2016-05-18 07:38:09.433' AS DateTime), CAST(N'2016-05-18 07:38:09.433' AS DateTime), 1, N'')
SET IDENTITY_INSERT [dbo].[ThuongHieu] OFF
SET IDENTITY_INSERT [dbo].[TinhTrang] ON 

INSERT [dbo].[TinhTrang] ([ID], [TenTrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (1, N'Đang hoạt động', CAST(N'2016-05-01 23:07:19.323' AS DateTime), CAST(N'2016-05-01 23:07:19.323' AS DateTime), N'')
INSERT [dbo].[TinhTrang] ([ID], [TenTrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (2, N'Đang chờ xét duyệt', CAST(N'2016-05-01 23:09:31.620' AS DateTime), CAST(N'2016-05-01 23:09:31.620' AS DateTime), N'')
INSERT [dbo].[TinhTrang] ([ID], [TenTrangThai], [NgayTao], [NgayCapNhat], [GhiChu]) VALUES (3, N'Tạm khoá', CAST(N'2016-05-01 23:09:31.623' AS DateTime), CAST(N'2016-05-01 23:09:31.623' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[TinhTrang] OFF
INSERT [dbo].[TuyenDung] ([id], [title], [img], [tag], [day], [nview], [rate], [nrate], [contents], [dayupdate], [usercreate], [TinhTrang]) VALUES (CAST(635983146559059039 AS Decimal(18, 0)), N'abc', N'../App_Themes/FrontEnd/img/08052016_023041_PM_e749eee0efdd262f8571458fa9594327.jpg', N'abc', CAST(N'2016-05-08 14:30:55.933' AS DateTime), 0, 0, 0, N'<p>dgsdgsdgsd</p>
', CAST(N'2016-05-08 14:30:55.933' AS DateTime), N'tamnt', 1)
INSERT [dbo].[TuyenDung] ([id], [title], [img], [tag], [day], [nview], [rate], [nrate], [contents], [dayupdate], [usercreate], [TinhTrang]) VALUES (CAST(635983149475782952 AS Decimal(18, 0)), N'abc1', N'../App_Themes/FrontEnd/img/08052016_023547_PM_eden_nebula_2-wallpaper-1366x768.jpg', N'abc', CAST(N'2016-05-08 14:35:47.683' AS DateTime), 0, 0, 0, N'<p>thanhtam</p>', CAST(N'2016-05-08 14:35:47.683' AS DateTime), N'tamnt', 1)
INSERT [dbo].[TuyenDung] ([id], [title], [img], [tag], [day], [nview], [rate], [nrate], [contents], [dayupdate], [usercreate], [TinhTrang]) VALUES (CAST(635983150647636943 AS Decimal(18, 0)), N'asfasfa', N'../App_Themes/FrontEnd/img/08052016_023547_PM_eden_nebula_2-wallpaper-1366x768.jpg', N'abc', CAST(N'2016-05-08 14:37:44.790' AS DateTime), 0, 0, 0, N'<p>asfasfasfasf</p>
', CAST(N'2016-05-08 14:37:44.790' AS DateTime), N'tamnt', 1)
INSERT [dbo].[TuyenDung] ([id], [title], [img], [tag], [day], [nview], [rate], [nrate], [contents], [dayupdate], [usercreate], [TinhTrang]) VALUES (CAST(635983170127850706 AS Decimal(18, 0)), N'adadbsdfbdgngfndgnf', N'../App_Themes/FrontEnd/img/08052016_023547_PM_eden_nebula_2-wallpaper-1366x768.jpg', N'abc', CAST(N'2016-05-08 15:10:12.833' AS DateTime), 0, 2.5, 0, N'<p>sfnsfndnbnfdbfdbdfnbdfdfndfndfn</p>
', CAST(N'2016-05-08 15:10:12.833' AS DateTime), N'tamnt', 1)
INSERT [dbo].[TuyenDung] ([id], [title], [img], [tag], [day], [nview], [rate], [nrate], [contents], [dayupdate], [usercreate], [TinhTrang]) VALUES (CAST(635983370778189946 AS Decimal(18, 0)), N'sfgsdsdb', N'../App_Themes/FrontEnd/img/08052016_084437_PM_e749eee0efdd262f8571458fa9594327.jpg', N'abc', CAST(N'2016-05-08 20:44:37.847' AS DateTime), 0, 0, 0, N'<p>sdbdsbsdbsdbsdb</p>
', CAST(N'2016-05-08 20:44:37.847' AS DateTime), N'tamnt', 1)
INSERT [dbo].[TuyenDung] ([id], [title], [img], [tag], [day], [nview], [rate], [nrate], [contents], [dayupdate], [usercreate], [TinhTrang]) VALUES (CAST(635983370908201543 AS Decimal(18, 0)), N'sdbdbsd', N'../App_Themes/FrontEnd/img/08052016_084450_PM_e749eee0efdd262f8571458fa9594327.jpg', N'abc', CAST(N'2016-05-08 20:44:50.827' AS DateTime), 0, 0, 0, N'<p>bsdbsdbsdb</p>
', CAST(N'2016-05-08 20:44:50.827' AS DateTime), N'tamnt', 1)
INSERT [dbo].[TuyenDung] ([id], [title], [img], [tag], [day], [nview], [rate], [nrate], [contents], [dayupdate], [usercreate], [TinhTrang]) VALUES (CAST(635983370997262973 AS Decimal(18, 0)), N'sdbsdbdsb', N'../App_Themes/FrontEnd/img/08052016_084459_PM_e749eee0efdd262f8571458fa9594327.jpg', N'abc', CAST(N'2016-05-08 20:44:59.730' AS DateTime), 0, 0, 0, N'<p>sdbadbwbdb</p>
', CAST(N'2016-05-08 20:44:59.730' AS DateTime), N'tamnt', 1)
INSERT [dbo].[UaThich] ([id], [iduser], [idsanpham], [ip]) VALUES (CAST(63599053592862 AS Decimal(18, 0)), 2, 5, N'::1')
INSERT [dbo].[UaThich] ([id], [iduser], [idsanpham], [ip]) VALUES (CAST(63599054963708 AS Decimal(18, 0)), 2, 5, N'::1')
INSERT [dbo].[UaThich] ([id], [iduser], [idsanpham], [ip]) VALUES (CAST(63599055274265 AS Decimal(18, 0)), 2, 5, N'::1')
INSERT [dbo].[UaThich] ([id], [iduser], [idsanpham], [ip]) VALUES (CAST(63599056372503 AS Decimal(18, 0)), 2, 2, N'::1')
INSERT [dbo].[UaThich] ([id], [iduser], [idsanpham], [ip]) VALUES (CAST(63599056377701 AS Decimal(18, 0)), 2, 1, N'::1')
INSERT [dbo].[UaThich] ([id], [iduser], [idsanpham], [ip]) VALUES (CAST(63599056387972 AS Decimal(18, 0)), 2, 4, N'::1')
INSERT [dbo].[UaThich] ([id], [iduser], [idsanpham], [ip]) VALUES (CAST(63599056397890 AS Decimal(18, 0)), 2, 3, N'::1')
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([UserId], [UserName]) VALUES (1, N'Admin')
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (1, CAST(N'2016-06-06 18:13:27.867' AS DateTime), NULL, 1, NULL, 0, N'AGGtd7o9BhXWrUc6yP85ye9o9qfg5vsj7enrjn1SApD5cUx/Umj3bic9D8VrbEzmJw==', CAST(N'2016-06-06 18:13:27.867' AS DateTime), N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[webpages_Roles] ON 

INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (1, N'Administrator')
SET IDENTITY_INSERT [dbo].[webpages_Roles] OFF
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[Website] ([sdt1], [sdt2], [email], [skype], [diachi], [twitter], [facebook], [tenshop], [googlemap], [linkwebsite], [favaicon], [thoigiantao], [thoigiancapnhat], [nguoichinhsua], [ghichi], [TinhTrang], [id]) VALUES (N'0164414356', N'23t2352352', N'tamthanh770@gmail.com', N'asgasg', N'agagagas', N'dsdsvsdvsd', N'sgasgasgasg', N'sdvdsvsvssdv', N'vsdvsdvsdv', N'sgasgasgsgasga', N'../App_Themes/FrontEnd/img/08052016_033311_AM_e749eee0efdd262f8571458fa9594327.jpg', CAST(N'2016-05-08 03:33:11.870' AS DateTime), CAST(N'2016-05-08 03:33:11.870' AS DateTime), N'tamnt', N'tamnt', 0, CAST(635982751917321588 AS Decimal(18, 0)))
INSERT [dbo].[Website] ([sdt1], [sdt2], [email], [skype], [diachi], [twitter], [facebook], [tenshop], [googlemap], [linkwebsite], [favaicon], [thoigiantao], [thoigiancapnhat], [nguoichinhsua], [ghichi], [TinhTrang], [id]) VALUES (N'0164414356', N'23t2352352', N'tamthanh770@gmail.com', N'asgasg', N'agagagas', N'dsdsvsdvsd', N'sgasgasgasg', N'sdvdsvsvssdv', N'vsdvsdvsdv', N'sgasgasgsgasga', N'', CAST(N'2016-05-08 03:36:04.070' AS DateTime), CAST(N'2016-05-08 03:36:04.070' AS DateTime), N'tamnt', N'tamnt', 0, CAST(635982753640474639 AS Decimal(18, 0)))
INSERT [dbo].[Website] ([sdt1], [sdt2], [email], [skype], [diachi], [twitter], [facebook], [tenshop], [googlemap], [linkwebsite], [favaicon], [thoigiantao], [thoigiancapnhat], [nguoichinhsua], [ghichi], [TinhTrang], [id]) VALUES (N'0164414356', N'23t2352352', N'tamthanh770@gmail.com', N'asgasg', N'agagagas', N'dsdsvsdvsd', N'sgasgasgasg', N'bbbbbbbbbbbbbb', N'vsdvsdvsdv', N'sgasgasgsgasga', N'', CAST(N'2016-05-08 03:45:44.670' AS DateTime), CAST(N'2016-05-08 03:45:44.670' AS DateTime), N'tamnt', N'tamnt', 1, CAST(635982759446025110 AS Decimal(18, 0)))
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 07/06/2016 01:20:21 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 07/06/2016 01:20:21 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 07/06/2016 01:20:21 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 07/06/2016 01:20:21 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 07/06/2016 01:20:21 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 07/06/2016 01:20:21 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__HoaDon__2725A6E1BF79F9B5]    Script Date: 07/06/2016 01:20:21 ******/
ALTER TABLE [dbo].[HoaDon] ADD UNIQUE NONCLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__KhachHan__2725CF1FBCA12F92]    Script Date: 07/06/2016 01:20:21 ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__LoaiSanP__730A57580C82235F]    Script Date: 07/06/2016 01:20:21 ******/
ALTER TABLE [dbo].[LoaiSanPham] ADD UNIQUE NONCLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__NguoiDun__55F68FC07088954F]    Script Date: 07/06/2016 01:20:21 ******/
ALTER TABLE [dbo].[NguoiDung] ADD UNIQUE NONCLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__NhaSanXu__3A1BDBD319B1F81E]    Script Date: 07/06/2016 01:20:21 ******/
ALTER TABLE [dbo].[NhaSanXuat] ADD UNIQUE NONCLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__SanPham__FAC7442C4E13F472]    Script Date: 07/06/2016 01:20:21 ******/
ALTER TABLE [dbo].[SanPham] ADD UNIQUE NONCLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__ThuongHi__3214CC9EB3867399]    Script Date: 07/06/2016 01:20:21 ******/
ALTER TABLE [dbo].[ThuongHieu] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__UserProf__C9F284567EF3A9A6]    Script Date: 07/06/2016 01:20:21 ******/
ALTER TABLE [dbo].[UserProfile] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__webpages__8A2B61603E9E25D4]    Script Date: 07/06/2016 01:20:21 ******/
ALTER TABLE [dbo].[webpages_Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_SanPham] FOREIGN KEY([SanPham_ID])
REFERENCES [dbo].[SanPham] ([ID])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_SanPham]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_TinhTrang] FOREIGN KEY([TrangThai])
REFERENCES [dbo].[TinhTrang] ([ID])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_TinhTrang]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_Order] FOREIGN KEY([HD_ID])
REFERENCES [dbo].[HoaDon] ([ID])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_Order]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_SanPham] FOREIGN KEY([SanPham_ID])
REFERENCES [dbo].[SanPham] ([ID])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_SanPham]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_TinhTrang] FOREIGN KEY([TrangThai])
REFERENCES [dbo].[TinhTrang] ([ID])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_TinhTrang]
GO
ALTER TABLE [dbo].[HinhAnh]  WITH CHECK ADD  CONSTRAINT [FK_Image_SanPham] FOREIGN KEY([SanPham_ID])
REFERENCES [dbo].[SanPham] ([ID])
GO
ALTER TABLE [dbo].[HinhAnh] CHECK CONSTRAINT [FK_Image_SanPham]
GO
ALTER TABLE [dbo].[HinhAnh]  WITH CHECK ADD  CONSTRAINT [FK_Image_TinhTrang] FOREIGN KEY([TrangThai])
REFERENCES [dbo].[TinhTrang] ([ID])
GO
ALTER TABLE [dbo].[HinhAnh] CHECK CONSTRAINT [FK_Image_TinhTrang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_Order_KhachHang] FOREIGN KEY([KH_ID])
REFERENCES [dbo].[KhachHang] ([ID])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_Order_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_Order_TinhTrang] FOREIGN KEY([TinhTrang])
REFERENCES [dbo].[TinhTrang] ([ID])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_Order_TinhTrang]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_TinhTrang] FOREIGN KEY([TrangThai])
REFERENCES [dbo].[TinhTrang] ([ID])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_TinhTrang]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[NguoiDung] ([ID])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_User]
GO
ALTER TABLE [dbo].[LoaiSanPham]  WITH CHECK ADD  CONSTRAINT [FK_LoaiSanPham_TinhTrang] FOREIGN KEY([TinhTrang])
REFERENCES [dbo].[TinhTrang] ([ID])
GO
ALTER TABLE [dbo].[LoaiSanPham] CHECK CONSTRAINT [FK_LoaiSanPham_TinhTrang]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_User_TinhTrang] FOREIGN KEY([TinhTrang])
REFERENCES [dbo].[TinhTrang] ([ID])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_User_TinhTrang]
GO
ALTER TABLE [dbo].[NhaSanXuat]  WITH CHECK ADD  CONSTRAINT [FK_NhaSanXuat_TinhTrang] FOREIGN KEY([TrangThai])
REFERENCES [dbo].[TinhTrang] ([ID])
GO
ALTER TABLE [dbo].[NhaSanXuat] CHECK CONSTRAINT [FK_NhaSanXuat_TinhTrang]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([LoaiSP])
REFERENCES [dbo].[LoaiSanPham] ([ID])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaSanXuat] FOREIGN KEY([NhaSanXuat])
REFERENCES [dbo].[NhaSanXuat] ([ID])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaSanXuat]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_ThuongHieu] FOREIGN KEY([ThuongHieu])
REFERENCES [dbo].[ThuongHieu] ([ID])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_ThuongHieu]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_TinhTrang] FOREIGN KEY([TinhTrang])
REFERENCES [dbo].[TinhTrang] ([ID])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_TinhTrang]
GO
ALTER TABLE [dbo].[ThuongHieu]  WITH CHECK ADD  CONSTRAINT [FK_ThuongHieu_TinhTrang] FOREIGN KEY([TrangThai])
REFERENCES [dbo].[TinhTrang] ([ID])
GO
ALTER TABLE [dbo].[ThuongHieu] CHECK CONSTRAINT [FK_ThuongHieu_TinhTrang]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
USE [master]
GO
ALTER DATABASE [4teamwines] SET  READ_WRITE 
GO
