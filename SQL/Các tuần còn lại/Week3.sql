USE QLGV

-- Q1
SELECT hoten, luong
from giaovien
where phai=N'Nữ'

-- Q2
select hoten as N'Họ và tên', luong * 1.1 as N'Lương sau tăng'
from giaovien

-- Q3
select magv
from giaovien
where hoten like N'Nguyễn%' and luong > 2000	
UNION
select magv
from giaovien gv, bomon bm
where gv.magv = bm.truongbm and year(bm.ngaynhanchuc) >= 1995

-- Q4
select *
from giaovien gv, bomon bm, khoa k 
where gv.mabm = bm.mabm and bm.makhoa = k.makhoa and k.makhoa = 'CNTT'

-- Q5
select *
from bomon bm
join giaovien gv on bm.truongbm = gv.magv 

select *
from bomon bm, giaovien gv
where bm.truongbm = gv.magv

-- Q6
select *
from giaovien gv, bomon bm
where gv.mabm = bm.mabm

-- Q7
select *
from detai dt, giaovien gv
where dt.gvcndt = gv.magv

-- Q8
select *
from khoa k, giaovien gv
where k.truongkhoa = gv.magv

-- Q9
select *
from giaovien gv, bomon bm, detai dt
where gv.mabm = bm.mabm and bm.tenbm = 'Vi sinh' and gv.magv = dt.gvcndt

-- Q10
select dt.madt as N'Mã đề tài', cd.tencd as 'Tên chủ đề', gv.hoten as N'Họ và tên', gv.ngsinh as N'Ngày tháng năm sinh'
from detai dt, chude cd, giaovien gv
where dt.capql = N'Thành phố' and dt.macd = cd.macd and dt.gvcndt = gv.magv

-- Q11
select gv.hoten as N'Họ và tên giáo viên', gv2.hoten as N'Họ và tên người quản lý'
from giaovien gv, giaovien gv2
where gv.gvqlcm = gv2.magv

-- Q12 
select gv.hoten as N'Họ và tên giáo viên'
from giaovien gv, giaovien gv2
where gv.gvqlcm = gv2.magv and gv2.hoten = N'Nguyễn Thanh Tùng'

-- Q13
select gv.hoten
from giaovien gv, bomon bm
where bm.truongbm = gv.magv and bm.tenbm = N'Hệ thống thông tin'

-- Q14
select gv.hoten, dt.tendt
from giaovien gv, detai dt, chude cd
where dt.gvcndt = gv.magv and dt.macd = cd.macd and cd.tencd = N'Quản lý giáo dục'

-- Q15
select *
from congviec cv, detai dt, thamgiadt tgdt, giaovien gv
where cv.madt = dt.madt and dt.tendt = N'HTTT quản lý các trường ĐH' 
	and tgdt.stt = cv.sott and tgdt.madt = dt.madt and gv.magv = tgdt.magv
	and cv.ngaybd >= '3/1/2008' and cv.ngaykt <= '3/31/2008' 

-- Q16
select gv.hoten as N'Họ và tên giáo viên', gv2.hoten as N'Họ và tên người quản lý'
from giaovien gv, giaovien gv2
where gv.gvqlcm = gv2.magv

-- Q17
select *
from congviec cv
where cv.ngaybd >= '1/1/2007' and cv.ngaykt <= '8/1/2007' 

-- Q18
select gv.hoten
from giaovien gv, bomon bm, giaovien gv2, bomon bm2
where gv2.hoten = N'Trần Trà Hương' and gv2.mabm = bm2.mabm
	and gv.mabm = bm.mabm and bm.mabm = bm2.mabm
	and gv.hoten != N'Trần Trà Hương'

-- Q19
select gv.hoten
from giaovien gv, bomon bm
where bm.truongbm = gv.magv
INTERSECT
select distinct gv.hoten
from giaovien gv, detai dt
where gv.magv = dt.gvcndt

-- Q20
select gv.hoten
from giaovien gv, bomon bm
where bm.truongbm = gv.magv
INTERSECT
select gv.hoten
from giaovien gv, khoa k
where k.truongkhoa = gv.magv

-- Q21
select gv.hoten
from giaovien gv, bomon bm
where bm.truongbm = gv.magv
INTERSECT
select distinct gv.hoten
from giaovien gv, detai dt
where gv.magv = dt.gvcndt

-- Q22
select gv.magv
from giaovien gv, khoa k
where k.truongkhoa = gv.magv
INTERSECT
select distinct gv.magv
from giaovien gv, detai dt
where gv.magv = dt.gvcndt

-- Q23
select gv.magv
from giaovien gv, bomon bm
where bm.mabm = 'HTTT' and gv.mabm = bm.mabm
UNION
select distinct gv.magv
from giaovien gv, thamgiadt tgdt
where gv.magv = tgdt.magv and tgdt.madt = '001'

-- Q24
select gv.magv, gv.hoten
from giaovien gv, bomon bm, giaovien gv2, bomon bm2
where gv2.magv = '002' and gv2.mabm = bm2.mabm
	and gv.mabm = bm.mabm and bm.mabm = bm2.mabm
	and gv.magv != '002'

-- Q25
select gv.hoten
from giaovien gv, bomon bm
where bm.truongbm = gv.magv

-- Q26
select hoten as N'Họ và tên', luong as 'Mức lương'
from giaovien