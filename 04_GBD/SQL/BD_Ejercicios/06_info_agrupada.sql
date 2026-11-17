-- 1
select cantpedida - cantrecibida AS diferencia
from linped
where numpedido = 1

-- 2
select AVG(DATEDIFF(DAY, fecha, fecharecep)) AS media
from pedido p, linped l
where p.numpedido = l.numpedido 
and l.numpedido = 1

-- 3
select COUNT(DISTINCT provincia) AS prov
from vendedor

-- 4
select MIN(preciocompra - preciounit) AS dif_min
from linped l, preciosum ps
where ps.numpieza = l.numpieza

-- 5
select AVG(distinct preciovent)
from pieza

-- 6
select numpieza, count(numvend) AS total_vendedores
from preciosum
where preciounit>=250
group by numpieza

--7
select numpieza, AVG(preciounit) AS precio_medio_sum
FROM preciosum
group by numpieza

--8
select nompieza, AVG(preciounit) AS precio_medio_sum
from pieza p, preciosum ps
where p.numpieza = ps.numpieza
and preciovent>=250
group by nompieza

--9
select numvend, AVG(preciovent) AS media_ventas
from pieza p, preciosum ps
where ps.numpieza = p.numpieza
group by numvend

--10
select fecha, count(p.numpedido) AS total_pedido, sum(preciocompra * cantpedida) AS total_pagado
from pedido p, linped l
where p.numpedido = l.numpedido
group by fecha

--11 
select ps.numvend, sum((preciocompra - preciounit) * cantrecibida) AS ganancias
from linped l, preciosum ps
where l.numpieza = ps.numpieza
group by ps.numvend

--12
select numpedido, sum(preciocompra - preciounit) AS dif_precio
from linped l, preciosum ps
where l.numpieza = ps.numpieza
group by numpedido

--13
select p.numpieza, ((max(preciovent) - avg(preciocompra)) / avg(preciocompra)) * 100 AS beneficio
from pieza p, linped l
where p.numpieza = l.numpieza
group by p.numpieza, preciovent

--14
select p.nompieza, count(distinct ps.numvend) as total_vendedores
from pieza p, preciosum ps, vendedor v
where p.numpieza = ps.numpieza
and ps.numvend = v.numvend
and v.provincia != 'ALICANTE'
group by p.numpieza, p.nompieza
order by p.nompieza asc;