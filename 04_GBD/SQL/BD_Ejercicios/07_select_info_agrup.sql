--1
select nombrecomer
from vendedor
group by nombrecomer
having count(*) > 2

--2
select numpedido
from linped
group by numpedido
having count(*) > 3

-- 3
select numpedido
from linped
group by numpedido
having sum(cantpedida) > 40

--4
select numpedido
from linped
group by numpedido
having sum(preciocompra * cantpedida) > 1000

--5
select numpieza, max(preciounit) as precio_max, count(*) as num_sumin
from preciosum
group by numpieza
having avg(preciounit) > 260

--6
select numpieza, max(preciounit) as max_precio, count(*) as submins
from preciosum
where preciounit >= 250
group by numpieza
having avg(preciounit) > 260

--7
select p.numpedido, fecha
from pedido p, linped l
where p.numpedido = l.numpedido
group by p.numpedido, fecha
having sum(cantpedida) > 30 
and sum(cantrecibida) < 10

--8
select numpieza, avg(preciounit)
from preciosum
group by numpieza
having avg(diassum) <= 14

--9
select numpedido, preciocompra, cantpedida
from linped l
where numlinea = 1 and fecharecep = '10-05-2019'

--10
select ps.numpieza, nompieza, max(preciounit) as precio_max
from preciosum ps, pieza p
where ps.numpieza = p.numpieza
and (preciovent > 250 or preciovent < 170)
group by ps.numpieza, nompieza
having avg(descuento) between 10 and 17
and avg(preciounit) > 150
order by max(preciounit) desc

--11
select count(*) as cantidad_prov
from preciosum
where numpieza = 'P-0001-33'

--12
select numpieza, max(preciounit) as precio_max, min(preciounit) as precio_min 
from preciosum
where numvend != 1
group by numpieza

--13
select nompieza
from preciosum ps, pieza p
where ps.numpieza = p.numpieza
group by ps.numpieza, nompieza
having count(*) > 2

--14
select v.numvend, nomvend, p.numpieza, nompieza
from vendedor v, pieza p, preciosum ps
where v.numvend = ps.numvend 
and p.numpieza = ps.numpieza
and preciounit > 200
order by numvend, nomvend, nompieza