-- Update (U) Operasyonu gerceklestirelim

update customers 
set name = 'Kaya', phone = '33333'
where id =7

-- Delete (D) Operasyonu gerceklestirelim 

delete from customers
where id = 7

-- Insert (I) Operasyonu gerceklestirelim 
insert into customers(id,email,phone,name,costumer_id,birthday,gender)
values(7,'abc@gmail','5458463233','Abuzer',7,'1999-06-06','Male')

--Elinde ondan fazla ürün olan tedarikçilerin isimlerini döndüren sorgu
select s.name as "Tedarikci Adı", COUNT(p.stock) as "Ürün stok sayısı" from products p 
inner join suppliers s 
on p.supplierid = s.supplierid
group by s.name
having COUNT(p.stock)>1

-- Stok adedi 'den fazla ürünleri isme göre gruplayıp listeleyiniz'
select p.name as "Urun Adı", p.stock as "Ürün stok sayısı" from products p 
inner join suppliers s 
on p.supplierid = s.supplierid
group by p.name, p.stock
having p.stock>50


-- Stok adedi 10 ile 50 arasında olan ürünleri listeleyen sorguyu yazınız
select p.name as "Urun Adı", p.stock as "Ürün stok sayısı" from products p 
group by p.name, p.stock
having p.stock
between 10 and 50

-- Alternative of above query 

select p.name as "Urun Adı", p.stock as "Ürün stok sayısı" from products p 
where p.stock
between 10 and 50


--  get  all records with left + inner join
select * from products p 
left join products_categories pc
on p.product_id=pc.product_id
inner join categories c
on c.category_id=pc.category_id

-- get all records with left + right join 
select * from products p 
left join products_categories pc
on p.product_id=pc.product_id
right join categories c
on c.category_id=pc.category_id



-- get all records with inner + left + right join = full join 

select * from products p 
full join products_categories pc
on p.product_id=pc.product_id
full join categories c
on c.category_id=pc.category_id

-- in kullanımı 
select * from users u
where name in ('veysel','ismail')

-- Ankarada olan tedarikçilerin sayısını getiren sorguyu yazınız

select * from customers cu
inner join adresses a 
on cu.id=a.user_id
inner join cities c
on a.city_id=c.city_id
inner join countries co 
on co.country_id=a.country_id
where c.name in ('ankara') and co.name in ('türkiye')











