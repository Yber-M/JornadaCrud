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
ValoracionID char(10),
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
    ('TS001', 'Acceso en línea', 'Acceso en línea a todas las noticias'),
    ('TS002', 'Entrega física', 'Entrega diaria del diario en papel'),
    ('TS003', 'Entrega física y Acceso en línea', 'Acceso en línea y entrega diaria en papel'),
    ('TS004', 'Edición Especial', 'Edición especial con contenido exclusivo los domingos'),
    ('TS005', 'Noticias locales', 'Noticias de eventos locales'),
    ('TS006', 'Noticias internacionales', 'Cobertura de noticias a nivel mundial'),
    ('TS007', 'Edición Deportiva', 'Cobertura completa de eventos deportivos'),
    ('TS008', 'Edición de Negocios', 'Información financiera y de negocios'),
    ('TS009', 'Edición de Tecnología', 'Novedades y avances tecnológicos'),
    ('TS010', 'Edición Cultural', 'Artículos sobre arte, música y cultura'),
    ('TS011', 'Edición de Moda', 'Tendencias en moda y estilo'),
    ('TS012', 'Edición de Salud', 'Información sobre salud y bienestar'),
    ('TS013', 'Edición de Ciencia', 'Descubrimientos científicos y avances'),
    ('TS014', 'Edición Política', 'Cobertura de noticias políticas'),
    ('TS015', 'Edición de Entretenimiento', 'Noticias de cine, música y entretenimiento'),
    ('TS016', 'Edición de Medio Ambiente', 'Información sobre temas ecológicos'),
    ('TS017', 'Edición de Viajes', 'Destinos de viaje y consejos'),
    ('TS018', 'Edición de Educación', 'Cobertura de temas educativos'),
    ('TS019', 'Edición Gastronómica', 'Recetas, críticas de restaurantes y más'),
    ('TS020', 'Servicio de Comentarios', 'Participación en la sección de comentarios'),
    ('TS021', 'Edición de Mascotas', 'Consejos para dueños de mascotas'),
    ('TS022', 'Noticias de Viajes', 'Novedades y consejos de viajes');

--Registro Tabla Servicios (60)
insert into Servicios (ServicioID, Nombre_servi, Descripcion_servi, Precio_servi, TipoServicioID)
values
    ('S001', 'Suscripción digital', 'Acceso en línea a todas las noticias', 9.99, 'TS001'),
    ('S002', 'Suscripción impresa', 'Entrega diaria del diario en papel', 19.99, 'TS002'),
    ('S003', 'Combo digital e impreso', 'Acceso en línea y entrega diaria en papel', 24.99, 'TS003'),
    ('S004', 'Edición dominical', 'Edición especial con contenido exclusivo los domingos', 4.99, 'TS004'),
    ('S005', 'Suscripción mensual', 'Acceso en línea durante un mes', 14.99, 'TS001'),
    ('S006', 'Noticias locales', 'Noticias de eventos locales', 2.99, 'TS005'),
    ('S007', 'Noticias internacionales', 'Cobertura de noticias a nivel mundial', 4.99, 'TS006'),
    ('S008', 'Suscripción anual', 'Acceso en línea durante un año', 149.99, 'TS001'),
    ('S009', 'Edición deportiva', 'Cobertura completa de eventos deportivos', 3.99, 'TS007'),
    ('S010', 'Edición de negocios', 'Información financiera y de negocios', 5.99, 'TS008'),
    ('S011', 'Noticias de tecnología', 'Novedades y avances tecnológicos', 3.49, 'TS009'),
    ('S012', 'Suplemento cultural', 'Artículos sobre arte, música y cultura', 2.49, 'TS010'),
    ('S013', 'Edición de moda', 'Tendencias en moda y estilo', 3.79, 'TS011'),
    ('S014', 'Servicio premium', 'Acceso exclusivo a contenido premium', 29.99, 'TS004'),
    ('S015', 'Noticias de salud', 'Información sobre salud y bienestar', 3.29, 'TS012'),
    ('S016', 'Suscripción semanal', 'Acceso en línea durante una semana', 5.99, 'TS001'),
    ('S017', 'Noticias de ciencia', 'Descubrimientos científicos y avances', 4.49, 'TS013'),
    ('S018', 'Edición política', 'Cobertura de noticias políticas', 3.99, 'TS014'),
    ('S019', 'Suscripción familiar', 'Acceso en línea para toda la familia', 19.99, 'TS001'),
    ('S020', 'Edición de entretenimiento', 'Noticias de cine, música y entretenimiento', 3.79, 'TS015'),
    ('S021', 'Servicio de archivos', 'Acceso a archivos históricos del diario', 9.99, 'TS001'),
    ('S022', 'Noticias de medio ambiente', 'Información sobre temas ecológicos', 3.49, 'TS016'),
    ('S023', 'Edición de viajes', 'Destinos de viaje y consejos', 4.79, 'TS017'),
    ('S024', 'Noticias de educación', 'Cobertura de temas educativos', 2.99, 'TS018'),
    ('S025', 'Noticias de gastronomía', 'Recetas, críticas de restaurantes y más', 4.29, 'TS019'),
    ('S026', 'Servicio de comentarios', 'Participación en la sección de comentarios', 1.99, 'TS020'),
    ('S027', 'Edición de mascotas', 'Consejos para dueños de mascotas', 2.49, 'TS021'),
    ('S028', 'Noticias de viajes', 'Novedades y consejos de viajes', 3.99, 'TS022'),
    ('S029', 'Servicio de alertas', 'Alertas de noticias importantes', 0.99, 'TS004'),
    ('S030', 'Noticias de deportes', 'Cobertura deportiva en tiempo real', 4.99, 'TS007'),
    ('S031', 'Edición nocturna', 'Noticias actualizadas durante la noche', 3.49, 'TS001'),
    ('S032', 'Servicio de comentarios premium', 'Participación destacada en comentarios', 2.99, 'TS020'),
    ('S033', 'Noticias de deportes extremos', 'Cobertura de deportes de riesgo', 4.99, 'TS007'),
    ('S034', 'Suscripción de fin de semana', 'Acceso los viernes, sábados y domingos', 9.99, 'TS001'),
    ('S035', 'Edición de ciencia ficción', 'Noticias sobre ciencia ficción y fantasía', 3.79, 'TS015'),
    ('S036', 'Noticias de automóviles', 'Cobertura de la industria automotriz', 2.99, 'TS009'),
    ('S037', 'Suscripción estudiantil', 'Descuento especial para estudiantes', 7.99, 'TS016'),
    ('S038', 'Edición de arquitectura', 'Noticias sobre arquitectura y diseño', 3.29, 'TS018'),
    ('S039', 'Noticias de música clásica', 'Cobertura de música clásica', 2.49, 'TS010'),
    ('S040', 'Edición de jardinería', 'Consejos para jardineros aficionados', 4.49, 'TS016'),
    ('S041', 'Servicio de notificaciones', 'Recibe alertas de noticias en tiempo real', 1.99, 'TS005'),
    ('S042', 'Edición de comedia', 'Noticias y contenido humorístico', 3.99, 'TS015'),
    ('S043', 'Noticias de viajes exóticos', 'Destinos de viaje inusuales', 4.79, 'TS017'),
    ('S044', 'Suscripción corporativa', 'Acceso para empresas y empleados', 19.99, 'TS008'),
    ('S045', 'Edición de astronomía', 'Noticias sobre el cosmos y estrellas', 3.79, 'TS013'),
    ('S046', 'Noticias de historia', 'Cobertura de eventos históricos', 2.99, 'TS018'),
    ('S047', 'Edición de poesía', 'Poesía y literatura lírica', 2.49, 'TS010'),
    ('S048', 'Servicio de resumen diario', 'Recibe un resumen por correo', 1.49, 'TS004'),
    ('S049', 'Edición de revistas', 'Contenido similar al de revistas', 4.99, 'TS011'),
    ('S050', 'Noticias de cine independiente', 'Películas y cine alternativo', 3.29, 'TS015'),
    ('S051', 'Edición de filosofía', 'Artículos sobre pensamiento filosófico', 2.49, 'TS013'),
    ('S052', 'Servicio de contenido multimedia', 'Acceso a videos y multimedia', 5.99, 'TS015'),
    ('S053', 'Noticias de bienestar', 'Salud y consejos para el bienestar', 3.99, 'TS012'),
    ('S054', 'Edición de ajedrez', 'Cobertura de ajedrez y juegos de mesa', 2.99, 'TS015'),
    ('S055', 'Noticias de desarrollo web', 'Cobertura de tecnología web', 4.49, 'TS009'),
    ('S056', 'Edición de psicología', 'Artículos sobre la mente y comportamiento', 3.29, 'TS012'),
    ('S057', 'Servicio de recomendaciones personalizadas', 'Recomendaciones basadas en tu historial', 1.99, 'TS004'),
    ('S058', 'Noticias de geografía', 'Cobertura de geografía y viajes', 4.79, 'TS006'),
	('S059', 'Noticias de rubgy', 'Noticias en tiempo real de rugby', 4.79, 'TS007'),
	('S060', 'Noticias de Argentina', 'Noticias en tiempo real de Argentina', 4.79, 'TS006');

--Registro Tabla Promociones (30)
insert into Promociones (PromocionesID, Nombre_promo, Descripcion_promo, FechaInicio, FechaFin, Porcentaje_Dsct)
values
    ('P001', 'Promoción de verano', 'Descuento de verano para suscriptores', '2023-06-01', '2023-08-31', 15),
    ('P002', 'Promoción de fin de semana', 'Oferta especial para viernes y sábado', '2023-07-01', '2023-07-02', 20),
    ('P003', 'Promoción estudiantil', 'Descuento exclusivo para estudiantes', '2023-09-01', '2023-12-31', 25),
    ('P004', 'Promoción de aniversario', 'Celebrando nuestro aniversario con descuentos', '2023-10-15', '2023-10-20', 30),
    ('P005', 'Promoción de primavera', 'Oferta especial para la temporada de primavera', '2023-04-01', '2023-04-30', 10),
    ('P006', 'Promoción de Navidad', 'Descuento navideño para regalos', '2023-12-01', '2023-12-24', 15),
    ('P007', 'Promoción de Black Friday', 'Ofertas exclusivas para el Viernes Negro', '2023-11-24', '2023-11-24', 40),
    ('P008', 'Promoción de Año Nuevo', 'Comienza el año con descuentos', '2024-01-01', '2024-01-02', 20),
    ('P009', 'Promoción de regreso a clases', 'Descuento para la temporada escolar', '2023-08-15', '2023-08-31', 15),
    ('P010', 'Promoción de Halloween', 'Ofertas especiales para Halloween', '2023-10-31', '2023-10-31', 25),
    ('P011', 'Promoción de otoño', 'Descuento para la temporada de otoño', '2023-09-15', '2023-11-30', 10),
    ('P012', 'Promoción de San Valentín', 'Oferta especial para el Día de San Valentín', '2023-02-14', '2023-02-14', 20),
    ('P013', 'Promoción de acción de gracias', 'Descuento para el Día de Acción de Gracias', '2023-11-23', '2023-11-23', 30),
    ('P014', 'Promoción de invierno', 'Oferta invernal para suscriptores', '2023-12-21', '2023-12-31', 15),
    ('P015', 'Promoción de Cyber Monday', 'Descuentos en línea exclusivos', '2023-11-27', '2023-11-27', 35),
    ('P016', 'Promoción de Pascua', 'Ofertas especiales para la Semana Santa', '2023-04-16', '2023-04-16', 20),
    ('P017', 'Promoción de Día de la Tierra', 'Descuento por el Día de la Tierra', '2023-04-22', '2023-04-22', 25),
    ('P018', 'Promoción de día de los abuelos', 'Descuento por el Día de los Abuelos', '2023-09-10', '2023-09-10', 20),
    ('P019', 'Promoción de día de las madres', 'Descuento por el Día de las Madres', '2023-05-14', '2023-05-14', 15),
    ('P020', 'Promoción de día de los padres', 'Descuento por el Día de los Padres', '2023-06-18', '2023-06-18', 15),
    ('P021', 'Promoción de día de los niños', 'Descuento por el Día de los Niños', '2023-04-30', '2023-04-30', 20),
    ('P022', 'Promoción de día de la independencia', 'Oferta especial para el Día de la Independencia', '2023-07-04', '2023-07-04', 25),
    ('P023', 'Promoción de día del trabajo', 'Descuento para el Día del Trabajo', '2023-09-04', '2023-09-04', 15),
    ('P024', 'Promoción de día de acción de gracias', 'Descuento para el Día de Acción de Gracias', '2023-11-23', '2023-11-23', 30),
    ('P025', 'Promoción de día de San Patricio', 'Descuento por el Día de San Patricio', '2023-03-17', '2023-03-17', 20),
    ('P026', 'Promoción de día de la Tierra', 'Descuento por el Día de la Tierra', '2023-04-22', '2023-04-22', 25),
    ('P027', 'Promoción de día de la mujer', 'Descuento por el Día de la Mujer', '2023-03-08', '2023-03-08', 15),
    ('P028', 'Promoción de día de la juventud', 'Descuento por el Día de la Juventud', '2023-08-12', '2023-08-12', 15),
    ('P029', 'Promoción de día de la tecnología', 'Oferta especial para el Día de la Tecnología', '2023-09-10', '2023-09-10', 20),
    ('P030', 'Promoción de día de la música', 'Descuento por el Día de la Música', '2023-06-21', '2023-06-21', 10);

--Registro Tabla Descuentos (30)
insert into Descuentos (DescuentoID, Nombre_des, Descripcion_des, Tipo_des, Valor_des)
values
	('D001', 'Descuento de verano', 'Oferta especial para la temporada de verano', 'Porcentaje', 15),
    ('D002', 'Descuento de primavera', 'Descuento para la temporada de primavera', 'Porcentaje', 10),
    ('D003', 'Descuento de otoño', 'Oferta especial para la temporada de otoño', 'Porcentaje', 20),
    ('D004', 'Descuento de invierno', 'Descuento para la temporada de invierno', 'Porcentaje', 25),
    ('D005', 'Descuento de vacaciones', 'Oferta especial para las vacaciones', 'Porcentaje', 30),
    ('D006', 'Descuento de fin de semana', 'Descuento para fines de semana', 'Porcentaje', 10),
    ('D007', 'Descuento de día festivo', 'Oferta especial para días festivos', 'Porcentaje', 15),
    ('D008', 'Descuento de aniversario', 'Descuento para celebrar el aniversario', 'Porcentaje', 20),
    ('D009', 'Descuento de cumpleaños', 'Oferta especial para cumpleaños', 'Porcentaje', 10),
    ('D010', 'Descuento de estudiante', 'Descuento para estudiantes', 'Porcentaje', 15),
    ('D011', 'Descuento de lealtad', 'Oferta especial para clientes leales', 'Porcentaje', 10),
    ('D012', 'Descuento de suscripción', 'Descuento para suscripciones', 'Porcentaje', 20),
    ('D013', 'Descuento de primer compra', 'Oferta especial para primeras compras', 'Porcentaje', 15),
    ('D014', 'Descuento de amigo referido', 'Descuento por referir a un amigo', 'Porcentaje', 10),
    ('D015', 'Descuento de tiempo limitado', 'Oferta por tiempo limitado', 'Porcentaje', 25),
    ('D016', 'Descuento de día de San Valentín', 'Descuento para el Día de San Valentín', 'Porcentaje', 20),
    ('D017', 'Descuento de día de la madre', 'Oferta especial para el Día de la Madre', 'Porcentaje', 15),
    ('D018', 'Descuento de día del padre', 'Descuento para el Día del Padre', 'Porcentaje', 10),
    ('D019', 'Descuento de Black Friday', 'Ofertas especiales para el Black Friday', 'Porcentaje', 30),
    ('D020', 'Descuento de Cyber Monday', 'Ofertas especiales para el Cyber Monday', 'Porcentaje', 25),
    ('D021', 'Descuento de Navidad', 'Descuento para la temporada navideña', 'Porcentaje', 20),
    ('D022', 'Descuento de año nuevo', 'Oferta especial para el Año Nuevo', 'Porcentaje', 15),
    ('D023', 'Descuento de día de Acción de Gracias', 'Descuento para el Día de Acción de Gracias', 'Porcentaje', 25),
    ('D024', 'Descuento de Halloween', 'Ofertas especiales para Halloween', 'Porcentaje', 20),
    ('D025', 'Descuento de regreso a clases', 'Descuento para el regreso a clases', 'Porcentaje', 15),
    ('D026', 'Descuento de día del trabajo', 'Oferta especial para el Día del Trabajo', 'Porcentaje', 25),
    ('D027', 'Descuento de día de la independencia', 'Descuento para el Día de la Independencia', 'Porcentaje', 20),
    ('D028', 'Descuento de Pascua', 'Oferta especial para la Pascua', 'Porcentaje', 10),
    ('D029', 'Descuento de San Patricio', 'Descuento por el Día de San Patricio', 'Porcentaje', 15),
    ('D030', 'Descuento de Black Friday', 'Ofertas especiales para el Black Friday', 'Porcentaje', 30);

--Registro Tabla Detalle_Comprobante (30)
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

--Registro Tabla Empleado (30)
INSERT INTO Empleado (EmpleadoID, DNI, Nombre_emple, Apellidos_emple, Telefono_emple, Horario_entrada, Horario_salida)
VALUES
	('E001', '123456789', 'Juan', 'Pérez', 955512345, '08:00', '17:00'),
    ('E002', '987654321', 'María', 'Rodríguez', 955523456, '09:00', '18:00'),
    ('E003', '567890123', 'Carlos', 'Gómez', 955534567, '09:30', '18:30'),
    ('E004', '789012345', 'Ana', 'López', 955545678, '08:30', '17:30'),
    ('E005', '345678901', 'Javier', 'Torres', 955556789, '07:45', '16:45'),
    ('E006', '234567890', 'Laura', 'Sánchez', 955567890, '08:15', '17:15'),
    ('E007', '456789012', 'Marcos', 'Martínez', 955578901, '10:00', '19:00'),
    ('E008', '678901234', 'Isabel', 'García', 955589012, '09:00', '18:00'),
    ('E009', '890123456', 'José', 'Fernández', 955590123, '07:30', '16:30'),
    ('E010', '123890456', 'Sofía', 'Pérez', 955501234, '08:45', '17:45'),
    ('E011', '456789012', 'Raúl', 'Morales', 955534567, '10:30', '19:30'),
    ('E012', '789012345', 'Elena', 'Cruz', 955545678, '07:30', '16:30'),
    ('E013', '234567890', 'Sergio', 'Herrera', 955556789, '09:15', '18:15'),
    ('E014', '345678901', 'Carmen', 'Vargas', 955567890, '08:30', '17:30'),
    ('E015', '567890123', 'Luis', 'Delgado', 955578901, '10:15', '19:15'),
    ('E016', '678901234', 'Ana', 'Mendoza', 955589012, '08:00', '17:00'),
    ('E017', '890123456', 'Diego', 'Romero', 955590123, '09:45', '18:45'),
    ('E018', '123890456', 'Marta', 'Ortega', 955501234, '07:45', '16:45'),
    ('E019', '234567890', 'Paula', 'González', 955534567, '08:30', '17:30'),
    ('E020', '456789012', 'Andrés', 'Jiménez', 955545678, '09:00', '18:00'),
    ('E021', '789012345', 'Patricia', 'Navarro', 955567890, '10:30', '19:30'),
    ('E022', '567890123', 'Mario', 'Silva', 955578901, '08:15', '17:15'),
    ('E023', '678901234', 'Laura', 'Ríos', 955589012, '08:45', '17:45'),
    ('E024', '890123456', 'Antonio', 'Guzmán', 955590123, '07:30', '16:30'),
    ('E025', '123890456', 'Elena', 'Castillo', 955501234, '09:15', '18:15'),
    ('E026', '234567890', 'Juan', 'Paredes', 955534567, '08:30', '17:30'),
    ('E027', '345678901', 'Ana', 'Soto', 955556789, '10:00', '19:00'),
    ('E028', '567890123', 'Luis', 'Ortega', 955578901, '08:30', '17:30'),
    ('E029', '678901234', 'Sofía', 'Morales', 955589012, '09:00', '18:00'),
    ('E030', '890123456', 'David', 'Ríos', 955590123, '08:00', '17:00');

--Registro Tabla Valoracion_Servicio (30)
INSERT INTO Valoracion_Servicio (ValoracionID, Puntuacion, Comentario)
VALUES
	('V001', 4, 'Excelente cobertura de noticias.'),
	('V002', 3, 'Buen contenido, pero la maquetación es confusa.'),
	('V003', 5, 'Me encanta este diario, siempre bien informado.'),
	('V004', 4, 'Las noticias son buenas, pero podrían ser más imparciales.'),
	('V005', 2, 'Demasiada publicidad en la página principal.'),
	('V006', 5, 'Gran variedad de secciones y reportajes.'),
	('V007', 4, 'Buenos análisis políticos.'),
	('V008', 3, 'A veces tienen problemas con las fechas de publicación.'),
	('V009', 4, 'Las entrevistas son interesantes.'),
	('V010', 5, 'Me mantienen al tanto de todo.'),
	('V011', 2, 'La página web es lenta para cargar.'),
	('V012', 4, 'Artículos bien escritos.'),
	('V013', 3, 'Necesitan más cobertura de noticias internacionales.'),
	('V014', 5, 'Muy informativo, especialmente en temas locales.'),
	('V015', 4, 'La app móvil es fácil de usar.'),
	('V016', 2, 'Contenido repetitivo en ocasiones.'),
	('V017', 5, 'Artículos de opinión perspicaces.'),
	('V018', 4, 'Buen equilibrio entre noticias y entretenimiento.'),
	('V019', 3, 'La sección deportiva podría ser más completa.'),
	('V020', 4, 'Buena cobertura de eventos locales.'),
	('V021', 5, '¡El mejor diario de la ciudad!'),
	('V022', 3, 'La calidad de impresión podría mejorar.'),
	('V023', 4, 'Artículos de investigación de alta calidad.'),
	('V024', 2, 'Demasiados errores tipográficos.'),
	('V025', 4, 'Buenos reportajes fotográficos.'),
	('V026', 3, 'Falta de diversidad en los columnistas.'),
	('V027', 5, 'La sección de cultura es genial.'),
	('V028', 4, 'Cobertura en tiempo real de eventos importantes.'),
	('V029', 3, 'Más contenido de ciencia y tecnología, por favor.'),
	('V030', 4, 'Interesantes editoriales políticos.');

--Registro Tabla Forma_Pago (10)
INSERT INTO Forma_Pago (FormaPagoID, Nombre_FP)
VALUES
	('FP01', 'Tarjeta de Crédito'),
	('FP02', 'Tarjeta de Débito'),
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
	('TC01', 'Suscriptor', 'Clientes que tienen una suscripción'),
	('TC02', 'Visitante', 'Usuarios que visitan ocasionalmente'),
	('TC03', 'Premium', 'Clientes con acceso premium'),
	('TC04', 'Estudiante', 'Estudiantes con descuento'),
	('TC05', 'Corporativo', 'Clientes corporativos'),
	('TC06', 'Invitado', 'Usuarios invitados por otros'),
	('TC07', 'VIP', 'Clientes VIP con beneficios exclusivos'),
	('TC08', 'Básico', 'Acceso básico gratuito'),
	('TC09', 'Gold', 'Clientes Gold con ventajas adicionales'),
	('TC10', 'Platino', 'Clientes Platino con máximas ventajas'),
	('TC11', 'Novato', 'Nuevos usuarios'),
	('TC12', 'Anual', 'Clientes con suscripción anual'),
	('TC13', 'Mensual', 'Clientes con suscripción mensual'),
	('TC14', 'Diamante', 'Clientes Diamante con ventajas especiales'),
	('TC15', 'Empleado', 'Empleados con beneficios'),
	('TC16', 'Senior', 'Clientes Senior con descuento'),
	('TC17', 'Familiar', 'Clientes con suscripción familiar'),
	('TC18', 'Premium Plus', 'Clientes Premium Plus'),
	('TC19', 'Joven', 'Clientes jóvenes con descuento'),
	('TC20', 'Empresarial', 'Clientes empresariales'),
	('TC21', 'Frequent Flyer', 'Clientes frecuentes con beneficios'),
	('TC22', 'Plus', 'Clientes Plus con ventajas adicionales'),
	('TC23', 'Reseller', 'Revendedores de suscripciones'),
	('TC24', 'Digital', 'Clientes con acceso digital'),
	('TC25', 'Acceso Completo', 'Acceso completo a contenido'),
	('TC26', 'Lite', 'Clientes con acceso Lite'),
	('TC27', 'Trial', 'Usuarios en período de prueba'),
	('TC28', 'Invitado VIP', 'Usuarios invitados con acceso VIP'),
	('TC29', 'Socio', 'Clientes socios con ventajas adicionales'),
	('TC30', 'Especial', 'Clientes con acceso especial');

--Registro Tabla Cliente (150)
INSERT INTO Cliente (Cliente_ID, DNI, Nombre_cl, Apellido_cl, Telefono_cl, TipoClienteID)
VALUES
	('C001', '123456789', 'Ana', 'Rodríguez', 901234567, 'TC01'),
	('C002', '987654321', 'Juan', 'Pérez', 908765432, 'TC02'),
	('C003', '456789123', 'María', 'López', 912345678, 'TC03'),
	('C004', '789123456', 'Pedro', 'García', 909876543, 'TC04'),
	('C005', '321654987', 'Laura', 'Martínez', 990123456, 'TC05'),
	('C006', '654987321', 'Carlos', 'Fernández', 938475629, 'TC06'),
	('C007', '135792468', 'Andrea', 'Torres', 943216578, 'TC07'),
	('C008', '246813579', 'Luis', 'González', 954738291, 'TC08'),
	('C009', '987123456', 'Julia', 'Sánchez', 968574302, 'TC09'),
	('C010', '654321789', 'Roberto', 'Ramírez', 923456789, 'TC10'),
	('C011', '321789654', 'Sofia', 'Vargas', 967543821, 'TC11'),
	('C012', '789654321', 'Diego', 'Castro', 945678903, 'TC12'),
	('C013', '456123789', 'Valentina', 'Morales', 987654321, 'TC13'),
	('C014', '321987654', 'Jorge', 'Díaz', 956738290, 'TC14'),
	('C015', '987456321', 'Carolina', 'Ortega', 912345679, 'TC15'),
	('C016', '123789456', 'Sergio', 'Herrera', 976543218, 'TC16'),
	('C017', '654123987', 'Paula', 'Jiménez', 989012345, 'TC17'),
	('C018', '789321654', 'Arturo', 'Mendoza', 918273645, 'TC18'),
	('C019', '456987123', 'Natalia', 'Silva', 974635218, 'TC19'),
	('C020', '987654123', 'Daniel', 'Ríos', 930127456, 'TC20'),
	('C021', '321987456', 'Patricia', 'Guzmán', 952864301, 'TC21'),
	('C022', '654789321', 'Marcos', 'Navarro', 949382715, 'TC22'),
	('C023', '123456987', 'Valeria', 'Escobar', 983745621, 'TC23'),
	('C024', '987321654', 'Andrea', 'Paredes', 905678432, 'TC24'),
	('C025', '789654123', 'Martin', 'Soto', 924503186, 'TC25'),
	('C026', '456321789', 'Isabella', 'Rivas', 936712548, 'TC26'),
	('C027', '321654789', 'Eduardo', 'Castro', 928467351, 'TC27'),
	('C028', '654789123', 'Antonia', 'Morales', 928467351, 'TC28'),
	('C029', '987123789', 'Gabriel', 'Carrasco', 901236578, 'TC29'),
	('C030', '123789654', 'Mariana', 'Reyes', 932156789, 'TC30'),
	('C031', '123456789', 'Lucía', 'Hernández', 901234567, 'TC25'),
    ('C032', '234567890', 'Andrés', 'Vargas', 902345678, 'TC15'),
    ('C033', '345678901', 'Carmen', 'Ramírez', 903456789, 'TC13'),
    ('C034', '456789012', 'Daniel', 'Ortega', 904567890, 'TC24'),
    ('C035', '567890123', 'Elena', 'Silva', 905678901, 'TC05'),
    ('C036', '678901234', 'Francisco', 'Molina', 906789012, 'TC15'),
    ('C037', '789012345', 'Lorena', 'Rojas', 907890123, 'TC26'),
    ('C038', '890123456', 'Juan', 'Cruz', 908901234, 'TC07'),
    ('C039', '901234567', 'Beatriz', 'Paz', 909012345, 'TC18'),
    ('C040', '012345678', 'Diego', 'Jiménez', 901123456, 'TC09'),
    ('C041', '123456789', 'Ana', 'Rodríguez', 901234567, 'TC30'),
    ('C042', '234567890', 'Luis', 'González', 902345678, 'TC01'),
    ('C043', '345678901', 'María', 'Martínez', 903456789, 'TC02'),
    ('C044', '456789012', 'Carlos', 'López', 904567890, 'TC02'),
    ('C045', '567890123', 'Laura', 'Pérez', 905678901, 'TC03'),
    ('C046', '678901234', 'Pedro', 'Sánchez', 906789012, 'TC11'),
    ('C047', '789012345', 'Sofía', 'Torres', 907890123, 'TC22'),
    ('C048', '890123456', 'Javier', 'Fernández', 908901234, 'TC13'),
    ('C049', '901234567', 'Isabel', 'Gómez', 909012345, 'TC11'),
    ('C050', '012345678', 'Miguel', 'Díaz', 901123456, 'TC22'),
    ('C051', '123456789', 'Lucía', 'Hernández', 901234567, 'TC23'),
    ('C052', '234567890', 'Andrés', 'Vargas', 902345678, 'TC21'),
    ('C053', '345678901', 'Carmen', 'Ramírez', 903456789, 'TC02'),
    ('C054', '456789012', 'Daniel', 'Ortega', 904567890, 'TC03'),
    ('C055', '567890123', 'Elena', 'Silva', 905678901, 'TC11'),
    ('C056', '678901234', 'Francisco', 'Molina', 906789012, 'TC02'),
    ('C057', '789012345', 'Lorena', 'Rojas', 907890123, 'TC03'),
    ('C058', '890123456', 'Juan', 'Cruz', 908901234, 'TC21'),
    ('C059', '901234567', 'Beatriz', 'Paz', 909012345, 'TC02'),
    ('C060', '012345678', 'Diego', 'Jiménez', 901123456, 'TC23'),
    ('C061', '123456789', 'Ana', 'Rodríguez', 901234567, 'TC01'),
    ('C062', '234567890', 'Luis', 'González', 902345678, 'TC12'),
    ('C063', '345678901', 'María', 'Martínez', 903456789, 'TC03'),
    ('C064', '456789012', 'Carlos', 'López', 904567890, 'TC11'),
    ('C065', '567890123', 'Laura', 'Pérez', 905678901, 'TC12'),
    ('C066', '678901234', 'Pedro', 'Sánchez', 906789012, 'TC03'),
    ('C067', '789012345', 'Sofía', 'Torres', 907890123, 'TC01'),
    ('C068', '890123456', 'Javier', 'Fernández', 908901234, 'TC02'),
    ('C069', '901234567', 'Isabel', 'Gómez', 909012345, 'TC03'),
    ('C070', '012345678', 'Miguel', 'Díaz', 901123456, 'TC01'),
    ('C071', '123456789', 'Lucía', 'Hernández', 901234567, 'TC02'),
    ('C072', '234567890', 'Andrés', 'Vargas', 902345678, 'TC03'),
    ('C073', '345678901', 'Carmen', 'Ramírez', 903456789, 'TC01'),
    ('C074', '456789012', 'Daniel', 'Ortega', 904567890, 'TC02'),
    ('C075', '567890123', 'Elena', 'Silva', 905678901, 'TC03'),
    ('C076', '678901234', 'Francisco', 'Molina', 906789012, 'TC01'),
    ('C077', '789012345', 'Lorena', 'Rojas', 907890123, 'TC02'),
    ('C078', '890123456', 'Juan', 'Cruz', 908901234, 'TC03'),
    ('C079', '901234567', 'Beatriz', 'Paz', 909012345, 'TC01'),
    ('C080', '012345678', 'Diego', 'Jiménez', 901123456, 'TC02'),
    ('C081', '123456789', 'Ana', 'Rodríguez', 901234567, 'TC03'),
    ('C082', '234567890', 'Luis', 'González', 902345678, 'TC01'),
    ('C083', '345678901', 'María', 'Martínez', 903456789, 'TC02'),
    ('C084', '456789012', 'Carlos', 'López', 904567890, 'TC03'),
    ('C085', '567890123', 'Laura', 'Pérez', 905678901, 'TC01'),
    ('C086', '678901234', 'Pedro', 'Sánchez', 906789012, 'TC02'),
    ('C087', '789012345', 'Sofía', 'Torres', 907890123, 'TC03'),
    ('C088', '890123456', 'Javier', 'Fernández', 908901234, 'TC01'),
    ('C089', '901234567', 'Isabel', 'Gómez', 909012345, 'TC02'),
    ('C090', '012345678', 'Miguel', 'Díaz', 901123456, 'TC03'),
    ('C091', '123456789', 'Lucía', 'Hernández', 901234567, 'TC01'),
    ('C092', '234567890', 'Andrés', 'Vargas', 902345678, 'TC02'),
    ('C093', '345678901', 'Carmen', 'Ramírez', 903456789, 'TC03'),
    ('C094', '456789012', 'Daniel', 'Ortega', 904567890, 'TC01'),
    ('C095', '567890123', 'Elena', 'Silva', 905678901, 'TC02'),
    ('C096', '678901234', 'Francisco', 'Molina', 906789012, 'TC03'),
    ('C097', '789012345', 'Lorena', 'Rojas', 907890123, 'TC01'),
    ('C098', '890123456', 'Juan', 'Cruz', 908901234, 'TC02'),
    ('C099', '901234567', 'Beatriz', 'Paz', 909012345, 'TC03'),
    ('C100', '012345678', 'Diego', 'Jiménez', 901123456, 'TC01'),
    ('C101', '123456789', 'Ana', 'Rodríguez', 901234567, 'TC02'),
    ('C102', '234567890', 'Luis', 'González', 902345678, 'TC03'),
    ('C103', '345678901', 'María', 'Martínez', 903456789, 'TC01'),
    ('C104', '456789012', 'Carlos', 'López', 904567890, 'TC02'),
    ('C105', '567890123', 'Laura', 'Pérez', 905678901, 'TC03'),
    ('C106', '678901234', 'Pedro', 'Sánchez', 906789012, 'TC01'),
    ('C107', '789012345', 'Sofía', 'Torres', 907890123, 'TC02'),
    ('C108', '890123456', 'Javier', 'Fernández', 908901234, 'TC03'),
    ('C109', '901234567', 'Isabel', 'Gómez', 909012345, 'TC01'),
    ('C110', '012345678', 'Miguel', 'Díaz', 901123456, 'TC02'),
    ('C111', '123456789', 'Lucía', 'Hernández', 901234567, 'TC03'),
    ('C112', '234567890', 'Andrés', 'Vargas', 902345678, 'TC01'),
    ('C113', '345678901', 'Carmen', 'Ramírez', 903456789, 'TC02'),
    ('C114', '456789012', 'Daniel', 'Ortega', 904567890, 'TC03'),
    ('C115', '567890123', 'Elena', 'Silva', 905678901, 'TC01'),
    ('C116', '678901234', 'Francisco', 'Molina', 906789012, 'TC02'),
    ('C117', '789012345', 'Lorena', 'Rojas', 907890123, 'TC03'),
    ('C118', '890123456', 'Juan', 'Cruz', 908901234, 'TC01'),
    ('C119', '901234567', 'Beatriz', 'Paz', 909012345, 'TC02'),
    ('C120', '012345678', 'Diego', 'Jiménez', 901123456, 'TC03'),
	('C121', '123456789', 'Ana', 'Rodríguez', 901234567, 'TC01'),
	('C122', '234567890', 'Luis', 'González', 902345678, 'TC02'),
	('C123', '345678901', 'María', 'Martínez', 903456789, 'TC03'),
	('C124', '456789012', 'Carlos', 'López', 904567890, 'TC01'),
	('C125', '567890123', 'Laura', 'Pérez', 905678901, 'TC02'),
	('C126', '678901234', 'Pedro', 'Sánchez', 906789012, 'TC03'),
	('C127', '789012345', 'Sofía', 'Torres', 907890123, 'TC01'),
	('C128', '890123456', 'Javier', 'Fernández', 908901234, 'TC02'),
	('C129', '901234567', 'Isabel', 'Gómez', 909012345, 'TC03'),
	('C130', '012345678', 'Miguel', 'Díaz', 901123456, 'TC01'),
	('C131', '123456789', 'Lucía', 'Hernández', 901234567, 'TC02'),
	('C132', '234567890', 'Andrés', 'Vargas', 902345678, 'TC03'),
	('C133', '345678901', 'Carmen', 'Ramírez', 903456789, 'TC01'),
	('C134', '456789012', 'Daniel', 'Ortega', 904567890, 'TC02'),
	('C135', '567890123', 'Elena', 'Silva', 905678901, 'TC03'),
	('C136', '678901234', 'Francisco', 'Molina', 906789012, 'TC01'),
	('C137', '789012345', 'Lorena', 'Rojas', 907890123, 'TC02'),
	('C138', '890123456', 'Juan', 'Cruz', 908901234, 'TC03'),
	('C139', '901234567', 'Beatriz', 'Paz', 909012345, 'TC01'),
	('C140', '012345678', 'Diego', 'Jiménez', 901123456, 'TC02'),
	('C141', '123456789', 'Ana', 'Rodríguez', 901234567, 'TC03'),
	('C142', '234567890', 'Luis', 'González', 902345678, 'TC01'),
	('C143', '345678901', 'María', 'Martínez', 903456789, 'TC02'),
	('C144', '456789012', 'Carlos', 'López', 904567890, 'TC03'),
	('C145', '567890123', 'Laura', 'Pérez', 905678901, 'TC01'),
	('C146', '678901234', 'Pedro', 'Sánchez', 906789012, 'TC02'),
	('C147', '789012345', 'Sofía', 'Torres', 907890123, 'TC03'),
	('C148', '890123456', 'Javier', 'Fernández', 908901234, 'TC01'),
	('C149', '901234567', 'Isabel', 'Gómez', 909012345, 'TC02'),
	('C150', '012345678', 'Miguel', 'Díaz', 901123456, 'TC03');
	

--Registro Tabla Comprobante_Pago ()
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

SELECT 
    E.Nombre_emple, 
    CP.FechaPago, 
    CP.Total,
    CP.Monto_IGV,
    CP.Importe_Total
FROM 
    Comprobante_Pago CP
JOIN 
    Empleado E ON CP.EmpleadoID = E.EmpleadoID
WHERE 
    CP.Importe_Total > (SELECT AVG(Importe_Total) FROM Comprobante_Pago)
ORDER BY 
    CP.Importe_Total DESC;

-- FUNCIÓN CALCULAR DESCUENTO

CREATE FUNCTION CalcularTotalConDescuento(
    @ServicioID CHAR(10),
    @Cantidad INT,
    @DescuentoID CHAR(10)
)
RETURNS DECIMAL(5,2)
AS
BEGIN
    DECLARE @Precio DECIMAL(5,2);
    DECLARE @Descuento DECIMAL(5,2);
    DECLARE @Total DECIMAL(5,2);

    -- Obtener el precio del servicio
    SELECT @Precio = Precio_servi FROM Servicios WHERE ServicioID = @ServicioID;

    -- Obtener el porcentaje de descuento
    SELECT @Descuento = Valor_des FROM Descuentos WHERE DescuentoID = @DescuentoID;

    -- Calcular el total con descuento
    SET @Total = @Precio * @Cantidad * (1 - @Descuento / 100);

    RETURN @Total;
END;

DECLARE @ServicioID CHAR(10) = 'S002';
DECLARE @DescuentoID CHAR(10) = 'D005';
DECLARE @Cantidad INT = 5;

-- Llama a la función dentro de una cláusula SELECT
SELECT dbo.CalcularTotalConDescuento(@ServicioID, @Cantidad, @DescuentoID) AS TotalConDescuento;



		
--Funcion COUNT

--Funcion CONCAT

--Funcion LENGHT

--Funcion GRANT Y REVOKE

--Funcion NOW

--Funcion DATE Y DATE_DIFF

--Funcion CAST

--Funcion TO_CHAR Y TO_NUMBER
