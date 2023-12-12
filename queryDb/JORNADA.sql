create database DiarioJornada
use DiarioJornada

--Tabla Tipo de Servicios
create table Tipo_Servicio (
TipoServicioID char(10) primary key not null,
Nombre_TS varchar(50),
Descripcion_TS varchar(100)
);

--Tabla Servicios
create table Servicios (
ServicioID char(10) primary key not null,
Nombre_servi varchar(50),
Descripcion_servi varchar(100),
Precio_servi decimal(5,2),
TipoServicioID char(10),
foreign key (TipoServicioID) references Tipo_Servicio(TipoServicioID),
);

--Tabla Promociones
create table Promociones (
PromocionesID char(10) primary key not null,
Nombre_promo varchar(50),
Descripcion_promo varchar(100),
FechaInicio date,
FechaFin date,
Porcentaje_Dsct int
);

--Tabla Descuentos
create table Descuentos (
DescuentoID char(10) primary key not null,
Nombre_des varchar(50),
Descripcion_des varchar(100),
Tipo_des varchar(50),
Valor_des decimal(5,2)
);

--Tabla Empleado
create table Empleado (
EmpleadoID char(10) primary key not null,
DNI int,
Nombre_emple varchar(50),
Apellidos_emple varchar(50),
Telefono_emple int,
Horario_entrada varchar(50),
Horario_salida varchar(50),
);

--Tabla Valoracion_Servicio
create table Valoracion_Servicio (
ValoracionID char(10) primary key not null,
Puntuacion int,
Comentario varchar(200)
);

--Tabla Forma_Pago
create table Forma_Pago (
FormaPagoID char(10) primary key not null,
Nombre_FP varchar(50)
);

--Tabla Tipo_Cliente
create table Tipo_Cliente (
TipoClienteID char(10) primary key not null,
Nombre_TC varchar(50),
Descripcion_TC varchar(100)
);

--Tabla Cliente
create table Cliente (
Cliente_ID char(10) primary key not null,
DNI int,
Nombre_cl varchar(50),
Apellido_cl varchar(50),
Telefono_cl int,
TipoClienteID char(10),
foreign key (TipoClienteID) references Tipo_Cliente(TipoClienteID)
);
--Tabla Detalle_Comprobante
create table Detalle_Comprobante (
DetalleComprobanteID CHAR(10) PRIMARY KEY NOT NULL,
ServicioID char(10),
DescuentoID char(10),
PromocionesID char(10),
Cantidad int,
Subtotal decimal(5,2),
foreign key (ServicioID) references Servicios(ServicioID),
foreign key (DescuentoID) references Descuentos(DescuentoID),
foreign key (PromocionesID) references Promociones(PromocionesID)
);

--Tabla Comprobante_Pago
create table Comprobante_Pago (
ComprobantePagoID char(10) primary key not null,
FechaPago date,
Tipo_Comprobante varchar(50),
FormaPagoID char(10),
Total decimal(5,2),
IGV int,
Monto_IGV decimal(5,2),
Importe_Total decimal(5,2),
DetalleComprobanteID char(10),
EmpleadoID char(10),
Cliente_ID char(10),
ValoracionID char(10)
foreign key (FormapagoID) references Forma_Pago(FormaPagoID),
foreign key (DetalleComprobanteID) references Detalle_Comprobante(DetalleComprobanteID),
foreign key (EmpleadoID) references Empleado(EmpleadoID),
foreign key (Cliente_ID) references Cliente(Cliente_ID),
foreign key (ValoracionID) references Valoracion_Servicio(ValoracionID)
);

-->>--------------------------------------------REGISTROS--------------------------------------------<<--

--Registro Tabla Tipo_Servicio (22)
insert into Tipo_Servicio (TipoServicioID, Nombre_TS, Descripcion_TS)
values
    ('TS001', 'Acceso en l nea', 'Acceso en l nea a todas las noticias'),
    ('TS002', 'Entrega f sica', 'Entrega diaria del diario en papel'),
    ('TS003', 'Entrega f sica y Acceso en l nea', 'Acceso en l nea y entrega diaria en papel'),
    ('TS004', 'Edici n Especial', 'Edici n especial con contenido exclusivo los domingos'),
    ('TS005', 'Noticias locales', 'Noticias de eventos locales'),
    ('TS006', 'Noticias internacionales', 'Cobertura de noticias a nivel mundial'),
    ('TS007', 'Edici n Deportiva', 'Cobertura completa de eventos deportivos'),
    ('TS008', 'Edici n de Negocios', 'Informaci n financiera y de negocios'),
    ('TS009', 'Edici n de Tecnolog a', 'Novedades y avances tecnol gicos'),
    ('TS010', 'Edici n Cultural', 'Art culos sobre arte, m sica y cultura'),
    ('TS011', 'Edici n de Moda', 'Tendencias en moda y estilo'),
    ('TS012', 'Edici n de Salud', 'Informaci n sobre salud y bienestar'),
    ('TS013', 'Edici n de Ciencia', 'Descubrimientos cient ficos y avances'),
    ('TS014', 'Edici n Pol tica', 'Cobertura de noticias pol ticas'),
    ('TS015', 'Edici n de Entretenimiento', 'Noticias de cine, m sica y entretenimiento'),
    ('TS016', 'Edici n de Medio Ambiente', 'Informaci n sobre temas ecol gicos'),
    ('TS017', 'Edici n de Viajes', 'Destinos de viaje y consejos'),
    ('TS018', 'Edici n de Educaci n', 'Cobertura de temas educativos'),
    ('TS019', 'Edici n Gastron mica', 'Recetas, cr ticas de restaurantes y m s'),
    ('TS020', 'Servicio de Comentarios', 'Participaci n en la secci n de comentarios'),
    ('TS021', 'Edici n de Mascotas', 'Consejos para due os de mascotas'),
    ('TS022', 'Noticias de Viajes', 'Novedades y consejos de viajes');

--Registro Tabla Servicios (60)
insert into Servicios (ServicioID, Nombre_servi, Descripcion_servi, Precio_servi, TipoServicioID)
values
    ('S001', 'Suscripci n digital', 'Acceso en l nea a todas las noticias', 9.99, 'TS001'),
    ('S002', 'Suscripci n impresa', 'Entrega diaria del diario en papel', 19.99, 'TS002'),
    ('S003', 'Combo digital e impreso', 'Acceso en l nea y entrega diaria en papel', 24.99, 'TS003'),
    ('S004', 'Edici n dominical', 'Edici n especial con contenido exclusivo los domingos', 4.99, 'TS004'),
    ('S005', 'Suscripci n mensual', 'Acceso en l nea durante un mes', 14.99, 'TS001'),
    ('S006', 'Noticias locales', 'Noticias de eventos locales', 2.99, 'TS005'),
    ('S007', 'Noticias internacionales', 'Cobertura de noticias a nivel mundial', 4.99, 'TS006'),
    ('S008', 'Suscripci n anual', 'Acceso en l nea durante un a o', 149.99, 'TS001'),
    ('S009', 'Edici n deportiva', 'Cobertura completa de eventos deportivos', 3.99, 'TS007'),
    ('S010', 'Edici n de negocios', 'Informaci n financiera y de negocios', 5.99, 'TS008'),
    ('S011', 'Noticias de tecnolog a', 'Novedades y avances tecnol gicos', 3.49, 'TS009'),
    ('S012', 'Suplemento cultural', 'Art culos sobre arte, m sica y cultura', 2.49, 'TS010'),
    ('S013', 'Edici n de moda', 'Tendencias en moda y estilo', 3.79, 'TS011'),
    ('S014', 'Servicio premium', 'Acceso exclusivo a contenido premium', 29.99, 'TS004'),
    ('S015', 'Noticias de salud', 'Informaci n sobre salud y bienestar', 3.29, 'TS012'),
    ('S016', 'Suscripci n semanal', 'Acceso en l nea durante una semana', 5.99, 'TS001'),
    ('S017', 'Noticias de ciencia', 'Descubrimientos cient ficos y avances', 4.49, 'TS013'),
    ('S018', 'Edici n pol tica', 'Cobertura de noticias pol ticas', 3.99, 'TS014'),
    ('S019', 'Suscripci n familiar', 'Acceso en l nea para toda la familia', 19.99, 'TS001'),
    ('S020', 'Edici n de entretenimiento', 'Noticias de cine, m sica y entretenimiento', 3.79, 'TS015'),
    ('S021', 'Servicio de archivos', 'Acceso a archivos hist ricos del diario', 9.99, 'TS001'),
    ('S022', 'Noticias de medio ambiente', 'Informaci n sobre temas ecol gicos', 3.49, 'TS016'),
    ('S023', 'Edici n de viajes', 'Destinos de viaje y consejos', 4.79, 'TS017'),
    ('S024', 'Noticias de educaci n', 'Cobertura de temas educativos', 2.99, 'TS018'),
    ('S025', 'Noticias de gastronom a', 'Recetas, cr ticas de restaurantes y m s', 4.29, 'TS019'),
    ('S026', 'Servicio de comentarios', 'Participaci n en la secci n de comentarios', 1.99, 'TS020'),
    ('S027', 'Edici n de mascotas', 'Consejos para due os de mascotas', 2.49, 'TS021'),
    ('S028', 'Noticias de viajes', 'Novedades y consejos de viajes', 3.99, 'TS022'),
    ('S029', 'Servicio de alertas', 'Alertas de noticias importantes', 0.99, 'TS004'),
    ('S030', 'Noticias de deportes', 'Cobertura deportiva en tiempo real', 4.99, 'TS007'),
    ('S031', 'Edici n nocturna', 'Noticias actualizadas durante la noche', 3.49, 'TS001'),
    ('S032', 'Servicio de comentarios premium', 'Participaci n destacada en comentarios', 2.99, 'TS020'),
    ('S033', 'Noticias de deportes extremos', 'Cobertura de deportes de riesgo', 4.99, 'TS007'),
    ('S034', 'Suscripci n de fin de semana', 'Acceso los viernes, s bados y domingos', 9.99, 'TS001'),
    ('S035', 'Edici n de ciencia ficci n', 'Noticias sobre ciencia ficci n y fantas a', 3.79, 'TS015'),
    ('S036', 'Noticias de autom viles', 'Cobertura de la industria automotriz', 2.99, 'TS009'),
    ('S037', 'Suscripci n estudiantil', 'Descuento especial para estudiantes', 7.99, 'TS016'),
    ('S038', 'Edici n de arquitectura', 'Noticias sobre arquitectura y dise o', 3.29, 'TS018'),
    ('S039', 'Noticias de m sica cl sica', 'Cobertura de m sica cl sica', 2.49, 'TS010'),
    ('S040', 'Edici n de jardiner a', 'Consejos para jardineros aficionados', 4.49, 'TS016'),
    ('S041', 'Servicio de notificaciones', 'Recibe alertas de noticias en tiempo real', 1.99, 'TS005'),
    ('S042', 'Edici n de comedia', 'Noticias y contenido humor stico', 3.99, 'TS015'),
    ('S043', 'Noticias de viajes ex ticos', 'Destinos de viaje inusuales', 4.79, 'TS017'),
    ('S044', 'Suscripci n corporativa', 'Acceso para empresas y empleados', 19.99, 'TS008'),
    ('S045', 'Edici n de astronom a', 'Noticias sobre el cosmos y estrellas', 3.79, 'TS013'),
    ('S046', 'Noticias de historia', 'Cobertura de eventos hist ricos', 2.99, 'TS018'),
    ('S047', 'Edici n de poes a', 'Poes a y literatura l rica', 2.49, 'TS010'),
    ('S048', 'Servicio de resumen diario', 'Recibe un resumen por correo', 1.49, 'TS004'),
    ('S049', 'Edici n de revistas', 'Contenido similar al de revistas', 4.99, 'TS011'),
    ('S050', 'Noticias de cine independiente', 'Pel culas y cine alternativo', 3.29, 'TS015'),
    ('S051', 'Edici n de filosof a', 'Art culos sobre pensamiento filos fico', 2.49, 'TS013'),
    ('S052', 'Servicio de contenido multimedia', 'Acceso a videos y multimedia', 5.99, 'TS015'),
    ('S053', 'Noticias de bienestar', 'Salud y consejos para el bienestar', 3.99, 'TS012'),
    ('S054', 'Edici n de ajedrez', 'Cobertura de ajedrez y juegos de mesa', 2.99, 'TS015'),
    ('S055', 'Noticias de desarrollo web', 'Cobertura de tecnolog a web', 4.49, 'TS009'),
    ('S056', 'Edici n de psicolog a', 'Art culos sobre la mente y comportamiento', 3.29, 'TS012'),
    ('S057', 'Servicio de recomendaciones personalizadas', 'Recomendaciones basadas en tu historial', 1.99, 'TS004'),
    ('S058', 'Noticias de geograf a', 'Cobertura de geograf a y viajes', 4.79, 'TS006'),
	('S059', 'Noticias de rubgy', 'Noticias en tiempo real de rugby', 4.79, 'TS007'),
	('S060', 'Noticias de Argentina', 'Noticias en tiempo real de Argentina', 4.79, 'TS006');

--Registro Tabla Promociones (30)
SELECT * FROM Promociones;
insert into Promociones (PromocionesID, Nombre_promo, Descripcion_promo, FechaInicio, FechaFin, Porcentaje_Dsct)
values
    ('P001', 'Promoci n de verano', 'Descuento de verano para suscriptores', '2023-06-01', '2023-08-31', 15),
    ('P002', 'Promoci n de fin de semana', 'Oferta especial para viernes y s bado', '2023-07-01', '2023-07-02', 20),
    ('P003', 'Promoci n estudiantil', 'Descuento exclusivo para estudiantes', '2023-09-01', '2023-12-31', 25),
    ('P004', 'Promoci n de aniversario', 'Celebrando nuestro aniversario con descuentos', '2023-10-15', '2023-10-20', 30),
    ('P005', 'Promoci n de primavera', 'Oferta especial para la temporada de primavera', '2023-04-01', '2023-04-30', 10),
    ('P006', 'Promoci n de Navidad', 'Descuento navide o para regalos', '2023-12-01', '2023-12-24', 15),
    ('P007', 'Promoci n de Black Friday', 'Ofertas exclusivas para el Viernes Negro', '2023-11-24', '2023-11-24', 40),
    ('P008', 'Promoci n de A o Nuevo', 'Comienza el a o con descuentos', '2024-01-01', '2024-01-02', 20),
    ('P009', 'Promoci n de regreso a clases', 'Descuento para la temporada escolar', '2023-08-15', '2023-08-31', 15),
    ('P010', 'Promoci n de Halloween', 'Ofertas especiales para Halloween', '2023-10-31', '2023-10-31', 25),
    ('P011', 'Promoci n de oto o', 'Descuento para la temporada de oto o', '2023-09-15', '2023-11-30', 10),
    ('P012', 'Promoci n de San Valent n', 'Oferta especial para el D a de San Valent n', '2023-02-14', '2023-02-14', 20),
    ('P013', 'Promoci n de acci n de gracias', 'Descuento para el D a de Acci n de Gracias', '2023-11-23', '2023-11-23', 30),
    ('P014', 'Promoci n de invierno', 'Oferta invernal para suscriptores', '2023-12-21', '2023-12-31', 15),
    ('P015', 'Promoci n de Cyber Monday', 'Descuentos en l nea exclusivos', '2023-11-27', '2023-11-27', 35),
    ('P016', 'Promoci n de Pascua', 'Ofertas especiales para la Semana Santa', '2023-04-16', '2023-04-16', 20),
    ('P017', 'Promoci n de D a de la Tierra', 'Descuento por el D a de la Tierra', '2023-04-22', '2023-04-22', 25),
    ('P018', 'Promoci n de d a de los abuelos', 'Descuento por el D a de los Abuelos', '2023-09-10', '2023-09-10', 20),
    ('P019', 'Promoci n de d a de las madres', 'Descuento por el D a de las Madres', '2023-05-14', '2023-05-14', 15),
    ('P020', 'Promoci n de d a de los padres', 'Descuento por el D a de los Padres', '2023-06-18', '2023-06-18', 15),
    ('P021', 'Promoci n de d a de los ni os', 'Descuento por el D a de los Ni os', '2023-04-30', '2023-04-30', 20),
    ('P022', 'Promoci n de d a de la independencia', 'Oferta especial para el D a de la Independencia', '2023-07-04', '2023-07-04', 25),
    ('P023', 'Promoci n de d a del trabajo', 'Descuento para el D a del Trabajo', '2023-09-04', '2023-09-04', 15),
    ('P024', 'Promoci n de d a de acci n de gracias', 'Descuento para el D a de Acci n de Gracias', '2023-11-23', '2023-11-23', 30),
    ('P025', 'Promoci n de d a de San Patricio', 'Descuento por el D a de San Patricio', '2023-03-17', '2023-03-17', 20),
    ('P026', 'Promoci n de d a de la Tierra', 'Descuento por el D a de la Tierra', '2023-04-22', '2023-04-22', 25),
    ('P027', 'Promoci n de d a de la mujer', 'Descuento por el D a de la Mujer', '2023-03-08', '2023-03-08', 15),
    ('P028', 'Promoci n de d a de la juventud', 'Descuento por el D a de la Juventud', '2023-08-12', '2023-08-12', 15),
    ('P029', 'Promoci n de d a de la tecnolog a', 'Oferta especial para el D a de la Tecnolog a', '2023-09-10', '2023-09-10', 20),
    ('P030', 'Promoci n de d a de la m sica', 'Descuento por el D a de la M sica', '2023-06-21', '2023-06-21', 10);

--Registro Tabla Descuentos (30)
insert into Descuentos (DescuentoID, Nombre_des, Descripcion_des, Tipo_des, Valor_des)
values
	('D001', 'Descuento de verano', 'Oferta especial para la temporada de verano', 'Porcentaje', 15),
    ('D002', 'Descuento de primavera', 'Descuento para la temporada de primavera', 'Porcentaje', 10),
    ('D003', 'Descuento de oto o', 'Oferta especial para la temporada de oto o', 'Porcentaje', 20),
    ('D004', 'Descuento de invierno', 'Descuento para la temporada de invierno', 'Porcentaje', 25),
    ('D005', 'Descuento de vacaciones', 'Oferta especial para las vacaciones', 'Porcentaje', 30),
    ('D006', 'Descuento de fin de semana', 'Descuento para fines de semana', 'Porcentaje', 10),
    ('D007', 'Descuento de d a festivo', 'Oferta especial para d as festivos', 'Porcentaje', 15),
    ('D008', 'Descuento de aniversario', 'Descuento para celebrar el aniversario', 'Porcentaje', 20),
    ('D009', 'Descuento de cumplea os', 'Oferta especial para cumplea os', 'Porcentaje', 10),
    ('D010', 'Descuento de estudiante', 'Descuento para estudiantes', 'Porcentaje', 15),
    ('D011', 'Descuento de lealtad', 'Oferta especial para clientes leales', 'Porcentaje', 10),
    ('D012', 'Descuento de suscripci n', 'Descuento para suscripciones', 'Porcentaje', 20),
    ('D013', 'Descuento de primer compra', 'Oferta especial para primeras compras', 'Porcentaje', 15),
    ('D014', 'Descuento de amigo referido', 'Descuento por referir a un amigo', 'Porcentaje', 10),
    ('D015', 'Descuento de tiempo limitado', 'Oferta por tiempo limitado', 'Porcentaje', 25),
    ('D016', 'Descuento de d a de San Valent n', 'Descuento para el D a de San Valent n', 'Porcentaje', 20),
    ('D017', 'Descuento de d a de la madre', 'Oferta especial para el D a de la Madre', 'Porcentaje', 15),
    ('D018', 'Descuento de d a del padre', 'Descuento para el D a del Padre', 'Porcentaje', 10),
    ('D019', 'Descuento de Black Friday', 'Ofertas especiales para el Black Friday', 'Porcentaje', 30),
    ('D020', 'Descuento de Cyber Monday', 'Ofertas especiales para el Cyber Monday', 'Porcentaje', 25),
    ('D021', 'Descuento de Navidad', 'Descuento para la temporada navide a', 'Porcentaje', 20),
    ('D022', 'Descuento de a o nuevo', 'Oferta especial para el A o Nuevo', 'Porcentaje', 15),
    ('D023', 'Descuento de d a de Acci n de Gracias', 'Descuento para el D a de Acci n de Gracias', 'Porcentaje', 25),
    ('D024', 'Descuento de Halloween', 'Ofertas especiales para Halloween', 'Porcentaje', 20),
    ('D025', 'Descuento de regreso a clases', 'Descuento para el regreso a clases', 'Porcentaje', 15),
    ('D026', 'Descuento de d a del trabajo', 'Oferta especial para el D a del Trabajo', 'Porcentaje', 25),
    ('D027', 'Descuento de d a de la independencia', 'Descuento para el D a de la Independencia', 'Porcentaje', 20),
    ('D028', 'Descuento de Pascua', 'Oferta especial para la Pascua', 'Porcentaje', 10),
    ('D029', 'Descuento de San Patricio', 'Descuento por el D a de San Patricio', 'Porcentaje', 15),
    ('D030', 'Descuento de Black Friday', 'Ofertas especiales para el Black Friday', 'Porcentaje', 30);

--Registro Tabla Detalle_Comprobante (30)
SELECT * FROM Detalle_Comprobante;
INSERT INTO Detalle_Comprobante(DetalleComprobanteID, ServicioID, DescuentoID, PromocionesID, Cantidad, Subtotal)
VALUES
	('DC001', 'S001', 'D001', 'P001', 2, 45.00),
	('DC002', 'S002', 'D002', 'P005', 1, 22.50),
	('DC003', 'S003', 'D003', 'P011', 3, 67.50),
	('DC004', 'S004', 'D004', 'P014', 2, 36.00),
	('DC005', 'S005', 'D005', 'P001', 1, 18.00),
	('DC006', 'S006', 'D006', 'P002', 4, 90.00),
	('DC007', 'S007', 'D007', 'P006', 1, 22.50),
	('DC008', 'S008', 'D008', 'P004', 2, 45.00),
	('DC009', 'S009', 'D009', 'P002', 3, 67.50),
	('DC010', 'S010', 'D010', 'P003', 1, 18.00),
	('DC011', 'S011', 'D011', 'P015', 2, 36.00),
	('DC012', 'S012', 'D012', 'P015', 1, 22.50),
	('DC013', 'S013', 'D013', 'P015', 3, 67.50),
	('DC014', 'S014', 'D014', 'P009', 2, 45.00),
	('DC015', 'S015', 'D015', 'P001', 1, 18.00),
	('DC016', 'S016', 'D016', 'P012', 4, 90.00),
	('DC017', 'S017', 'D017', 'P019', 1, 22.50),
	('DC018', 'S018', 'D018', 'P020', 2, 45.00),
	('DC019', 'S019', 'D019', 'P007', 3, 67.50),
	('DC020', 'S020', 'D020', 'P015', 1, 18.00),
	('DC021', 'S021', 'D021', 'P006', 2, 36.00),
	('DC022', 'S022', 'D022', 'P008', 1, 22.50),
	('DC023', 'S023', 'D023', 'P024', 3, 67.50),
	('DC024', 'S024', 'D024', 'P010', 2, 45.00),
	('DC025', 'S025', 'D025', 'P009', 1, 18.00),
	('DC026', 'S026', 'D026', 'P023', 4, 90.00),
	('DC027', 'S027', 'D027', 'P022', 1, 22.50),
	('DC028', 'S028', 'D028', 'P016', 2, 45.00),
	('DC029', 'S029', 'D029', 'P025', 3, 67.50),
	('DC030', 'S030', 'D030', 'P007', 1, 18.00);

	select * from Empleado
--Registro Tabla Empleado (30)
INSERT INTO Empleado (EmpleadoID, DNI, Nombre_emple, Apellidos_emple, Telefono_emple, Horario_entrada, Horario_salida)
VALUES
	('E001', '123456789', 'Juan', 'P rez', 955512345, '08:00', '17:00'),
    ('E002', '987654321', 'Mar a', 'Rodr guez', 955523456, '09:00', '18:00'),
    ('E003', '567890123', 'Carlos', 'G mez', 955534567, '09:30', '18:30'),
    ('E004', '789012345', 'Ana', 'L pez', 955545678, '08:30', '17:30'),
    ('E005', '345678901', 'Javier', 'Torres', 955556789, '07:45', '16:45'),
    ('E006', '234567890', 'Laura', 'S nchez', 955567890, '08:15', '17:15'),
    ('E007', '456789012', 'Marcos', 'Mart nez', 955578901, '10:00', '19:00'),
    ('E008', '678901234', 'Isabel', 'Garc a', 955589012, '09:00', '18:00'),
    ('E009', '890123456', 'Jos ', 'Fern ndez', 955590123, '07:30', '16:30'),
    ('E010', '123890456', 'Sof a', 'P rez', 955501234, '08:45', '17:45'),
    ('E011', '456789012', 'Ra l', 'Morales', 955534567, '10:30', '19:30'),
    ('E012', '789012345', 'Elena', 'Cruz', 955545678, '07:30', '16:30'),
    ('E013', '234567890', 'Sergio', 'Herrera', 955556789, '09:15', '18:15'),
    ('E014', '345678901', 'Carmen', 'Vargas', 955567890, '08:30', '17:30'),
    ('E015', '567890123', 'Luis', 'Delgado', 955578901, '10:15', '19:15'),
    ('E016', '678901234', 'Ana', 'Mendoza', 955589012, '08:00', '17:00'),
    ('E017', '890123456', 'Diego', 'Romero', 955590123, '09:45', '18:45'),
    ('E018', '123890456', 'Marta', 'Ortega', 955501234, '07:45', '16:45'),
    ('E019', '234567890', 'Paula', 'Gonz lez', 955534567, '08:30', '17:30'),
    ('E020', '456789012', 'Andr s', 'Jim nez', 955545678, '09:00', '18:00'),
    ('E021', '789012345', 'Patricia', 'Navarro', 955567890, '10:30', '19:30'),
    ('E022', '567890123', 'Mario', 'Silva', 955578901, '08:15', '17:15'),
    ('E023', '678901234', 'Laura', 'R os', 955589012, '08:45', '17:45'),
    ('E024', '890123456', 'Antonio', 'Guzm n', 955590123, '07:30', '16:30'),
    ('E025', '123890456', 'Elena', 'Castillo', 955501234, '09:15', '18:15'),
    ('E026', '234567890', 'Juan', 'Paredes', 955534567, '08:30', '17:30'),
    ('E027', '345678901', 'Ana', 'Soto', 955556789, '10:00', '19:00'),
    ('E028', '567890123', 'Luis', 'Ortega', 955578901, '08:30', '17:30'),
    ('E029', '678901234', 'Sof a', 'Morales', 955589012, '09:00', '18:00'),
    ('E030', '890123456', 'David', 'R os', 955590123, '08:00', '17:00'),
	('E041', '621654987', 'Cristina', 'Quintana', 955566611, '08:00', '17:00'),
    ('E042', '732165498', 'Alberto', 'Cuevas', 955522233, '09:00', '18:00'),
    ('E043', '843216549', 'Rosa', 'Bellido', 955533344, '09:30', '18:30'),
    ('E044', '954321654', 'Félix', 'Navarro', 955544455, '08:30', '17:30'),
    ('E045', '065432165', 'Hugo', 'Casas', 955555566, '07:45', '16:45'),
    ('E046', '176543216', 'Lidia', 'Vento', 955566677, '08:15', '17:15'),
    ('E047', '287654321', 'Amalia', 'Corrales', 955577788, '10:00', '19:00'),
    ('E048', '398765432', 'Federico', 'Machado', 955588899, '09:00', '18:00'),
    ('E049', '409876543', 'Estela', 'Pizarro', 955599900, '07:30', '16:30'),
    ('E050', '510987654', 'Oscar', 'Tejero', 955500011, '08:45', '17:45'),
    ('E051', '621098765', 'Nora', 'Solís', 955511122, '08:00', '17:00'),
    ('E052', '732109876', 'Aarón', 'Menéndez', 955522233, '09:00', '18:00'),
    ('E053', '843210987', 'Carla', 'Montero', 955533344, '09:30', '18:30'),
    ('E054', '954321098', 'Luciano', 'Paz', 955544455, '08:30', '17:30'),
    ('E055', '065432109', 'Diana', 'Cano', 955555566, '07:45', '16:45'),
    ('E056', '176543210', 'Gonzalo', 'Prieto', 955566677, '08:15', '17:15'),
    ('E057', '287654321', 'Almudena', 'Soler', 955577788, '10:00', '19:00'),
    ('E058', '398765432', 'Ignacio', 'Serrano', 955588899, '09:00', '18:00'),
    ('E059', '409876543', 'Susana', 'Ortega', 955599900, '07:30', '16:30'),
    ('E060', '510987654', 'Víctor', 'Gallego', 955500011, '08:45', '17:45');

--Registro Tabla Valoracion_Servicio (30)
INSERT INTO Valoracion_Servicio (ValoracionID, Puntuacion, Comentario)
VALUES
	('V001', 4, 'Excelente cobertura de noticias.'),
	('V002', 3, 'Buen contenido, pero la maquetaci n es confusa.'),
	('V003', 5, 'Me encanta este diario, siempre bien informado.'),
	('V004', 4, 'Las noticias son buenas, pero podr an ser m s imparciales.'),
	('V005', 2, 'Demasiada publicidad en la p gina principal.'),
	('V006', 5, 'Gran variedad de secciones y reportajes.'),
	('V007', 4, 'Buenos an lisis pol ticos.'),
	('V008', 3, 'A veces tienen problemas con las fechas de publicaci n.'),
	('V009', 4, 'Las entrevistas son interesantes.'),
	('V010', 5, 'Me mantienen al tanto de todo.'),
	('V011', 2, 'La p gina web es lenta para cargar.'),
	('V012', 4, 'Art culos bien escritos.'),
	('V013', 3, 'Necesitan m s cobertura de noticias internacionales.'),
	('V014', 5, 'Muy informativo, especialmente en temas locales.'),
	('V015', 4, 'La app m vil es f cil de usar.'),
	('V016', 2, 'Contenido repetitivo en ocasiones.'),
	('V017', 5, 'Art culos de opini n perspicaces.'),
	('V018', 4, 'Buen equilibrio entre noticias y entretenimiento.'),
	('V019', 3, 'La secci n deportiva podr a ser m s completa.'),
	('V020', 4, 'Buena cobertura de eventos locales.'),
	('V021', 5, ' El mejor diario de la ciudad!'),
	('V022', 3, 'La calidad de impresi n podr a mejorar.'),
	('V023', 4, 'Art culos de investigaci n de alta calidad.'),
	('V024', 2, 'Demasiados errores tipogr ficos.'),
	('V025', 4, 'Buenos reportajes fotogr ficos.'),
	('V026', 3, 'Falta de diversidad en los columnistas.'),
	('V027', 5, 'La secci n de cultura es genial.'),
	('V028', 4, 'Cobertura en tiempo real de eventos importantes.'),
	('V029', 3, 'M s contenido de ciencia y tecnolog a, por favor.'),
	('V030', 4, 'Interesantes editoriales pol ticos.');

--Registro Tabla Forma_Pago (10)
INSERT INTO Forma_Pago (FormaPagoID, Nombre_FP)
VALUES
	('FP01', 'Tarjeta de Cr dito'),
	('FP02', 'Tarjeta de D bito'),
	('FP03', 'Efectivo'),
	('FP04', 'Transferencia Bancaria'),
	('FP05', 'PayPal'),
	('FP06', 'Apple Pay'),
	('FP07', 'Google Wallet'),
	('FP08', 'Yape'),
	('FP09', 'Plin'),
	('FP10', 'Izipay');

--Registro Tabla Tipo_Cliente (30)
INSERT INTO Tipo_Cliente (TipoClienteID, Nombre_TC, Descripcion_TC)
VALUES
	('TC01', 'Suscriptor', 'Clientes que tienen una suscripci n'),
	('TC02', 'Visitante', 'Usuarios que visitan ocasionalmente'),
	('TC03', 'Premium', 'Clientes con acceso premium'),
	('TC04', 'Estudiante', 'Estudiantes con descuento'),
	('TC05', 'Corporativo', 'Clientes corporativos'),
	('TC06', 'Invitado', 'Usuarios invitados por otros'),
	('TC07', 'VIP', 'Clientes VIP con beneficios exclusivos'),
	('TC08', 'B sico', 'Acceso b sico gratuito'),
	('TC09', 'Gold', 'Clientes Gold con ventajas adicionales'),
	('TC10', 'Platino', 'Clientes Platino con m ximas ventajas'),
	('TC11', 'Novato', 'Nuevos usuarios'),
	('TC12', 'Anual', 'Clientes con suscripci n anual'),
	('TC13', 'Mensual', 'Clientes con suscripci n mensual'),
	('TC14', 'Diamante', 'Clientes Diamante con ventajas especiales'),
	('TC15', 'Empleado', 'Empleados con beneficios'),
	('TC16', 'Senior', 'Clientes Senior con descuento'),
	('TC17', 'Familiar', 'Clientes con suscripci n familiar'),
	('TC18', 'Premium Plus', 'Clientes Premium Plus'),
	('TC19', 'Joven', 'Clientes j venes con descuento'),
	('TC20', 'Empresarial', 'Clientes empresariales'),
	('TC21', 'Frequent Flyer', 'Clientes frecuentes con beneficios'),
	('TC22', 'Plus', 'Clientes Plus con ventajas adicionales'),
	('TC23', 'Reseller', 'Revendedores de suscripciones'),
	('TC24', 'Digital', 'Clientes con acceso digital'),
	('TC25', 'Acceso Completo', 'Acceso completo a contenido'),
	('TC26', 'Lite', 'Clientes con acceso Lite'),
	('TC27', 'Trial', 'Usuarios en per odo de prueba'),
	('TC28', 'Invitado VIP', 'Usuarios invitados con acceso VIP'),
	('TC29', 'Socio', 'Clientes socios con ventajas adicionales'),
	('TC30', 'Especial', 'Clientes con acceso especial');

--Registro Tabla Cliente (150)
INSERT INTO Cliente (Cliente_ID, DNI, Nombre_cl, Apellido_cl, Telefono_cl, TipoClienteID)
VALUES
	('C001', '123456789', 'Ana', 'Rodr guez', 901234567, 'TC01'),
	('C002', '987654321', 'Juan', 'P rez', 908765432, 'TC02'),
	('C003', '456789123', 'Mar a', 'L pez', 912345678, 'TC03'),
	('C004', '789123456', 'Pedro', 'Garc a', 909876543, 'TC04'),
	('C005', '321654987', 'Laura', 'Mart nez', 990123456, 'TC05'),
	('C006', '654987321', 'Carlos', 'Fern ndez', 938475629, 'TC06'),
	('C007', '135792468', 'Andrea', 'Torres', 943216578, 'TC07'),
	('C008', '246813579', 'Luis', 'Gonz lez', 954738291, 'TC08'),
	('C009', '987123456', 'Julia', 'S nchez', 968574302, 'TC09'),
	('C010', '654321789', 'Roberto', 'Ram rez', 923456789, 'TC10'),
	('C011', '321789654', 'Sofia', 'Vargas', 967543821, 'TC11'),
	('C012', '789654321', 'Diego', 'Castro', 945678903, 'TC12'),
	('C013', '456123789', 'Valentina', 'Morales', 987654321, 'TC13'),
	('C014', '321987654', 'Jorge', 'D az', 956738290, 'TC14'),
	('C015', '987456321', 'Carolina', 'Ortega', 912345679, 'TC15'),
	('C016', '123789456', 'Sergio', 'Herrera', 976543218, 'TC16'),
	('C017', '654123987', 'Paula', 'Jim nez', 989012345, 'TC17'),
	('C018', '789321654', 'Arturo', 'Mendoza', 918273645, 'TC18'),
	('C019', '456987123', 'Natalia', 'Silva', 974635218, 'TC19'),
	('C020', '987654123', 'Daniel', 'R os', 930127456, 'TC20'),
	('C021', '321987456', 'Patricia', 'Guzm n', 952864301, 'TC21'),
	('C022', '654789321', 'Marcos', 'Navarro', 949382715, 'TC22'),
	('C023', '123456987', 'Valeria', 'Escobar', 983745621, 'TC23'),
	('C024', '987321654', 'Andrea', 'Paredes', 905678432, 'TC24'),
	('C025', '789654123', 'Martin', 'Soto', 924503186, 'TC25'),
	('C026', '456321789', 'Isabella', 'Rivas', 936712548, 'TC26'),
	('C027', '321654789', 'Eduardo', 'Castro', 928467351, 'TC27'),
	('C028', '654789123', 'Antonia', 'Morales', 928467351, 'TC28'),
	('C029', '987123789', 'Gabriel', 'Carrasco', 901236578, 'TC29'),
	('C030', '123789654', 'Mariana', 'Reyes', 932156789, 'TC30'),
	('C031', '123456789', 'Luc a', 'Hern ndez', 901234567, 'TC25'),
    ('C032', '234567890', 'Andr s', 'Vargas', 902345678, 'TC15'),
    ('C033', '345678901', 'Carmen', 'Ram rez', 903456789, 'TC13'),
    ('C034', '456789012', 'Daniel', 'Ortega', 904567890, 'TC24'),
    ('C035', '567890123', 'Elena', 'Silva', 905678901, 'TC05'),
    ('C036', '678901234', 'Francisco', 'Molina', 906789012, 'TC15'),
    ('C037', '789012345', 'Lorena', 'Rojas', 907890123, 'TC26'),
    ('C038', '890123456', 'Juan', 'Cruz', 908901234, 'TC07'),
    ('C039', '901234567', 'Beatriz', 'Paz', 909012345, 'TC18'),
    ('C040', '012345678', 'Diego', 'Jim nez', 901123456, 'TC09'),
    ('C041', '123456789', 'Ana', 'Rodr guez', 901234567, 'TC30'),
    ('C042', '234567890', 'Luis', 'Gonz lez', 902345678, 'TC01'),
    ('C043', '345678901', 'Mar a', 'Mart nez', 903456789, 'TC02'),
    ('C044', '456789012', 'Carlos', 'L pez', 904567890, 'TC02'),
    ('C045', '567890123', 'Laura', 'P rez', 905678901, 'TC03'),
    ('C046', '678901234', 'Pedro', 'S nchez', 906789012, 'TC11'),
    ('C047', '789012345', 'Sof a', 'Torres', 907890123, 'TC22'),
    ('C048', '890123456', 'Javier', 'Fern ndez', 908901234, 'TC13'),
    ('C049', '901234567', 'Isabel', 'G mez', 909012345, 'TC11'),
    ('C050', '012345678', 'Miguel', 'D az', 901123456, 'TC22'),
    ('C051', '123456789', 'Luc a', 'Hern ndez', 901234567, 'TC23'),
    ('C052', '234567890', 'Andr s', 'Vargas', 902345678, 'TC21'),
    ('C053', '345678901', 'Carmen', 'Ram rez', 903456789, 'TC02'),
    ('C054', '456789012', 'Daniel', 'Ortega', 904567890, 'TC03'),
    ('C055', '567890123', 'Elena', 'Silva', 905678901, 'TC11'),
    ('C056', '678901234', 'Francisco', 'Molina', 906789012, 'TC02'),
    ('C057', '789012345', 'Lorena', 'Rojas', 907890123, 'TC03'),
    ('C058', '890123456', 'Juan', 'Cruz', 908901234, 'TC21'),
    ('C059', '901234567', 'Beatriz', 'Paz', 909012345, 'TC02'),
    ('C060', '012345678', 'Diego', 'Jim nez', 901123456, 'TC23'),
    ('C061', '123456789', 'Ana', 'Rodr guez', 901234567, 'TC01'),
    ('C062', '234567890', 'Luis', 'Gonz lez', 902345678, 'TC12'),
    ('C063', '345678901', 'Mar a', 'Mart nez', 903456789, 'TC03'),
    ('C064', '456789012', 'Carlos', 'L pez', 904567890, 'TC11'),
    ('C065', '567890123', 'Laura', 'P rez', 905678901, 'TC12'),
    ('C066', '678901234', 'Pedro', 'S nchez', 906789012, 'TC03'),
    ('C067', '789012345', 'Sof a', 'Torres', 907890123, 'TC01'),
    ('C068', '890123456', 'Javier', 'Fern ndez', 908901234, 'TC02'),
    ('C069', '901234567', 'Isabel', 'G mez', 909012345, 'TC03'),
    ('C070', '012345678', 'Miguel', 'D az', 901123456, 'TC01'),
    ('C071', '123456789', 'Luc a', 'Hern ndez', 901234567, 'TC02'),
    ('C072', '234567890', 'Andr s', 'Vargas', 902345678, 'TC03'),
    ('C073', '345678901', 'Carmen', 'Ram rez', 903456789, 'TC01'),
    ('C074', '456789012', 'Daniel', 'Ortega', 904567890, 'TC02'),
    ('C075', '567890123', 'Elena', 'Silva', 905678901, 'TC03'),
    ('C076', '678901234', 'Francisco', 'Molina', 906789012, 'TC01'),
    ('C077', '789012345', 'Lorena', 'Rojas', 907890123, 'TC02'),
    ('C078', '890123456', 'Juan', 'Cruz', 908901234, 'TC03'),
    ('C079', '901234567', 'Beatriz', 'Paz', 909012345, 'TC01'),
    ('C080', '012345678', 'Diego', 'Jim nez', 901123456, 'TC02'),
    ('C081', '123456789', 'Ana', 'Rodr guez', 901234567, 'TC03'),
    ('C082', '234567890', 'Luis', 'Gonz lez', 902345678, 'TC01'),
    ('C083', '345678901', 'Mar a', 'Mart nez', 903456789, 'TC02'),
    ('C084', '456789012', 'Carlos', 'L pez', 904567890, 'TC03'),
    ('C085', '567890123', 'Laura', 'P rez', 905678901, 'TC01'),
    ('C086', '678901234', 'Pedro', 'S nchez', 906789012, 'TC02'),
    ('C087', '789012345', 'Sof a', 'Torres', 907890123, 'TC03'),
    ('C088', '890123456', 'Javier', 'Fern ndez', 908901234, 'TC01'),
    ('C089', '901234567', 'Isabel', 'G mez', 909012345, 'TC02'),
    ('C090', '012345678', 'Miguel', 'D az', 901123456, 'TC03'),
    ('C091', '123456789', 'Luc a', 'Hern ndez', 901234567, 'TC01'),
    ('C092', '234567890', 'Andr s', 'Vargas', 902345678, 'TC02'),
    ('C093', '345678901', 'Carmen', 'Ram rez', 903456789, 'TC03'),
    ('C094', '456789012', 'Daniel', 'Ortega', 904567890, 'TC01'),
    ('C095', '567890123', 'Elena', 'Silva', 905678901, 'TC02'),
    ('C096', '678901234', 'Francisco', 'Molina', 906789012, 'TC03'),
    ('C097', '789012345', 'Lorena', 'Rojas', 907890123, 'TC01'),
    ('C098', '890123456', 'Juan', 'Cruz', 908901234, 'TC02'),
    ('C099', '901234567', 'Beatriz', 'Paz', 909012345, 'TC03'),
    ('C100', '012345678', 'Diego', 'Jim nez', 901123456, 'TC01'),
    ('C101', '123456789', 'Ana', 'Rodr guez', 901234567, 'TC02'),
    ('C102', '234567890', 'Luis', 'Gonz lez', 902345678, 'TC03'),
    ('C103', '345678901', 'Mar a', 'Mart nez', 903456789, 'TC01'),
    ('C104', '456789012', 'Carlos', 'L pez', 904567890, 'TC02'),
    ('C105', '567890123', 'Laura', 'P rez', 905678901, 'TC03'),
    ('C106', '678901234', 'Pedro', 'S nchez', 906789012, 'TC01'),
    ('C107', '789012345', 'Sof a', 'Torres', 907890123, 'TC02'),
    ('C108', '890123456', 'Javier', 'Fern ndez', 908901234, 'TC03'),
    ('C109', '901234567', 'Isabel', 'G mez', 909012345, 'TC01'),
    ('C110', '012345678', 'Miguel', 'D az', 901123456, 'TC02'),
    ('C111', '123456789', 'Luc a', 'Hern ndez', 901234567, 'TC03'),
    ('C112', '234567890', 'Andr s', 'Vargas', 902345678, 'TC01'),
    ('C113', '345678901', 'Carmen', 'Ram rez', 903456789, 'TC02'),
    ('C114', '456789012', 'Daniel', 'Ortega', 904567890, 'TC03'),
    ('C115', '567890123', 'Elena', 'Silva', 905678901, 'TC01'),
    ('C116', '678901234', 'Francisco', 'Molina', 906789012, 'TC02'),
    ('C117', '789012345', 'Lorena', 'Rojas', 907890123, 'TC03'),
    ('C118', '890123456', 'Juan', 'Cruz', 908901234, 'TC01'),
    ('C119', '901234567', 'Beatriz', 'Paz', 909012345, 'TC02'),
    ('C120', '012345678', 'Diego', 'Jim nez', 901123456, 'TC03'),
	('C121', '123456789', 'Ana', 'Rodr guez', 901234567, 'TC01'),
	('C122', '234567890', 'Luis', 'Gonz lez', 902345678, 'TC02'),
	('C123', '345678901', 'Mar a', 'Mart nez', 903456789, 'TC03'),
	('C124', '456789012', 'Carlos', 'L pez', 904567890, 'TC01'),
	('C125', '567890123', 'Laura', 'P rez', 905678901, 'TC02'),
	('C126', '678901234', 'Pedro', 'S nchez', 906789012, 'TC03'),
	('C127', '789012345', 'Sof a', 'Torres', 907890123, 'TC01'),
	('C128', '890123456', 'Javier', 'Fern ndez', 908901234, 'TC02'),
	('C129', '901234567', 'Isabel', 'G mez', 909012345, 'TC03'),
	('C130', '012345678', 'Miguel', 'D az', 901123456, 'TC01'),
	('C131', '123456789', 'Luc a', 'Hern ndez', 901234567, 'TC02'),
	('C132', '234567890', 'Andr s', 'Vargas', 902345678, 'TC03'),
	('C133', '345678901', 'Carmen', 'Ram rez', 903456789, 'TC01'),
	('C134', '456789012', 'Daniel', 'Ortega', 904567890, 'TC02'),
	('C135', '567890123', 'Elena', 'Silva', 905678901, 'TC03'),
	('C136', '678901234', 'Francisco', 'Molina', 906789012, 'TC01'),
	('C137', '789012345', 'Lorena', 'Rojas', 907890123, 'TC02'),
	('C138', '890123456', 'Juan', 'Cruz', 908901234, 'TC03'),
	('C139', '901234567', 'Beatriz', 'Paz', 909012345, 'TC01'),
	('C140', '012345678', 'Diego', 'Jim nez', 901123456, 'TC02'),
	('C141', '123456789', 'Ana', 'Rodr guez', 901234567, 'TC03'),
	('C142', '234567890', 'Luis', 'Gonz lez', 902345678, 'TC01'),
	('C143', '345678901', 'Mar a', 'Mart nez', 903456789, 'TC02'),
	('C144', '456789012', 'Carlos', 'L pez', 904567890, 'TC03'),
	('C145', '567890123', 'Laura', 'P rez', 905678901, 'TC01'),
	('C146', '678901234', 'Pedro', 'S nchez', 906789012, 'TC02'),
	('C147', '789012345', 'Sof a', 'Torres', 907890123, 'TC03'),
	('C148', '890123456', 'Javier', 'Fern ndez', 908901234, 'TC01'),
	('C149', '901234567', 'Isabel', 'G mez', 909012345, 'TC02'),
	('C150', '012345678', 'Miguel', 'D az', 901123456, 'TC03');
	

--Registro Tabla Comprobante_Pago ()
SELECT * FROM Comprobante_Pago;
INSERT INTO Comprobante_Pago (ComprobantePagoID, FechaPago, Tipo_Comprobante, FormaPagoID, Total, IGV, Monto_IGV, Importe_Total, DetalleComprobanteID, EmpleadoID, Cliente_ID, ValoracionID)
VALUES
	('CP001', '2023-09-01', 'Boleta', 'FP01', 75.00, 18.00, 57.00, 75.00, 'DC001', 'E001', 'C001', 'V001'),
	('CP002', '2023-09-02', 'Boleta', 'FP02', 42.50, 10.20, 32.30, 42.50, 'DC002', 'E002', 'C002', 'V002'),
	('CP003', '2023-09-03', 'Factura', 'FP01', 120.00, 28.80, 91.20, 120.00, 'DC003', 'E003', 'C003', 'V003'),
	('CP004', '2023-09-04', 'Boleta', 'FP03', 95.75, 22.98, 72.77, 95.75, 'DC004', 'E004', 'C004', 'V004'),
	('CP005', '2023-09-05', 'Factura', 'FP02', 55.25, 13.26, 41.99, 55.25, 'DC005', 'E005', 'C005', 'V005'),
	('CP006', '2023-09-06', 'Boleta', 'FP01', 68.90, 16.54, 52.36, 68.90, 'DC006', 'E006', 'C006', 'V006'),
	('CP007', '2023-09-07', 'Factura', 'FP03', 32.40, 7.78, 24.62, 32.40, 'DC007', 'E007', 'C007', 'V007'),
	('CP008', '2023-09-08', 'Boleta', 'FP02', 89.20, 21.41, 67.79, 89.20, 'DC008', 'E008', 'C008', 'V008'),
	('CP009', '2023-09-09', 'Boleta', 'FP01', 110.50, 26.52, 83.98, 110.50, 'DC009', 'E009', 'C009', 'V009'),
	('CP010', '2023-09-10', 'Factura', 'FP02', 45.60, 10.94, 34.66, 45.60, 'DC010', 'E010', 'C010', 'V010'),
	('CP011', '2023-09-11', 'Factura', 'FP01', 78.25, 18.78, 59.47, 78.25, 'DC011', 'E011', 'C011', 'V011'),
	('CP012', '2023-09-12', 'Boleta', 'FP03', 63.75, 15.30, 48.45, 63.75, 'DC012', 'E012', 'C012', 'V012'),
	('CP013', '2023-09-13', 'Boleta', 'FP02', 52.00, 12.48, 39.52, 52.00, 'DC013', 'E013', 'C013', 'V013'),
	('CP014', '2023-09-14', 'Boleta', 'FP01', 37.80, 9.07, 28.73, 37.80, 'DC014', 'E014', 'C014', 'V014'),
	('CP015', '2023-09-15', 'Factura', 'FP03', 95.00, 22.80, 72.20, 95.00, 'DC015', 'E015', 'C015', 'V015'),
	('CP016', '2023-09-16', 'Boleta', 'FP02', 82.60, 19.82, 62.78, 82.60, 'DC016', 'E016', 'C016', 'V016'),
	('CP017', '2023-09-17', 'Factura', 'FP01', 120.25, 28.86, 91.39, 120.25, 'DC017', 'E017', 'C017', 'V017'),
	('CP018', '2023-09-18', 'Boleta', 'FP03', 55.90, 13.42, 42.48, 55.90, 'DC018', 'E018', 'C018', 'V018'),
	('CP019', '2023-09-19', 'Boleta', 'FP02', 68.75, 16.50, 52.25, 68.75, 'DC019', 'E019', 'C019', 'V019'),
	('CP020', '2023-09-20', 'Boleta', 'FP01', 43.20, 10.37, 32.83, 43.20, 'DC020', 'E020', 'C020', 'V020'),
	('CP021', '2023-09-21', 'Boleta', 'FP03', 91.40, 21.94, 69.46, 91.40, 'DC021', 'E021', 'C021', 'V021'),
	('CP022', '2023-09-22', 'Boleta', 'FP02', 72.80, 17.47, 55.33, 72.80, 'DC022', 'E022', 'C022', 'V022'),
	('CP023', '2023-09-23', 'Boleta', 'FP01', 38.50, 9.24, 29.26, 38.50, 'DC023', 'E023', 'C023', 'V023'),
	('CP024', '2023-09-24', 'Boleta', 'FP03', 105.60, 25.34, 80.26, 105.60, 'DC024', 'E024', 'C024', 'V024'),
	('CP025', '2023-09-25', 'Factura', 'FP02', 49.75, 11.94, 37.81, 49.75, 'DC025', 'E025', 'C025', 'V025'),
	('CP026', '2023-09-26', 'Boleta', 'FP01', 73.00, 17.52, 55.48, 73.00, 'DC026', 'E026', 'C026', 'V026'),
	('CP027', '2023-09-27', 'Boleta', 'FP03', 64.20, 15.41, 48.79, 64.20, 'DC027', 'E027', 'C027', 'V027'),
	('CP028', '2023-09-28', 'Boleta', 'FP02', 89.90, 21.58, 68.32, 89.90, 'DC028', 'E028', 'C028', 'V028'),
	('CP029', '2023-09-29', 'Boleta', 'FP01', 42.40, 10.18, 32.22, 42.40, 'DC029', 'E029', 'C029', 'V029'),
	('CP030', '2023-09-30', 'Boleta', 'FP03', 115.00, 27.60, 87.40, 115.00, 'DC030', 'E030', 'C030', 'V030'),
	('CP031', '2023-09-01', 'Boleta', 'FP01', 75.00, 18.00, 57.00, 75.00, 'DC001', 'E001', 'C031', 'V001'),
	('CP032', '2023-09-02', 'Boleta', 'FP02', 82.50, 19.80, 62.70, 82.50, 'DC002', 'E002', 'C032', 'V002'),
	('CP033', '2023-11-29', 'Boleta', 'FP06', 58.60, 14.06, 44.54, 58.60, 'DC010', 'E020', 'C033', 'V010'),
	('CP034', '2023-11-29', 'Boleta', 'FP03', 58.60, 14.06, 44.54, 58.60, 'DC020', 'E030', 'C034', 'V020'),
	('CP035', '2023-09-03', 'Boleta', 'FP03', 60.00, 14.40, 45.60, 60.00, 'DC003', 'E003', 'C035', 'V003'),
	('CP036', '2023-09-04', 'Boleta', 'FP04', 45.75, 10.98, 34.77, 45.75, 'DC004', 'E004', 'C036', 'V004'),
	('CP037', '2023-09-05', 'Boleta', 'FP05', 93.20, 22.37, 70.83, 93.20, 'DC005', 'E005', 'C037', 'V005'),
	('CP038', '2023-09-06', 'Boleta', 'FP06', 68.90, 16.54, 52.36, 68.90, 'DC006', 'E006', 'C038', 'V006'),
	('CP039', '2023-09-07', 'Boleta', 'FP07', 53.25, 12.78, 40.47, 53.25, 'DC007', 'E007', 'C039', 'V007'),
	('CP040', '2023-09-08', 'Boleta', 'FP08', 77.40, 18.58, 58.82, 77.40, 'DC008', 'E008', 'C040', 'V008'),
	('CP041', '2023-09-09', 'Boleta', 'FP09', 64.60, 15.50, 49.10, 64.60, 'DC009', 'E009', 'C041', 'V009'),
	('CP042', '2023-09-10', 'Boleta', 'FP10', 89.75, 21.54, 68.21, 89.75, 'DC010', 'E010', 'C042', 'V010'),
	('CP043', '2023-09-11', 'Boleta', 'FP01', 73.20, 17.57, 55.63, 73.20, 'DC011', 'E011', 'C043', 'V011'),
	('CP044', '2023-09-12', 'Boleta', 'FP02', 51.90, 12.46, 39.44, 51.90, 'DC012', 'E012', 'C044', 'V012'),
	('CP045', '2023-09-13', 'Boleta', 'FP03', 96.50, 23.16, 73.34, 96.50, 'DC013', 'E013', 'C045', 'V013'),
	('CP046', '2023-09-14', 'Boleta', 'FP04', 62.75, 15.06, 47.69, 62.75, 'DC014', 'E014', 'C046', 'V014'),
	('CP047', '2023-09-15', 'Boleta', 'FP05', 49.30, 11.83, 37.47, 49.30, 'DC015', 'E015', 'C047', 'V015'),
	('CP048', '2023-09-16', 'Boleta', 'FP06', 84.20, 20.21, 63.99, 84.20, 'DC016', 'E016', 'C048', 'V016'),
	('CP049', '2023-09-17', 'Boleta', 'FP07', 70.10, 16.82, 53.28, 70.10, 'DC017', 'E017', 'C049', 'V017'),
	('CP050', '2023-09-18', 'Factura', 'FP08', 55.25, 13.26, 41.99, 55.25, 'DC018', 'E018', 'C050', 'V018'),
	('CP051', '2023-09-19', 'Factura', 'FP09', 79.80, 19.15, 60.65, 79.80, 'DC019', 'E019', 'C051', 'V019'),
	('CP052', '2023-09-20', 'Boleta', 'FP10', 67.40, 16.18, 51.22, 67.40, 'DC020', 'E020', 'C052', 'V020'),
	('CP053', '2023-09-21', 'Boleta', 'FP01', 58.60, 14.06, 44.54, 58.60, 'DC021', 'E021', 'C053', 'V021'),
	('CP054', '2023-09-22', 'Boleta', 'FP02', 91.30, 21.91, 69.39, 91.30, 'DC022', 'E022', 'C054', 'V022'),
	('CP055', '2023-09-23', 'Boleta', 'FP03', 63.85, 15.32, 48.53, 63.85, 'DC023', 'E023', 'C055', 'V023'),
	('CP056', '2023-09-24', 'Boleta', 'FP04', 48.45, 11.61, 36.84, 48.45, 'DC024', 'E024', 'C056', 'V024'),
	('CP057', '2023-09-25', 'Boleta', 'FP05', 86.70, 20.81, 65.89, 86.70, 'DC025', 'E025', 'C057', 'V025'),
	('CP058', '2023-09-26', 'Boleta', 'FP06', 74.55, 17.89, 56.66, 74.55, 'DC026', 'E026', 'C058', 'V026'),
	('CP059', '2023-09-27', 'Boleta', 'FP07', 54.70, 13.13, 41.57, 54.70, 'DC027', 'E027', 'C059', 'V027'),
	('CP060', '2023-09-28', 'Boleta', 'FP08', 80.90, 19.42, 61.48, 80.90, 'DC028', 'E028', 'C060', 'V028'),
	('CP061', '2023-09-29', 'Boleta', 'FP09', 66.20, 15.89, 50.31, 66.20, 'DC029', 'E029', 'C061', 'V029'),
	('CP062', '2023-09-30', 'Boleta', 'FP10', 59.15, 14.12, 45.03, 59.15, 'DC030', 'E030', 'C062', 'V030'),
	('CP063', '2023-10-01', 'Boleta', 'FP01', 75.00, 18.00, 57.00, 75.00, 'DC001', 'E001', 'C063', 'V011'),
	('CP064', '2023-10-02', 'Factura', 'FP02', 82.50, 19.80, 62.70, 82.50, 'DC002', 'E002', 'C064', 'V012'),
	('CP065', '2023-10-03', 'Boleta', 'FP03', 60.00, 14.40, 45.60, 60.00, 'DC003', 'E003', 'C065', 'V013'),
	('CP066', '2023-10-04', 'Boleta', 'FP04', 45.75, 10.98, 34.77, 45.75, 'DC004', 'E004', 'C066', 'V014'),
	('CP067', '2023-10-05', 'Boleta', 'FP05', 93.20, 22.37, 70.83, 93.20, 'DC005', 'E005', 'C067', 'V015'),
	('CP068', '2023-10-06', 'Boleta', 'FP06', 68.90, 16.54, 52.36, 68.90, 'DC006', 'E006', 'C068', 'V016'),
	('CP069', '2023-10-07', 'Boleta', 'FP07', 53.25, 12.78, 40.47, 53.25, 'DC007', 'E007', 'C069', 'V017'),
	('CP070', '2023-10-08', 'Boleta', 'FP08', 77.40, 18.58, 58.82, 77.40, 'DC008', 'E008', 'C070', 'V018'),
	('CP071', '2023-10-09', 'Factura', 'FP09', 64.60, 15.50, 49.10, 64.60, 'DC009', 'E009', 'C071', 'V019'),
	('CP072', '2023-10-10', 'Boleta', 'FP10', 89.75, 21.54, 68.21, 89.75, 'DC010', 'E010', 'C072', 'V020'),
	('CP073', '2023-10-11', 'Factura', 'FP01', 73.20, 17.57, 55.63, 73.20, 'DC011', 'E011', 'C073', 'V001'),
	('CP074', '2023-10-12', 'Boleta', 'FP02', 51.90, 12.46, 39.44, 51.90, 'DC012', 'E012', 'C074', 'V002'),
	('CP075', '2023-10-13', 'Boleta', 'FP03', 96.50, 23.16, 73.34, 96.50, 'DC013', 'E013', 'C075', 'V003'),
	('CP076', '2023-10-14', 'Factura', 'FP04', 62.75, 15.06, 47.69, 62.75, 'DC014', 'E014', 'C076', 'V004'),
	('CP077', '2023-10-15', 'Boleta', 'FP05', 49.30, 11.83, 37.47, 49.30, 'DC015', 'E015', 'C077', 'V005'),
	('CP078', '2023-10-16', 'Factura', 'FP06', 84.20, 20.21, 63.99, 84.20, 'DC016', 'E016', 'C078', 'V006'),
	('CP079', '2023-10-17', 'Boleta', 'FP07', 70.10, 16.82, 53.28, 70.10, 'DC017', 'E017', 'C079', 'V007'),
	('CP080', '2023-10-18', 'Factura', 'FP08', 55.25, 13.26, 41.99, 55.25, 'DC018', 'E018', 'C080', 'V008'),
	('CP081', '2023-10-19', 'Boleta', 'FP09', 79.80, 19.15, 60.65, 79.80, 'DC019', 'E019', 'C081', 'V009'),
	('CP082', '2023-10-20', 'Factura', 'FP10', 67.40, 16.18, 51.22, 67.40, 'DC020', 'E020', 'C082', 'V030'),
	('CP083', '2023-10-21', 'Factura', 'FP01', 58.60, 75.00, 18.00, 58.60, 'DC021', 'E021', 'C083', 'V011'),
	('CP084', '2023-10-22', 'Boleta', 'FP02', 91.30, 21.91, 69.39, 91.30, 'DC022', 'E002', 'C084', 'V012'),
	('CP085', '2023-10-23', 'Factura', 'FP03', 63.85, 15.32, 48.53, 63.85, 'DC023', 'E023', 'C085', 'V013'),
	('CP086', '2023-10-24', 'Boleta', 'FP04', 48.45, 11.61, 36.84, 48.45, 'DC024', 'E024', 'C086', 'V014'),
	('CP087', '2023-10-25', 'Boleta', 'FP05', 86.70, 20.81, 65.89, 86.70, 'DC025', 'E025', 'C087', 'V015'),
	('CP088', '2023-10-26', 'Factura', 'FP06', 74.55, 17.89, 56.66, 74.55, 'DC026', 'E026', 'C088', 'V016'),
	('CP089', '2023-10-27', 'Boleta', 'FP07', 54.70, 13.13, 41.57, 54.70, 'DC027', 'E027', 'C089', 'V017'),
	('CP090', '2023-10-28', 'Boleta', 'FP08', 78.45, 18.83, 59.62, 78.45, 'DC028', 'E028', 'C090', 'V018'),
	('CP091', '2023-10-29', 'Factura', 'FP09', 66.80, 16.03, 50.77, 66.80, 'DC029', 'E029', 'C091', 'V019'),
	('CP092', '2023-10-30', 'Boleta', 'FP10', 58.60, 14.06, 44.54, 58.60, 'DC030', 'E030', 'C092', 'V010'),
	('CP093', '2023-10-31', 'Factura', 'FP01', 75.00, 18.00, 57.00, 75.00, 'DC001', 'E011', 'C093', 'V011'),
	('CP094', '2023-11-01', 'Boleta', 'FP02', 82.50, 19.80, 62.70, 82.50, 'DC002', 'E012', 'C094', 'V012'),
	('CP095', '2023-11-02', 'Factura', 'FP03', 60.00, 14.40, 45.60, 60.00, 'DC003', 'E013', 'C095', 'V013'),
	('CP096', '2023-11-03', 'Boleta', 'FP04', 45.75, 10.98, 34.77, 45.75, 'DC004', 'E014', 'C096', 'V014'),
	('CP097', '2023-11-04', 'Factura', 'FP05', 93.20, 22.37, 70.83, 93.20, 'DC005', 'E015', 'C097', 'V015'),
	('CP098', '2023-11-05', 'Boleta', 'FP06', 68.90, 16.54, 52.36, 68.90, 'DC006', 'E016', 'C098', 'V016'),
	('CP099', '2023-11-06', 'Factura', 'FP07', 53.25, 12.78, 40.47, 53.25, 'DC007', 'E017', 'C099', 'V017'),
	('CP100', '2023-11-07', 'Factura', 'FP08', 77.40, 18.58, 58.82, 77.40, 'DC008', 'E018', 'C100', 'V018'),
	('CP101', '2023-11-08', 'Boleta', 'FP09', 64.60, 15.50, 49.10, 64.60, 'DC009', 'E019', 'C101', 'V019'),
	('CP102', '2023-11-09', 'Boleta', 'FP10', 89.75, 21.54, 68.21, 89.75, 'DC010', 'E020', 'C102', 'V020'),
	('CP103', '2023-11-10', 'Boleta', 'FP01', 73.20, 17.57, 55.63, 73.20, 'DC011', 'E001', 'C103', 'V021'),
	('CP104', '2023-11-11', 'Factura', 'FP02', 51.90, 12.46, 39.44, 51.90, 'DC012', 'E002', 'C104', 'V022'),
	('CP105', '2023-11-12', 'Factura', 'FP03', 96.50, 23.16, 73.34, 96.50, 'DC013', 'E003', 'C105', 'V023'),
	('CP106', '2023-11-13', 'Factura', 'FP04', 62.75, 15.06, 47.69, 62.75, 'DC014', 'E004', 'C106', 'V024'),
	('CP107', '2023-11-14', 'Factura', 'FP05', 49.30, 11.83, 37.47, 49.30, 'DC015', 'E005', 'C107', 'V025'),
	('CP108', '2023-11-15', 'Boleta', 'FP06', 84.20, 20.21, 63.99, 84.20, 'DC016', 'E006', 'C108', 'V026'),
	('CP109', '2023-11-16', 'Boleta', 'FP07', 70.10, 16.82, 53.28, 70.10, 'DC017', 'E007', 'C109', 'V027'),
	('CP110', '2023-11-17', 'Factura', 'FP08', 55.25, 13.26, 41.99, 55.25, 'DC018', 'E008', 'C110', 'V028'),
	('CP111', '2023-11-18', 'Boleta', 'FP09', 79.80, 19.15, 60.65, 79.80, 'DC019', 'E009', 'C111', 'V029'),
	('CP112', '2023-11-19', 'Boleta', 'FP10', 67.40, 16.18, 51.22, 67.40, 'DC020', 'E030', 'C112', 'V030'),
	('CP113', '2023-11-20', 'Boleta', 'FP01', 58.60, 14.06, 44.54, 58.60, 'DC021', 'E021', 'C113', 'V001'),
	('CP114', '2023-11-21', 'Factura', 'FP02', 91.30, 21.91, 69.39, 91.30, 'DC022', 'E022', 'C114', 'V002'),
	('CP115', '2023-11-22', 'Boleta', 'FP03', 63.85, 15.32, 48.53, 63.85, 'DC023', 'E023', 'C115', 'V003'),
	('CP116', '2023-11-23', 'Factura', 'FP04', 48.45, 11.61, 36.84, 48.45, 'DC024', 'E024', 'C116', 'V004'),
	('CP117', '2023-11-24', 'Factura', 'FP05', 86.70, 20.81, 65.89, 86.70, 'DC025', 'E025', 'C117', 'V005'),
	('CP118', '2023-11-25', 'Boleta', 'FP06', 74.55, 17.89, 56.66, 74.55, 'DC026', 'E026', 'C118', 'V006'),
	('CP119', '2023-11-26', 'Factura', 'FP07', 54.70, 13.13, 41.57, 54.70, 'DC027', 'E027', 'C119', 'V007'),
	('CP120', '2023-11-27', 'Factura', 'FP08', 78.45, 18.83, 59.62, 78.45, 'DC028', 'E028', 'C120', 'V008'),
	('CP121', '2023-11-28', 'Boleta', 'FP09', 66.80, 16.03, 50.77, 66.80, 'DC029', 'E029', 'C121', 'V009'),
	('CP122', '2023-11-29', 'Factura', 'FP10', 58.60, 14.06, 44.54, 58.60, 'DC030', 'E020', 'C122', 'V010'),
	('CP123', '2023-11-29', 'Factura', 'FP10', 58.60, 14.06, 44.54, 58.60, 'DC010', 'E010', 'C123', 'V020'),
	('CP124', '2023-11-29', 'Boleta', 'FP10', 58.60, 14.06, 44.54, 58.60, 'DC020', 'E010', 'C124', 'V011'),
	('CP125', '2023-11-29', 'Factura', 'FP10', 58.60, 14.06, 44.54, 58.60, 'DC030', 'E020', 'C125', 'V012'),
	('CP126', '2023-11-29', 'Boleta', 'FP01', 58.60, 14.06, 44.54, 58.60, 'DC005', 'E010', 'C126', 'V001'),
	('CP127', '2023-11-29', 'Factura', 'FP04', 58.60, 14.06, 44.54, 58.60, 'DC001', 'E005', 'C127', 'V002'),
	('CP128', '2023-11-29', 'Factura', 'FP02', 58.60, 14.06, 44.54, 58.60, 'DC008', 'E007', 'C128', 'V021'),
	('CP129', '2023-11-29', 'Boleta', 'FP05', 58.60, 14.06, 44.54, 58.60, 'DC025', 'E002', 'C129', 'V022'),
	('CP130', '2023-11-29', 'Factura', 'FP07', 58.60, 14.06, 44.54, 58.60, 'DC014', 'E003', 'C130', 'V023');

select * from Detalle_Comprobante
delete from Comprobante_Pago

------------------------------------------------------------------------------------------------------------
-->>----------------------------------------------CONSULTAS---------------------------------------------<<--
-->>--------------------------------------------SUBCONSULTAS--------------------------------------------<<--
------------------------------------------------------------------------------------------------------------

--1--Obtener el total de ventas de cada uno de los empleados--

SELECT e.Nombre_emple, e.Apellidos_emple, (
	SELECT SUM(c.Total)
	FROM Comprobante_Pago c
	WHERE c.EmpleadoID = e.EmpleadoID) AS Total_Ventas
FROM Empleado e;

--2--Clientes con mayor cantidad de compras--

SELECT c.Nombre_cl, c.Apellido_cl, (
	SELECT COUNT(*) 
	FROM Comprobante_Pago cp 
	WHERE cp.Cliente_ID = c.Cliente_ID) AS Total_Compras
FROM Cliente c
ORDER BY Total_Compras DESC;

--3--Promoci n m s utilizada--

SELECT p.Nombre_promo, (
	SELECT COUNT(*) 
	FROM Comprobante_Pago cp 
	WHERE cp.DetalleComprobanteID = p.PromocionesID) AS Total_Utilizaciones
FROM Promociones p
ORDER BY Total_Utilizaciones DESC;

--4--Empleados con mejor rendimiento--

SELECT e.Nombre_emple, e.Apellidos_emple, (
	SELECT SUM(cp.Total) 
	FROM Comprobante_Pago cp 
	WHERE cp.EmpleadoID = e.EmpleadoID) AS Total_Ventas
FROM Empleado e
ORDER BY Total_Ventas DESC;

--5--Clientes que gastaron m s dinero--

SELECT c.Nombre_cl, c.Apellido_cl, (
	SELECT SUM(cp.Total) 
	FROM Comprobante_Pago cp 
	WHERE cp.Cliente_ID = c.Cliente_ID) AS Total_Gastado
FROM Cliente c
ORDER BY Total_Gastado DESC;

--6--Obtener el nombre del tipo de servicio de un servicio espec fico--

SELECT (
	SELECT Nombre_TS 
	FROM Tipo_Servicio 
	WHERE TipoServicioID = S.TipoServicioID) AS TipoDeServicio
FROM Servicios S;

--7--Obtener el valor de descuento aplicado en un detalle de comprobante espec fico--

SELECT (
	SELECT Valor_des 
	FROM Descuentos 
	WHERE DescuentoID = DC.DescuentoID) AS ValorDescuento
FROM Detalle_Comprobante DC;

--8--Obtener el nombre del cliente en un comprobante de pago espec fico--

SELECT (
	SELECT Nombre_cl
	FROM Cliente 
	WHERE Cliente_ID = CP.Cliente_ID) AS NombreCliente
FROM Comprobante_Pago CP;

--9--Encontrar las promociones activas en una fecha espec fica y mostrar la cantidad de servicios vendidos con esa promoci n--

SELECT P.Nombre_promo, P.Descripcion_promo, P.Porcentaje_Dsct,
    (SELECT COUNT(*) FROM Detalle_Comprobante D WHERE D.PromocionesID = P.PromocionesID) AS Servicios_Vendidos
FROM Promociones P
WHERE P.FechaInicio <= '2023-10-26' AND P.FechaFin >= '2023-10-26';

--10--Obtener los nombres de los servicios que tienen un precio mayor al promedio de todos los servicios--

SELECT Nombre_servi
FROM Servicios
WHERE Precio_servi > (
    SELECT AVG(Precio_servi)
    FROM Servicios
);

--11--Obtener los nombres de los clientes que han gastado m s de 1000 soles en servicios--

SELECT Nombre_cl, Apellido_cl
FROM Cliente
WHERE Cliente_ID IN (
    SELECT Cliente_ID
    FROM Comprobante_Pago
    WHERE Total > 1000
);

--12--Obtener los nombres de los tipos de servicios que tienen m s servicios asociados que el promedio de los tipos de servicios y que tienen un precio promedio mayor a 50 soles--

SELECT Nombre_TS
FROM Tipo_Servicio
WHERE TipoServicioID IN (
    SELECT TipoServicioID
    FROM Servicios
    GROUP BY TipoServicioID
    HAVING COUNT(ServicioID) > (
        SELECT AVG(CountServicios)
        FROM (
            SELECT TipoServicioID, COUNT(ServicioID) AS CountServicios
            FROM Servicios
            GROUP BY TipoServicioID
        ) AS SubqueryAlias
    )
) AND (
    SELECT AVG(Precio_servi)
    FROM Servicios
    WHERE TipoServicioID = Servicios.TipoServicioID
) > 50

--13--Obtener todos los clientes que son del tipo de cliente "VIP" y que han gastado m s de 500 soles en el establecimiento--

SELECT * FROM Cliente
WHERE TipoClienteID = 'VIP'
AND (
	SELECT SUM(Importe_Total) 
	FROM Comprobante_Pago	
	WHERE Cliente_ID = Cliente.Cliente_ID) > 500;

--14--Encontrar los servicios que tienen un precio mayor que el triple del precio de su tipo de servicio--

SELECT Nombre_servi, Precio_servi
FROM Servicios
WHERE Precio_servi > 3 * (SELECT Precio_servi FROM Tipo_Servicio WHERE Tipo_Servicio.TipoServicioID = Servicios.TipoServicioID);

--15--Listar los clientes que han realizado un pago con una forma de pago diferente de "Tarjeta de Cr dito"--

SELECT DISTINCT C.Cliente_ID, C.Nombre_cl, C.Apellido_cl
FROM Cliente C
WHERE C.Cliente_ID IN (
    SELECT CP.Cliente_ID
    FROM Comprobante_Pago CP
    JOIN Forma_Pago FP ON CP.FormaPagoID = FP.FormaPagoID
    WHERE FP.Nombre_FP <> 'Tarjeta de Cr dito'
);

--16--Mostrar los comprobantes de pago que contienen un detalle de comprobante con una cantidad igual a 1--

SELECT CP.*
FROM Comprobante_Pago CP
JOIN Detalle_Comprobante DC ON CP.ComprobantePagoID = DC.DetalleComprobanteID
WHERE DC.Cantidad = 1;

--17--Recuperar los tipos de servicios que tienen m s de 3 servicios relacionados--

SELECT TS.TipoServicioID, TS.Nombre_TS, TS.Descripcion_TS
FROM Tipo_Servicio TS
WHERE (
    SELECT COUNT(*) 
    FROM Servicios S
    WHERE S.TipoServicioID = TS.TipoServicioID
) > 3;

--18--Calcular el importe total promedio de los comprobantes de pago realizados por un cliente espec fico--

SELECT AVG(CP.Importe_Total) AS PromedioImporteTotal
FROM Comprobante_Pago CP
WHERE CP.Cliente_ID IN (
    SELECT CP.Cliente_ID
    FROM Comprobante_Pago CP
    WHERE CP.Cliente_ID = 'Cliente_ID_ESPECIFICO'
);

--19--Obtener los comprobantes de pago que han sido valorados con una puntuaci n de 4 estrellas o m s--

SELECT CP.*
FROM Comprobante_Pago CP
WHERE CP.ValoracionID IN (
    SELECT VS.ValoracionID
    FROM Valoracion_Servicio VS
    WHERE VS.Puntuacion >= 4
);

--20--Contar cu ntos servicios tienen un precio mayor que el precio promedio de su tipo de servicio--

SELECT TS.TipoServicioID, COUNT(*) AS CantidadServicios
FROM Tipo_Servicio TS
JOIN Servicios S ON TS.TipoServicioID = S.TipoServicioID
WHERE S.Precio_servi > (
    SELECT AVG(Precio_servi)
    FROM Servicios
    WHERE TipoServicioID = TS.TipoServicioID
)
GROUP BY TS.TipoServicioID;

--21--Encontrar los empleados que tienen un horario de entrada igual al horario de salida--

SELECT EmpleadoID, Nombre_emple, Apellidos_emple
FROM Empleado
WHERE Horario_entrada IN (
    SELECT Horario_salida
    FROM Empleado
);

--22--Listar los comprobantes de pago que tienen un importe total mayor que el doble del IGV--

SELECT *
FROM Comprobante_Pago
WHERE EXISTS (
    SELECT 1
    FROM Comprobante_Pago
    WHERE Importe_Total > (2 * Monto_IGV)
);

--23--Mostrar los servicios que tienen un precio mayor que el precio promedio de su tipo de servicio--

SELECT S.Nombre_servi, S.Precio_servi, TS.Nombre_TS, AVG_TS.PrecioPromedio
FROM Servicios S
JOIN Tipo_Servicio TS ON S.TipoServicioID = TS.TipoServicioID
JOIN (
    SELECT TipoServicioID, AVG(Precio_servi) AS PrecioPromedio
    FROM Servicios
    GROUP BY TipoServicioID
) AVG_TS ON S.TipoServicioID = AVG_TS.TipoServicioID
WHERE S.Precio_servi > AVG_TS.PrecioPromedio;

--24--Recuperar los tipos de clientes que tienen una descripci n que no contiene la palabra "Regular"--

SELECT *
FROM Tipo_Cliente
WHERE Descripcion_TC IN (
    SELECT Descripcion_TC
    FROM Tipo_Cliente
    WHERE Descripcion_TC NOT LIKE '%Regular%'
);

--25--Calcular el total gastado por un cliente en servicios de un tipo de servicio espec fico--

SELECT C.Cliente_ID, C.Nombre_cl, C.Apellido_cl,
  (
    SELECT SUM(Importe_Total)
    FROM Comprobante_Pago CP
    JOIN Detalle_Comprobante DC ON CP.DetalleComprobanteID = DC.DetalleComprobanteID
    JOIN Servicios S ON DC.ServicioID = S.ServicioID
    WHERE C.Cliente_ID = 'Cliente_ID' AND S.TipoServicioID = 'TipoServicioID'
  ) AS TotalGastado
FROM Cliente C;

--26--Obtener los clientes que han realizado valoraciones con comentarios que contienen la palabra "excelente"--

SELECT DISTINCT C.Cliente_ID, C.Nombre_cl, C.Apellido_cl
FROM Cliente C
WHERE C.Cliente_ID IN (
    SELECT CP.Cliente_ID
    FROM Comprobante_Pago CP
    JOIN Valoracion_Servicio VS ON CP.ValoracionID = VS.ValoracionID
    WHERE VS.Comentario LIKE '%excelente%'
);

--27--Obtener la cantidad de valoraciones con comentarios que contienen la palabra "excelente" de los clientes--

SELECT DISTINCT C.Cliente_ID, C.Nombre_cl, C.Apellido_cl,
  (
    SELECT COUNT(CP.ComprobantePagoID)
    FROM Comprobante_Pago CP
    JOIN Valoracion_Servicio VS ON CP.ValoracionID = VS.ValoracionID
    WHERE CP.Cliente_ID = C.Cliente_ID
    AND VS.Comentario LIKE '%excelente%'
  ) AS NumeroValoraciones
FROM Cliente C;

--28--Contar cu ntos comprobantes de pago han sido realizados por un cliente espec fico--

SELECT COUNT(*) AS CantidadComprobantes,
  (
    SELECT MAX(Importe_Total)
    FROM Comprobante_Pago
    WHERE Cliente_ID = 'Cliente_ID'
  ) AS ImporteTotalMaximo
FROM Comprobante_Pago
WHERE Cliente_ID = 'Cliente_ID';

--29--Encontrar los empleados que tienen un n mero de tel fono que termina en "1234"--

SELECT EmpleadoID, Nombre_emple, Apellidos_emple, Telefono_emple
FROM Empleado
WHERE Telefono_emple IN (
    SELECT Telefono_emple
    FROM Empleado
    WHERE Telefono_emple LIKE '%1234'
);

--30--Encontrar los empleados que tienen un n mero de tel fono que termina en "7"--

SELECT EmpleadoID, Nombre_emple, Apellidos_emple, Telefono_emple
FROM Empleado
WHERE Telefono_emple IN (
    SELECT Telefono_emple
    FROM Empleado
    WHERE Telefono_emple LIKE '%7'
);

--31--Encontrar los empleados que tienen un n mero de tel fono que termina en "0"

SELECT EmpleadoID, Nombre_emple, Apellidos_emple, Telefono_emple
FROM Empleado
WHERE Telefono_emple IN (
    SELECT Telefono_emple
    FROM Empleado
    WHERE Telefono_emple LIKE '%0'
);

--32--Listar los tipos de servicios que tienen un nombre que comienza con la letra "A"--

SELECT TipoServicioID, Nombre_TS
FROM Tipo_Servicio
WHERE Nombre_TS IN (
    SELECT Nombre_TS
    FROM Tipo_Servicio
    WHERE Nombre_TS LIKE 'A%'
);

--33--Listar los tipos de servicios que tienen un nombre que finaliza con la letra "S"--

SELECT TipoServicioID, Nombre_TS
FROM Tipo_Servicio
WHERE Nombre_TS IN (
    SELECT Nombre_TS
    FROM Tipo_Servicio
    WHERE Nombre_TS LIKE '%S'
);

--34--Listar los tipos de servicios que tienen un nombre que finaliza con la letra "A"--

SELECT TipoServicioID, Nombre_TS
FROM Tipo_Servicio
WHERE Nombre_TS IN (
    SELECT Nombre_TS
    FROM Tipo_Servicio
    WHERE Nombre_TS LIKE '%A'
);

--35--Listar los tipos de servicios que tienen un nombre que comienza con la letra "E"--

SELECT TipoServicioID, Nombre_TS
FROM Tipo_Servicio
WHERE Nombre_TS IN (
    SELECT Nombre_TS
    FROM Tipo_Servicio
    WHERE Nombre_TS LIKE 'E%'
);

--36--Contar el n mero de servicios de cada tipo de servicio--

SELECT TipoServicioID, Nombre_TS,
  (
    SELECT COUNT(*)
    FROM Servicios
    WHERE TipoServicioID = TS.TipoServicioID
  ) AS NumeroServicios
FROM Tipo_Servicio TS;

--37--Mostrar los comprobantes de pago que tienen un importe total mayor que el importe total promedio de todos los comprobantes de pago--

SELECT CP.*
FROM Comprobante_Pago CP
WHERE CP.Importe_Total > (
    SELECT AVG(Importe_Total)
    FROM Comprobante_Pago
);

--38--Recuperar los servicios que tienen un precio igual al precio promedio de todos los servicios--

SELECT Nombre_servi, Precio_servi
FROM Servicios
WHERE Precio_servi = (
    SELECT AVG(Precio_servi)
    FROM Servicios
);

--39--Calcular el promedio de los descuentos aplicados en los comprobantes de pago--

SELECT AVG(Valor_des) AS PromedioDescuentos
FROM (
    SELECT Valor_des
    FROM Descuentos
) AS D;

--40--Calcular el n mero de descuentos con un valor mayor que 10 aplicados en los comprobantes de pago--

SELECT AVG(Valor_des) AS PromedioDescuentos,
  (
    SELECT COUNT(*)
    FROM Descuentos
    WHERE Valor_des > 10
  ) AS NumeroDescuentosMayores10
FROM Descuentos;

--41--Obtener los clientes que han realizado un pago con una forma de pago espec fica--

SELECT DISTINCT C.Cliente_ID, C.Nombre_cl, C.Apellido_cl,
  (
    SELECT COUNT(*)
    FROM Comprobante_Pago CP
    JOIN Forma_Pago FP ON CP.FormaPagoID = FP.FormaPagoID
    WHERE CP.Cliente_ID = C.Cliente_ID
    AND FP.Nombre_FP = 'Nombre_Forma_Pago'
  ) AS NumeroPagos
FROM Cliente C;

--42--Contar cu ntos comprobantes de pago contienen un detalle de comprobante con una cantidad superior a 3--

SELECT COUNT(*) AS CantidadComprobantes
FROM (
    SELECT CP.DetalleComprobanteID
    FROM Comprobante_Pago CP
    JOIN Detalle_Comprobante DC ON CP.DetalleComprobanteID = DC.DetalleComprobanteID
    WHERE DC.Cantidad > 3
) AS DetallesComprobantes;


--43--Calcula el importe total de todos los comprobantes de pago con una cantidad mayor que 3--

SELECT COUNT(*) AS CantidadComprobantes,
  (
    SELECT SUM(Importe_Total)
    FROM Comprobante_Pago CP
    JOIN Detalle_Comprobante DC ON CP.DetalleComprobanteID = DC.DetalleComprobanteID
    WHERE DC.Cantidad > 3
  ) AS ImporteTotalComprobantes
FROM Comprobante_Pago CP
JOIN Detalle_Comprobante DC ON CP.DetalleComprobanteID = DC.DetalleComprobanteID
WHERE DC.Cantidad > 3;

--44--Encontrar los empleados que tienen un horario de entrada posterior a las 9 AM--

SELECT EmpleadoID, Nombre_emple, Apellidos_emple, Horario_entrada
FROM Empleado
WHERE Horario_entrada IN (
    SELECT CONVERT(TIME, Horario_entrada)
    FROM Empleado
    WHERE CONVERT(TIME, Horario_entrada) > '09:00:00'
);

--45--Encontrar los empleados que tienen un horario de entrada posterior a las 8 AM--

SELECT EmpleadoID, Nombre_emple, Apellidos_emple, Horario_entrada
FROM Empleado
WHERE Horario_entrada IN (
    SELECT CONVERT(TIME, Horario_entrada)
    FROM Empleado
    WHERE CONVERT(TIME, Horario_entrada) > '08:00:00'
);

--46--Listar los servicios que no tienen ning n descuento aplicado--

SELECT S.Nombre_servi, S.Descripcion_servi, S.Precio_servi
FROM Servicios S
WHERE S.ServicioID NOT IN (
    SELECT ServicioID
    FROM Detalle_Comprobante
    WHERE DescuentoID IS NOT NULL
);

--47--Mostrar los comprobantes de pago que tienen un importe total mayor que la suma de todos los importes totales de comprobantes--

SELECT CP.*
FROM Comprobante_Pago CP
WHERE CP.Importe_Total > (
    SELECT SUM(Importe_Total)
    FROM Comprobante_Pago
);

--48--Recuperar los tipos de clientes que tienen una descripci n que contiene la palabra "VIP"--

SELECT TipoClienteID, Nombre_TC, Descripcion_TC
FROM Tipo_Cliente
WHERE TipoClienteID IN (
    SELECT TipoClienteID
    FROM Tipo_Cliente
    WHERE Descripcion_TC LIKE '%VIP%'
);

--49--Calcula el n mero de clientes de cada tipo de cliente--

SELECT TipoClienteID, Nombre_TC, Descripcion_TC,
  (
    SELECT COUNT(*)
    FROM Cliente
    WHERE TipoClienteID = TC.TipoClienteID
  ) AS NumeroClientes
FROM Tipo_Cliente TC;

--50--Mostrar los comprobantes de pago que contienen un detalle de comprobante espec fico--

SELECT *
FROM (
    SELECT *
    FROM Comprobante_Pago
    WHERE DetalleComprobanteID = 'DetalleComprobanteID'
) AS CP;

--51--Recuperar los clientes que han realizado un pago en efectivo y valorado el servicio con una puntuaci n de 5 estrellas--

SELECT C.Cliente_ID, C.Nombre_cl, C.Apellido_cl,
  (
    SELECT COUNT(*)
    FROM Comprobante_Pago CP
    JOIN Valoracion_Servicio VS ON CP.ValoracionID = VS.ValoracionID
    WHERE CP.Cliente_ID = C.Cliente_ID
    AND CP.FormaPagoID = 'Efectivo' AND VS.Puntuacion = 5
  ) AS NumeroComprobantesConPuntuacion5
FROM Cliente C;

--52--Encontrar los empleados que tienen el mismo horario de entrada y salida--

SELECT EmpleadoID, Nombre_emple, Apellidos_emple, Horario_entrada, Horario_salida,
  (
    SELECT COUNT(*)
    FROM Empleado
    WHERE Horario_entrada = Horario_salida
  ) AS NumeroEmpleadosConHorarioIgual
FROM Empleado;

------------------------------------------------------------------------------------------------------------
-->>----------------------------------------FUNCIONES---------------------------------------------------<<--
------------------------------------------------------------------------------------------------------------

CREATE FUNCTION contar_empleados ()
RETURNS INT
AS
BEGIN
  DECLARE @Count INT
  SELECT @Count = COUNT(*) FROM Empleado
  RETURN @Count
END
------
CREATE FUNCTION obtener_costo_total (@DetalleComprobanteID CHAR(10))
RETURNS DECIMAL(5,2)
AS
BEGIN
  DECLARE @Total DECIMAL(5,2)
  SELECT @Total = Subtotal FROM Detalle_Comprobante WHERE DetalleComprobanteID = @DetalleComprobanteID
  RETURN @Total
END
-------
CREATE FUNCTION listar_servicios (@TipoServicioID CHAR(10))
RETURNS TABLE
AS
RETURN (
  SELECT Nombre_servi, Descripcion_servi, Precio_servi FROM Servicios WHERE TipoServicioID = @TipoServicioID
)
------
CREATE FUNCTION calcular_IGV (@ComprobantePagoID CHAR(10))
RETURNS DECIMAL(5,2)
AS
BEGIN
  DECLARE @IGV DECIMAL(5,2)
  SELECT @IGV = Total * 0.18 FROM Comprobante_Pago WHERE ComprobantePagoID = @ComprobantePagoID
  RETURN @IGV
END

------
CREATE FUNCTION num_servicios_tipo (@TipoServicioID CHAR(10))
RETURNS INT
AS
BEGIN
  DECLARE @Count INT
  SELECT @Count = COUNT(*) FROM Servicios WHERE TipoServicioID = @TipoServicioID
  RETURN @Count
END
------
CREATE FUNCTION obtener_empleado (@DNI INT)
RETURNS TABLE
AS
RETURN (
  SELECT * FROM Empleado WHERE DNI = @DNI
)
------
CREATE FUNCTION tiene_descuento (@ServicioID CHAR(10))
RETURNS BIT
AS
BEGIN
  DECLARE @Result BIT
  IF EXISTS(SELECT 1 FROM Detalle_Comprobante WHERE ServicioID = @ServicioID AND DescuentoID IS NOT NULL)
    SET @Result = 1
  ELSE
    SET @Result = 0
  RETURN @Result
END
------
CREATE FUNCTION obtener_porcentaje_descuento (@PromocionesID CHAR(10))
RETURNS INT
AS
BEGIN
  DECLARE @Porcentaje INT
  SELECT @Porcentaje = Porcentaje_Dsct FROM Promociones WHERE PromocionesID = @PromocionesID
  RETURN @Porcentaje
END
------
CREATE FUNCTION duracion_promocion (@PromocionesID CHAR(10))
RETURNS INT
AS
BEGIN
  DECLARE @Dias INT
  SELECT @Dias = DATEDIFF(DAY, FechaInicio, FechaFin) FROM Promociones WHERE PromocionesID = @PromocionesID
  RETURN @Dias
END

------
CREATE FUNCTION contar_clientes_tipo (@TipoClienteID CHAR(10))
RETURNS INT
AS
BEGIN
  DECLARE @Count INT
  SELECT @Count = COUNT(*) FROM Cliente WHERE TipoClienteID = @TipoClienteID
  RETURN @Count
END

------
CREATE FUNCTION salario_promedio_departamento (@DepartamentoID INT)
RETURNS FLOAT
AS
BEGIN
  DECLARE @SalarioPromedio FLOAT
  SELECT @SalarioPromedio = AVG(Salario) FROM Empleado WHERE DepartamentoID = @DepartamentoID
  RETURN @SalarioPromedio
END

------
CREATE FUNCTION obtener_nombre_cliente (@ClienteID INT)
RETURNS NVARCHAR(255)
AS
BEGIN
  DECLARE @Nombre NVARCHAR(255)
  SELECT @Nombre = Nombre FROM Cliente WHERE ClienteID = @ClienteID
  RETURN @Nombre
END

------
CREATE FUNCTION producto_existe (@ProductoID INT)
RETURNS BIT
AS
BEGIN
  DECLARE @Existe BIT
  IF EXISTS(SELECT 1 FROM Producto WHERE ProductoID = @ProductoID)
    SET @Existe = 1
  ELSE
    SET @Existe = 0
  RETURN @Existe
END

------
CREATE FUNCTION ultimo_precio_producto (@ProductoID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
  DECLARE @Precio DECIMAL(10, 2)
  SELECT TOP 1 @Precio = Precio FROM Historial_Precio WHERE ProductoID = @ProductoID ORDER BY Fecha DESC
  RETURN @Precio
END

------
CREATE FUNCTION total_ventas_empleado (@EmpleadoID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
  DECLARE @Total DECIMAL(10, 2)
  SELECT @Total = SUM(Monto) FROM Ventas WHERE EmpleadoID = @EmpleadoID
  RETURN @Total
END

------
CREATE FUNCTION listar_productos_categoria (@CategoriaID INT)
RETURNS TABLE
AS
RETURN (
  SELECT Nombre, Precio FROM Producto WHERE CategoriaID = @CategoriaID
)

------
CREATE FUNCTION obtener_stock (@ProductoID INT)
RETURNS INT
AS
BEGIN
  DECLARE @Stock INT
  SELECT @Stock = Stock FROM Producto WHERE ProductoID = @ProductoID
  RETURN @Stock
END

------
CREATE FUNCTION es_supervisor (@EmpleadoID INT)
RETURNS BIT
AS
BEGIN
  DECLARE @EsSupervisor BIT
  IF EXISTS (SELECT 1 FROM Empleado WHERE EmpleadoID = @EmpleadoID AND EsSupervisor = 1)
    SET @EsSupervisor = 1
  ELSE
    SET @EsSupervisor = 0
  RETURN @EsSupervisor
END

------
CREATE FUNCTION tiempo_servicio (@EmpleadoID INT)
RETURNS INT
AS
BEGIN
  DECLARE @Anos INT
  SELECT @Anos = DATEDIFF(YEAR, FechaIngreso, GETDATE()) FROM Empleado WHERE EmpleadoID = @EmpleadoID
  RETURN @Anos
END

------
CREATE FUNCTION contar_productos_orden (@OrdenID INT)
RETURNS INT
AS
BEGIN
  DECLARE @Count INT
  SELECT @Count = COUNT(*) FROM Detalle_Orden WHERE OrdenID = @OrdenID
  RETURN @Count
END

------
CREATE FUNCTION calcular_edad (@FechaNacimiento DATE)
RETURNS INT
AS
BEGIN
  DECLARE @Edad INT
  SET @Edad = DATEDIFF(YEAR, @FechaNacimiento, GETDATE())
  RETURN @Edad
END

------
CREATE FUNCTION total_compras_cliente (@ClienteID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
  DECLARE @TotalCompras DECIMAL(10, 2)
  SELECT @TotalCompras = SUM(Total) FROM Compras WHERE ClienteID = @ClienteID
  RETURN @TotalCompras
END

------
CREATE FUNCTION estado_factura (@FacturaID INT)
RETURNS VARCHAR(50)
AS
BEGIN
  DECLARE @Estado VARCHAR(50)
  SELECT @Estado = Estado FROM Factura WHERE FacturaID = @FacturaID
  RETURN @Estado
END

------
CREATE FUNCTION contar_empleados_departamento (@DepartamentoID INT)
RETURNS INT
AS
BEGIN
  DECLARE @NumEmpleados INT
  SELECT @NumEmpleados = COUNT(*) FROM Empleado WHERE DepartamentoID = @DepartamentoID
  RETURN @NumEmpleados
END

------
CREATE FUNCTION calcular_impuesto (@Monto DECIMAL(10, 2), @TasaImpuesto DECIMAL(5, 2))
RETURNS DECIMAL(10, 2)
AS
BEGIN
  DECLARE @Impuesto DECIMAL(10, 2)
  SET @Impuesto = @Monto * @TasaImpuesto / 100
  RETURN @Impuesto
END

------
CREATE FUNCTION listar_pedidos_pendientes (@ClienteID INT)
RETURNS TABLE
AS
RETURN (
  SELECT PedidoID, Fecha, Monto FROM Pedido WHERE ClienteID = @ClienteID AND Estado = 'Pendiente'
)

------
CREATE FUNCTION correo_proveedor (@ProveedorID INT)
RETURNS VARCHAR(255)
AS
BEGIN
  DECLARE @Correo VARCHAR(255)
  SELECT @Correo = Correo FROM Proveedor WHERE ProveedorID = @ProveedorID
  RETURN @Correo
END

------
CREATE FUNCTION costo_total_inventario_categoria (@CategoriaID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
  DECLARE @CostoTotal DECIMAL(10, 2)
  SELECT @CostoTotal = SUM(CostoUnitario * Cantidad) FROM Producto WHERE CategoriaID = @CategoriaID
  RETURN @CostoTotal
END

------
CREATE FUNCTION margen_beneficio_producto (@ProductoID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
  DECLARE @Margen DECIMAL(10, 2)
  SELECT @Margen = PrecioVenta - Costo FROM Producto WHERE ProductoID = @ProductoID
  RETURN @Margen
END

------
CREATE FUNCTION cliente_ha_comprado (@ClienteID INT)
RETURNS BIT
AS
BEGIN
  DECLARE @HaComprado BIT
  IF EXISTS(SELECT 1 FROM Compras WHERE ClienteID = @ClienteID)
    SET @HaComprado = 1
  ELSE
    SET @HaComprado = 0
  RETURN @HaComprado
END

------
CREATE FUNCTION dias_diferencia (@Fecha1 DATE, @Fecha2 DATE)
RETURNS INT
AS
BEGIN
  RETURN DATEDIFF(DAY, @Fecha1, @Fecha2)
END

------
CREATE FUNCTION nombre_completo (@ID INT)
RETURNS NVARCHAR(200)
AS
BEGIN
  DECLARE @Nombre NVARCHAR(100), @Apellido NVARCHAR(100)
  SELECT @Nombre = Nombre, @Apellido = Apellido FROM Empleados WHERE ID = @ID
  RETURN CONCAT(@Nombre, ' ', @Apellido)
END

------
CREATE FUNCTION producto_en_stock (@ProductoID INT)
RETURNS BIT
AS
BEGIN
  DECLARE @Stock INT
  SELECT @Stock = Stock FROM Productos WHERE ID = @ProductoID
  IF (@Stock > 0) RETURN 1
  ELSE RETURN 0
END

------
CREATE FUNCTION salario_neto (@EmpleadoID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
  DECLARE @SalarioBruto DECIMAL(10, 2), @Impuesto DECIMAL(10, 2)
  SELECT @SalarioBruto = Salario FROM Empleados WHERE ID = @EmpleadoID
  SET @Impuesto = @SalarioBruto * 0.2
  RETURN (@SalarioBruto - @Impuesto)
END

-----
CREATE FUNCTION ultimo_pedido (@ClienteID INT)
RETURNS INT
AS
BEGIN
  RETURN (SELECT TOP 1 PedidoID FROM Pedidos WHERE ClienteID = @ClienteID ORDER BY Fecha DESC)
END

-----
CREATE FUNCTION media_precio_categoria (@CategoriaID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
  DECLARE @Media DECIMAL(10, 2)
  SELECT @Media = AVG(Precio) FROM Productos WHERE CategoriaID = @CategoriaID
  RETURN @Media
END

-----
CREATE FUNCTION productos_en_orden (@OrdenID INT)
RETURNS INT
AS
BEGIN
  RETURN (SELECT COUNT(*) FROM DetallesOrden WHERE OrdenID = @OrdenID)
END

-----
CREATE FUNCTION dias_desde_ultima_compra (@ClienteID INT)
RETURNS INT
AS
BEGIN
  DECLARE @UltimaCompra DATE
  SELECT @UltimaCompra = MAX(Fecha) FROM Compras WHERE ClienteID = @ClienteID
  RETURN DATEDIFF(DAY, @UltimaCompra, GETDATE())
END

-----
CREATE FUNCTION suma_ventas_vendedor (@VendedorID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
  DECLARE @Suma DECIMAL(10, 2)
  SELECT @Suma = SUM(Monto) FROM Ventas WHERE VendedorID = @VendedorID
  RETURN @Suma
END

-----
CREATE FUNCTION cliente_mas_compras ()
RETURNS INT
AS
BEGIN
  RETURN (SELECT TOP 1 ClienteID FROM Compras GROUP BY ClienteID ORDER BY COUNT(*) DESC)
END

-----
CREATE FUNCTION promedio_salario_departamento(@depto NVARCHAR(50))
RETURNS FLOAT
AS
BEGIN
  RETURN (SELECT AVG(salario) FROM empleados WHERE departamento = @depto)
END

-----
CREATE FUNCTION cliente_existe(@clienteID INT)
RETURNS BIT
AS
BEGIN
  IF EXISTS (SELECT 1 FROM clientes WHERE ID = @clienteID)
    RETURN 1
  RETURN 0
END

-----
CREATE FUNCTION calcular_impuesto(@salario FLOAT)
RETURNS FLOAT
AS
BEGIN
  RETURN (@salario * 0.3)
END

-----
CREATE FUNCTION obtener_stock(@productoID INT)
RETURNS INT
AS
BEGIN
  RETURN (SELECT stock FROM productos WHERE ID = @productoID)
END

-----
CREATE FUNCTION ventas_en_fecha(@inicio DATE, @fin DATE)
RETURNS INT
AS
BEGIN
  RETURN (SELECT COUNT(*) FROM ventas WHERE fecha BETWEEN @inicio AND @fin)
END

-----
CREATE FUNCTION suma_ventas_empleado(@empleadoID INT)
RETURNS FLOAT
AS
BEGIN
  RETURN (SELECT SUM(monto) FROM ventas WHERE empleadoID = @empleadoID)
END

-----
CREATE FUNCTION cliente_frecuente()
RETURNS NVARCHAR(50)
AS
BEGIN
  RETURN (SELECT TOP 1 clienteNombre FROM ventas GROUP BY clienteNombre ORDER BY COUNT(*) DESC)
END

-----
CREATE FUNCTION margen_beneficio(@productoID INT)
RETURNS FLOAT
AS
BEGIN
  DECLARE @costo FLOAT, @precio FLOAT
  SELECT @costo = costo, @precio = precio FROM productos WHERE ID = @productoID
  RETURN ((@precio - @costo) / @costo * 100)
END

-----
CREATE FUNCTION email_valido(@email NVARCHAR(100))
RETURNS BIT
AS
BEGIN
  IF (CHARINDEX('@', @email) > 0 AND CHARINDEX('.', @email) > 0)
    RETURN 1
  ELSE
    RETURN 0
END

-----
CREATE FUNCTION total_ventas_mes_a o(@mes INT, @a o INT)
RETURNS FLOAT
AS
BEGIN
  RETURN (SELECT SUM(monto) FROM ventas WHERE MONTH(fecha) = @mes AND YEAR(fecha) = @a o)
END

------------------------------------------------------------------------------------------------------------
-->>------------------------------------PROCEDIMIENTO ALMACENADOS---------------------------------------<<--
------------------------------------------------------------------------------------------------------------

---01---Insertar un nuevo tipo de servicio---
CREATE PROCEDURE InsertarTipoServicio (
    @tipoServicioID CHAR(10),
    @nombre_TS VARCHAR(50),
    @descripcion_TS VARCHAR(100)
)
AS
BEGIN
    INSERT INTO Tipo_Servicio (TipoServicioID, Nombre_TS, Descripcion_TS)
    VALUES ('TS023', 'Edici n Turismo', 'Promocionar Sitios Turisticos');
END;

---02---Actualizar un tipo de servicio---
CREATE PROCEDURE ActualizarTipoServicio (
    @tipoServicioID CHAR(10),
    @nombre_TS VARCHAR(50),
    @descripcion_TS VARCHAR(100)
)
AS
BEGIN
    UPDATE Tipo_Servicio
    SET Nombre_TS = 'Edici n Politica', Descripcion_TS = 'Promocionar Campa as Politicas'
    WHERE TipoServicioID = 'TS023';
END;

---03---Eliminar un tipo de servicio---
CREATE PROCEDURE EliminarTipoServicio (
    @tipoServicioID CHAR(10)
)
AS
BEGIN
    DELETE FROM Tipo_Servicio
    WHERE TipoServicioID = 'TS023';
END;

---04---Insertar un nuevo servicio---
CREATE PROCEDURE InsertarServicio (
    @servicioID CHAR(10),
    @nombre_Servicio VARCHAR(50),
    @descripcion_Servicio VARCHAR(100),
    @precio_Servicio DECIMAL(5,2),
    @tipoServicioID CHAR(10)
)
AS
BEGIN
    INSERT INTO Servicios (ServicioID, Nombre_servi, Descripcion_servi, Precio_servi, TipoServicioID)
    VALUES ('S061', 'Noticias de Europa', 'Noticias en tiempo real de Europa', 10.99, 'TS006');
END;

---05---Actualizar un servicio---
CREATE PROCEDURE ActualizarServicio (
    @servicioID CHAR(10),
    @nombre_Servicio VARCHAR(50),
    @descripcion_Servicio VARCHAR(100),
    @precio_Servicio DECIMAL(5,2),
    @tipoServicioID CHAR(10)
)
AS
BEGIN
    UPDATE Servicios
    SET Nombre_servi = 'Noticias de Africa', Descripcion_servi = 'Noticias en tiempo real de Africa',
        Precio_servi = 15.99, TipoServicioID = 'TS006'
    WHERE ServicioID = 'S061';
END;

---06---Eliminar un servicio---
CREATE PROCEDURE EliminarServicio (
    @servicioID CHAR(10)
)
AS
BEGIN
    DELETE FROM Servicios
    WHERE ServicioID = 'S061';
END;

---07---Insertar una nueva promoci n---
CREATE PROCEDURE InsertarPromocion (
    @promocionesID CHAR(10),
    @nombre_Promo VARCHAR(50),
    @descripcion_Promo VARCHAR(100),
    @fechaInicio DATE,
    @fechaFin DATE,
    @porcentaje_Dsct INT
)
AS
BEGIN
    INSERT INTO Promociones (PromocionesID, Nombre_Promo, Descripcion_Promo, FechaInicio, FechaFin, Porcentaje_Dsct)
    VALUES ('P031', 'Promoci n universitaria', 'Descuento exclusivo para universitarios', '2023-09-01', '2023-12-23', 20);
END;

---08---Actualizar una promoci n---
CREATE PROCEDURE ActualizarPromocion (
    @promocionesID CHAR(10),
    @nombre_Promo VARCHAR(50),
    @descripcion_Promo VARCHAR(100),
    @fechaInicio DATE,
    @fechaFin DATE,
    @porcentaje_Dsct INT
)
AS
BEGIN
    UPDATE Promociones
    SET Nombre_Promo = 'Promoci n de D a Nacional del Pisco', Descripcion_Promo = 'Descuento por el D a del Pisco',
        FechaInicio = '2023-07-22', FechaFin = '2023-07-22', Porcentaje_Dsct = 18
    WHERE PromocionesID = 'P031';
END;

---09---Eliminar una promoci n---
CREATE PROCEDURE EliminarPromocion (
    @promocionesID CHAR(10)
)
AS
BEGIN
    DELETE FROM Promociones
    WHERE PromocionesID = 'P031';
END;

---10---Insertar un nuevo descuento---
CREATE PROCEDURE InsertarDescuento (
    @descuentoID CHAR(10),
    @nombre_Des VARCHAR(50),
    @descripcion_Des VARCHAR(100),
    @tipo_Des VARCHAR(50),
    @valor_Des DECIMAL(5,2)
)
AS
BEGIN
    INSERT INTO Descuentos (DescuentoID, Nombre_des, Descripcion_des, Tipo_des, Valor_des)
	VALUES ('D031', 'Descuento universitario', 'Descuento para universitarios', 'Porcentaje', 24);
END;

---11---Actualizar un descuento---
CREATE PROCEDURE ActualizarDescuento (
    @descuentoID CHAR(10),
    @nombre_Des VARCHAR(50),
    @descripcion_Des VARCHAR(100),
    @tipo_Des VARCHAR(50),
    @valor_Des DECIMAL(5,2)
)
AS
BEGIN
    UPDATE Descuentos
    SET Nombre_Des = 'Descuento de d a del Pisco', Descripcion_Des = 'Descuento por el d a del Pisco',
        Tipo_Des = 'Porcentaje', Valor_Des = 29
    WHERE DescuentoID = 'D031';
END;

---12---Eliminar un descuento---
CREATE PROCEDURE EliminarDescuento (
    @descuentoID CHAR(10)
)
AS
BEGIN
    DELETE FROM Descuentos
    WHERE DescuentoID = 'D031';
END;

---13---Insertar un nuevo detalle de comprobante---
CREATE PROCEDURE InsertarDetalleComprobante (
    @detalleComprobanteID CHAR(10),
    @servicioID CHAR(10),
    @descuentoID CHAR(10),
    @promocionesID CHAR(10),
    @cantidad INT,
    @subtotal DECIMAL(5,2)
)
AS
BEGIN
    INSERT INTO Detalle_Comprobante (DetalleComprobanteID, ServicioID, DescuentoID, PromocionesID, Cantidad, Subtotal)
    VALUES ('DC031', 'S001', 'D001', 'P001', 10, 60.00);
END;

---14---Actualizar un detalle de comprobante---
CREATE PROCEDURE ActualizarDetalleComprobante (
    @detalleComprobanteID CHAR(10),
    @servicioID CHAR(10),
    @descuentoID CHAR(10),
    @promocionesID CHAR(10),
    @cantidad INT,
    @subtotal DECIMAL(5,2)
)
AS
BEGIN
    UPDATE Detalle_Comprobante
    SET ServicioID = 'S004', DescuentoID = 'D011', PromocionesID = 'P009',
        Cantidad = 5, Subtotal = 30.00
    WHERE DetalleComprobanteID = 'DC031';
END;

---15---Eliminar un detalle de comprobante---
CREATE PROCEDURE EliminarDetalleComprobante (
    @detalleComprobanteID CHAR(10)
)
AS
BEGIN
    DELETE FROM Detalle_Comprobante
    WHERE DetalleComprobanteID = 'DC031';
END;

---16---Insertar un nuevo empleado---
CREATE PROCEDURE InsertarEmpleado (
    @empleadoID CHAR(10),
    @dni INT,
    @nombre_Emple VARCHAR(50),
    @apellidos_Emple VARCHAR(50),
    @telefono_Emple INT,
    @horario_Entrada VARCHAR(50),
    @horario_Salida VARCHAR(50)
)
AS
BEGIN
    INSERT INTO Empleado (EmpleadoID, DNI, Nombre_Emple, Apellidos_Emple, Telefono_Emple, Horario_Entrada, Horario_Salida)
    VALUES ('E031', '72456789', 'Jose', 'Flores', 950023485, '07:30', '16:30');
END;

---17---Actualizar un empleado---
CREATE PROCEDURE ActualizarEmpleado (
    @empleadoID CHAR(10),
    @dni INT,
    @nombre_Emple VARCHAR(50),
    @apellidos_Emple VARCHAR(50),
    @telefono_Emple INT,
    @horario_Entrada VARCHAR(50),
    @horario_Salida VARCHAR(50)
)
AS
BEGIN
	UPDATE Empleado
		SET DNI = '45683336', Nombre_emple = 'Fernando', Apellidos_emple = 'Portilla', Telefono_emple = 943678991, 
			Horario_entrada = '07:00', Horario_salida = '16:00'
		WHERE EmpleadoID = 'E031';
END;

---18---Eliminar un empleado---
CREATE PROCEDURE EliminarEmpleado (
    @empleadoID CHAR(10)
)
AS
BEGIN
    DELETE FROM Empleado
    WHERE EmpleadoID = 'E031';
END;

---19---Insertar una nueva valoraci n de servicio---
CREATE PROCEDURE InsertarValoracionServicio (
    @valoracionID CHAR(10),
    @puntuacion INT,
    @comentario VARCHAR(200)
)
AS
BEGIN
    INSERT INTO Valoracion_Servicio (ValoracionID, Puntuacion, Comentario)
    VALUES ('V031', 6, 'Excelentes descuentos.');
END;

---20---Actualizar una valoraci n de servicio---
CREATE PROCEDURE ActualizarValoracionServicio (
    @valoracionID CHAR(10),
    @puntuacion INT,
    @comentario VARCHAR(200)
)
AS
BEGIN
    UPDATE Valoracion_Servicio
    SET Puntuacion = 0, Comentario = 'P simo servicio'
    WHERE ValoracionID = 'V031';
END;

---21---Eliminar una valoraci n de servicio---
CREATE PROCEDURE EliminarValoracionServicio (
    @valoracionID CHAR(10)
)
AS
BEGIN
    DELETE FROM Valoracion_Servicio
    WHERE ValoracionID = 'V031';
END;

---22---Insertar una nueva forma de pago---
CREATE PROCEDURE InsertarFormaPago (
    @formaPagoID CHAR(10),
    @nombre_FP VARCHAR(50)
)
AS
BEGIN
    INSERT INTO Forma_Pago (FormaPagoID, Nombre_FP)
    VALUES ('FP11', 'Tyba');
END;

---23---Actualizar una forma de pago---
CREATE PROCEDURE ActualizarFormaPago (
    @formaPagoID CHAR(10),
    @nombre_FP VARCHAR(50)
)
AS
BEGIN
    UPDATE Forma_Pago
    SET Nombre_FP = 'BBVA'
    WHERE FormaPagoID = 'FP11';
END;

---24---Eliminar una forma de pago---
CREATE PROCEDURE EliminarFormaPago (
    @formaPagoID CHAR(10)
)
AS
BEGIN
    DELETE FROM Forma_Pago
    WHERE FormaPagoID = 'FP11';
END;

---25---Insertar un nuevo tipo de cliente---
CREATE PROCEDURE InsertarTipoCliente (
    @tipoClienteID CHAR(10),
    @nombre_TC VARCHAR(50),
    @descripcion_TC VARCHAR(100)
)
AS
BEGIN
    INSERT INTO Tipo_Cliente (TipoClienteID, Nombre_TC, Descripcion_TC)
    VALUES ('TC31', 'Suscriptor Premium', 'Clientes que tienen una suscripci n premium');
END;

---26---Actualizar un tipo de cliente---
CREATE PROCEDURE ActualizarTipoCliente (
    @tipoClienteID CHAR(10),
    @nombre_TC VARCHAR(50),
    @descripcion_TC VARCHAR(100)
)
AS
BEGIN
    UPDATE Tipo_Cliente
    SET Nombre_TC = 'Universitario', Descripcion_TC = 'Universitarios con descuento'
    WHERE TipoClienteID = 'TC31';
END;

---27---Eliminar un tipo de cliente---
CREATE PROCEDURE EliminarTipoCliente (
    @tipoClienteID CHAR(10)
)
AS
BEGIN
    DELETE FROM Tipo_Cliente
    WHERE TipoClienteID = 'TC31';
END;

---28---Insertar un nuevo cliente---
CREATE PROCEDURE InsertarrCliente (
    @clienteID CHAR(10),
    @dni INT,
    @nombre_cl VARCHAR(50),
    @apellido_cl VARCHAR(50),
    @telefono_cl INT,
    @tipoClienteID CHAR(10)
)
AS
BEGIN
    INSERT INTO Cliente (Cliente_ID, DNI, Nombre_cl, Apellido_cl, Telefono_cl, TipoClienteID)
	VALUES ('C151', '03461789', 'Mayli', 'Tarazona', 921314567, 'TC01');
END;

---29---Actualizar un cliente---
CREATE PROCEDURE ActualizarCliente (
    @clienteID CHAR(10),
    @dni INT,
    @nombre_cl VARCHAR(50),
    @apellido_cl VARCHAR(50),
    @telefono_cl INT,
    @tipoClienteID CHAR(10)
)
AS
BEGIN
    UPDATE Cliente
    SET DNI = '76789190', Nombre_cl = 'Arduan', Apellido_cl = 'Hakimi',
        Telefono_cl = 930816203, TipoClienteID = 'TC02'
    WHERE Cliente_ID = 'C151';
END;

---30---Eliminar un cliente---
CREATE PROCEDURE EliminarCliente (
    @clienteID CHAR(10)
)
AS
BEGIN
    DELETE FROM Cliente
    WHERE Cliente_ID = 'C151';
END;

---31---Crear un nuevo comprobante de pago---
CREATE PROCEDURE CrearComprobantePago (
    @comprobantePagoID CHAR(10),
    @fechaPago DATE,
    @tipo_Comprobante VARCHAR(50),
    @formaPagoID CHAR(10),
    @total DECIMAL(5,2),
    @IGV INT,
    @monto_IGV DECIMAL(5,2),
    @importe_Total DECIMAL(5,2),
	@detalleComprobanteID CHAR(10),
	@empleadoID CHAR(10),
	@cliente_ID CHAR(10),
	@valoracionID CHAR(10)
)
AS
BEGIN
    INSERT INTO Comprobante_Pago (ComprobantePagoID, FechaPago, Tipo_Comprobante, FormaPagoID, Total, IGV, Monto_IGV, Importe_Total, DetalleComprobanteID, EmpleadoID, Cliente_ID, ValoracionID)
    VALUES ('CP131', '2023-12-01', 'Boleta', 'FP01', 90.00, 18.00, 72.00, 90.00, 'DC001', 'E001', 'C001', 'V001');
END;

---32---Actualizar un comprobante de pago---
CREATE PROCEDURE ActualizarComprobantePago (
    @comprobantePagoID CHAR(10),
    @fechaPago DATE,
    @tipo_Comprobante VARCHAR(50),
    @formaPagoID CHAR(10),
    @total DECIMAL(5,2),
    @IGV INT,
    @monto_IGV DECIMAL(5,2),
    @importe_Total DECIMAL(5,2)
)
AS
BEGIN
    UPDATE Comprobante_Pago
    SET FechaPago = '2023-12-02', Tipo_Comprobante = 'Factura', FormaPagoID = 'FP05',
        Total = 40.00, IGV = 50.66, Monto_IGV = 60.77, Importe_Total = 78.00,  DetalleComprobanteID = 'DC002', EmpleadoID = 'E005', Cliente_ID = 'C006', ValoracionID = 'V007'
    WHERE ComprobantePagoID = 'CP131';
END;

---33---Eliminar un comprobante de pago---
CREATE PROCEDURE EliminarComprobantePago (
    @comprobantePagoID CHAR(10)
)
AS
BEGIN
    DELETE FROM Comprobante_Pago
    WHERE ComprobantePagoID = 'CP131';
END;

---34---Obtener todos los tipos de servicios---
CREATE PROCEDURE ObtenerTiposServicios 
AS
BEGIN
    SELECT *
    FROM Tipo_Servicio;
END;

---35---Obtener un tipo de servicio por ID---
CREATE PROCEDURE ObtenerTipoServicioPorID (
    @tipoServicioID CHAR(10)
)
AS
BEGIN
    SELECT *
    FROM Tipo_Servicio
    WHERE TipoServicioID = 'TS002';
END;

---36---Obtener todos los servicios---
CREATE PROCEDURE ObtenerServicios
AS
BEGIN
    SELECT *
    FROM Servicios;
END;

---37---Obtener un servicio por ID---
CREATE PROCEDURE ObtenerServicioPorID (
    @servicioID CHAR(10)
)
AS
BEGIN
    SELECT *
    FROM Servicios
    WHERE ServicioID = 'S005';
END;

---38---Obtener todos los servicios de un tipo de servicio---
CREATE PROCEDURE ObtenerServiciosDeTipo (
    @tipoServicioID CHAR(10)
)
AS
BEGIN
    SELECT *
    FROM Servicios
    WHERE TipoServicioID = 'TS004';
END;

---39---Obtener todos los detalles de comprobante de un comprobante de pago---
CREATE PROCEDURE ObtenerDetallesComprobante (
    @detalleComprobanteID CHAR(10)
)
AS
BEGIN
    SELECT *
    FROM Comprobante_Pago
    WHERE DetalleComprobanteID = 'DC001';
END;

---40---Obtener un detalle de comprobante por ID---
CREATE PROCEDURE ObtenerDetalleComprobantePorID (
    @detalleComprobanteID CHAR(10)
)
AS
BEGIN
    SELECT *
    FROM Detalle_Comprobante
    WHERE DetalleComprobanteID = 'DC009';
END;

---41---Obtener todos los empleados---
CREATE PROCEDURE ObtenerEmpleados 
AS
BEGIN
    SELECT *
    FROM Empleado;
END;

---42---Obtener un empleado por ID---
CREATE PROCEDURE ObtenerEmpleadoPorID (
    @empleadoID CHAR(10)
)
AS
BEGIN
    SELECT *
    FROM Empleado
    WHERE EmpleadoID = 'E008';
END;

---43---Obtener todas las valoraciones de servicio---
CREATE PROCEDURE ObtenerValoracionesServicio 
AS
BEGIN
    SELECT *
    FROM Valoracion_Servicio;
END;

---44---Obtener una valoraci n de servicio por ID---
CREATE PROCEDURE ObtenerValoracionServicioPorID (
    @valoracionID CHAR(10)
)
AS
BEGIN
    SELECT *
    FROM Valoracion_Servicio
    WHERE ValoracionID = 'V002';
END;

---45---Obtener todas las formas de pago---
CREATE PROCEDURE ObtenerFormasPago 
AS
BEGIN
    SELECT *
    FROM Forma_Pago;
END;

---46---Obtener una forma de pago por ID---
CREATE PROCEDURE ObtenerFormaPagoPorID (
    @formaPagoID CHAR(10)
)
AS
BEGIN
    SELECT *
    FROM Forma_Pago
    WHERE FormaPagoID = 'FP10';
END;

---47---Obtener todos los tipos de clientes---
CREATE PROCEDURE ObtenerTiposClientes 
AS
BEGIN
    SELECT *
    FROM Tipo_Cliente;
END;

---48---Obtener un tipo de cliente por ID---
CREATE PROCEDURE ObtenerTipoClientePorID (
    @tipoClienteID CHAR(10)
)
AS
BEGIN
    SELECT *
    FROM Tipo_Cliente
    WHERE TipoClienteID = 'TC09';
END;

---49---Obtener todos los clientes---
CREATE PROCEDURE ObtenerClientes 
AS
BEGIN
    SELECT *
    FROM Cliente;
END;

---50---Obtener un cliente por ID---
CREATE PROCEDURE ObtenerClientePorID (
    @clienteID CHAR(10)
)
AS
BEGIN
    SELECT *
    FROM Cliente
    WHERE Cliente_ID = 'C044';
END;

------------------------------------------------------------------------------------------------------------
-->>-----------------------------------------------VISTAS-----------------------------------------------<<--
------------------------------------------------------------------------------------------------------------

---01---Vista de Servicios con Tipo de Servicio---
create view Vista_Servicios_Tipo_Servicio as
select s.ServicioID, s.Nombre_servi, s.Descripcion_servi, s.Precio_servi, ts.Nombre_TS, ts.Descripcion_TS
from Servicios as s
inner join Tipo_Servicio as ts on s.TipoServicioID = ts.TipoServicioID;

---02---Vista de Detalle Comprobante con Servicio, Descuento y Promoci n---
create view Vista_Detalle_Comprobante_Servicio_Descuento_Promocion as
select dc.DetalleComprobanteID, s.Nombre_servi, d.Nombre_des, p.Nombre_promo, dc.Cantidad, dc.Subtotal
from Detalle_Comprobante as dc
inner join Servicios as s on dc.ServicioID = s.ServicioID
left join Descuentos as d on dc.DescuentoID = d.DescuentoID
left join Promociones as p on dc.PromocionesID = p.PromocionesID;

---03---Vista para listar todos los clientes junto con su informaci n de contacto---
CREATE VIEW Vista_Cliente_Contacto AS
SELECT Cliente_ID, Nombre_cl, Apellido_cl, Telefono_cl, Nombre_TC
FROM Cliente
JOIN Tipo_Cliente ON Cliente.TipoClienteID = Tipo_Cliente.TipoClienteID;

---04---Vista de Comprobante Pago con Detalle Comprobante, Empleado, Cliente y Valoraci n---
create view Vista_Comprobante_Pago_Detalle_Empleado_Cliente_Valoracion as
select cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total, dc.DetalleComprobanteID, s.Nombre_servi, d.Nombre_des, p.Nombre_promo, e.Nombre_emple, c.Nombre_cl, vs.Puntuacion, vs.Comentario
from Comprobante_Pago as cp
inner join Detalle_Comprobante as dc on cp.DetalleComprobanteID = dc.DetalleComprobanteID
inner join Servicios as s on dc.ServicioID = s.ServicioID
left join Descuentos as d on dc.DescuentoID = d.DescuentoID
left join Promociones as p on dc.PromocionesID = p.PromocionesID
inner join Empleado as e on cp.EmpleadoID = e.EmpleadoID
inner join Cliente as c on cp.Cliente_ID = c.Cliente_ID
inner join Valoracion_Servicio as vs on cp.ValoracionID = vs.ValoracionID;

---05---Vista de Servicios m s solicitados por Tipo de Cliente---
CREATE VIEW Vista_Servicios_Mas_Solicitados_Tipo_Cliente AS
SELECT TOP 10
    s.Nombre_servi,
    s.Descripcion_servi,
    COUNT(dc.DetalleComprobanteID) AS Cantidad_Solicitudes,
    tc.Nombre_TC
FROM Detalle_Comprobante AS dc
INNER JOIN Servicios AS s ON dc.ServicioID = s.ServicioID
INNER JOIN Comprobante_Pago AS cp ON dc.DetalleComprobanteID = cp.DetalleComprobanteID
INNER JOIN Cliente AS c ON cp.Cliente_ID = c.Cliente_ID
INNER JOIN Tipo_Cliente AS tc ON c.TipoClienteID = tc.TipoClienteID
GROUP BY s.ServicioID, s.Nombre_servi, s.Descripcion_servi, tc.Nombre_TC
ORDER BY Cantidad_Solicitudes DESC;

---06---Vista de Comprobante Pago con Descuentos y Promociones Aplicados---
create view Vista_Comprobante_Pago_Descuentos_Promociones as
select cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total,
sum(dc.Subtotal * d.Valor_des / 100) as Total_Descuentos,
sum(dc.Subtotal * p.Porcentaje_Dsct / 100) as Total_Promociones
from Comprobante_Pago as cp
inner join Detalle_Comprobante as dc on cp.DetalleComprobanteID = dc.DetalleComprobanteID
left join Descuentos as d on dc.DescuentoID = d.DescuentoID
left join Promociones as p on dc.PromocionesID = p.PromocionesID
group by cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total;


---07---Vista de Comprobante Pago con Descuentos y Promociones Aplicados, y Total Pagado---
create view Vista_Comprobante_Pago_Descuentos_Promociones_Total as
select cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total,
sum(dc.Subtotal * d.Valor_des / 100) as Total_Descuentos,
sum(dc.Subtotal * p.Porcentaje_Dsct / 100) as Total_Promociones,
cp.Total - sum(dc.Subtotal * d.Valor_des / 100) - sum(dc.Subtotal * p.Porcentaje_Dsct / 100) as Total_Pagado
from Comprobante_Pago as cp
inner join Detalle_Comprobante as dc on cp.DetalleComprobanteID = dc.DetalleComprobanteID
left join Descuentos as d on dc.DescuentoID = d.DescuentoID
left join Promociones as p on dc.PromocionesID = p.PromocionesID
group by cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total;

---08---Vista de Comprobante Pago con Descuentos y Promociones Aplicados, y Total Pagado por Tipo de Pago---
CREATE VIEW Vista_Comprobante_Pago_Descuentos_Promociones_Total_Forma_Pago AS
SELECT
    cp.ComprobantePagoID,
    cp.FechaPago,
    cp.Tipo_Comprobante,
    cp.Total,
    cp.IGV,
    cp.Monto_IGV,
    cp.Importe_Total,
    SUM(dc.Subtotal * d.Valor_des / 100) AS Total_Descuentos,
    SUM(dc.Subtotal * p.Porcentaje_Dsct / 100) AS Total_Promociones,
    cp.Total - SUM(dc.Subtotal * d.Valor_des / 100) - SUM(dc.Subtotal * p.Porcentaje_Dsct / 100) AS Total_Pagado,
    cp.FormaPagoID
FROM Comprobante_Pago AS cp
INNER JOIN Detalle_Comprobante AS dc ON cp.DetalleComprobanteID = dc.DetalleComprobanteID
LEFT JOIN Descuentos AS d ON dc.DescuentoID = d.DescuentoID
LEFT JOIN Promociones AS p ON dc.PromocionesID = p.PromocionesID
GROUP BY cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total, cp.FormaPagoID;

---09---Vista de Comprobante Pago con Descuentos y Promociones Aplicados, y Total Pagado por Tipo de Cliente---
create view Vista_Comprobante_Pago_Descuentos_Promociones_Total_Tipo_Cliente as
select cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total,
sum(dc.Subtotal * d.Valor_des / 100) as Total_Descuentos,
sum(dc.Subtotal * p.Porcentaje_Dsct / 100) as Total_Promociones,
cp.Total - sum(dc.Subtotal * d.Valor_des / 100) - sum(dc.Subtotal * p.Porcentaje_Dsct / 100) as Total_Pagado,
cp.Cliente_ID, tc.Nombre_TC
from Comprobante_Pago as cp
inner join Detalle_Comprobante as dc on cp.DetalleComprobanteID = dc.DetalleComprobanteID
left join Descuentos as d on dc.DescuentoID = d.DescuentoID
left join Promociones as p on dc.PromocionesID = p.PromocionesID
inner join Cliente as c on cp.Cliente_ID = c.Cliente_ID
inner join Tipo_Cliente as tc on c.TipoClienteID = tc.TipoClienteID
group by cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total, cp.Cliente_ID, tc.Nombre_TC;

---10---Vista de Comprobante Pago con Descuentos y Promociones Aplicados, y Total Pagado por Empleado---
create view Vista_Comprobante_Pago_Descuentos_Promociones_Total_Empleado as
select cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total,
sum(dc.Subtotal * d.Valor_des / 100) as Total_Descuentos,
sum(dc.Subtotal * p.Porcentaje_Dsct / 100) as Total_Promociones,
cp.Total - sum(dc.Subtotal * d.Valor_des / 100) - sum(dc.Subtotal * p.Porcentaje_Dsct / 100) as Total_Pagado,
cp.EmpleadoID, e.Nombre_emple
from Comprobante_Pago as cp
inner join Detalle_Comprobante as dc on cp.DetalleComprobanteID = dc.DetalleComprobanteID
left join Descuentos as d on dc.DescuentoID = d.DescuentoID
left join Promociones as p on dc.PromocionesID = p.PromocionesID
inner join Empleado as e on cp.EmpleadoID = e.EmpleadoID
group by cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total, cp.EmpleadoID, e.Nombre_emple;

---11---Vista de Valoraci n de Servicios con Puntuaciones por Rango---
create view Vista_Valoracion_Servicios_Puntuaciones_Rango as
select vs.Puntuacion, count(vs.ValoracionID) as Cantidad_Valoraciones
from Valoracion_Servicio as vs
group by vs.Puntuacion;

---12---Vista de Valoraci n de Servicios con Puntuaciones por Rango y Comentarios---
CREATE VIEW Vista_Valoracion_Servicios_Puntuaciones_Rango_Comentarios AS
SELECT vs.Puntuacion, COUNT(vs.ValoracionID) AS Cantidad_Valoraciones, vs.Comentario
FROM Valoracion_Servicio AS vs
GROUP BY vs.Puntuacion, vs.Comentario;

---13---Vista de Comprobante Pago con Detalle Comprobante y Descuentos Aplicados---
create view Vista_Comprobante_Pago_Detalle_Descuentos as
select cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total,
dc.DetalleComprobanteID, s.Nombre_servi, d.Nombre_des, d.Valor_des, dc.Subtotal
from Comprobante_Pago as cp
inner join Detalle_Comprobante as dc on cp.DetalleComprobanteID = dc.DetalleComprobanteID
inner join Servicios as s on dc.ServicioID = s.ServicioID
left join Descuentos as d on dc.DescuentoID = d.DescuentoID;

---14---Vista de Comprobante Pago con Detalle Comprobante y Promociones Aplicadas---
create view Vista_Comprobante_Pago_Detalle_Promociones as
select cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total,
dc.DetalleComprobanteID, s.Nombre_servi, p.Nombre_promo, p.Porcentaje_Dsct, dc.Subtotal
from Comprobante_Pago as cp
inner join Detalle_Comprobante as dc on cp.DetalleComprobanteID = dc.DetalleComprobanteID
inner join Servicios as s on dc.ServicioID = s.ServicioID
left join Promociones as p on dc.PromocionesID = p.PromocionesID;

---15---Vista de Comprobante Pago con Detalle Comprobante, Descuentos y Promociones Aplicadas---
create view Vista_Comprobante_Pago_Detalle_Descuentos_Promociones as
select cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total,
dc.DetalleComprobanteID, s.Nombre_servi, d.Nombre_des, d.Valor_des, dc.Subtotal,
p.Nombre_promo, p.Porcentaje_Dsct
from Comprobante_Pago as cp
inner join Detalle_Comprobante as dc on cp.DetalleComprobanteID = dc.DetalleComprobanteID
inner join Servicios as s on dc.ServicioID = s.ServicioID
left join Descuentos as d on dc.DescuentoID = d.DescuentoID
left join Promociones as p on dc.PromocionesID = p.PromocionesID;

---16---Vista de Comprobante Pago con Detalle Comprobante, Descuentos y Promociones Aplicadas, y Total Pagado---
create view Vista_Comprobante_Pago_Detalle_Descuentos_Promociones_Total as
select cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total,
dc.DetalleComprobanteID, s.Nombre_servi, d.Nombre_des, d.Valor_des, dc.Subtotal,
p.Nombre_promo, p.Porcentaje_Dsct,
cp.Total - sum(dc.Subtotal * d.Valor_des / 100) - sum(dc.Subtotal * p.Porcentaje_Dsct / 100) as Total_Pagado
from Comprobante_Pago as cp
inner join Detalle_Comprobante as dc on cp.DetalleComprobanteID = dc.DetalleComprobanteID
inner join Servicios as s on dc.ServicioID = s.ServicioID
left join Descuentos as d on dc.DescuentoID = d.DescuentoID
left join Promociones as p on dc.PromocionesID = p.PromocionesID
group by cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total,
dc.DetalleComprobanteID, s.Nombre_servi, d.Nombre_des, d.Valor_des, dc.Subtotal,
p.Nombre_promo, p.Porcentaje_Dsct;

---17--- Vista de Comprobante Pago con Detalle Comprobante, Descuentos y Promociones Aplicadas, y Total Pagado por Tipo de Cliente---
create view Vista_Comprobante_Pago_Detalle_Descuentos_Promociones_Total_Tipo_Cliente as
select cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total,
dc.DetalleComprobanteID, s.Nombre_servi, d.Nombre_des, d.Valor_des, dc.Subtotal,
p.Nombre_promo, p.Porcentaje_Dsct,
cp.Total - sum(dc.Subtotal * d.Valor_des / 100) - sum(dc.Subtotal * p.Porcentaje_Dsct / 100) as Total_Pagado,
cp.Cliente_ID, tc.Nombre_TC
from Comprobante_Pago as cp
inner join Detalle_Comprobante as dc on cp.DetalleComprobanteID = dc.DetalleComprobanteID
inner join Servicios as s on dc.ServicioID = s.ServicioID
left join Descuentos as d on dc.DescuentoID = d.DescuentoID
left join Promociones as p on dc.PromocionesID = p.PromocionesID
inner join Cliente as c on cp.Cliente_ID = c.Cliente_ID
inner join Tipo_Cliente as tc on c.TipoClienteID = tc.TipoClienteID
group by cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total,
dc.DetalleComprobanteID, s.Nombre_servi, d.Nombre_des, d.Valor_des, dc.Subtotal,
p.Nombre_promo, p.Porcentaje_Dsct, cp.Cliente_ID, tc.Nombre_TC;

---18---Vista de Comprobante Pago con Detalle Comprobante, Descuentos y Promociones Aplicadas, y Total Pagado por Empleado---
create view Vista_Comprobante_Pago_Detalle_Descuentos_Promociones_Total_Empleado as
select cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total,
dc.DetalleComprobanteID, s.Nombre_servi, d.Nombre_des, d.Valor_des, dc.Subtotal,
p.Nombre_promo, p.Porcentaje_Dsct,
cp.Total - sum(dc.Subtotal * d.Valor_des / 100) - sum(dc.Subtotal * p.Porcentaje_Dsct / 100) as Total_Pagado,
cp.EmpleadoID, e.Nombre_emple
from Comprobante_Pago as cp
inner join Detalle_Comprobante as dc on cp.DetalleComprobanteID = dc.DetalleComprobanteID
inner join Servicios as s on dc.ServicioID = s.ServicioID
left join Descuentos as d on dc.DescuentoID = d.DescuentoID
left join Promociones as p on dc.PromocionesID = p.PromocionesID
inner join Empleado as e on cp.EmpleadoID = e.EmpleadoID
group by cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total,
dc.DetalleComprobanteID, s.Nombre_servi, d.Nombre_des, d.Valor_des, dc.Subtotal,
p.Nombre_promo, p.Porcentaje_Dsct, cp.EmpleadoID, e.Nombre_emple;

---19---Vista de Comprobante Pago con Detalle Comprobante, Descuentos y Promociones Aplicadas, y Total Pagado por Rango de Fechas---
CREATE VIEW Vista_Comprobante_Pago_Detalle_Descuentos_Promociones_Total_Rango_Fechas AS
SELECT 
    cp.ComprobantePagoID,
    cp.FechaPago,
    cp.Tipo_Comprobante,
    cp.Total,
    cp.IGV,
    cp.Monto_IGV,
    cp.Importe_Total,
    dc.DetalleComprobanteID,
    s.Nombre_servi,
    d.Nombre_des,
    d.Valor_des,
    dc.Subtotal,
    p.Nombre_promo,
    p.Porcentaje_Dsct,
    cp.Total - SUM(dc.Subtotal * d.Valor_des/ 100) - SUM(dc.Subtotal * p.Porcentaje_Dsct / 100) as Total_Pagado
FROM Comprobante_Pago as cp
INNER JOIN Detalle_Comprobante as dc ON cp.DetalleComprobanteID = dc.DetalleComprobanteID
INNER JOIN Servicios as s ON dc.ServicioID = s.ServicioID
LEFT JOIN Descuentos as d ON dc.DescuentoID = d.DescuentoID
LEFT JOIN Promociones as p ON dc.PromocionesID = p.PromocionesID
WHERE cp.FechaPago BETWEEN '2023-07-01' AND '2023-07-31'
GROUP BY cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total,
    dc.DetalleComprobanteID, s.Nombre_servi, d.Nombre_des, d.Valor_des, dc.Subtotal, p.Nombre_promo, p.Porcentaje_Dsct;

---20---Vista de Comprobante Pago con Detalle Comprobante, Descuentos y Promociones Aplicadas, y Total Pagado por Rango de Fechas y Tipo de Pago---
CREATE VIEW Vista_Comprobante_Pago_Detalle_Descuentos_Promociones_Total_Rango_Fechas_Forma_Pago AS
SELECT 
    cp.ComprobantePagoID,
    cp.FechaPago,
    cp.Tipo_Comprobante,
    cp.Total,
    cp.IGV,
    cp.Monto_IGV,
    cp.Importe_Total,
    dc.DetalleComprobanteID,
    s.Nombre_servi,
    d.Nombre_des,
    d.Valor_des,
    dc.Subtotal,
    p.Nombre_promo,
    p.Porcentaje_Dsct,
    cp.Total - SUM(dc.Subtotal * d.Valor_des / 100) - SUM(dc.Subtotal * p.Porcentaje_Dsct / 100) AS Total_Pagado,
    cp.FormaPagoID
FROM Comprobante_Pago AS cp
INNER JOIN Detalle_Comprobante AS dc ON cp.DetalleComprobanteID = dc.DetalleComprobanteID
INNER JOIN Servicios AS s ON dc.ServicioID = s.ServicioID
LEFT JOIN Descuentos AS d ON dc.DescuentoID = d.DescuentoID
LEFT JOIN Promociones AS p ON dc.PromocionesID = p.PromocionesID
WHERE cp.FechaPago BETWEEN '2023-07-01' AND '2023-07-31'
GROUP BY cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total,
    dc.DetalleComprobanteID, s.Nombre_servi, d.Nombre_des, d.Valor_des, dc.Subtotal, p.Nombre_promo, p.Porcentaje_Dsct,
    cp.FormaPagoID;

---21---Vista de Comprobante Pago con Detalle Comprobante, Descuentos y Promociones Aplicadas, y Total Pagado por Rango de Fechas, Tipo de Pago, y Tipo de Cliente---
CREATE VIEW Vista_Comprobante_Pago_Detalle_Descuentos_Promociones_Total_Rango_Fechas_Forma_Pago_Tipo_Cliente AS
SELECT 
    cp.ComprobantePagoID,
    cp.FechaPago,
    cp.Tipo_Comprobante,
    cp.Total,
    cp.IGV,
    cp.Monto_IGV,
    cp.Importe_Total,
    dc.DetalleComprobanteID,
    s.Nombre_servi,
    d.Nombre_des,
    d.Valor_des,
    dc.Subtotal,
    p.Nombre_promo,
    p.Porcentaje_Dsct,
    cp.Total - SUM(dc.Subtotal * d.Valor_des / 100) - SUM(dc.Subtotal * p.Porcentaje_Dsct / 100) as Total_Pagado,
    CASE WHEN cp.FechaPago BETWEEN '2023-07-01' AND '2023-07-31' THEN 1 ELSE 0 END AS Fecha_Entre_Rango,
    cp.FormaPagoID,
    cp.Cliente_ID
FROM Comprobante_Pago AS cp
INNER JOIN Detalle_Comprobante AS dc ON cp.DetalleComprobanteID = dc.DetalleComprobanteID
INNER JOIN Servicios AS s ON dc.ServicioID = s.ServicioID
LEFT JOIN Descuentos AS d ON dc.DescuentoID = d.DescuentoID
LEFT JOIN Promociones AS p ON dc.PromocionesID = p.PromocionesID
INNER JOIN Cliente AS c ON cp.Cliente_ID = c.Cliente_ID
INNER JOIN Tipo_Cliente AS tc ON c.TipoClienteID = tc.TipoClienteID
GROUP BY cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total,
    dc.DetalleComprobanteID, s.Nombre_servi, d.Nombre_des, d.Valor_des, dc.Subtotal,
    p.Nombre_promo, p.Porcentaje_Dsct, cp.FormaPagoID, cp.Cliente_ID;

---22--- Vista de Comprobante Pago con Detalle Comprobante, Descuentos y Promociones Aplicadas, y Total Pagado por Rango de Fechas, Tipo de Pago, Tipo de Cliente, y Empleado---
CREATE VIEW Vista_Comprobante_Pago_Detalle_Descuentos_Promociones_Total_Rango_Fechas_Forma_Pago_Tipo_Cliente_Empleado AS
SELECT 
    cp.ComprobantePagoID,
    cp.FechaPago,
    cp.Tipo_Comprobante,
    cp.Total,
    cp.IGV,
    cp.Monto_IGV,
    cp.Importe_Total,
    dc.DetalleComprobanteID,
    s.Nombre_servi,
    d.Nombre_des,
    d.Valor_des,
    dc.Subtotal,
    p.Nombre_promo,
    p.Porcentaje_Dsct,
    cp.Total - SUM(dc.Subtotal * d.Valor_des / 100) - SUM(dc.Subtotal * p.Porcentaje_Dsct / 100) AS Total_Pagado,
    cp.FormaPagoID,
    cp.Cliente_ID,
    cp.EmpleadoID
FROM Comprobante_Pago AS cp
INNER JOIN Detalle_Comprobante AS dc ON cp.DetalleComprobanteID = dc.DetalleComprobanteID
INNER JOIN Servicios AS s ON dc.ServicioID = s.ServicioID
LEFT JOIN Descuentos AS d ON dc.DescuentoID = d.DescuentoID
LEFT JOIN Promociones AS p ON dc.PromocionesID = p.PromocionesID
INNER JOIN Cliente AS c ON cp.Cliente_ID = c.Cliente_ID
WHERE cp.FechaPago BETWEEN '2023-07-01' AND '2023-07-31'
GROUP BY cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total,
    dc.DetalleComprobanteID, s.Nombre_servi, d.Nombre_des, d.Valor_des, dc.Subtotal,
    p.Nombre_promo, p.Porcentaje_Dsct, cp.FormaPagoID, cp.Cliente_ID, cp.EmpleadoID;

---23---
CREATE VIEW Vista_Comprobante_Pago_Detalle_Descuentos_Promociones_Total_Rango_Fechas_Forma_Pago_Tipo_Cliente_Empleado_Servicio AS
SELECT 
    cp.ComprobantePagoID,
    cp.FechaPago,
    cp.Tipo_Comprobante,
    cp.Total,
    cp.IGV,
    cp.Monto_IGV,
    cp.Importe_Total,
    dc.DetalleComprobanteID,
    s.Nombre_servi,
    d.Nombre_des,
    d.Valor_des,
    dc.Subtotal,
    p.Nombre_promo,
    p.Porcentaje_Dsct,
    cp.Total - SUM(dc.Subtotal * d.Valor_des / 100) - SUM(dc.Subtotal * p.Porcentaje_Dsct / 100) AS Total_Pagado,
    cp.FormaPagoID,
    cp.Cliente_ID,
    cp.EmpleadoID,
    dc.ServicioID
FROM Comprobante_Pago AS cp
INNER JOIN Detalle_Comprobante AS dc ON cp.DetalleComprobanteID = dc.DetalleComprobanteID
INNER JOIN Servicios AS s ON dc.ServicioID = s.ServicioID
LEFT JOIN Descuentos AS d ON dc.DescuentoID = d.DescuentoID
LEFT JOIN Promociones AS p ON dc.PromocionesID = p.PromocionesID
INNER JOIN Cliente AS c ON cp.Cliente_ID = c.Cliente_ID
INNER JOIN Tipo_Cliente AS tc ON c.TipoClienteID = tc.TipoClienteID
INNER JOIN Empleado AS e ON cp.EmpleadoID = e.EmpleadoID
WHERE cp.FechaPago BETWEEN '2023-07-01' AND '2023-07-31'
GROUP BY cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total,
    dc.DetalleComprobanteID, s.Nombre_servi, d.Nombre_des, d.Valor_des, dc.Subtotal,
    p.Nombre_promo, p.Porcentaje_Dsct, cp.FormaPagoID, cp.Cliente_ID, cp.EmpleadoID, dc.ServicioID;

---24---Vista de ejemplo que une las tablas Servicios y Tipo_Servicio---
CREATE VIEW Vista_Servicios_TipoServicio AS
SELECT s.ServicioID, s.Nombre_servi, s.Descripcion_servi, s.Precio_servi,
       ts.Nombre_TS AS NombreTipoServicio, ts.Descripcion_TS AS DescripcionTipoServicio
FROM Servicios s
INNER JOIN Tipo_Servicio ts ON s.TipoServicioID = ts.TipoServicioID;

---25---Vista para mostrar detalles de empleados con sus horarios---
CREATE VIEW Vista_Empleados_Horarios AS
SELECT e.EmpleadoID, e.Nombre_emple, e.Apellidos_emple, e.Telefono_emple,
       e.Horario_entrada, e.Horario_salida
FROM Empleado e;

---26---Vista para mostrar detalles de clientes con su tipo de cliente---
CREATE VIEW Vista_Clientes_TipoCliente AS
SELECT c.Cliente_ID, c.Nombre_cl, c.Apellido_cl, c.Telefono_cl,
       tc.Nombre_TC AS TipoCliente, tc.Descripcion_TC AS DescripcionTipoCliente
FROM Cliente c
INNER JOIN Tipo_Cliente tc ON c.TipoClienteID = tc.TipoClienteID;

---27---Vista para mostrar detalles de los comprobantes de pago con informaci n de clientes y empleados---
CREATE VIEW Vista_ComprobantesPago_Clientes_Empleados AS
SELECT cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total,
       c.Nombre_cl AS NombreCliente, c.Apellido_cl AS ApellidoCliente,
       e.Nombre_emple AS NombreEmpleado, e.Apellidos_emple AS ApellidoEmpleado
FROM Comprobante_Pago cp
INNER JOIN Cliente c ON cp.Cliente_ID = c.Cliente_ID
INNER JOIN Empleado e ON cp.EmpleadoID = e.EmpleadoID;

---28---Vista para mostrar detalles de promociones con informaci n de servicios asociados---
CREATE VIEW Vista_Promociones_Servicios AS
SELECT pr.PromocionesID, pr.Nombre_promo, pr.Descripcion_promo, pr.FechaInicio, pr.FechaFin, pr.Porcentaje_Dsct,
       ds.Nombre_des AS NombreDescuento, ds.Descripcion_des AS DescripcionDescuento,
       s.Nombre_servi AS NombreServicio, s.Descripcion_servi AS DescripcionServicio, s.Precio_servi AS PrecioServicio
FROM Promociones pr
LEFT JOIN Detalle_Comprobante dc ON pr.PromocionesID = dc.PromocionesID
LEFT JOIN Descuentos ds ON dc.DescuentoID = ds.DescuentoID
LEFT JOIN Servicios s ON dc.ServicioID = s.ServicioID;

---29---Vista para mostrar detalles de tipos de servicios con informaci n de servicios relacionados---
CREATE VIEW Vista_TipoServicio_Servicios AS
SELECT ts.TipoServicioID, ts.Nombre_TS, ts.Descripcion_TS,
       s.ServicioID, s.Nombre_servi AS NombreServicio, s.Descripcion_servi AS DescripcionServicio, s.Precio_servi AS PrecioServicio
FROM Tipo_Servicio ts
LEFT JOIN Servicios s ON ts.TipoServicioID = s.TipoServicioID;

---30---Vista para mostrar detalles de formas de pago con informaci n de comprobantes de pago---
CREATE VIEW Vista_FormasPago_ComprobantesPago AS
SELECT fp.FormaPagoID, fp.Nombre_FP AS NombreFormaPago,
       cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total,
       cp.IGV, cp.Monto_IGV, cp.Importe_Total
FROM Forma_Pago fp
INNER JOIN Comprobante_Pago cp ON fp.FormaPagoID = cp.FormaPagoID;

---31---Vista para mostrar detalles de descuentos con informaci n de servicios asociados---
CREATE VIEW Vista_Descuentos_Servicios AS
SELECT d.DescuentoID, d.Nombre_des, d.Descripcion_des, d.Tipo_des, d.Valor_des,
       s.ServicioID, s.Nombre_servi AS NombreServicio, s.Descripcion_servi AS DescripcionServicio, s.Precio_servi AS PrecioServicio
FROM Descuentos d
LEFT JOIN Detalle_Comprobante dc ON d.DescuentoID = dc.DescuentoID
LEFT JOIN Servicios s ON dc.ServicioID = s.ServicioID;

---32---Vista para mostrar detalles de tipos de cliente con informaci n de clientes asociados---
CREATE VIEW Vista_TipoCliente_Clientes AS
SELECT tc.TipoClienteID, tc.Nombre_TC, tc.Descripcion_TC,
       c.Cliente_ID, c.Nombre_cl AS NombreCliente, c.Apellido_cl AS ApellidoCliente, c.Telefono_cl
FROM Tipo_Cliente tc
LEFT JOIN Cliente c ON tc.TipoClienteID = c.TipoClienteID;

---33---Vista para mostrar detalles de tipos de cliente con informaci n de comprobantes de pago asociados---
CREATE VIEW Vista_TipoCliente_ComprobantesPago AS
SELECT tc.TipoClienteID, tc.Nombre_TC, tc.Descripcion_TC,
       cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total,
       cp.IGV, cp.Monto_IGV, cp.Importe_Total
FROM Tipo_Cliente tc
LEFT JOIN Cliente c ON tc.TipoClienteID = c.TipoClienteID
LEFT JOIN Comprobante_Pago cp ON c.Cliente_ID = cp.Cliente_ID;

---34--- Vista para mostrar detalles de tipos de servicios con informaci n de promociones asociadas---
CREATE VIEW Vista_TipoServicio_Promociones AS
SELECT ts.TipoServicioID, ts.Nombre_TS, ts.Descripcion_TS,
       p.PromocionesID, p.Nombre_promo AS NombrePromocion, p.Descripcion_promo AS DescripcionPromocion,
       p.FechaInicio, p.FechaFin, p.Porcentaje_Dsct
FROM Tipo_Servicio ts
LEFT JOIN Servicios s ON ts.TipoServicioID = s.TipoServicioID
LEFT JOIN Detalle_Comprobante dc ON s.ServicioID = dc.ServicioID
LEFT JOIN Promociones p ON dc.PromocionesID = p.PromocionesID;

---35---Vista para mostrar detalles de servicios con informaci n de descuentos y promociones asociados---
CREATE VIEW Vista_Servicios_Descuentos_Promociones AS
SELECT s.ServicioID, s.Nombre_servi, s.Descripcion_servi, s.Precio_servi,
       d.DescuentoID, d.Nombre_des AS NombreDescuento, d.Descripcion_des AS DescripcionDescuento, d.Tipo_des, d.Valor_des,
       p.PromocionesID, p.Nombre_promo AS NombrePromocion, p.Descripcion_promo AS DescripcionPromocion, p.FechaInicio, p.FechaFin, p.Porcentaje_Dsct
FROM Servicios s
LEFT JOIN Detalle_Comprobante dc ON s.ServicioID = dc.ServicioID
LEFT JOIN Descuentos d ON dc.DescuentoID = d.DescuentoID
LEFT JOIN Promociones p ON dc.PromocionesID = p.PromocionesID;

---36---Vista para mostrar detalles de comprobantes de pago con informaci n de tipos de cliente asociados---
CREATE VIEW Vista_Comprobantes_TipoCliente AS
SELECT cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total,
       tc.TipoClienteID, tc.Nombre_TC AS NombreTipoCliente, tc.Descripcion_TC AS DescripcionTipoCliente
FROM Comprobante_Pago cp
LEFT JOIN Cliente c ON cp.Cliente_ID = c.Cliente_ID
LEFT JOIN Tipo_Cliente tc ON c.TipoClienteID = tc.TipoClienteID;

---37---Vista para mostrar detalles de tipos de servicios con informaci n de descuentos asociados---
CREATE VIEW Vista_TipoServicio_Descuentos AS
SELECT ts.TipoServicioID, ts.Nombre_TS, ts.Descripcion_TS,
       d.DescuentoID, d.Nombre_des AS NombreDescuento, d.Descripcion_des AS DescripcionDescuento, d.Tipo_des, d.Valor_des
FROM Tipo_Servicio ts
LEFT JOIN Servicios s ON ts.TipoServicioID = s.TipoServicioID
LEFT JOIN Detalle_Comprobante dc ON s.ServicioID = dc.ServicioID
LEFT JOIN Descuentos d ON dc.DescuentoID = d.DescuentoID;

---38---Vista para mostrar detalles de tipos de cliente con informaci n de empleados asociados---
CREATE VIEW Vista_TipoCliente_Empleados AS
SELECT tc.TipoClienteID, tc.Nombre_TC, tc.Descripcion_TC,
       c.Cliente_ID, c.Nombre_cl AS NombreCliente, c.Apellido_cl AS ApellidoCliente, c.Telefono_cl,
       e.EmpleadoID, e.Nombre_emple AS NombreEmpleado, e.Apellidos_emple AS ApellidoEmpleado
FROM Tipo_Cliente tc
LEFT JOIN Cliente c ON tc.TipoClienteID = c.TipoClienteID
LEFT JOIN Comprobante_Pago cp ON c.Cliente_ID = cp.Cliente_ID
LEFT JOIN Empleado e ON cp.EmpleadoID = e.EmpleadoID;

---39---Vista para mostrar detalles de tipos de servicios con informaci n de descuentos y promociones asociados---
CREATE VIEW Vista_TipoServicio_Descuentos_Promociones AS
SELECT ts.TipoServicioID, ts.Nombre_TS, ts.Descripcion_TS,
       d.DescuentoID, d.Nombre_des AS NombreDescuento, d.Descripcion_des AS DescripcionDescuento, d.Tipo_des, d.Valor_des,
       p.PromocionesID, p.Nombre_promo AS NombrePromocion, p.Descripcion_promo AS DescripcionPromocion, p.FechaInicio, p.FechaFin, p.Porcentaje_Dsct
FROM Tipo_Servicio ts
LEFT JOIN Servicios s ON ts.TipoServicioID = s.TipoServicioID
LEFT JOIN Detalle_Comprobante dc ON s.ServicioID = dc.ServicioID
LEFT JOIN Descuentos d ON dc.DescuentoID = d.DescuentoID
LEFT JOIN Promociones p ON dc.PromocionesID = p.PromocionesID;

---40--- Vista para mostrar detalles de empleados con informaci n de formas de pago asociadas---
CREATE VIEW Vista_Empleados_FormasPago AS
SELECT e.EmpleadoID, e.Nombre_emple, e.Apellidos_emple, e.Telefono_emple,
       fp.FormaPagoID, fp.Nombre_FP
FROM Empleado e
LEFT JOIN Comprobante_Pago cp ON e.EmpleadoID = cp.EmpleadoID
LEFT JOIN Forma_Pago fp ON cp.FormaPagoID = fp.FormaPagoID;

---41---Vista para mostrar detalles de comprobantes de pago con informaci n de valoraciones asociadas---
CREATE VIEW Vista_Comprobantes_Valoraciones AS
SELECT cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total,
       vs.ValoracionID, vs.Puntuacion, vs.Comentario
FROM Comprobante_Pago cp
LEFT JOIN Valoracion_Servicio vs ON cp.ValoracionID = vs.ValoracionID;

---42---Vista para mostrar detalles de clientes con informaci n de tipos de cliente asociados---
CREATE VIEW Vista_Clientes_TiposCliente AS
SELECT c.Cliente_ID, c.Nombre_cl, c.Apellido_cl, c.Telefono_cl,
       tc.TipoClienteID, tc.Nombre_TC AS TipoCliente, tc.Descripcion_TC AS DescripcionTipoCliente
FROM Cliente c
LEFT JOIN Tipo_Cliente tc ON c.TipoClienteID = tc.TipoClienteID;

---43---Vista para mostrar detalles de clientes con informaci n detallada de comprobantes de pago asociados---
CREATE VIEW Vista_Clientes_ComprobantesPago AS
SELECT c.Cliente_ID, c.Nombre_cl, c.Apellido_cl, c.Telefono_cl,
       cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total
FROM Cliente c
LEFT JOIN Comprobante_Pago cp ON c.Cliente_ID = cp.Cliente_ID;

---44---Vista para mostrar detalles de comprobantes de pago con informaci n de empleados asociados---
CREATE VIEW Vista_Comprobantes_Empleados AS
SELECT cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total,
       e.EmpleadoID, e.Nombre_emple, e.Apellidos_emple, e.Telefono_emple
FROM Comprobante_Pago cp
LEFT JOIN Empleado e ON cp.EmpleadoID = e.EmpleadoID;

---45---Vista para mostrar detalles de servicios con informaci n de promociones asociadas---
CREATE VIEW Vista_Servicios_Promociones AS
SELECT s.ServicioID, s.Nombre_servi, s.Descripcion_servi, s.Precio_servi,
       p.PromocionesID, p.Nombre_promo, p.Descripcion_promo, p.FechaInicio, p.FechaFin, p.Porcentaje_Dsct
FROM Servicios s
LEFT JOIN Detalle_Comprobante dc ON s.ServicioID = dc.ServicioID
LEFT JOIN Promociones p ON dc.PromocionesID = p.PromocionesID;

---46---Vista para mostrar detalles de empleados con informaci n de clientes asociados---
CREATE VIEW Vista_Empleados_Clientes AS
SELECT e.EmpleadoID, e.Nombre_emple, e.Apellidos_emple, e.Telefono_emple,
       c.Cliente_ID, c.Nombre_cl AS NombreCliente, c.Apellido_cl AS ApellidoCliente, c.Telefono_cl
FROM Empleado e
LEFT JOIN Comprobante_Pago cp ON e.EmpleadoID = cp.EmpleadoID
LEFT JOIN Cliente c ON cp.Cliente_ID = c.Cliente_ID;

---47---Vista para mostrar detalles de clientes con informaci n de formas de pago asociadas---
CREATE VIEW Vista_Clientes_FormasPago AS
SELECT c.Cliente_ID, c.Nombre_cl, c.Apellido_cl, c.Telefono_cl,
       fp.FormaPagoID, fp.Nombre_FP
FROM Cliente c
LEFT JOIN Comprobante_Pago cp ON c.Cliente_ID = cp.Cliente_ID
LEFT JOIN Forma_Pago fp ON cp.FormaPagoID = fp.FormaPagoID;

---48---Vista para mostrar detalles de empleados con el total de ventas realizadas---
CREATE VIEW Vista_Empleados_TotalVentas AS
SELECT e.EmpleadoID, e.Nombre_emple, e.Apellidos_emple, e.Telefono_emple,
       COUNT(cp.ComprobantePagoID) AS TotalVentas
FROM Empleado e
LEFT JOIN Comprobante_Pago cp ON e.EmpleadoID = cp.EmpleadoID
GROUP BY e.EmpleadoID, e.Nombre_emple, e.Apellidos_emple, e.Telefono_emple;

---49---Vista de Comprobantes de Pago con Totales e IGV---
CREATE VIEW Vista_Comprobantes_Pago_Totales_IGV AS
SELECT cp.ComprobantePagoID, cp.FechaPago, cp.Tipo_Comprobante, cp.Total, cp.IGV, cp.Monto_IGV, cp.Importe_Total
FROM Comprobante_Pago AS cp;

---50---Vista para mostrar detalles de clientes con informaci n detallada de forma de pago asociada---
CREATE VIEW Vista_Clientes_FormaPago AS
SELECT c.Cliente_ID, c.Nombre_cl, c.Apellido_cl, c.Telefono_cl,
       fp.FormaPagoID, fp.Nombre_FP
FROM Cliente c
LEFT JOIN Comprobante_Pago cp ON c.Cliente_ID = cp.Cliente_ID
LEFT JOIN Forma_Pago fp ON cp.FormaPagoID = fp.FormaPagoID;

------------------------------------------------------------------------------------------------------------
-->>------------------------------------------TRIGGERS--------------------------------------------------<<--
------------------------------------------------------------------------------------------------------------

--1. Actualizar Subtotal al Insertar en Detalle_Comprobante:
CREATE TRIGGER tr_actualizar_subtotal
ON Detalle_Comprobante
AFTER INSERT
AS
BEGIN
    UPDATE dc
    SET Subtotal = s.Precio_servi * i.Cantidad * (1 - (d.Valor_des + p.Porcentaje_Dsct) / 100)
    FROM Detalle_Comprobante dc
    JOIN inserted i ON dc.DetalleComprobanteID = i.DetalleComprobanteID
    JOIN Servicios s ON dc.ServicioID = s.ServicioID
    LEFT JOIN Descuentos d ON dc.DescuentoID = d.DescuentoID
    LEFT JOIN Promociones p ON dc.PromocionesID = p.PromocionesID;
END;


--2. Actualizar Importe_Total en Comprobante_Pago al Insertar en Detalle_Comprobante:
CREATE TRIGGER tr_actualizar_importe_total
ON Detalle_Comprobante
AFTER INSERT
AS
BEGIN
    UPDATE cp
    SET Importe_Total = cp.Total + i.Subtotal
    FROM Comprobante_Pago cp
    JOIN inserted i ON cp.DetalleComprobanteID = i.DetalleComprobanteID;
END;


--3. Actualizar Total en Comprobante_Pago al Insertar en Detalle_Comprobante:
CREATE TRIGGER tr_actualizar_total
ON Detalle_Comprobante
AFTER INSERT
AS
BEGIN
    UPDATE cp
    SET Total = cp.Importe_Total / (1 + cp.IGV / 100)
    FROM Comprobante_Pago cp
    JOIN inserted i ON cp.DetalleComprobanteID = i.DetalleComprobanteID;
END;


--4. Actualizar Puntuacion en Valoracion_Servicio al Insertar en Comprobante_Pago:
CREATE TRIGGER tr_actualizar_puntuacion
ON Comprobante_Pago
AFTER INSERT
AS
BEGIN
    UPDATE vs
    SET Puntuacion = CASE
                        WHEN i.Importe_Total >= 50 THEN 5
                        WHEN i.Importe_Total >= 30 THEN 4
                        WHEN i.Importe_Total >= 20 THEN 3
                        WHEN i.Importe_Total >= 10 THEN 2
                        ELSE 1
                     END
    FROM Valoracion_Servicio vs
    JOIN inserted i ON vs.ValoracionID = i.ValoracionID;
END;


--5. Actualizar Horario_salida en Empleado al Insertar en Comprobante_Pago:
CREATE TRIGGER tr_actualizar_horario_salida
ON Comprobante_Pago
AFTER INSERT
AS
BEGIN
    UPDATE e
    SET Horario_salida = '18:00'
    FROM Empleado e
    JOIN inserted i ON e.EmpleadoID = i.EmpleadoID;
END;


--6. Actualizar FechaFin en Promociones al Insertar en Detalle_Comprobante:
CREATE TRIGGER tr_actualizar_fechafin
ON Detalle_Comprobante
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET FechaFin = DATEADD(MONTH, 1, GETDATE())
    FROM Promociones p
    JOIN inserted i ON p.PromocionesID = i.PromocionesID;
END;


--7. Actualizar Descripcion_des en Descuentos al Insertar en Detalle_Comprobante:
CREATE TRIGGER tr_actualizar_descripcion_des
ON Detalle_Comprobante
AFTER INSERT
AS
BEGIN
    UPDATE d
    SET Descripcion_des = 'Descuento aplicado en compra'
    FROM Descuentos d
    JOIN inserted i ON d.DescuentoID = i.DescuentoID;
END;


--8. Actualizar IGV en Comprobante_Pago al Insertar en Detalle_Comprobante:
CREATE TRIGGER tr_actualizar_igv
ON Detalle_Comprobante
AFTER INSERT
AS
BEGIN
    UPDATE cp
    SET IGV = 18
    FROM Comprobante_Pago cp
    JOIN inserted i ON cp.DetalleComprobanteID = i.DetalleComprobanteID;
END;


--9. Actualizar FechaPago en Comprobante_Pago al Insertar en Detalle_Comprobante:
CREATE TRIGGER tr_actualizar_fechapago
ON Detalle_Comprobante
AFTER INSERT
AS
BEGIN
    UPDATE cp
    SET FechaPago = GETDATE()
    FROM Comprobante_Pago cp
    JOIN inserted i ON cp.DetalleComprobanteID = i.DetalleComprobanteID;
END;


--10. Actualizar Stock en Productos al Insertar en Detalle_Comprobante:
CREATE TRIGGER tr_actualizar_stock
ON Detalle_Comprobante
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET Stock = p.Stock - i.Cantidad
    FROM Productos p
    JOIN inserted i ON p.ProductoID = i.ProductoID;
END;


--11. Actualizar FechaModificacion en Cliente al Insertar en Detalle_Comprobante:
CREATE TRIGGER tr_actualizar_fecha_modificacion_cliente
ON Detalle_Comprobante
AFTER INSERT
AS
BEGIN
    UPDATE c
    SET FechaModificacion = GETDATE()
    FROM Cliente c
    JOIN Comprobante_Pago cp ON c.ClienteID = cp.ClienteID
    JOIN inserted i ON cp.DetalleComprobanteID = i.DetalleComprobanteID;
END;


--12. Actualizar Descuento en Comprobante_Pago al Insertar en Detalle_Comprobante:
CREATE TRIGGER tr_actualizar_descuento
ON Detalle_Comprobante
AFTER INSERT
AS
BEGIN
    UPDATE cp
    SET Descuento = d.Valor_des
    FROM Comprobante_Pago cp
    JOIN inserted i ON cp.DetalleComprobanteID = i.DetalleComprobanteID
    JOIN Descuentos d ON i.DescuentoID = d.DescuentoID;
END;


--13. Actualizar MontoNeto en Comprobante_Pago al Insertar en Detalle_Comprobante:
CREATE TRIGGER tr_actualizar_monto_neto
ON Detalle_Comprobante
AFTER INSERT
AS
BEGIN
    UPDATE cp
    SET MontoNeto = cp.Importe_Total - cp.Descuento
    FROM Comprobante_Pago cp
    JOIN inserted i ON cp.DetalleComprobanteID = i.DetalleComprobanteID;
END;


--14. Actualizar Estado en Pedido al Insertar en Detalle_Comprobante:
CREATE TRIGGER tr_actualizar_estado_pedido
ON Detalle_Comprobante
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET Estado = 'Procesado'
    FROM Pedido p
    JOIN inserted i ON p.PedidoID = i.PedidoID;
END;


--15. Actualizar FechaEntrega en Pedido al Insertar en Detalle_Comprobante:
CREATE TRIGGER tr_actualizar_fecha_entrega
ON Detalle_Comprobante
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET FechaEntrega = GETDATE()
    FROM Pedido p
    JOIN inserted i ON p.PedidoID = i.PedidoID;
END;


--16. Actualizar Existencia en Almacen_Producto al Insertar en Detalle_Comprobante:
CREATE TRIGGER tr_actualizar_existencia_almacen_producto
ON Detalle_Comprobante
AFTER INSERT
AS
BEGIN
    UPDATE ap
    SET Existencia = ap.Existencia - i.Cantidad
    FROM Almacen_Producto ap
    JOIN inserted i ON ap.ProductoID = i.ProductoID;
END;


--17. Actualizar Saldo en Cuenta_Cliente al Insertar en Comprobante_Pago:
CREATE TRIGGER tr_actualizar_saldo_cuenta_cliente
ON Comprobante_Pago
AFTER INSERT
AS
BEGIN
    UPDATE cc
    SET Saldo = cc.Saldo - i.Importe_Total
    FROM Cuenta_Cliente cc
    JOIN inserted i ON cc.ClienteID = i.ClienteID;
END;


--18. Actualizar CantidadVendida en Producto al Insertar en Detalle_Comprobante:
CREATE TRIGGER tr_actualizar_cantidad_vendida_producto
ON Detalle_Comprobante
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET CantidadVendida = p.CantidadVendida + i.Cantidad
    FROM Productos p
    JOIN inserted i ON p.ProductoID = i.ProductoID;
END;


--19. Actualizar CantidadComprada en Proveedor_Producto al Insertar en Detalle_Comprobante:
CREATE TRIGGER tr_actualizar_cantidad_comprada_proveedor_producto
ON Detalle_Comprobante
AFTER INSERT
AS
BEGIN
    UPDATE pp
    SET CantidadComprada = pp.CantidadComprada + i.Cantidad
    FROM Proveedor_Producto pp
    JOIN inserted i ON pp.ProductoID = i.ProductoID
    JOIN Comprobante_Pago cp ON i.DetalleComprobanteID = cp.DetalleComprobanteID;
END;


--20. Actualizar Estado en Producto al Insertar en Detalle_Comprobante:
CREATE TRIGGER tr_actualizar_estado_producto
ON Detalle_Comprobante
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET Estado = 'Vendido'
    FROM Productos p
    JOIN inserted i ON p.ProductoID = i.ProductoID;
END;


--21. Actualizar PrecioPromedio en Producto al Insertar en Detalle_Comprobante:
CREATE TRIGGER tr_actualizar_precio_promedio_producto
ON Detalle_Comprobante
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET PrecioPromedio = (p.PrecioPromedio * p.CantidadVendida + i.PrecioUnitario * i.Cantidad) / (p.CantidadVendida + i.Cantidad)
    FROM Productos p
    JOIN inserted i ON p.ProductoID = i.ProductoID;
END;


--22. Actualizar CalificacionPromedio en Producto al Insertar en Resena_Producto:
CREATE TRIGGER tr_actualizar_calificacion_promedio_producto
ON Resena_Producto
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET CalificacionPromedio = (p.CalificacionPromedio * p.CantidadResenas + i.Calificacion) / (p.CantidadResenas + 1)
    FROM Productos p
    JOIN inserted i ON p.ProductoID = i.ProductoID;
END;


--23. Actualizar Existencia en Almacen_Producto al Insertar en Pedido_Producto:
CREATE TRIGGER tr_actualizar_existencia_almacen_producto_pedido
ON Pedido_Producto
AFTER INSERT
AS
BEGIN
    UPDATE ap
    SET Existencia = ap.Existencia + i.Cantidad
    FROM Almacen_Producto ap
    JOIN inserted i ON ap.ProductoID = i.ProductoID;
END;


--24. Actualizar Estado en Pedido al Insertar en Devolucion:
CREATE TRIGGER tr_actualizar_estado_pedido_devolucion
ON Devolucion
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET Estado = 'Devuelto'
    FROM Pedido p
    JOIN inserted i ON p.PedidoID = i.PedidoID;
END;


--25. Actualizar Existencia en Almacen_Producto al Eliminar en Detalle_Comprobante:
CREATE TRIGGER tr_actualizar_existencia_almacen_producto_eliminar
ON Detalle_Comprobante
AFTER DELETE
AS
BEGIN
    UPDATE ap
    SET Existencia = ap.Existencia + d.Cantidad
    FROM Almacen_Producto ap
    JOIN deleted d ON ap.ProductoID = d.ProductoID;
END;



