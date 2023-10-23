INSERT INTO tab_rol (Id_Rol, Nombre_Rol, Descripcion_Rol)
VALUES
(1,'ADMIN', 'ROL ADMIN'),
(2,'EMPRESA', 'ROL EMPRESA'),
(3,'COLABORADOR', 'ROL COLABORADOR');

INSERT INTO Tab_Usuario VALUES('ADMIN','ADMIN',1);


--SELECT * FROM Tab_Usuario;
--SELECT * FROM Tab_Etiqueta;
--SELECT * FROM Tab_Empresa;
--SELECT * FROM Tab_Colaborador;
--SELECT * FROM tab_rol;





INSERT INTO Tab_Etiqueta (Id_etiqueta, Nombre_Etiqueta, Descripcion_Etiqueta)
VALUES
(1,'Fitnes', 'Persona que gusta de hacer ejercicio'),
(2,'Deportista', 'Persona que practica algún deporte de forma habitual'),
(3,'Amante de la naturaleza', 'Persona que disfruta de la naturaleza'),
(4,'Curioso', 'Persona que le gusta aprender cosas nuevas'),
(5,'Creador', 'Persona que disfruta de crear cosas'),
(6,'Colaborador', 'Persona que disfruta de trabajar en equipo'),
(7,'Líder', 'Persona que tiene capacidad de inspirar y motivar a otros'),
(8,'Empático', 'Persona que es capaz de ponerse en el lugar de los demás'),
(9,'Responsable', 'Persona que cumple con sus obligaciones'),
(10,'Organizado', 'Persona que tiene un buen manejo del tiempo y los recursos'),
(11,'Puntual', 'Persona que cumple con los plazos establecidos'),
(12,'Profesional', 'Persona que se comporta de forma ética y responsable en el trabajo'),
(13,'Trabajólico', 'Persona que disfruta del trabajo'),
(14,'Competitivo', 'Persona que busca superarse a sí mismo y a los demás'),
(15,'Dinámico', 'Persona que tiene energía y entusiasmo'),
(16,'Creativo', 'Persona que tiene capacidad de generar ideas nuevas'),
(17,'Innovador', 'Persona que busca nuevas formas de hacer las cosas'),
(18,'Empresario', 'Persona que tiene capacidad de crear y gestionar un negocio'),
(19,'Ingenioso', 'Persona que encuentra soluciones creativas a los problemas');

INSERT INTO Tab_Empresa (NIT, Nombre_Empresa, Estado_Empresa, Puntos)
VALUES
('900123456-11', 'Frimac S.A', TRUE, 500),
('900123456-12', 'CAMPUS LAND SAS BIC', TRUE, 200),
('900123456-13', 'BASC ORIENTE ', TRUE, 100),
('900123456-14', 'MANTILLA MARKETING S.A.S.', TRUE, 500),
('900123456-15', 'MAJOREL BUCARAMANGA SAS ', TRUE, 200),
('900123456-16', 'Empresa 9', TRUE, 100),
('900123456-17', 'Empresa 10', TRUE, 500),
('900123456-18', 'Empresa 11', TRUE, 200),
('900123456-19', 'Empresa 12', TRUE, 100),
('900123456-20', 'Empresa 13', TRUE, 500),
('900123456-21', 'Empresa 14', TRUE, 200),
('900123456-22', 'Empresa 15', TRUE, 100),
('900123456-23', 'Empresa 16', TRUE, 500),
('900123456-24', 'Empresa 17', TRUE, 200),
('900123456-25', 'Empresa 18', TRUE, 100),
('900123456-26', 'Empresa 19', TRUE, 500),
('900123456-27', 'Empresa 20', TRUE, 200);


INSERT INTO Tab_Colaborador (Documento_Colaborador, Empresa_Colaborador, Nombre_1, Nombre_2, Apellido_1, Apellido_2, Genero, Correo_Empresarial, Correo_Personal, Fecha_Nacimiento, Foto, Estado_Colaborador, Puntos_Acumulados)
VALUES
('1000000002', '900123456-11', 'Luis', 'Pablo', 'Gonzalez', 'Martínez', 'Masculino', 'luis.gonzalez@zfsantander.com', 'luis.gonzalez@gmail.com', '1992-02-02', 'https://cloudfront-us-east-1.images.arcpublishing.com/artear/K57L7QTJUK2WK6SZM5BN4V2ZTM.jpg', TRUE, 0),
('2000000002', '900123456-12', 'Maria', 'Lucía', 'Perez', 'Hernández', 'Femenino', 'maria.perez@zfsantander.com', 'maria.perez@gmail.com', '1997-03-03', 'https://cloudfront-us-east-1.images.arcpublishing.com/artear/K57L7QTJUK2WK6SZM5BN4V2ZTM.jpg', TRUE, 10),
('3000000002', '900123456-13', 'Pedro', 'Andrés', 'Lopez', 'Rodríguez', 'Masculino', 'pedro.lopez@zfsantander.com', 'pedro.lopez@gmail.com', '1999-04-04', 'https://cloudfront-us-east-1.images.arcpublishing.com/artear/K57L7QTJUK2WK6SZM5BN4V2ZTM.jpg', TRUE, 20),
('4000000002', '900123456-14', 'Sofia', 'Andrea', 'Diaz', 'Muñoz', 'Femenino', 'sofia.diaz@zfsantander.com', 'sofia.diaz@gmail.com', '2000-06-06', 'https://cloudfront-us-east-1.images.arcpublishing.com/artear/K57L7QTJUK2WK6SZM5BN4V2ZTM.jpg', TRUE, 30),
('5000000002', '900123456-15', 'Juan', 'Antonio', 'Garcia', 'Fernández', 'Masculino', 'juan.garcia@zfsantander.com', 'juan.garcia@gmail.com', '1993-07-07', 'https://cloudfront-us-east-1.images.arcpublishing.com/artear/K57L7QTJUK2WK6SZM5BN4V2ZTM.jpg', TRUE, 40),
('6000000002', '900123456-16', 'Ana', 'María', 'Lopez', 'Rodríguez', 'Femenino', 'ana.lopez@zfsantander.com', 'ana.lopez@gmail.com', '1998-08-08', 'https://cloudfront-us-east-1.images.arcpublishing.com/artear/K57L7QTJUK2WK6SZM5BN4V2ZTM.jpg', TRUE, 50);



INSERT INTO Tab_Evento (Id_Evento, Nombre_Evento, Descripcion_Evento, Foto_Evento, Fecha_Evento, Fecha_Evento_FIN, Aforo_Maximo, Aforo_Registrado, Puntos_Colaborador, Puntos_Empresa, Puntos_Castigo, Estado_Boolean)
VALUES
(1, 'Amor y amistad 2023', 'Evento de amor y amistad para los colaboradores de ZFSantander', 'https://i.imgur.com/WP8qtZR.jpg', '2023-09-23 12:00:00', '2023-09-23 18:00:00', 100, 0, 10, 10, 5, TRUE);

INSERT INTO Tab_Evento (Id_Evento, Nombre_Evento, Descripcion_Evento, Foto_Evento, Fecha_Evento, Fecha_Evento_FIN, Aforo_Maximo, Aforo_Registrado, Puntos_Colaborador, Puntos_Empresa, Puntos_Castigo, Estado_Boolean)
VALUES
(2, 'Día de la familia 2023', 'Evento para celebrar el día de la familia con los colaboradores de ZFSantander', 'https://example.com/imagen.png', '2023-10-15 10:00:00', '2023-10-15 18:00:00', 150, 0, 15, 15, 10, TRUE);

INSERT INTO Tab_Evento (Id_Evento, Nombre_Evento, Descripcion_Evento, Foto_Evento, Fecha_Evento, Fecha_Evento_FIN, Aforo_Maximo, Aforo_Registrado, Puntos_Colaborador, Puntos_Empresa, Puntos_Castigo, Estado_Boolean)
VALUES
(3, 'Navidad ZFSantander 2023', 'Evento para celebrar la navidad con los colaboradores de ZFSantander', 'https://example.com/imagen.png', '2023-12-23 19:00:00', '2023-12-23 23:00:00', 200, 0, 20, 20, 15, TRUE);

INSERT INTO Tab_Evento (Id_Evento, Nombre_Evento, Descripcion_Evento, Foto_Evento, Fecha_Evento, Fecha_Evento_FIN, Aforo_Maximo, Aforo_Registrado, Puntos_Colaborador, Puntos_Empresa, Puntos_Castigo, Estado_Boolean)
VALUES
(4, 'Halloween ZFSantander 2023', 'Evento para celebrar el Halloween con los colaboradores de ZFSantander', 'https://i.imgur.com/1e9hKOl.jpg', '2023-12-23 19:00:00', '2023-12-23 23:00:00', 200, 0, 20, 20, 15, TRUE);

INSERT INTO Tab_Evento (Id_Evento, Nombre_Evento, Descripcion_Evento, Foto_Evento, Fecha_Evento, Fecha_Evento_FIN, Aforo_Maximo, Aforo_Registrado, Puntos_Colaborador, Puntos_Empresa, Puntos_Castigo, Estado_Boolean)
VALUES
(5, 'AñoNuevo ZFSantander 2023', 'Evento para celebrar el AñoNuevo con los colaboradores de ZFSantander', 'https://i.imgur.com/cWCCd42.jpg', '2023-12-23 19:00:00', '2023-12-23 23:00:00', 200, 0, 20, 20, 15, TRUE);

INSERT INTO Tab_Evento (Id_Evento, Nombre_Evento, Descripcion_Evento, Foto_Evento, Fecha_Evento, Fecha_Evento_FIN, Aforo_Maximo, Aforo_Registrado, Puntos_Colaborador, Puntos_Empresa, Puntos_Castigo, Estado_Boolean)
VALUES
(6, 'Summer ZFSantander 2023', 'Evento para celebrar el Summer con los colaboradores de ZFSantander', 'https://example.com/imagen.png', '2023-12-23 19:00:00', '2023-12-23 23:00:00', 200, 0, 20, 20, 15, TRUE);




-- INSERT 1
INSERT INTO Tab_Premio (Id_Premio,Nombre_Premio, Detalles_Premio, Coste_Premio, Estado_Premio)
VALUES (1,'Tarde de película en pareja', 'Dos entradas a Cinemark que incluyen combo 3', 100, TRUE);

-- INSERT 2
INSERT INTO Tab_Premio (Id_Premio,Nombre_Premio, Detalles_Premio, Coste_Premio, Estado_Premio)
VALUES (2,'Tarjeta de regalo de Amazon', 'Tarjeta de regalo de $50 para compras en Amazon', 500, TRUE);

-- INSERT 3
INSERT INTO Tab_Premio (Id_Premio,Nombre_Premio, Detalles_Premio, Coste_Premio, Estado_Premio)
VALUES (3,'Viaje de fin de semana', 'Paquete de fin de semana para dos personas en un resort', 1000, TRUE);

-- INSERT 4
INSERT INTO Tab_Premio (Id_Premio,Nombre_Premio, Detalles_Premio, Coste_Premio, Estado_Premio)
VALUES (4,'Cena en restaurante de lujo', 'Cena para dos personas en un restaurante estrella Michelin', 750, TRUE);

-- INSERT 5
INSERT INTO Tab_Premio (Id_Premio,Nombre_Premio, Detalles_Premio, Coste_Premio, Estado_Premio)
VALUES (5,'Suscripción a Netflix', 'Suscripción premium a Netflix por 6 meses', 200, TRUE);

-- INSERT 6
INSERT INTO Tab_Premio (Id_Premio,Nombre_Premio, Detalles_Premio, Coste_Premio, Estado_Premio)
VALUES (6,'Billetes de avión', 'Billetes de avión de ida y vuelta para dos personas a un destino a elección', 1200, TRUE);

-- INSERT 7
INSERT INTO Tab_Premio (Id_Premio,Nombre_Premio, Detalles_Premio, Coste_Premio, Estado_Premio)
VALUES (7,'Reloj de pulsera', 'Reloj de pulsera de marca reconocida', 300, TRUE);

-- INSERT 8
INSERT INTO Tab_Premio (Id_Premio,Nombre_Premio, Detalles_Premio, Coste_Premio, Estado_Premio)
VALUES (8,'Experiencia de paracaidismo', 'Salto en paracaídas para una persona en un lugar emocionante', 400, TRUE);

-- INSERT 9
INSERT INTO Tab_Premio (Id_Premio,Nombre_Premio, Detalles_Premio, Coste_Premio, Estado_Premio)
VALUES (9,'Tablet de última generación', 'Tablet con pantalla de alta resolución y procesador rápido', 250, TRUE);

-- INSERT 10
INSERT INTO Tab_Premio (Id_Premio,Nombre_Premio, Detalles_Premio, Coste_Premio, Estado_Premio)
VALUES (10,'Membresía de gimnasio', 'Membresía de un año en un gimnasio de primera clase', 150, TRUE);

















