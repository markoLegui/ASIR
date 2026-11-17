
-- 1
select numpieza, cantpedida - cantrecibida as diferencia
from linped
where numpedido = 1;


-- 2
select avg(cast(datediff(day, p.fecha, l.fecharecep) as decimal(10,2))) as media_dias
from pedido p, linped l
where p.numpedido = l.numpedido
and p.numpedido = 1;


-- 3
select count(distinct provincia) as provincias
from vendedor;


-- 4
select min(l.preciocompra - ps.preciounit) as diferencia_minima
from linped l, pedido p, preciosum ps
where l.numpedido = p.numpedido
and l.numpieza = ps.numpieza
and p.numvend = ps.numvend;


-- 5
select avg(distinct preciovent) as media_precios
from pieza;


-- 6
select max(ps.preciounit * ps.descuento / 100.0) as descuento_maximo
from preciosum ps;


-- 7
select distinct p.numpieza, p.nompieza,
       p.preciovent - ps.preciounit as diferencia
from pieza p, preciosum ps, vendedor v
where p.numpieza = ps.numpieza
and ps.numvend = v.numvend
and v.provincia = 'Alicante';


-- 8
select max(preciovent) as maximo,
       min(preciovent) as minimo,
       avg(preciovent) as media
from pieza;


-- 9
select count(distinct numpieza) as total_piezas
from preciosum;


-- 10
select count(*) as total_vendedores
from vendedor;


-- 11
select sum(l.preciocompra - ps.preciounit) as diferencia_total
from linped l, pedido p, preciosum ps
where l.numpedido = p.numpedido
and l.numpieza = ps.numpieza
and p.numvend = ps.numvend
and ps.preciounit < l.preciocompra;
