DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;
----------------------------------------------------------------------------------------------------
CREATE TYPE categoria as ENUM ('informatica', 'telecomunicaciones', 'vigilancia','alumbrado');

CREATE TABLE sucursal(
    id_sucursal integer,
    nombre text ,
    apertura date ,
    h_inicio VARCHAR(10),
    h_cierre VARCHAR(10),
    direccion text
);

comment ON TABLE sucursal IS 'Tabla que contiene la informacion de las sucursales';
comment ON COLUMN sucursal.id_sucursal IS 'El identificador de la sucursal';
comment ON COLUMN sucursal.nombre IS 'El nombre de la sucursal';
comment ON COLUMN sucursal.apertura IS 'La fecha de apertura de la sucursal';
comment ON COLUMN sucursal.direccion IS 'La dirección donde se encuentra la sucursal';

CREATE TABLE departamento(
    id_departamento VARCHAR(50),
    id_sucursal integer,
    nombre text ,
    empaque text ,
    fecha_preparacion date,
    descripcion text,
    watts integer,
    categoria categoria,
    refrigeracion boolean , 
    fecha_caducidad date,
    es_electronico boolean,
    es_perecedero boolean 
);

comment ON TABLE departamento IS 'Tabla que contiene la informacion de los diferentes departamentos que contiene una tienda';
comment ON COLUMN departamento.id_departamento IS 'El identificador del departamento';
comment ON COLUMN departamento.id_sucursal IS 'El identificador de la sucursal';
comment ON COLUMN departamento.nombre IS 'El nombre del departamento';
comment ON COLUMN departamento.empaque IS 'El tipo de empaque que necesita un producto, ya sea bolsa, lata, etc.';
comment ON COLUMN departamento.fecha_preparacion IS 'La fecha en que se empaquetó el producto';
comment ON COLUMN departamento.descripcion IS 'La descripción y especificaciones de los productos electrónicos';
comment ON COLUMN departamento.watts IS 'La cantidad de Watts que utiliza el producto electrónico';
comment ON COLUMN departamento.categoria IS 'La categoría a la que pertenece el electrónico, ya sea Informática, Vigilancia, etc.';
comment ON COLUMN departamento.refrigeracion IS 'Si el producto requiere refrigeración o no';
comment ON COLUMN departamento.fecha_caducidad IS 'La fecha de caducidad del producto perecedero';
comment ON COLUMN departamento.es_electronico IS 'Para indicar si el producto es un electrónico';
comment ON COLUMN departamento.es_perecedero IS 'Para indicar si el producto es perecedero';

CREATE TABLE tel_sucursal(
    id_sucursal integer,
    tel_su VARCHAR(20) 
);

comment ON TABLE tel_sucursal IS 'Tabla que contiene los teléfonos de la sucursal';
comment ON COLUMN tel_sucursal.id_sucursal IS 'El identificador de la sucursal';
comment ON COLUMN tel_sucursal.tel_su IS 'El teléfono de la sucursal';

CREATE TABLE producto(
    id_producto VARCHAR(50),
    id_departamento VARCHAR(50) ,
    nombre text ,
    precio real,
    marca text ,
    stock integer 
);

comment ON TABLE producto IS 'Tabla que contiene la información acerca de los productos';
comment ON COLUMN producto.id_producto IS 'El identificador del producto';
comment ON COLUMN producto.id_departamento IS 'El identificador de la sucursal';
comment ON COLUMN producto.nombre IS 'El nombre del producto';
comment ON COLUMN producto.precio IS 'El precio del producto';
comment ON COLUMN producto.marca IS 'La marca del producto';
comment ON COLUMN producto.stock IS 'La cantidad de elementos que hay del producto en la sucursal';


CREATE TABLE cajero(
    id_cajero VARCHAR(50) , 
    id_sucursal integer ,
    nombre VARCHAR(20) ,
    apellido_paterno VARCHAR(20),
    apellido_materno VARCHAR(20),
    fecha_nacimiento DATE,
    direccion VARCHAR(100) ,
    curp VARCHAR(18) ,
    salario integer

);

comment ON TABLE cajero IS 'Tabla que contiene la información de los cajeros de la sucursal';
comment ON COLUMN cajero.id_cajero IS 'El identificador del cajero';
comment ON COLUMN cajero.id_sucursal IS 'El identificador de la sucursal donde se encuentra el cajero';
comment ON COLUMN cajero.nombre IS 'El nombre o los nombres del cajero';
comment ON COLUMN cajero.apellido_paterno IS 'El apellido paterno del cajero';
comment ON COLUMN cajero.apellido_materno IS 'El apellido materno del cajero';
comment ON COLUMN cajero.fecha_nacimiento IS 'La fecha de nacimiento del cajero';
comment ON COLUMN cajero.direccion IS 'La dirección en la que vive el cajero';
comment ON COLUMN cajero.curp IS 'El CURP del cajero';
comment ON COLUMN cajero.salario IS 'El salario que percibe el cajero';


CREATE TABLE tel_cajero(
    id_cajero VARCHAR(50) ,
    tel_caj VARCHAR(20)
);
comment ON TABLE tel_cajero IS 'Tabla que contiene los teléfonos del cajero';
comment ON COLUMN tel_cajero.id_cajero IS 'El identificador del cajero';
comment ON COLUMN tel_cajero.tel_caj IS 'El teléfono del cajero';

CREATE TABLE correo_cajero(
    id_cajero VARCHAR(50) ,
    correo_caj VARCHAR(40) 
);

comment ON TABLE correo_cajero IS 'Tabla que contiene los correos del cajero';
comment ON COLUMN correo_cajero.id_cajero IS 'El identificador del cajero';
comment ON COLUMN correo_cajero.correo_caj IS 'El correo del cajero';

CREATE TABLE encargado(
    id_encargado VARCHAR(50), 
    id_sucursal integer ,
    nombre VARCHAR(20) ,
    apellido_paterno VARCHAR(20) ,
    apellido_materno VARCHAR(20) ,
    fecha_nacimiento DATE,
    direccion VARCHAR(100) ,
    curp VARCHAR(18) ,
    salario integer

);


comment ON TABLE encargado IS 'Tabla que contiene la información de los encargados de la sucursal';
comment ON COLUMN encargado.id_encargado IS 'El identificador del encargado';
comment ON COLUMN encargado.id_sucursal IS 'El identificador de la sucursal donde se encuentra el encargado';
comment ON COLUMN encargado.nombre IS 'El nombre o los nombres del encargado';
comment ON COLUMN encargado.apellido_paterno IS 'El apellido paterno del encargado';
comment ON COLUMN encargado.apellido_materno IS 'El apellido materno del encargado';
comment ON COLUMN encargado.fecha_nacimiento IS 'La fecha de nacimiento del encargado';
comment ON COLUMN encargado.direccion IS 'La dirección en la que vive el encargado';
comment ON COLUMN encargado.curp IS 'El CURP del encargado';
comment ON COLUMN encargado.salario IS 'El salario que percibe el encargado';

CREATE TABLE tel_encargado(
    id_encargado VARCHAR(50) ,
    tel_enc VARCHAR(20) 
);

comment ON TABLE tel_encargado IS 'Tabla que contiene los teléfonos del encargado';
comment ON COLUMN tel_encargado.id_encargado IS 'El identificador del encargado';
comment ON COLUMN tel_encargado.tel_enc IS 'El teléfono del encargado';

CREATE TABLE correo_encargado(
    id_encargado VARCHAR(50),
    correo_enc VARCHAR(40) 
);

comment ON TABLE correo_encargado IS 'Tabla que contiene los correos del encargado';
comment ON COLUMN correo_encargado.id_encargado IS 'El identificador del encargado';
comment ON COLUMN correo_encargado.correo_enc IS 'El correo del encargado';

CREATE TABLE gerente(
    id_gerente VARCHAR(50) , 
    id_sucursal integer ,
    nombre VARCHAR(20),
    apellido_paterno VARCHAR(20) ,
    apellido_materno VARCHAR(20) ,
    fecha_nacimiento DATE,
    direccion VARCHAR(100) ,
    curp VARCHAR(18), 
    salario integer 
);
comment ON TABLE gerente IS 'Tabla que contiene la información de los gerentes de la sucursal';
comment ON COLUMN gerente.id_gerente IS 'El identificador del gerente';
comment ON COLUMN gerente.id_sucursal IS 'El identificador de la sucursal donde se encuentra el gerente';
comment ON COLUMN gerente.nombre IS 'El nombre o los nombres del gerente';
comment ON COLUMN gerente.apellido_paterno IS 'El apellido paterno del gerente';
comment ON COLUMN gerente.apellido_materno IS 'El apellido materno del gerente';
comment ON COLUMN gerente.fecha_nacimiento IS 'La fecha de nacimiento del gerente';
comment ON COLUMN gerente.direccion IS 'La dirección en la que vive el gerente';
comment ON COLUMN gerente.curp IS 'El CURP del gerente';
comment ON COLUMN gerente.salario IS 'El salario que percibe el gerente';

CREATE TABLE tel_gerente(
    id_gerente VARCHAR(50) ,
    tel_ger VARCHAR(20) 
);
comment ON TABLE tel_gerente IS 'Tabla que contiene los teléfonos del gerente';
comment ON COLUMN tel_gerente.id_gerente IS 'El identificador del gerente';
comment ON COLUMN tel_gerente.tel_ger IS 'El teléfono del gerente';

CREATE TABLE correo_gerente(
    id_gerente VARCHAR(50) ,
    correo_ger VARCHAR(40) 
);

comment ON TABLE correo_gerente IS 'Tabla que contiene los correos del gerente';
comment ON COLUMN correo_gerente.id_gerente IS 'El identificador del gerente';
comment ON COLUMN correo_gerente.correo_ger IS 'El correo del gerente';

CREATE TABLE cliente(
    id_cliente VARCHAR(50) ,
    nombre VARCHAR(20),
    apellido_paterno VARCHAR(20) ,
    apellido_materno VARCHAR(20) ,
    fecha_nacimiento DATE,
    direccion VARCHAR(100)
);


comment ON TABLE cliente IS 'Tabla que contiene la información del cliente';
comment ON COLUMN cliente.id_cliente IS 'El identificador del cliente';
comment ON COLUMN cliente.nombre IS 'El nombre o los nombres del cliente';
comment ON COLUMN cliente.apellido_paterno IS 'El apellido paterno del cliente';
comment ON COLUMN cliente.apellido_paterno IS 'El apellido materno del cliente';
comment ON COLUMN cliente.fecha_nacimiento IS 'La fecha de nacimiento del cliente';

CREATE TABLE tel_cliente(
    id_cliente VARCHAR(50) ,
    tel_cl VARCHAR(20) 
);

comment ON TABLE tel_cliente IS 'Tabla que contiene los teléfonos del cliente';
comment ON COLUMN tel_cliente.id_cliente IS 'El identificador del cliente';
comment ON COLUMN tel_cliente.tel_cl IS 'El teléfono del cliente';

CREATE TABLE correo_cliente(
    id_cliente VARCHAR(50),
    correo_cl VARCHAR(40) 
);
comment ON TABLE correo_cliente IS 'Tabla que contiene los correos de los clientes';
comment ON COLUMN correo_cliente.id_cliente IS 'El identificador del cliente';
comment ON COLUMN correo_cliente.correo_cl IS 'El correo del cliente';

CREATE TYPE metodos_pago as ENUM ('Efectivo', 'Debito', 'Credito');

CREATE TABLE venta(
    id_venta VARCHAR(50) ,
    id_sucursal integer ,
    id_cajero VARCHAR(50) ,
    id_cliente VARCHAR(50),
    metodo metodos_pago ,
    cantidad_producto integer,
    precio_desglose integer
);  


comment ON TABLE venta IS 'Tabla que contiene la información de la venta o ticket';
comment ON COLUMN venta.id_venta IS 'El identificador de la venta o ticket';
comment ON COLUMN venta.id_sucursal IS 'El identificador de la sucursal donde se realizó la venta';
comment ON COLUMN venta.id_cajero IS 'El identificador del cajero que realizó la venta';
comment ON COLUMN venta.id_cliente IS 'El identificador del cliente que hizo la compra';
comment ON COLUMN venta.metodo IS 'El método de pago con el que se realizó la venta';
comment ON COLUMN venta.cantidad_producto IS 'La cantidad de productos que se compraron';
comment ON COLUMN venta.precio_desglose IS 'La cantidad final a pagar';


----Restricciones Sucursal--- 
ALTER TABLE sucursal ADD CONSTRAINT sucursal_pkey PRIMARY KEY(id_sucursal);
ALTER TABLE sucursal ADD CONSTRAINT psu UNIQUE(id_sucursal);
--Dominio
ALTER TABLE sucursal ALTER COLUMN id_sucursal SET NOT NULL;
ALTER TABLE sucursal ADD CONSTRAINT snom CHECK(nombre <>'');
ALTER TABLE sucursal ALTER COLUMN apertura SET NOT NULL;
ALTER TABLE sucursal ADD CONSTRAINT sdir CHECK(direccion <>'');
--Restricciones Departamento--- 
ALTER TABLE departamento ADD CONSTRAINT departamento_pkey PRIMARY KEY(id_departamento);
ALTER TABLE departamento ADD CONSTRAINT pdep UNIQUE(id_departamento);

--Dominio
ALTER TABLE departamento ALTER COLUMN id_departamento SET NOT NULL;
ALTER TABLE departamento ADD CONSTRAINT dnom CHECK(nombre <>'');
ALTER TABLE departamento ADD CONSTRAINT demp CHECK(empaque <>'');
ALTER TABLE departamento ADD CONSTRAINT watts CHECK (watts >= 0);

--Referencial
ALTER TABLE departamento ADD CONSTRAINT dept_fkey FOREIGN KEY(id_sucursal)
REFERENCES sucursal(id_sucursal);


--Restricciones TelefonoSucursal----------------------------------------------------------
--Dominio
ALTER TABLE tel_sucursal ALTER COLUMN tel_su SET NOT NULL;
ALTER TABLE tel_sucursal ADD CONSTRAINT telefonoS CHECK (tel_su SIMILAR TO '[0-9]*');
--Entidad
ALTER TABLE tel_sucursal ADD CONSTRAINT tel_su_pkey PRIMARY KEY(id_sucursal, tel_su);
--Referencial
ALTER TABLE tel_sucursal ADD CONSTRAINT id_su_fkey FOREIGN KEY (id_sucursal)
REFERENCES sucursal(id_sucursal);
--Restricciones Producto--- 
ALTER TABLE producto ADD CONSTRAINT producto_pkey PRIMARY KEY(id_producto);
ALTER TABLE producto ADD CONSTRAINT ppr UNIQUE(id_producto);
ALTER TABLE producto ADD CONSTRAINT idP UNIQUE(id_departamento);
--Dominio
ALTER TABLE producto ALTER COLUMN id_producto SET NOT NULL;
ALTER TABLE producto ADD CONSTRAINT pnom CHECK(nombre <>'');
ALTER TABLE producto ADD CONSTRAINT prec  CHECK (precio >= 0.0);
ALTER TABLE producto ALTER COLUMN marca SET NOT NULL;
ALTER TABLE producto ADD CONSTRAINT  stoc CHECK (stock >= 0);
--Referencial
ALTER TABLE producto ADD CONSTRAINT prod_fkey FOREIGN KEY(id_departamento)
REFERENCES departamento(id_departamento);
--Restricciones cajero--
ALTER TABLE cajero ADD CONSTRAINT cajero_pkey PRIMARY KEY(id_cajero);
ALTER TABLE cajero ADD CONSTRAINT pcaj UNIQUE(id_cajero);
--Dominio
ALTER TABLE cajero ALTER COLUMN id_cajero SET NOT NULL;
ALTER TABLE cajero ADD CONSTRAINT cnom CHECK(nombre <>'');
ALTER TABLE cajero ADD CONSTRAINT apc  CHECK (apellido_paterno <>'');
ALTER TABLE cajero ADD CONSTRAINT amc  CHECK (apellido_materno <>'');
ALTER TABLE cajero ALTER COLUMN fecha_nacimiento SET NOT NULL;
ALTER TABLE cajero ALTER COLUMN direccion SET NOT NULL;
ALTER TABLE cajero ADD CONSTRAINT  curp_c CHECK (curp <> '');
ALTER TABLE cajero ADD CONSTRAINT  salario_c CHECK (salario >= 0);
--Referencial
ALTER TABLE cajero ADD CONSTRAINT cajero_fkey FOREIGN KEY(id_sucursal)
REFERENCES sucursal(id_sucursal);

--Restricciones TelefonoCajero----------------------------------------------------------
--Dominio
ALTER TABLE tel_cajero ALTER COLUMN tel_caj SET NOT NULL;
ALTER TABLE tel_cajero ADD CONSTRAINT telefonoC CHECK (tel_caj SIMILAR TO '[0-9]*');
--Entidad
ALTER TABLE tel_cajero ADD CONSTRAINT tel_caj_pkey PRIMARY KEY(id_cajero, tel_caj);
--Referencial
ALTER TABLE tel_cajero ADD CONSTRAINT id_caj_fkey FOREIGN KEY (id_cajero)
REFERENCES cajero(id_cajero);
--Restricciones CorreoCajero----------------------------------------------------------
--Dominio
ALTER TABLE correo_cajero ALTER COLUMN id_cajero SET NOT NULL;
ALTER TABLE correo_cajero ADD CONSTRAINT correoC  CHECK(correo_caj <> '');
--Entidad
ALTER TABLE correo_cajero ADD CONSTRAINT correo_caj_pkey PRIMARY KEY(id_cajero, correo_caj);
--Referencial
ALTER TABLE correo_cajero ADD CONSTRAINT correo_caj_fkey FOREIGN KEY (id_cajero)
REFERENCES cajero(id_cajero);
--Restricciones encargado--
ALTER TABLE encargado ADD CONSTRAINT encargado_pkey PRIMARY KEY(id_encargado);
ALTER TABLE encargado ADD CONSTRAINT penc UNIQUE(id_encargado);

--Dominio
ALTER TABLE encargado ALTER COLUMN id_encargado SET NOT NULL;
ALTER TABLE encargado ADD CONSTRAINT enom CHECK(nombre <>'');
ALTER TABLE encargado ADD CONSTRAINT ape  CHECK (apellido_paterno <>'');
ALTER TABLE encargado ADD CONSTRAINT ame  CHECK (apellido_materno <>'');
ALTER TABLE encargado ALTER COLUMN fecha_nacimiento SET NOT NULL;
ALTER TABLE encargado ALTER COLUMN direccion SET NOT NULL;
ALTER TABLE encargado ADD CONSTRAINT  curp_c CHECK (curp <> '');
ALTER TABLE encargado ADD CONSTRAINT  salario_c CHECK (salario >= 0);
--Referencial
ALTER TABLE encargado ADD CONSTRAINT encargado_fkey FOREIGN KEY(id_sucursal)
REFERENCES sucursal(id_sucursal);

--Restricciones Telefonoencargado----------------------------------------------------------
--Dominio
ALTER TABLE tel_encargado ALTER COLUMN tel_enc SET NOT NULL;
ALTER TABLE tel_encargado ADD CONSTRAINT telefonoEN CHECK (tel_enc SIMILAR TO '[0-9]*');
--Entidad
ALTER TABLE tel_encargado ADD CONSTRAINT tel_enc_pkey PRIMARY KEY(id_encargado, tel_enc);
--Referencial
ALTER TABLE tel_encargado ADD CONSTRAINT id_enc_fkey FOREIGN KEY (id_encargado)
REFERENCES encargado(id_encargado);
--Restricciones Correoencargado----------------------------------------------------------
--Dominio
ALTER TABLE correo_encargado ALTER COLUMN id_encargado SET NOT NULL;
ALTER TABLE correo_encargado ADD CONSTRAINT correoC  CHECK(correo_enc <> '');
--Entidad
ALTER TABLE correo_encargado ADD CONSTRAINT correo_enc_pkey PRIMARY KEY(id_encargado, correo_enc);
--Referencial
ALTER TABLE correo_encargado ADD CONSTRAINT correo_enc_fkey FOREIGN KEY (id_encargado)
REFERENCES encargado(id_encargado);
--Restricciones gerente--
ALTER TABLE gerente ADD CONSTRAINT gerente_pkey PRIMARY KEY(id_gerente);
ALTER TABLE gerente ADD CONSTRAINT pger UNIQUE(id_gerente);
--Dominio
ALTER TABLE gerente ALTER COLUMN id_gerente SET NOT NULL;
ALTER TABLE gerente ADD CONSTRAINT enom CHECK(nombre <>'');
ALTER TABLE gerente ADD CONSTRAINT ape  CHECK (apellido_paterno <>'');
ALTER TABLE gerente ADD CONSTRAINT ame  CHECK (apellido_materno <>'');
ALTER TABLE gerente ALTER COLUMN fecha_nacimiento SET NOT NULL;
ALTER TABLE gerente ALTER COLUMN direccion SET NOT NULL;
ALTER TABLE gerente ADD CONSTRAINT  curp_c CHECK (curp <> '');
ALTER TABLE gerente ADD CONSTRAINT  salario_c CHECK (salario >= 0);
--Referencial
ALTER TABLE gerente ADD CONSTRAINT gerente_fkey FOREIGN KEY(id_sucursal)
REFERENCES sucursal(id_sucursal);

--Restricciones Telefonogerente----------------------------------------------------------
--Dominio
ALTER TABLE tel_gerente ALTER COLUMN tel_ger SET NOT NULL;
ALTER TABLE tel_gerente ADD CONSTRAINT telefonoG CHECK (tel_ger SIMILAR TO '[0-9]*');
--Entidad
ALTER TABLE tel_gerente ADD CONSTRAINT tel_ger_pkey PRIMARY KEY(id_gerente, tel_ger);
--Referencial
ALTER TABLE tel_gerente ADD CONSTRAINT id_ger_fkey FOREIGN KEY (id_gerente)
REFERENCES gerente(id_gerente);
--Restricciones Correogerente----------------------------------------------------------
--Dominio
ALTER TABLE correo_gerente ALTER COLUMN id_gerente SET NOT NULL;
ALTER TABLE correo_gerente ADD CONSTRAINT correoG  CHECK(correo_ger <> '');
--Entidad
ALTER TABLE correo_gerente ADD CONSTRAINT correo_ger_pkey PRIMARY KEY(id_gerente, correo_ger);
--Referencial
ALTER TABLE correo_gerente ADD CONSTRAINT correo_ger_fkey FOREIGN KEY (id_gerente)
REFERENCES gerente(id_gerente);
--Restricciones cliente--
ALTER TABLE cliente ADD CONSTRAINT cliente_pkey PRIMARY KEY(id_cliente);
ALTER TABLE cliente ADD CONSTRAINT pcl UNIQUE(id_cliente);
--Dominio
ALTER TABLE cliente ALTER COLUMN id_cliente SET NOT NULL;
ALTER TABLE cliente ADD CONSTRAINT enom CHECK(nombre <>'');
ALTER TABLE cliente ADD CONSTRAINT ape  CHECK (apellido_paterno <>'');
ALTER TABLE cliente ADD CONSTRAINT ame  CHECK (apellido_materno <>'');
ALTER TABLE cliente ALTER COLUMN fecha_nacimiento SET NOT NULL;
ALTER TABLE cliente ALTER COLUMN direccion SET NOT NULL;


--Restricciones Telefonocliente----------------------------------------------------------
--Dominio
ALTER TABLE tel_cliente ALTER COLUMN tel_cl SET NOT NULL;
ALTER TABLE tel_cliente ADD CONSTRAINT telefonoCL CHECK (tel_cl SIMILAR TO '[0-9]*');;
--Entidad
ALTER TABLE tel_cliente ADD CONSTRAINT tel_cl_pkey PRIMARY KEY(id_cliente, tel_cl);
--Referencial
ALTER TABLE tel_cliente ADD CONSTRAINT id_cl_fkey FOREIGN KEY (id_cliente)
REFERENCES cliente(id_cliente);
--Restricciones Correocliente----------------------------------------------------------
--Dominio
ALTER TABLE correo_cliente ALTER COLUMN correo_cl SET NOT NULL;
ALTER TABLE correo_cliente ADD CONSTRAINT correoC  CHECK(correo_cl <> '');
--Entidad
ALTER TABLE correo_cliente ADD CONSTRAINT correo_cl_pkey PRIMARY KEY(id_cliente, correo_cl);
--Referencial
ALTER TABLE correo_cliente ADD CONSTRAINT correo_cl_fkey FOREIGN KEY (id_cliente)
REFERENCES cliente(id_cliente);
--Restriciones Ventas--
ALTER TABLE venta ADD CONSTRAINT venta_pkey PRIMARY KEY(id_venta);
ALTER TABLE venta ADD CONSTRAINT pvent UNIQUE(id_venta);
ALTER TABLE venta ADD CONSTRAINT idCajV UNIQUE(id_cajero);
ALTER TABLE venta ADD CONSTRAINT idClV UNIQUE(id_cliente);
--Dominio
ALTER TABLE venta ALTER COLUMN id_venta SET NOT NULL;
ALTER TABLE venta ALTER COLUMN metodo SET NOT NULL;
ALTER TABLE venta ADD CONSTRAINT cantidad_p CHECK(cantidad_producto >= 0);
ALTER TABLE venta ADD CONSTRAINT precio_des CHECK(precio_desglose >= 0.0);
--Referencial
ALTER TABLE venta ADD CONSTRAINT venta_suc_fkey FOREIGN KEY (id_sucursal)
REFERENCES sucursal(id_sucursal);
ALTER TABLE venta ADD CONSTRAINT venta_caj_fkey FOREIGN KEY (id_cajero)
REFERENCES cajero(id_cajero);
ALTER TABLE venta ADD CONSTRAINT venta_cl_fkey FOREIGN KEY (id_cliente)
REFERENCES cliente(id_cliente);