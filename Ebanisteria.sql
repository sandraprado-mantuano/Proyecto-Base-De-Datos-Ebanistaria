CREATE TABLE empleados (
    codigoEmpleado varchar(10) primary key NOT NULL unique,
    nombreEmpleado character(40) NOT NULL unique,
    direccion character varying(50) NOT NULL,
    cedula integer  NOT NULL,
    telefono character varying(10) NOT NULL,
    cargo character(30) NOT NULL unique,
    sueldo double precision NOT NULL,
    horasExtras double precision NOT NULL    
);
select * from empleados;
insert into empleados(codigoEmpleado, nombreEmpleado, direccion, cedula, telefono, cargo, sueldo, horasExtras) values
('E0001', 'Carlos Ruiz', 'los esteros calle 119', 131661221, '0928845210', 'jefe', 490, 60),
('E0002', 'Jenny Pin', 'calle 15 avenida 26', 1210563398, '0987898780', 'contadora', 390, 20),
('E0003', 'Veronica Lopez', 'cdla. El Palmar', 1305543761, '0985442488', 'secretaria', 390, 30),
('E0004', 'Edwin Chuez', 'Barrio San Pedro', 1306645109, '0928990850', 'emlpleado', 400, 100),
('E0005', 'Fabian Vera', 'lo esteros calle 120', 1300877096, '0909945645', 'empleado5 ', 400, 90),
('E0006', 'Oscar Mero', 'La padrera', 1316677430, '0906760987', 'empleado6', 400, 96),
('E0007', 'Beto Parraga', 'la florita', 1316043123, '0921056509', 'empleado7', 400, 48);

CREATE TABLE compra (
    codigoCompra varchar(10) primary key NOT NULL,
    nombreEmpleadopk character(30) NOT NULL unique,
    nombreMaterial character(50) NOT NULL,
    detalle character(50) NOT NULL unique,
    fechaCompra date NOT NULL,
    cantidad integer NOT NULL,
    nombreProveedor character(20) NOT NULL,
    valortotal double precision NOT NULL,
    CONSTRAINT nombreEmpleadopkfkey FOREIGN KEY (nombreEmpleadopk)
    REFERENCES empleados (nombreEmpleado) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE CASCADE    
	);
select * from compra;
insert into compra(codigoCompra, nombreEmpleadopk, nombreMaterial, detalle, fechaCompra, cantidad, nombreProveedor, valorTotal) values
('C0001', 'Jenny Pin', 'pegamento y madera', 'los materiales estan en buen estado', '20/10/2016', 20, 'construcABC', 180),
('C0002', 'Fabian Vera', '10 docenas de clavos y tornillos', 'buen estado', '20/11/2016', 20, 'segureMaterial', 35),
('C0003', 'Oscar Mero', 'madera y cortadora', 'mal estado la madera se devulve cortador buena', '12/02/2018', 3, 'ABCdistrib', 400),
('C0004', 'Veronica Lopez', 'cojines', 'buenos', '03/04/2017', 200, 'distr el duradero', 590),
('C0005', 'Beto Parraga', '10 tarros de pintura y 10 docenas de papellija', ' buenos materiales', '20/11/2019', 20, 'distr amigo const', 100),
('C0006', 'Edwin Chuez', 'grapadora', 'no funciona se devulve', '09/03/2018', 0, 'cost nuevo', 0);

CREATE TABLE registroCompra (
    codigoComprapk varchar (10) NOT NULL,
    codigoEmpleadopk varchar (10) NOT NULL,
    nombreEmpleadopk character(40) NOT NULL,
    cargopk character(30) NOT NULL,
    detallepk character(50) NOT NULL,
    fecha date NOT NULL,
    devolucionMaterial character(50) NOT NULL
    );
select * from registroCompra;
insert into registroCompra (codigoComprapk, codigoEmpleadopk, nombreEmpleadopk, cargopk, detallepk, fecha, devolucionMaterial) values
('C0001','E0002','Jenny Pin', 'contadora', 'los materiales estan en buen estado', '20/10/2016','no se devuelve' ),
('C0001','E0005','Fabian Vera', 'empleado5', 'buen estado', '20/11/2016', 'no devolver'),
('C0001','E0006','Oscar Mero', 'empleado6', 'mal estado la madera se devulve cortador buena', '12/02/2018','si se devuelve la la madera' ),
('C0001','E0003','Veronica Lopez', 'secretaria', 'buenos', '03/04/2017', 'no'),
('C0001','E0007','Beto Parraga', 'empleado7', ' buenos materiales', '20/11/2019', 'no devolver material'),
('C0001','E0004','Edwin Chuez', 'empleado', 'no funciona se devulve', '09/03/2018', 'si' );

CREATE TABLE datosCliente(
    codigoCliente varchar (10) primary key NOT NULL,
    descuentopk varchar (10) NOT NULL,
    nombreCliente character(30) NOT NULL,
    direccion character varying(50) NOT NULL,
    cedula integer NOT NULL,
    telefono integer NOT NULL,
    fecha date NOT NULL
	);
		
select * from datosCliente;
insert into datosCliente(codigoCliente, descuentopk, nombreCliente, direccion, cedula, telefono, fecha) values
('CL01','0 de desc', 'Carlos Ruiz', 'Barrio san pedro', 1305543664, 0965744351 ,'01/1/2018'),
('CL02','no hay des', 'Jenny Pin', 'urb Sariland', 1315546541, 0980945341, '22/09/2018' ),
('CL03','10%','Veronica Lopez', 'urb Antonio', 1356783420, 0987331509,'03/01/2018' ),
('CL04', '0%','Edwin Chuez', 'La Pradera', 1329884530, 0966342083, '06/12/2019'),
('CL05', '20%','Fabian Vera', 'Los Esteros', 1324276890, 0984387044,'03/2/2019');
	
CREATE TABLE ventasMuebles (
    codigoVenta varchar(10) primary key NOT NULL,
    codigoEmpleadopk varchar (10) NOT NULL,
    nombreEmpleadopk character(30) NOT NULL,
    nombreClientepk character(30) NOT NULL,
    nombreMueble character(60) NOT NULL,
    cantidad integer  NOT NULL,
    fecha date NOT NULL,
    valorVenta double precision NOT NULL,
    descuento varchar (10) NOT NULL unique
    );
select * from ventasMuebles;
insert into ventasMuebles(codigoVenta, codigoEmpleadopk, nombreEmpleadopk, nombreClientepk, nombreMueble, cantidad, fecha, valorVenta, descuento) values
('V001','E0001', 'Carlos Ruiz', 'Sandra Prado','juegos de muebles', 2, '19/02/2017', 490, '0 de desc'),
('V002','E0002', 'Jenny Pin', 'Erik Salas', 'armatio', 1, '22/01/2019', 120, 'no hay des'),
('V003','E0003', 'Veronica Lopez', 'Manuel Mera', 'escritorios', 6, '03/07/2018', 800, '10%'),
('V004','E0004', 'Edwin Chuez', 'Pedro Bravo', 'sillas',20, '15/11/2019', 160, '0%'),
('V005','E0005', 'Fabian Vera', 'Rosa Laz','mesas', 20, '09/09/2019', 2100, '20%');

select all codigoEmpleado, nombreEmpleado, direccion, cedula, telefono, cargo, sueldo, horasExtras
from empleados where horasExtras >= '50';

select all codigoCompra, nombreEmpleadopk, fechaCompra
from compra where fechaCompra = '20/11/2016' ;

select all codigoCompra, nombreEmpleadopk, fechaCompra
from compra where fechaCompra =  '09/03/2018' ;

select all  nombreProveedor, nombreEmpleadopk, detalle from compra 
order by nombreProveedor;

select nombreCliente, direccion, telefono, descuentopk
from datosCliente where descuentopk = '10%';


