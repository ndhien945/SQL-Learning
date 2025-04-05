use QLGV;
go

-- Q27
select count(*) as N'Số lượng giáo viên', sum(luong) as N'Tổng lương'
from giaovien

-- Q28
select bomon.tenbm as 'Tên bộ môn', count(*) as N'Số lượng giáo viên', avg(luong) as N'Trung bình lương'
from giaovien, bomon
where giaovien.mabm = bomon.mabm
group by bomon.tenbm

-- Q29
select cd.tencd as N'Tên chủ đề', count(*) as N'Số lượng đề tài'
from chude cd, detai dt
where cd.macd = dt.macd
group by cd.tencd

-- Q30
select gv.hoten as N'Họ và tên', count(distinct madt) as N'Số lượng đề tài'
from giaovien gv, thamgiadt tgdt
where gv.magv = tgdt.magv
group by gv.hoten

-- Q31
select gv.hoten as N'Họ và tên', count(madt) as N'Số lượng đề tài chủ nhiệm'
from giaovien gv, detai dt
where gv.magv = dt.gvcndt
group by gv.hoten

-- Q32
select gv.hoten as N'Họ và tên', count(*) as N'Số lượng đề tài chủ nhiệm'
from giaovien gv, nguoithan nt
where gv.magv = nt.magv
group by gv.hoten

-- Q33
select gv.hoten as N'Họ và tên', count(distinct madt) as N'Số lượng đề tài'
from giaovien gv, thamgiadt tgdt
where gv.magv = tgdt.magv
group by gv.hoten
having count(distinct madt) >= 3

-- Q34
select count(distinct gv.magv) as N'Số lượng giáo viên tham gia đề tài "Ứng dụng hóa học xanh"'
from giaovien gv, detai dt, thamgiadt tgdt
where gv.magv = tgdt.magv and tgdt.madt = dt.madt and dt.tendt = N'Ứng dụng hóa học xanh'


