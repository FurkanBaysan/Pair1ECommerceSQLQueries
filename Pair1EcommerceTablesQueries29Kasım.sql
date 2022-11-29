	 
	 -- Bugünün tarihini almak
Select CURRENT_DATE as "Bugünün Tarihi";
--

--
Select * from orders;
--

-- date_part , extract (ayı,günü ve yılı çekmek,fetch etmek)
Select date_part('month',CURRENT_DATE) as "İçinde bulunduğumuz ay"
Select date_part('year',CURRENT_DATE) as "İçinde bulunduğumuz yıl"
Select date_part('century',CURRENT_DATE) as "İçinde bulunduğumuz yüzyıl"
Select date_part('day',CURRENT_DATE) as "İçinde bulunduğumuz gün"

Select id,date_part('day',orderdate) from orders


-- Ayın 15. günü verilen tüm siparişleri listele
Select * from orders
Where date_part('day',orderdate) = 15
--

-- Yaşı 21'den büyük müşterileri listele.
Select * from users

select * from users where (date_part('year',current_date) - (date_part('year',birth_date))) > 21

select * from users where date_part('year', birth_date)<=2001
--

-- son 10 gün içerisindeki siparişler
select * from orders where 
(date_part('year',current_date) = date_part('year',orderdate))
and (date_part('month',current_date) = date_part('month',orderdate))
and (date_part('day',current_date) - (date_part('day',orderdate))) <= 10

select * from orders where date_part('day', orderdate)>=19
--

-- extract
Select extract(month from current_date) as "İçinde bulunduğmuz ay"

Select extract(year from orderdate),count(*) from orders
group by extract(year from orderdate)

--datediff
--timestamp
--type conversion (timestamp'e convert etme, zaman aralığına yani)

-- datediff => postgresql'da mevcut değil

-- iki date veya timepan arasında ne kadar fark olduğunuzu bulalmızı sağlayan fonksiyon
select orderdate from orders
select orderdate::timestamp from orders

-- Aradaki farkın kaç gün olduğunu gösterir
select current_date::timestamp-orderdate::timestamp from orders

-- son 10 gün içerisindeki siparişler
select * from orders 
where (DATE_PART('days',current_date::timestamp-orderdate::timestamp) <=10
	   
--İki sipariş arasındaki Haftalık farkı almak
select TRUNC(DATE_PART('days',current_date::timestamp-orderdate::timestamp)/7) 
from orders

-- İki tarih arasındaki saat farkını almak 
	   
select '2022-11-29 21:00'::timestamp as "Tarih"
select '2022-11-29 16:00'::timestamp as "Tarih"
	   
select DATE_PART('hour','2022-11-29 21:00'::timestamp) as "Tarih"
select DATE_PART('hour','2022-11-29 16:00'::timestamp) as "Tarih"
	   
Select DATE_PART('hour','2022-11-29 22:00'::timestamp - '2022-11-28 21:00'::timestamp)  as "Tarih"
	-- yukardaki query'yi saat farkını doğru bir şekilde vericek hale getiriniz

-- Doğru Hali 
Select Date_Part('day','2022-11-29 22:00'::timestamp - '2022-11-28 21:00'::timestamp)*24
	   +Date_Part('hour','2022-11-29 22:00'::timestamp - '2022-11-28 21:00'::timestamp) 
	   as "Saat Farkı"	   

	   
	   
   -- SON DATABASE TASK
-- veritabanınızda eksik ise date ve timestamp eksik ise alanları ekleyip 
-- bu alanların kullandığımız örneklere benzer 10 adet query ile örneklendirilmesi
	   
	 
-- Query 1 : Yaşı 20-30 arasındaki müşterileri listele.
	   
select * from users where (date_part('year',current_date) - (date_part('year',birth_date))) between  20 and 30 
	   
-- Query 2 : Kulanıcıların yaşlarını gün formatında listeleyelim 
	   
	   select DATE_PART('day',current_date::timestamp-birth_date::timestamp)
	   from users u
	  
	  -- Query 3 :  Kullanıcı dogum gunlerine kaç ay ve kaç gün kaldığını listeleyen sorguyuz yazınız
	   
	select 	TRUNC (DATE_PART('month',current_date) - DATE_PART('month',birth_date)) as "month",
		TRUNC (DATE_PART('day',current_date) - DATE_PART('day',birth_date)) as "day"
from users u
	   
	   -- Query 4 : Bugünki siparişlerin listesini getiren query'yi yazınız.
	   
select * from orders 
where orderdate=current_date
-- Altrnative: where DATE_PART('day',orderdate)=DATE_PART('day',current_date)
	   
	   -- Ouery 5 : Hangi ayda kaç sipariş verilmiş , bunu getiren sorguyu yazınız.
select count(*), extract(month from orderdate) from orders o 
group by o.orderdate
order by orderid
	   
	   -- 7,6,11 ay 
	   -- 1,1,2 sipariş adedi 
	   
	   
	-- Query 6 : Hangi id'li ürün hangi ay sipariş edildi, bunu getiren query   
select extract(month from orderdate) as "Ay",orderid from orders o
group by orderid, orderdate
	 
-- Query 7 : Tedarikçilerin/Satıcıların kaç yıldır sisteme üye olduğunu döndüren sorguyu yazınız.
select s.name, DATE_PART('year',current_date)-DATE_PART('year',s.registerdate) from suppliers s
	
-- Query 8 : İleri tarihlerdeki siparişlerin teslim tarihini döndüren sorguyu yazınız.
select deliverydate from deliveries
where deliverydate > current_date
	   
	   
-- Query 9 : Son 6 ay içerisindeki siparişleri getiren query'yi yazınız
select * from orders o 
where DATE_PART('month',current_date)- DATE_PART('month',orderdate)<6 
	   
-- Query 10 : Müşterilerin yaş ortalaması 
	   
select AVG((DATE_PART('year',current_date) - DATE_PART('year',birthday)))
from customers
	   
	


				   
				   
				   
				   
	  
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   

	   
	   


