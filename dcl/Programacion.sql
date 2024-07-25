/* Procedimiento que da la bienvenida al gran abarrotero */
CREATE PROCEDURE bienvenido(varchar) 
AS  $$
BEGIN
RAISE NOTICE 'Bienvenido a el gran abarrotero!', $1;
END
$$
Language plpgsql;

-- Llamamos al procedimiento
call bienvenido('Juan');


/* Procedimiento para consultar las ventas de los productos en la base de datos donde la cantidad de productos vendida es mayor a 10*/
CREATE PROCEDURE venta_productos() 
AS $$
BEGIN 
    CREATE TEMP TABLE temp_table AS
    SELECT * 
    FROM venta 
    WHERE cantidad_producto > 10;
END 
$$
LANGUAGE plpgsql;

--Llamamos al procedimiento
call venta_productos();

-- Verificamos si el procedimiento funciona correctamente seleccionando todos los campos de la tabla temporal
SELECT * FROM temp_table


/* Disparador para verificar el precio desglosado de una venta */
CREATE OR REPLACE FUNCTION precio() RETURNS trigger AS $$
DECLARE 
	precio integer;
BEGIN 
	IF(TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN 
		SELECT precio_desglose INTO precio FROM venta 
		WHERE id_venta = NEW.id_venta;
		IF precio = 0 THEN 
			RAISE EXCEPTION 'El precio desglosado en % debe de ser mayor a $0', precio;
		END IF;
	END IF;	
	RETURN NEW;
END;
$$
language plpgsql;

-- Borramos cualquier disparador previamente existente
DROP TRIGGER IF EXISTS precio_actual ON venta

--Creamos el disparador
CREATE TRIGGER precio_actual
BEFORE INSERT OR UPDATE ON venta
FOR EACH ROW EXECUTE PROCEDURE precio();

--Verificamos si el disparador funciona
update venta set precio_desglose = 0 where id_venta = 'V100';


/* Creamos el disparador que verifica la canditad de productos vendidos */
CREATE OR REPLACE FUNCTION verificar_cantidad() RETURNS trigger AS $$
DECLARE 
	cantidad_nueva integer;
BEGIN 
	IF(TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN 
		SELECT cantidad_producto INTO cantidad_nueva FROM venta 
		WHERE id_venta = NEW.id_venta;
		IF cantidad_nueva = 0 THEN 
			RAISE EXCEPTION 'El cantidad de producto vendida debe de ser mayor a 0';
		END IF;
	END IF;	
	RETURN NEW;
END;
$$
language plpgsql;

-- Borramos cualquier disparador previamente existente
DROP TRIGGER IF EXISTS verifica_cantidad ON venta 

-- Creamos el disparador para la tabla venta
CREATE TRIGGER  verificar_cantidad
BEFORE INSERT OR UPDATE ON venta
FOR EACH ROW EXECUTE PROCEDURE verificar_cantidad();

-- Verificamos si el disparador funciona correctamente
update venta set cantidad_producto = 0 where id_venta = 'V99';
 