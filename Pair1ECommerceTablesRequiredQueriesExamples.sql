-- İçinde 'a' içeren ürünleri getiren query'yi yazın

select * from products p
where name LIKE '%a%'

-- İçinde 'a' içermeyen veya supplierid'si 2 olan ürünlerin adedini getiren query'yi yazın
select COUNT(p) from products p
where name NOT LIKE '%a%' or p.supplierid=2


-- İçinde icloud uzantısı ile biten kullanıcıların isimlerini ve maillerini getirin

select name, email from users
where email LIKE '%icloud%'

-- Türkiye/Ankara'da yaşayan müşterilerin adreslerini getirin.

select cu.name,cu.phone,co.name,c.name,a.postacode,a.street from adresses a
INNER JOIN  users u
on a.user_id= u.user_id
INNER JOIN customers cu 
on u.user_id=cu.id
INNER JOIN cities c
on a.city_id=c.city_id
INNER JOIN countries co
on a.country_id=co.country_id
where co.name=LOWER('Türkiye') and c.name=LOWER('Ankara')


-- İstediğimiz kategorideki ürünlerin stok adedi toplamları 

select SUM(pr.stock) from products pr
INNER JOIN products_categories pc
on pr.product_id=pc.product_id
INNER JOIN categories ca
on pc.category_id=ca.category_id
where ca.category_id=2

-- İstediğimiz kategorideki ürünleri stok adedine göre sıralayan sorguyu yazın.
select * from products pr
INNER JOIN products_categories pc
on pr.product_id=pc.product_id
INNER JOIN categories ca
on pc.category_id=ca.category_id
where ca.category_id=2
ORDER BY pr.stock DESC



-- İstediğimiz tedarikçinin ürünlerini stok adedine göre sıralayan sorguyu yazınız.

select * from products pc 
INNER JOIN suppliers su
on pc.supplierid=su.supplierid
where su.supplierid=2
ORDER BY stock

select su.name as "Tedarikçi Adı",su.supplierid as "Tedarikçi Id",pc.name as "Ürün Adı",pc.stock as "Ürün Stok Adedi" 
from products pc 
INNER JOIN suppliers su
on pc.supplierid=su.supplierid
where su.supplierid=2
ORDER BY stock

-- Tüm tedarikçilerin elindeki ürünlerin tamamını sattığı durumda kazandığı toplam kazancı getiren query'yi yazınız


select su.supplierid,su.name, SUM(pc.price-(pc.price * pc.discount_rate)) as "Toplam Kazanç" from products pc  
INNER JOIN suppliers su
on pc.supplierid=su.supplierid
GROUP BY su.supplierid


-- Bir tedarikçinin elindeki ürünlerin tamamını sattığı durumda kazandığı toplam kazancı getiren query'yi yazınız


select su.supplierid,su.name, SUM(pc.price-(pc.price * pc.discount_rate)) as "Toplam Kazanç" from products pc  
INNER JOIN suppliers su
on pc.supplierid=su.supplierid
where su.supplierid=1
GROUP BY su.supplierid

-- Ortalama stok adedinden düşük olan tedarikçilerin listesini getiren query'yi yazın


select * from products pc 
INNER JOIN suppliers su
on pc.supplierid=su.supplierid
where pc.stock < (select AVG(stock) from products)
ORDER BY pc.stock


-- Aynı kategorideki ürünlerden fiyatı en yüksek olanı getiren query'yi yazınız

select MAX(p.price), ca.name from products p
INNER JOIN products_categories pc 
on p.product_id=pc.product_id
INNER JOIN categories ca
on pc.category_id=ca.category_id
GROUP BY ca.category_id

























