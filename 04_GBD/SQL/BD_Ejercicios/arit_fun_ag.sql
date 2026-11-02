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
select 
from 