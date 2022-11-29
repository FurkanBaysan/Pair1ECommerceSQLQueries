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