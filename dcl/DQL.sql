-- 1. Obtener todas las sucursales que tengas un horario de atencion de 7:00 a 22:00 
SELECT * 
FROM sucursal 
WHERE h_inicio > '8:00' AND h_cierre < '18:00';


-- 2. Obtener la información de todos los cajeros que trabajan en las primeras 10 sucursales
SELECT *
FROM cajero
WHERE cajero.id_sucursal >= 1 AND cajero.id_sucursal <= 10;

-- 3. Obtener la informacion de todos los gerentes que ganan menos que el salario maximo del cajero 
SELECT *
FROM gerente 
WHERE salario < (SELECT MAX(salario) FROM cajero);

-- 4. Obtener la informacion de los clientes que nacieron en el mes de agosto  
SELECT * 
from cliente
where EXTRACT(MONTH FROM fecha_nacimiento) = '8';


-- 5. Obtener la informacion de los productos que tienen un empaque de lata
SELECT id_producto, producto.id_departamento, producto.nombre, precio, marca, stock
from producto 
FULL OUTER JOIN departamento ON  producto.id_departamento = departamento.id_departamento 
where empaque = 'Lata';

--6. Obtener la informacion de los productos que tienen un empaque de caja
SELECT id_producto, producto.id_departamento, producto.nombre, precio, marca, stock
from producto 
FULL OUTER JOIN departamento ON  producto.id_departamento = departamento.id_departamento 
where empaque = 'Caja';

-- 7. Obtener la informacion de los productos con stock mayor a 20 
SELECT *
FROM producto 
WHERE stock > 20;

-- 8. Obtener la informacion de los gerentes y encargados que trabajan en la misma sucursal
SELECT id_gerente, gerente.nombre, id_encargado, encargado.nombre, gerente.id_sucursal
FROM gerente 
JOIN encargado ON gerente.id_sucursal = encargado.id_sucursal;

-- 9. Obtener la informacion de los gerentes y cajeros que trabajan en la misma sucursal
SELECT id_gerente, gerente.nombre, id_cajero, cajero.nombre, gerente.id_sucursal
FROM gerente 
JOIN cajero ON gerente.id_sucursal = cajero.id_sucursal;

-- 10. Obtener el departamento, nombre,de abarrotes que tienen productos perecederos
SELECT id_departamento, nombre, empaque, fecha_preparacion
FROM departamento
WHERE es_perecedero = true;

-- 11. Obtener correos de los cajeros con salario mayor a 10 000
SELECT cajero.id_cajero, correo_caj, salario
FROM correo_cajero
JOIN cajero ON correo_cajero.id_cajero = cajero.id_cajero
WHERE cajero.salario > 10000;

-- 12. Obtener la información de ventas donde el precio desglosado sea entre 5000 a 10000
SELECT *
FROM venta 
WHERE precio_desglose > 5000 AND precio_desglose < 10000;

-- 13. Obtener la información de ventas donde el cliente pago en Efectivo 
SELECT *
FROM venta 
WHERE metodo = 'Efectivo';


-- 14. Obtener la direccion de las sucursales que abrieron el mes de febrero 
SELECT id_sucursal, direccion 
FROM sucursal 
WHERE EXTRACT(MONTH FROM apertura) = '2';


-- 15. Obtener los productos del departamento de abarrotes caducados tomando en cuenta la fecha en que se realiza la consulta.
SELECT id_departamento ,id_sucursal ,nombre,fecha_caducidad,refrigeracion,empaque  
FROM departamento
WHERE fecha_caducidad  <= now() and nombre='Abarrotes'
ORDER BY fecha_caducidad  asc