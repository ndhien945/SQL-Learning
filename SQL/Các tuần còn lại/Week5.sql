use QLGV;
go

-- Q35
select distinct luong as N'Mức lương cao nhất'
from giaovien
where luong >= all(select gv.luong
				from giaovien gv)

-- Q36
select hoten as N'Họ và tên'
from giaovien
where luong >= all(select gv.luong
				from giaovien gv)

-- Q37
select hoten as N'Họ và tên'
from giaovien
where mabm = 'HTTT' and luong >= all(select gv.luong
				from giaovien gv
				where mabm = 'HTTT')

-- Q38
select hoten as N'Họ và tên', 2025 - year(ngsinh) as N'Tuổi'
from giaovien
where mabm = 'HTTT' and year(ngsinh) <= all(select year(ngsinh)
				from giaovien gv
				where mabm = 'HTTT')

-- Q39
select gv.hoten as N'Họ và tên', 2025 - year(gv.ngsinh) as N'Tuổi'
from giaovien as gv, bomon bm, khoa k
where gv.mabm = bm.mabm and bm.makhoa = k.makhoa and k.tenkhoa = N'Công nghệ thông tin' 
		and year(ngsinh) >= all(select year(ngsinh)
				from giaovien as gv, bomon bm, khoa k
				where gv.mabm = bm.mabm and bm.makhoa = k.makhoa and k.tenkhoa = N'Công nghệ thông tin')

-- Q40
select k.tenkhoa as N'Tên khoa', gv.hoten as N'Họ và tên'
from bomon bm, giaovien gv, khoa k
where gv.mabm = bm.mabm and bm.makhoa = k.makhoa and gv.luong >= all(select luong
					from giaovien gv2, bomon bm2, khoa k2
					where gv2.mabm = bm2.mabm and bm2.makhoa = k2.makhoa and k.makhoa = k2.makhoa)

-- Q41
select bm.tenbm as N'Tên bộ môn', gv.hoten as N'Họ và tên'
from bomon bm, giaovien gv
where gv.mabm = bm.mabm and gv.luong >= all(select luong
					from giaovien gv2, bomon bm2
					where gv2.mabm = bm2.mabm and bm2.mabm = bm.mabm)
-- Q42
select distinct dt.tendt
from thamgiadt tgdt, detai dt
where dt.madt not in (select dt2.madt
						from thamgiadt tgdt2, detai dt2, giaovien gv
						where gv.hoten = N'Nguyễn Hoài An' and gv.magv = tgdt2.magv and dt2.madt = tgdt2.madt)
-- Q43
select distinct dt.tendt, gv.hoten
from thamgiadt tgdt, detai dt, giaovien gv
where gv.magv = gvcndt and dt.madt not in (select dt2.madt
						from thamgiadt tgdt2, detai dt2, giaovien gv
						where gv.hoten = N'Nguyễn Hoài An' and gv.magv = tgdt2.magv and dt2.madt = tgdt2.madt)
--Q44
select distinct gv.hoten
from thamgiadt tgdt, detai dt, giaovien gv, bomon bm, khoa k
where gv.mabm = bm.mabm and bm.makhoa = k.makhoa and k.tenkhoa = N'Công nghệ thông tin' and gv.magv not in (select distinct gv2.magv
						from thamgiadt tgdt2, giaovien gv2
						where gv.magv = tgdt2.magv )

-- Q45
select distinct gv.hoten
from thamgiadt tgdt, detai dt, giaovien gv
where gv.magv not in (select distinct gv2.magv
						from thamgiadt tgdt2, giaovien gv2
						where gv.magv = tgdt2.magv )

-- Q46
select hoten as N'Họ và tên'
from giaovien
where luong > (select gv.luong
				from giaovien gv
				where gv.hoten = N'Nguyễn Hoài An')
-- Q47
select distinct gv.hoten
from bomon bm, giaovien gv
where gv.magv = bm.truongbm and magv in (select distinct gv2.magv
						from thamgiadt tgdt2, giaovien gv2
						where gv.magv = tgdt2.magv )

--Q48
select distinct bm.tenbm, gv.hoten
from bomon bm, giaovien gv, giaovien gv2, bomon bm2
where gv.mabm = bm.mabm and gv2.mabm = bm2.mabm and bm.mabm = bm2.mabm and gv.phai = gv2.phai and gv.hoten != gv2.hoten

-- Q49
select hoten as N'Họ và tên'
from giaovien
where luong >= any(select gv.luong
				from giaovien gv, bomon bm
				where gv.mabm = bm.mabm and bm.tenbm = N'Công nghệ phần mềm')

-- Q50
select hoten as N'Họ và tên'
from giaovien
where luong >= all(select gv.luong
				from giaovien gv, bomon bm
				where gv.mabm = bm.mabm and bm.tenbm = N'Hệ thống thông tin')

-- Q51
select k1.tenkhoa, count(*) 
from khoa k1, giaovien gv1, bomon bm1
where gv1.mabm = bm1.mabm and bm1.makhoa = k1.makhoa
group by k1.tenkhoa
having count(*) >= all(select count(*) 
					from giaovien gv, bomon bm, khoa k
					where gv.mabm = bm.mabm and bm.makhoa = k.makhoa
					group by k.tenkhoa)

-- Q52
select gv.hoten, count(*) as N'Số lượng đề tài chủ nhiệm'
from detai dt, giaovien gv
where gv.magv = dt.gvcndt
group by gv.hoten
having count(*) >= all (select count(*)
							from detai dt2, giaovien gv2
							where gv2.magv = dt2.gvcndt
							group by gv2.hoten)

-- Q53
select bm.tenbm, count(*)
from bomon bm, giaovien gv
where gv.mabm = bm.mabm
group by bm.tenbm
having count(*) >= all (select count(*)
						from bomon bm2, giaovien gv2
						where gv2.mabm = bm2.mabm
						group by bm2.tenbm)
-- Q54
select gv.hoten, bm.tenbm, count(distinct tgdt.madt)
from giaovien gv, thamgiadt tgdt, bomon bm
where gv.magv = tgdt.magv and gv.mabm = bm.mabm
group by gv.hoten, bm.tenbm
having count(distinct tgdt.madt) >= all(select count(distinct tgdt2.madt)
										from giaovien gv2, thamgiadt tgdt2, bomon bm2
										where gv2.magv = tgdt2.magv and gv2.mabm = bm2.mabm
										group by gv2.hoten)

-- Q55
select gv.hoten, count(distinct tgdt.madt)
from giaovien gv, thamgiadt tgdt, bomon bm
where gv.magv = tgdt.magv and gv.mabm = bm.mabm and bm.mabm = 'HTTT'
group by gv.hoten
having count(distinct tgdt.madt) >= all(select count(distinct tgdt2.madt)
										from giaovien gv2, thamgiadt tgdt2, bomon bm2
										where gv2.magv = tgdt2.magv and gv2.mabm = bm2.mabm and bm2.mabm = 'HTTT'
										group by gv2.hoten)

-- Q56
select gv.hoten, bm.tenbm , count(*) as N'Số người thân'
from giaovien gv, nguoithan nt, bomon bm
where gv.magv = nt.magv and gv.mabm = bm.mabm
group by gv.hoten, bm.tenbm
having count(*) >= all(select count(*) 
						from giaovien gv2, nguoithan nt2, bomon bm2
						where gv2.magv = nt2.magv and gv2.mabm = bm2.mabm
						group by gv2.hoten)

-- Q57
select gv.hoten, count(*) as N'Số lượng đề tài chủ nhiệm'
from detai dt, giaovien gv, bomon bm
where gv.magv = dt.gvcndt and bm.truongbm = gv.magv
group by gv.hoten
having count(*) >= all (select count(*)
							from detai dt2, giaovien gv2, bomon bm2
							where gv2.magv = dt2.gvcndt and bm2.truongbm = gv2.magv
							group by gv2.hoten)


