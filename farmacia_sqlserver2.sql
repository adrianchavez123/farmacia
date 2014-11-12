
create table articulos
(
idArticulo int Identity(1,1),
nombre varchar(60) not null,
descripcion varchar(255) not null,
existencia int not null,
precioVenta real not null,
activo int not null,
primary key (idArticulo)	
)
go


create table empleados
	(
		idEmpleado int not null Identity(1,1),
		nombre varchar(60) not null,
		puesto varchar(30) not null,
		sueldo real not null,
		antiguedad int not null,
		celular varchar(15) not null,
		telefono varchar(10) not null,
		email varchar(100) not null,
		domicilio varchar(100) not null,
		noSeguroSocial varchar(100) not null,
		activo int not  null,
		primary key (idEmpleado)
	)
go


create table clientes
	(
		idCliente int not null Identity(1,1),
		nombre varchar(60) not null,
		domicilio varchar(100) not null,
		colonia varchar(30) not null,
		telefono varchar(10) not null,
		celular varchar(15) not null,
		email varchar(100) not null,
		cp varchar(6) not null,
		municipio varchar(60) not null,
		estado varchar(60) not null,
		activo int not null,
		primary key (idCliente)
	)
go


create table proveedores
	(
		idProveedor int not null Identity(1,1),
		nombre varchar(60) not null,
		domicilio varchar(100) not null,
		colonia varchar(30) not null,
		telefono varchar(10) not null,
		celular varchar(15) not null,
		email varchar(100) not null,
		cp varchar(6) not null,
		municipio varchar(60) not null,
		estado varchar(60) not null,
		rfc varchar(100) not null,
		activo int not null,
		primary key (idProveedor)
	)
go



create table compras
	(
		folioCompra int not null Identity(1,1),
		idProveedor int not null,
		idArticulo int not null,
		cantidad int not null,
		precioCompra real not null,
		porcientoGanancia float not null,
		fecha datetime,
		foreign key (idArticulo) references articulos(idArticulo),
		foreign key (idProveedor) references proveedores(idProveedor),
		primary key (folioCompra)
	)
go

create table ventas
	(
		folioVenta int not null Identity(1,1),
		fecha datetime not null,
		idEmpleado int not null,
		foreign key (idEmpleado) references empleados(idEmpleado),
		primary key (folioVenta)
	)
go
create table detalleVentas
	(
		folioDetalleVenta int not null Identity(1,1),
		folioVenta int not null,
		idArticulo int not null,
		cantidad int not null,
		foreign key (folioVenta) references ventas(folioVenta),
		foreign key (idArticulo) references articulos(idArticulo),
		primary key (folioDetalleVenta)
	)
go




