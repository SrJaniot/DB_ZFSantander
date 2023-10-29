-- DATA BASE BY SENHUB 2023  ;)

DROP TABLE IF EXISTS Tab_Premio_Reclamado;
DROP TABLE IF EXISTS Tab_Comentario;
DROP TABLE IF EXISTS Tab_Parametros_Puntos;
DROP TABLE IF EXISTS Tab_PuntosXEmpresa;
DROP TABLE IF EXISTS Tab_PuntosXColaborador;
DROP TABLE IF EXISTS Tab_RegistroXEvento;
DROP TABLE IF EXISTS Tab_EtiquetasXColaborador;
DROP TABLE IF EXISTS Tab_EtiquetasXEvento;
DROP TABLE IF EXISTS Tab_Colaborador;
DROP TABLE IF EXISTS Tab_Empresa;
DROP TABLE IF EXISTS Tab_Premio;
DROP TABLE IF EXISTS Tab_Evento;
DROP TABLE IF EXISTS Tab_Etiqueta;
DROP TABLE IF EXISTS Tab_Usuario;
DROP TABLE IF EXISTS Tab_Rol;
DROP TABLE IF EXISTS tab_borrados;
DROP FUNCTION IF EXISTS funcion_retorna_ultmoid(character varying,character varying);



CREATE TABLE Tab_Rol -- Tabla que almacena los roles que 
(
Id_Rol          INTEGER NOT NULL,-- Id del rol .Cada rol tendra una funcion diferente dentro del sistema al igual que vistas
Nombre_Rol      VARCHAR NOT NULL,--Nombre del rol. El nombre con el que se identifica el rol ejemplo(Usuario)
Descripcion_Rol VARCHAR NOT NULL,--Descripcion de las funciones del rol dentro del sistema ejemplo(Colaborador de una empresa de la familia ZFSantander)
user_insert VARCHAR ,
user_update VARCHAR,
date_insert TIMESTAMP WITHOUT TIME ZONE ,
date_update TIMESTAMP WITHOUT TIME ZONE ,
PRIMARY KEY (Id_Rol)
);

CREATE TABLE Tab_Usuario -- Tabla donde se almacenaran los usuarios y contraseñas que tendras acceso al sistema con integridad referencial hacia la tab_rol garantizando las funciones a desenpeñar en el sistema
(
Nick            VARCHAR NOT NULL,-- Id de acceso al sistema que sera unico para cada colaborador el cual va a ser el NIT 
Contrasena      VARCHAR NOT NULL,-- Contraseña de acceso al sistema que debe almacenarce hashead
Rol             INTEGER NOT NULL,-- Numero de rol que tiene integridad referencial hacia la tabla roles para garantizar las funciones que desempeñara el usuario en el sistema
Estado          BOOLEAN NOT NULL DEFAULT TRUE ,-- Estado del Usuario (TRUE=Usuario activo  Y  FALSE=Usuario inactivo)
pirmeravez      BOOLEAN NOT NULL DEFAULT TRUE,
user_insert VARCHAR ,
user_update VARCHAR,
date_insert TIMESTAMP WITHOUT TIME ZONE ,
date_update TIMESTAMP WITHOUT TIME ZONE ,
PRIMARY KEY (Nick),
FOREIGN KEY (Rol) REFERENCES Tab_Rol (Id_Rol)-- Llave foranea que garantiza que deba existir el rol antes de registrar al nuevo usuario
);

CREATE TABLE Tab_Etiqueta--tabla que almacenara las etiquetas creadas por ZFSantander para caracterizar los colaboradores de cada empresa
(Id_etiqueta   INTEGER  NOT NULL, -- Id de la etiqueta creada por zonafranca
 Nombre_Etiqueta    VARCHAR NOT NULL,-- Nombre con el que se da a conocer la etiqueta ejemplo (fitnes)
 Descripcion_Etiqueta   VARCHAR NOT NULL, -- Una descripcion que defina la etiqueta ejemplo(persona que gusta de hacer ejercicio)
 Estado_Etiqueta    BOOLEAN NOT NULL DEFAULT TRUE,-- Estado de la etiqueta (TRUE = activa y FALSE = desactivada ) 
 user_insert VARCHAR ,
user_update VARCHAR,
date_insert TIMESTAMP WITHOUT TIME ZONE ,
date_update TIMESTAMP WITHOUT TIME ZONE ,
PRIMARY KEY (Id_etiqueta)
);

CREATE TABLE Tab_Evento -- tabla donde se almacenaran todos los eventos creados por ZFSantander
(
Id_Evento     INTEGER NOT NULL,--Id del evento , se crea como numero grande para preveer una gran cantidad de eventos
Nombre_Evento  VARCHAR NOT NULL,-- Nombre con el que se identifica el evento ejemplo(Amor y amistad 2023)
Descripcion_Evento  VARCHAR NOT NULL, -- Descripcion de lo que se va a realizar en el evento
Foto_Evento    VARCHAR NOT NULL,-- Ruta de la imagen que hace referencia al evento ejemplo(foto de arobicos)
Fecha_Evento   TIMESTAMP NOT NULL,-- Fecha con hora del evento ejemplo(10/10/2023 12:00 )
Fecha_Evento_FIN   TIMESTAMP NOT NULL,
Aforo_Maximo   INTEGER  NOT NULL, -- Numero maximo de asistentes que puede recibir el evento
Aforo_Registrado INTEGER NOT NULL,-- Numero de asistentes registrados al evento 
Puntos_Colaborador  INTEGER NOT NULL,-- Cantidad de puntos que ganaria un colaborador por asistir al evento
Puntos_Empresa  INTEGER NOT NULL,-- Cantidad de puntos que ganaria la empresa por cada colaborador que asista al evento
Puntos_Castigo  INTEGER NOT NULL,--Cantidad de puntos que se aplicaran como castigo por no asistir a un evento en el que el colaborador este registrado
Estado_Boolean  BOOLEAN NOT NULL DEFAULT TRUE,-- Estado del evento el cual inicia siempre activo
user_insert VARCHAR ,
user_update VARCHAR,
date_insert TIMESTAMP WITHOUT TIME ZONE ,
date_update TIMESTAMP WITHOUT TIME ZONE ,
PRIMARY KEY (Id_Evento)
);


CREATE TABLE Tab_Premio -- Tabla donde se almacenaran todos los premios ofrecidos por ZFSantander. El unico que puedo administrar premios es ZFSantander
(
Id_Premio       INTEGER NOT NULL, -- Id del premio que sera un auto incrementable calculado por el motor
Nombre_Premio   VARCHAR NOT NULL, -- Un nombre que vaya de acuerdo con el premio ofrecido ejemplio (Tarde de pelicula en pareja )
Detalles_Premio VARCHAR NOT NULL, -- Detalles sobre el premio que se quiere brindar ejemplo(Dos Entradas a Cinemark para cualquier pelicula que inluyen combo 3 )
Coste_Premio    INTEGER NOT NULL, -- Valor en puntos que tiene el premio para poder reclamarlo
Estado_Premio   BOOLEAN NOT NULL DEFAULT TRUE, -- Estado en el que se encuentra el premio (TRUE = Premio activo  Y FALSE = Premio desactivado)
Foto            VARCHAR NOT NULL,--Foto del premio
user_insert VARCHAR ,
user_update VARCHAR,
date_insert TIMESTAMP WITHOUT TIME ZONE ,
date_update TIMESTAMP WITHOUT TIME ZONE ,
PRIMARY KEY (Id_Premio)
);


CREATE TABLE Tab_Empresa -- Tabla donde se almacenaran las empresa que hacen parte de ZFSantander. El unico autorizado para CREAR una nueva empresa es ZFSantander.
(
    NIT             VARCHAR  NOT NULL,--Id de indentificacion unico para cada empresa que hace parte de ZFSantander
    Nombre_Empresa  VARCHAR NOT NULL,--Nombre de la empresa que hace parte de ZFSantander
    oficina         VARCHAR NOT NULL,--Direccion de la empresa 
    Estado_Empresa  BOOLEAN NOT NULL DEFAULT TRUE,--Estado de la empresa (TRUE = Empresa activa  y False=Empresa inactiva )
    Puntos          INTEGER  NOT NULL DEFAULT 0,--Cantidad de puntos que tiene aculados una empresa. 
    user_insert VARCHAR ,
    user_update VARCHAR,
    date_insert TIMESTAMP WITHOUT TIME ZONE ,
    date_update TIMESTAMP WITHOUT TIME ZONE ,
    PRIMARY KEY (NIT)
);

CREATE TABLE Tab_Colaborador -- Tabla donde se almacenara los colaboradores que hacen parte de cada empresa y que tendra integridad referencial con la habla emplezas para garantizar que cada colaborador pertenece a una empresa
(
Documento_Colaborador   VARCHAR  NOT NULL,--Documento del colaborador de la empresa, el cual es una llave primaria compuesta junto con empresa para solucionar el inconveniente de que un trabajador ya trabajara con otra empresa en ZFSantander
Empresa_Colaborador     VARCHAR  NOT NULL,--NIT de la empresa que contrata al colaborador, el cual es una llave primaria compuesta junto con empleado para solucionar el inconveniente de que un trabajador pueda trabajar en otra empresa
Nombre_1                VARCHAR NOT NULL,-- Primer nombre del colaborador
Nombre_2                VARCHAR ,-- Segundo nombre del colaborador
Apellido_1              VARCHAR NOT NULL,-- Primer apellido del colaborador
Apellido_2              VARCHAR ,--Segundo apellido del colaborador
Genero                  VARCHAR NOT NULL,--Genero en varchar para dejar que usuario escoja el genero y ser inclusivos
Correo_Empresarial      VARCHAR ,--Correo Empresarial si es que lo tiene
Correo_Personal         VARCHAR NOT NULL,--Correo personal debe ser obligatorio para registrarse
Fecha_Nacimiento        DATE NOT NULL,-- Fecha de nacimiento para poder calcular la edad y la generacion ala que pertenece
Foto                    VARCHAR NOT NULL,--Foto para el perfil del usuario
Estado_Colaborador      BOOLEAN NOT NULL DEFAULT TRUE,--Estado en el que se encuentra el colaborador dentro de la empre (TRUE=Colaborador activo  Y  FALSE=Colaborador inactivo)
Puntos_Acumulados       INTEGER  NOT NULL DEFAULT 0,--Cantidad de puntos acumulados por un colaborador 
user_insert VARCHAR ,
user_update VARCHAR,
date_insert TIMESTAMP WITHOUT TIME ZONE ,
date_update TIMESTAMP WITHOUT TIME ZONE ,
PRIMARY KEY (Documento_Colaborador),
FOREIGN KEY (Empresa_Colaborador) REFERENCES Tab_Empresa (NIT)
);
-- PREFERIBLEMENTE PENSAR EN TENER UNA TABLA DE USUARIOS POR EMPRESA PARA TENER UN CONTROL DEL USUARIO QUE AH TRABAJADO EN DIFERENTE EMPRESAS DE ZFSantander o delimitar que cuando un colaborar ya no trabaje se elimine su cuenta para que posterior mente se pueda registrar si no mostrara error de llave priamria 

CREATE TABLE Tab_EtiquetasXColaborador
(
Id_Colaborador VARCHAR NOT NULL,
Id_etiqueta  INTEGER NOT NULL,
user_insert VARCHAR ,
user_update VARCHAR,
date_insert TIMESTAMP WITHOUT TIME ZONE ,
date_update TIMESTAMP WITHOUT TIME ZONE ,
PRIMARY KEY (Id_Colaborador,Id_etiqueta),
FOREIGN KEY (Id_Colaborador) REFERENCES Tab_Colaborador(Documento_Colaborador),
FOREIGN KEY (Id_etiqueta) REFERENCES Tab_Etiqueta(Id_etiqueta) 

);

CREATE TABLE Tab_EtiquetasXEvento
(
Id_Evento INTEGER NOT NULL,
Id_etiqueta  INTEGER NOT NULL,
user_insert VARCHAR ,
user_update VARCHAR,
date_insert TIMESTAMP WITHOUT TIME ZONE ,
date_update TIMESTAMP WITHOUT TIME ZONE ,
PRIMARY KEY (Id_Evento,Id_etiqueta),
FOREIGN KEY (Id_Evento) REFERENCES Tab_Evento(Id_Evento),
FOREIGN KEY (Id_etiqueta) REFERENCES Tab_Etiqueta(Id_etiqueta) 

);

CREATE TABLE Tab_RegistroXEvento --Tabla resultante del Registro de un usuario a un evento , en esta tabla se llevara un registro de los usuarios registrados para cada evento 
(
Id_Evento               INTEGER NOT NULL,--Id del evento al que el colaborador se esta registrando el cual es una llave primaria compuesta con id colaborador para garantizar que el evento y el colaborador existen 
Id_Colaborador          VARCHAR NOT NULL,--Id del Colaborador que se esta registrando al evento el cual es una llave primaria compuesta con id del evento para garantizar que el colaborador si existe 
Referido_Por            VARCHAR, -- Id del colaborador que lo invita al evento 
Asistencia              BOOLEAN NOT NULL DEFAULT FALSE,--Un atributo de control que solo puede modificar ZFSantander para confirmar la asistencia inicial mente es false (TRUE=Colaborador Asiste y False=Colaborador no Asiste)
--La modificacion del atributo asistencia es la que desencadena los triggers que llena la tabla puntos empresa y puntos colaborador.
--Al confirmar la insercion de datos en las tablas se procede actualizar el valor de puntos de los asociados y de la empresa
user_insert VARCHAR ,
user_update VARCHAR,
date_insert TIMESTAMP WITHOUT TIME ZONE ,
date_update TIMESTAMP WITHOUT TIME ZONE ,
PRIMARY KEY (Id_Evento,Id_Colaborador),
FOREIGN KEY (Referido_Por) REFERENCES Tab_Colaborador(Documento_Colaborador),
FOREIGN KEY (Id_Evento) REFERENCES Tab_Evento(Id_Evento),
FOREIGN KEY (Id_Colaborador)REFERENCES Tab_Colaborador(Documento_Colaborador)
);

CREATE TABLE Tab_PuntosXColaborador -- Tabla que alamacenaralos puntos ganados o restados por cada colaborador para tener un registro de la entrada y salida de puntos
(
Id_Puntos   INTEGER NOT NULL, -- Id auto incrementable que sera el seria de la entrada y salida de puntos 
Id_Asociado VARCHAR NOT NULL,-- Id del colaborador que suma o resta puntos 
Motivo_Puntos   VARCHAR NOT NULL,--Motivo por el cual se le suman o se le restan puntos 
Cantidad_Puntos INTEGER NOT NULL ,-- Cantidad de puntos que se van a sumar o se van a restar si la cantidad es negativa es por que restaran puntos por que se redimio algun premio o por que se aplico un castigo 
Fecha_Movimiento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- LA FECHA DEL MOVIMIENTO QUE POR DEFECTO SE VA A CARGAR EL AÑO MES DIA HORA MINUTO Y SEGUNDO
user_insert VARCHAR ,
user_update VARCHAR,
date_insert TIMESTAMP WITHOUT TIME ZONE ,
date_update TIMESTAMP WITHOUT TIME ZONE ,
PRIMARY KEY (Id_Puntos),
FOREIGN KEY (Id_Asociado) REFERENCES Tab_Colaborador (Documento_Colaborador)
);

CREATE TABLE Tab_PuntosXEmpresa -- Tabla que alamacenaralos puntos ganados o restados por cada colaborador para tener un registro de la entrada y salida de puntos
(
Id_Puntos_Empresa   INTEGER NOT NULL, -- Id auto incrementable que sera el seria de la entrada y salida de puntos 
Id_Empresa VARCHAR NOT NULL,-- Id de la empresa  que suma  puntos 
Motivo_Puntos   VARCHAR NOT NULL,--Motivo por el cual se le suman o se le restan puntos 
Cantidad_Puntos INTEGER NOT NULL CHECK (Cantidad_Puntos > 0),-- Cantidad de puntos que se van a sumar 
Fecha_Movimiento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- LA FECHA DEL MOVIMIENTO QUE POR DEFECTO SE VA A CARGAR EL AÑO MES DIA HORA MINUTO Y SEGUNDO
user_insert VARCHAR ,
user_update VARCHAR,
date_insert TIMESTAMP WITHOUT TIME ZONE ,
date_update TIMESTAMP WITHOUT TIME ZONE ,
PRIMARY KEY (Id_Puntos_Empresa),
FOREIGN KEY (Id_Empresa) REFERENCES Tab_Empresa (NIT)
);


CREATE TABLE Tab_Premio_Reclamado -- Tabla que almacenara los premios que ya fueron solicitados 
(
Id_Reclamo      INTEGER  NOT NULL,--Id auto incrementable de cada reclamo el cual es una llave triple     
Id_Premio       INTEGER  NOT NULL,--Id de premio a reclamar el cual es una llave triple
Id_Reclamante   VARCHAR  NOT NULL,--Id del colaborador que reclama el premio el cual es una llave triple
Estado_Reclamo  BOOLEAN NOT NULL DEFAULT FALSE,--estado de la entrega del premio (TRUE=Premio entregado  Y  FALSE=Premio sin entregar)
user_insert VARCHAR ,
user_update VARCHAR,
date_insert TIMESTAMP WITHOUT TIME ZONE ,
date_update TIMESTAMP WITHOUT TIME ZONE ,
PRIMARY KEY (Id_Reclamo),
FOREIGN KEY (Id_Reclamo) REFERENCES Tab_Premio_Reclamado(Id_Reclamo),
FOREIGN KEY (Id_Premio) REFERENCES Tab_Premio(Id_Premio),
FOREIGN KEY (Id_Reclamante) REFERENCES Tab_Colaborador(Documento_Colaborador)

);

CREATE TABLE Tab_Comentario -- Tabla que alamcenara los comentarios realizados por cada usuario para cada evento
(
    Id_Evento           INTEGER  NOT NULL,--
    Id_Comentarista     VARCHAR  NOT NULL,--
    Id_comentario       INTEGER  NOT NULL, --buscar la manera de que solo se sumen puntos por el primer comentario del usuario en el evento 
    Comentario          VARCHAR NOT NULL,--
    user_insert VARCHAR ,
    user_update VARCHAR,
    date_insert TIMESTAMP WITHOUT TIME ZONE ,
    date_update TIMESTAMP WITHOUT TIME ZONE ,

    PRIMARY KEY (Id_Evento,Id_Comentarista),
    FOREIGN KEY (Id_Evento) REFERENCES Tab_Evento(Id_Evento),
    FOREIGN KEY (Id_Comentarista) REFERENCES Tab_Colaborador(Documento_Colaborador)
);

CREATE TABLE Tab_Parametros_Puntos--
(
    Id_Parametro        INTEGER NOT NULL,
    Tipo_Parametro        VARCHAR NOT NULL,
    Cantidad_Puntos     INTEGER NOT NULL,--En una posterior vuelta de desarrollo se puede adicionar la opcion de vencimiento de puntos de acuerdo a la fecha en la que se ganan dichos puntos
    user_insert VARCHAR ,
    user_update VARCHAR,
    date_insert TIMESTAMP WITHOUT TIME ZONE ,
    date_update TIMESTAMP WITHOUT TIME ZONE ,
    PRIMARY KEY (Id_Parametro)
);
CREATE TABLE tab_borrados -- ELIMINADOS (LLEVA EL REGISTRO EN UNA TABLA)
(
    id_consec       INTEGER     NOT NULL CHECK(id_consec>0),
    nom_tabla       VARCHAR     NOT NULL,
    usr_delete      VARCHAR     NOT NULL,
    fec_delete      TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    PRIMARY KEY(id_consec)
);

--FUNCION IMPORTANTE QUE SE USARA EN TODO LADO: MI AUTO INCREMENTABLE ;)
--FUNCION PRYMARY KEY (CONSECUTIVO) para cualquier tabala solo poniendo el nombre de la 
--tabala en comillas en los parametros de la funcion

--SELECT funcion_Retorna_ultmoid('game','id_game');

CREATE OR REPLACE FUNCTION funcion_Retorna_ultmoid(wnom_tabla VARCHAR,wnom_columna_id VARCHAR)RETURNS INTEGER AS

$$ DECLARE ULTIMOID INTEGER;
	BEGIN
		  EXECUTE 'SELECT MAX  ('||wnom_columna_id||')  FROM ' || wnom_tabla INTO ULTIMOID ;
		
		--RAISE NOTICE '%',ULTIMOID;
		IF ULTIMOID IS NULL  THEN
			ULTIMOID=1;
			--RAISE NOTICE '%',ULTIMOID;
			RETURN ULTIMOID;	
		ELSE
		ULTIMOID=ULTIMOID+1;
		--RAISE NOTICE '%',ULTIMOID
		RETURN ULTIMOID;
		
		END IF ;
	END;

$$
LANGUAGE PLPGSQL;

--FUNCION QUE SE ENCARGA DE REGISTRAR LA PENALIZACION POR INASISTENCIA 
CREATE OR REPLACE FUNCTION aplicar_castigos (Id_Evento INTEGER) RETURNS BOOLEAN AS
$$  
    DECLARE REC_Asistente RECORD;
    DECLARE CUR_Asistentes REFCURSOR;
    DECLARE Id_Puntos_Max   INTEGER;
    DECLARE MOTIVO  VARCHAR;
    DECLARE RECparametros   RECORD;
    BEGIN
        MOTIVO='INASISTENCIA';
        OPEN CUR_Asistentes FOR SELECT a.Id_Evento,a.Id_Colaborador,a.Referido_Por,a.Asistencia FROM Tab_RegistroXEvento a;
        FETCH CUR_Asistentes INTO REC_Asistente;
        WHILE FOUND LOOP
            IF REC_Asistente.Asistencia IS FALSE THEN
                SELECT funcion_Retorna_ultmoid('Tab_PuntosXColaborador','Id_Puntos')  INTO Id_Puntos_Max ;
                SELECT a.Id_Parametro,a.Tipo_Parametro,a.Cantidad_Puntos INTO RECparametros FROM Tab_Parametros_Puntos a
                WHERE a.Tipo_Parametro="INASISTENCIA";
                IF FOUND THEN
                    RECparametros.Cantidad_Puntos=RECparametros.Cantidad_Puntos*(-1);
                    INSERT INTO Tab_PuntosXColaborador VALUES (Id_Puntos_Max,REC_Asistente.Id_Colaborador,RECparametros.Tipo_Parametro,RECparametros.Cantidad_Puntos);
                    IF FOUND THEN
                        RAISE NOTICE 'INSERTE LOS DATOS DE INASISTENCIA PARA EL COLABORADOR % CON LOS VALORES DE LA TABLA PARAMETROS ',REC_Asistente.Id_Colaborador;
                    ELSE
                        RAISE NOTICE 'NO PUDE INSERTE LOS DATOS DE INASISTENCIA PARA EL COLABORADOR % CON LOS VALORES DE LA TABLA PARAMETROS ',REC_Asistente.Id_Colaborador;
                    END IF;
                ELSE
                    INSERT INTO Tab_PuntosXColaborador VALUES (Id_Puntos_Max,REC_Asistente.Id_Colaborador,'INASISTENCIA',-5);
                    IF FOUND THEN
                        RAISE NOTICE 'INSERTE LOS DATOS DE INASISTENCIA PARA EL COLABORADOR % CON VALORES PREDETERMINADOS PARA INASISTENCIA',REC_Asistente.Id_Colaborador;
                    ELSE 
                        RAISE NOTICE 'NO PUDE INSERTE LOS DATOS DE INASISTENCIA PARA EL COLABORADOR % CON LOS VALORES PREDETERMINADOS ',REC_Asistente.Id_Colaborador;
                    END IF;
                END IF;
            END IF;
        FETCH CUR_Asistentes INTO REC_Asistente;
        END LOOP;
        CLOSE CUR_Asistentes;
        RETURN TRUE;
    END;
$$
LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION registrar_colaborador (Pdocumento Tab_Colaborador.Documento_Colaborador%TYPE,Pempresa Tab_Colaborador.Empresa_Colaborador%TYPE,Pnombre1 Tab_Colaborador.Nombre_1%TYPE,Pnombre2 Tab_Colaborador.Nombre_2%TYPE,Papellido1 Tab_Colaborador.Apellido_1%TYPE,Papellido2 Tab_Colaborador.Apellido_2%TYPE,Pgenero Tab_Colaborador.Genero%TYPE,PcorreoE Tab_Colaborador.Correo_Empresarial%TYPE,PcorreoP Tab_Colaborador.Correo_Personal%TYPE,PfechaN Tab_Colaborador.Fecha_Nacimiento%TYPE,Pfoto Tab_Colaborador.Foto%TYPE) RETURNS BOOLEAN AS
$$
DECLARE Rec_colaborador RECORD ;
BEGIN
    SELECT a.Documento_Colaborador,a.Empresa_Colaborador,a.Nombre_1,a.Nombre_2,a.Apellido_1,a.Apellido_2,a.Genero,a.Correo_Empresarial,a.Correo_Personal,a.Fecha_Nacimiento,a.Foto,a.Estado_Colaborador INTO Rec_colaborador FROM Tab_Colaborador a WHERE a.Documento_Colaborador=Pdocumento;
    IF FOUND THEN
        IF Rec_colaborador.Estado_Colaborador IS TRUE THEN
            RAISE NOTICE 'Se encontro un colaborador  con documento: % ACTIVO  en otra empresa con NIT: % ',Rec_colaborador.Documento_Colaborador,Rec_colaborador.Empresa_Colaborador;
            RETURN FALSE;
        ELSE 
            RAISE NOTICE 'Ya  existio el colaborador con documento:% registrado en otra empresa se usaran los datos basicos encontrados junto con los nuevos datos proporcionados ',Pdocumento;
            INSERT INTO Tab_Colaborador VALUES(Pdocumento,Pempresa,Rec_colaborador.Nombre_1,Rec_colaborador.Nombre_2,Rec_colaborador.Apellido_1,Rec_colaborador.Apellido_2,Rec_colaborador.Genero,PcorreoE,PcorreoP,Rec_colaborador.Fecha_Nacimiento,Pfoto);
            RETURN TRUE;
		END IF;
    ELSE
        RAISE NOTICE 'Se inserta nuevo colaborador ';
        INSERT INTO Tab_Colaborador VALUES(Pdocumento,Pempresa,Pnombre1,Pnombre2,Papellido1,Papellido2,Pgenero,PcorreoE,PcorreoP,PfechaN,Pfoto);
        RETURN TRUE;
	END IF;


END;
$$
LANGUAGE PLPGSQL;













--FUNCIONES DE LOS TRIGGERS.



-----------------------------------------------------------------------------------------------------------------------------------------
--FUNCION PARA TRIGGER QUE ME PERMITE LLEVAR EL CONTROL DE CUAL USUARIO HIZO ALGUNA ACTIVIDAD DE MOVIMIENTO DE DISCO EN CUALQUIER TABLA.
--PARA INSERT Y UPDATE EL TRIGGER TIENE QUE SER "BEFORE"
--PARA DELETE EL TRIGGER TIENE QUE SER "AFTER"
--REQUISITOS PARA PODER CREAR ESTA FUNCION:
--*HABER CREADO ANTES LA FUNCION funcion_Retorna_ultmoid(wnom_tabla VARCHAR,wnom_columna_id VARCHAR)


CREATE OR REPLACE FUNCTION fun_act_tabla() RETURNS "trigger" AS
$$
    DECLARE wid_consec tab_borrados.id_consec%TYPE;
    BEGIN
    /*
    NEW Y OLD SON VARIABLES DE POSTGRES  QUE ACTUAN DIRECTAMENTE EN EL REGISTRO QUE SE ESTA MANIPULANDO, EJEMPLO:
    SI PODEMOS VER CUANDO ES INSERT "NEW" ESTA MANIPULANDO DIRECTAMENTE UNA COLUMNA DE LA TABLA QUE ESTE MANEJANDO 
    EL TRIGGER (CUANDO SE CREA EL TRIGGER SE LE DICE A CUAL TABLA Y QUE METODO VA A TRABAJAR ). Y COMO VEMOS,
    EL ESTA GUARDANDO EN ESA COLUMNA DEL REGISTRO NEW.user_insert = CURRENT_USER; NEW.date_insert  = CURRENT_TIMESTAMP;
    EL USUARIO Y FECHA QUE VA A INSERTAR (TENIENDO ENCUNTA QUE EL TRIGGER LO USAREMOS COM UN "BEFORE INSERT") ANTES DE
    INSERTARLO. 
    */
        IF TG_OP = 'INSERT' THEN
           NEW.user_insert = CURRENT_USER;
           NEW.date_insert  = CURRENT_TIMESTAMP;
           RETURN NEW;
        END IF;
        IF TG_OP = 'UPDATE' THEN
           NEW.user_update = CURRENT_USER;
           NEW.date_update= CURRENT_TIMESTAMP;
           RETURN NEW;
        END IF;
        IF TG_OP = 'DELETE' THEN
            SELECT funcion_Retorna_ultmoid('tab_borrados','id_consec') INTO wid_consec;
            INSERT INTO tab_borrados VALUES(wid_consec,TG_RELNAME,CURRENT_USER,CURRENT_TIMESTAMP);
            --TG_RELNAME RETORNA EL NOMBRE DE LA TABLA (VARCHAR) EN LA QUE SE ESTE TRABAJANDO EN EL TRIGGER
            RETURN OLD; 
        END IF;
    END;
$$
LANGUAGE PLPGSQL;


-- FUNCION TRIGGER que me permite inseertar registro en las tablas  Tab_PuntosXColaborador, Tab_PuntosXEmpresa
--POST UPDATE de la Tab_RegistroXEvento
-- INSERTA PUNTOS COLABORADOR REFERIDO SI EXISTE   (OPCIONAL)
-- INSERTA PUNTOS COLABORADOR ASISTENTE
-- INSETA PUNTOS EMPRESAS 

CREATE OR REPLACE FUNCTION Inserta_Puntos_PostUpdate_Asistencia() RETURNS "trigger" AS
$$
	DECLARE id_consec INTEGER;
    DECLARE id_consec2 INTEGER;
    DECLARE id_consec3 INTEGER;

    DECLARE ID_EMPRESA  VARCHAR;

    DECLARE PUNTOS_REFERIDO INTEGER;
    DECLARE PUNTOS_ASISTENCIA INTEGER;
    DECLARE aPUNTOS_EMPRESA INTEGER;


	BEGIN
		-- Insertar un nuevo registro en la tabla Tab_PuntosXColaborador

		SELECT funcion_Retorna_ultmoid('Tab_PuntosXColaborador','Id_Puntos') INTO id_consec;
        SELECT funcion_Retorna_ultmoid('Tab_PuntosXEmpresa','Id_Puntos_Empresa') INTO id_consec3;
        
        SELECT Puntos_Colaborador INTO PUNTOS_ASISTENCIA FROM Tab_Evento
        WHERE Tab_Evento.Id_Evento = NEW.Id_Evento ;
        SELECT Puntos_Empresa INTO aPUNTOS_EMPRESA FROM Tab_Evento
        WHERE Tab_Evento.Id_Evento = NEW.Id_Evento ;

        SELECT Empresa_Colaborador INTO ID_EMPRESA FROM Tab_Colaborador
        WHERE Tab_Colaborador.Documento_Colaborador = NEW.Id_Colaborador;

        -- INSERT DEL ASISTENTE / EMPRESA
        IF NEW.Asistencia IS TRUE THEN
            -- INSERT ASISTENTE
            INSERT INTO Tab_PuntosXColaborador 
            VALUES (id_consec, NEW.Id_Colaborador, 'ASITENCIA',PUNTOS_ASISTENCIA,CURRENT_TIMESTAMP); 
           
            -- INSERT  EMPRESA
            INSERT INTO Tab_PuntosXEmpresa
            VALUES (id_consec3, ID_EMPRESA, 'ASITENCIA COLABORADOR',aPUNTOS_EMPRESA,CURRENT_TIMESTAMP);
            --Id_Puntos_Empresa   INTEGER NOT NULL, -- Id auto incrementable que sera el seria de la entrada y salida de puntos 
            --Id_Empresa VARCHAR NOT NULL,-- Id de la empresa  que suma  puntos 
            --Motivo_Puntos   VARCHAR NOT NULL,--Motivo por el cual se le suman o se le restan puntos 
            --Cantidad_Puntos INTEGER NOT NULL CHECK (Cantidad_Puntos > 0),-- Cantidad de puntos que se van a sumar 
            --Fecha_Movimiento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- LA FECHA DEL MOVIMIENTO QUE POR DEFECTO SE VA A CARGAR EL AÑO MES DIA HORA MINUTO Y SEGUNDO

        

            -- INSERT DEL REFERDIO SI LLEGA A HABER 
            IF NEW.Referido_Por IS NOT NULL THEN

                SELECT funcion_Retorna_ultmoid('Tab_PuntosXColaborador','Id_Puntos') INTO id_consec2;

                SELECT Cantidad_Puntos INTO PUNTOS_REFERIDO FROM Tab_Parametros_Puntos
                WHERE Tab_Parametros_Puntos.Tipo_Parametro = 'REFERIDO' ;
                -- INSERT REFERIDO SI LLEGA A TENER PUNTOS REFERIDO CUSTOM  Tab_Parametros_Puntos 
                IF FOUND THEN
                    INSERT INTO Tab_PuntosXColaborador 
                    VALUES (id_consec2, NEW.Referido_Por, 'REFERIDO', PUNTOS_REFERIDO,CURRENT_TIMESTAMP ); 
                -- INSERT REFERIDO SI LLEGA A TENER PUNTOS REFERIDO POR DEFECTO 2
                ELSE
                    INSERT INTO Tab_PuntosXColaborador 
                    VALUES (id_consec2, NEW.Referido_Por, 'REFERIDO', 2 ,CURRENT_TIMESTAMP ); 
                END IF; 
                
            END IF;
        END IF;

           -- Id_Puntos   INTEGER NOT NULL, -- Id auto incrementable que sera el seria de la entrada y salida de puntos 
            --Id_Asociado VARCHAR NOT NULL,-- Id del colaborador que suma o resta puntos 
           -- Motivo_Puntos   VARCHAR NOT NULL,--Motivo por el cual se le suman o se le restan puntos 
           -- Cantidad_Puntos INTEGER NOT NULL ,-- Cantidad de puntos que se van a sumar o se van a restar si la cantidad es negativa es por que restaran puntos por que se redimio algun premio o por que se aplico un castigo 
            --Fecha_Movimiento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- LA FECHA DEL MOVIMIENTO QUE POR DEFECTO SE VA A CARGAR EL AÑO MES DIA HORA MINUTO Y SEGUNDO


		RETURN NEW;
	END;
$$ 
LANGUAGE PLPGSQL;









----------------------------------------------------------------------------------------------------


CREATE OR REPLACE FUNCTION INSERTAR_PUNTOSXCOLABORADOR_TRAS_COMENTARIO() RETURNS "trigger" AS
$$
DECLARE Id_Colaborador_Comenta VARCHAR ;
DECLARE Id_Puntos_Max INTEGER;
DECLARE RECparametros   RECORD;
BEGIN
    IF TG_OP ='INSERT' THEN
        SELECT funcion_Retorna_ultmoid('Tab_PuntosXColaborador','Id_Puntos')  INTO Id_Puntos_Max ; 
        SELECT a.Id_Parametro,a.Tipo_Parametro,a.Cantidad_Puntos INTO RECparametros FROM Tab_Parametros_Puntos a
        WHERE a.Tipo_Parametro='COMENTARIO';
        IF FOUND THEN
            INSERT INTO Tab_PuntosXColaborador VALUES (Id_Puntos_Max,NEW.Id_Comentarista,RECparametros.Tipo_Parametro,RECparametros.Cantidad_Puntos);
            RETURN NEW;
        ELSE 
            INSERT INTO Tab_PuntosXColaborador VALUES (Id_Puntos_Max,NEW.Id_Comentarista,'COMENTARIO',1);
            RETURN NEW;
        END IF;
    END IF;
END;
$$
LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION ACTUALIZAR_PUNTOSTOTALES_EMPRESA() RETURNS "trigger" AS
$$

BEGIN
    IF TG_OP ='INSERT' THEN
        UPDATE Tab_Empresa SET Puntos=Puntos+NEW.Cantidad_Puntos
        WHERE NIT=NEW.Id_Empresa;
        IF FOUND THEN
            RAISE NOTICE 'Sume correctamente los puntos ganados por la empresa';
            RETURN NEW;
        ELSE 
            RAISE NOTICE 'NO pude sumar los puntos ganados por la empresa';
            RETURN NEW;
        END IF;
            
    END IF;
END;
$$
LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION ACTUALIZAR_PUNTOSTOTALES_COLABORADOR() RETURNS "trigger" AS
$$

BEGIN
    IF TG_OP ='INSERT' THEN
        UPDATE Tab_Colaborador SET Puntos_Acumulados=Puntos_Acumulados+NEW.Cantidad_Puntos
        WHERE Documento_Colaborador=NEW.Id_Asociado;
        IF FOUND THEN
            RAISE NOTICE 'Sume correctamente los puntos ganados por el colaborador ';
            RETURN NEW;
        ELSE 
            RAISE NOTICE 'NO pude sumar los puntos ganados por el colaborador ';
            RETURN NEW;
        END IF;
            
    END IF;
END;
$$
LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION INSERTAR_PUNTOSXCOLABORADOR_TRAS_RECLAMARPREMIO() RETURNS "trigger" AS
$$
    DECLARE Id_Puntos_Max INTEGER;
    DECLARE Valor_Premio INTEGER;
    DECLARE Premio_reclamado VARCHAR;
    BEGIN
    IF TG_OP ='INSERT' THEN
        
        SELECT funcion_Retorna_ultmoid('Tab_PuntosXColaborador','Id_Puntos')  INTO Id_Puntos_Max ;
        Premio_reclamado="RECLAMA PREMIO NUMERO :"||NEW.Id_Premio::VARCHAR;
        SELECT a.Coste_Premio INTO Valor_Premio FROM Tab_Premio
        WHERE Id_Premio=NEW.Id_Premio AND Estado_Premio IS TRUE;
        IF FOUND THEN
			Valor_Premio=Valor_Premio*(-1);
            INSERT INTO Tab_PuntosXColaborador VALUES(Id_Puntos_Max,NEW.Id_Reclamante,Premio_reclamado,Valor_Premio);
            IF FOUND THEN
                RAISE NOTICE 'Pude ingresar correctamente el premio que se reclamo ';
                RETURN NEW;
            ELSE 
                RAISE NOTICE ' NO PUDE ingresar correctamente el premio que se reclamo ';
                RETURN NEW;
            END IF;
        ELSE
            RAISE NOTICE 'El premio no se encuentra registrado o esta desactivado ';
            RETURN NEW;
        END IF;

    END IF;
    END;
$$
LANGUAGE PLPGSQL;



CREATE OR REPLACE FUNCTION CREAR_USUARIO_LOGIN_COLABORADORES() RETURNS "trigger" AS
$$

        --Nick            VARCHAR NOT NULL,-- Id de acceso al sistema que sera unico para cada colaborador el cual va a ser el NIT 
       -- Contrasena      VARCHAR NOT NULL,-- Contraseña de acceso al sistema que debe almacenarce hashead
        --Rol             INTEGER NOT NULL,-- Numero de rol que tiene integridad referencial hacia la tabla roles para garantizar las funciones que desempeñara el usuario en el sistema
        --Estado          BOOLEAN NOT NULL DEFAULT TRUE ,-- Estado del Usuario (TRUE=Usuario activo  Y  FALSE=Usuario inactivo)
       -- pirmeravez      BOOLEAN NOT NULL DEFAULT TRUE,
   
    DECLARE CONTRASENA VARCHAR;
    
    BEGIN
        IF TG_OP ='INSERT' THEN

            CONTRASENA=NEW.Nombre_1||NEW.Apellido_1||'123'::VARCHAR;
            CONTRASENA=UPPER(CONTRASENA);


            INSERT INTO Tab_Usuario
            VALUES (NEW.Documento_Colaborador, CONTRASENA, 3);
        END IF;
        RETURN NEW;
    END;
$$
LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION CREAR_USUARIO_LOGIN_EMPRESAS() RETURNS "trigger" AS
$$

        --Nick            VARCHAR NOT NULL,-- Id de acceso al sistema que sera unico para cada colaborador el cual va a ser el NIT 
       -- Contrasena      VARCHAR NOT NULL,-- Contraseña de acceso al sistema que debe almacenarce hashead
        --Rol             INTEGER NOT NULL,-- Numero de rol que tiene integridad referencial hacia la tabla roles para garantizar las funciones que desempeñara el usuario en el sistema
        --Estado          BOOLEAN NOT NULL DEFAULT TRUE ,-- Estado del Usuario (TRUE=Usuario activo  Y  FALSE=Usuario inactivo)
       -- pirmeravez      BOOLEAN NOT NULL DEFAULT TRUE,
   
    DECLARE CONTRASENA VARCHAR;
    
    BEGIN
        IF TG_OP ='INSERT' THEN

            CONTRASENA=NEW.Nombre_Empresa||'123'::VARCHAR;
            CONTRASENA=UPPER(CONTRASENA);
            INSERT INTO Tab_Usuario
            VALUES (NEW.NIT, CONTRASENA, 2);
        END IF;
        RETURN NEW;
    END;
$$
LANGUAGE PLPGSQL;


CREATE OR REPLACE FUNCTION UPDATE_USUARIO_PRIMERAVEZ() RETURNS "trigger" AS
$$

        --Nick            VARCHAR NOT NULL,-- Id de acceso al sistema que sera unico para cada colaborador el cual va a ser el NIT 
       -- Contrasena      VARCHAR NOT NULL,-- Contraseña de acceso al sistema que debe almacenarce hashead
        --Rol             INTEGER NOT NULL,-- Numero de rol que tiene integridad referencial hacia la tabla roles para garantizar las funciones que desempeñara el usuario en el sistema
        --Estado          BOOLEAN NOT NULL DEFAULT TRUE ,-- Estado del Usuario (TRUE=Usuario activo  Y  FALSE=Usuario inactivo)
       -- pirmeravez      BOOLEAN NOT NULL DEFAULT TRUE,
   
    DECLARE CONTRASENAA VARCHAR;
    
    BEGIN
	 	SELECT a.Contrasena INTO CONTRASENAA FROM Tab_Usuario a
        WHERE  a.Nick = NEW.Nick;
		
        IF TG_OP ='UPDATE' THEN
		
			
				IF NEW.pirmeravez IS TRUE THEN
					RAISE NOTICE 'ENTRE AL PRIMER IF ';
					IF OLD.Contrasena != CONTRASENAA THEN
						RAISE NOTICE 'ENTRE A LOS DOS IF ';

					 -- Actualizar un valor en la tabla "cuenta" según la lógica deseada
						UPDATE Tab_Usuario
						SET pirmeravez = FALSE
						WHERE Tab_Usuario.Nick = NEW.Nick; 
					END IF; 
				END IF;
		END IF;
			RETURN NEW;
    END;
$$
LANGUAGE PLPGSQL;




CREATE OR REPLACE FUNCTION CALCULO_AFORO_POST_INSERT_RESERVA() RETURNS "trigger" AS
$$
DECLARE REC_EVENTO      RECORD;
BEGIN
    IF TG_OP='INSERT' THEN
        SELECT a.Fecha_Evento,a.Fecha_Evento_FIN,a.Aforo_Maximo,a.Aforo_Registrado INTO REC_EVENTO FROM Tab_Evento a
        WHERE Id_Evento=NEW.Id_Evento;
        IF FOUND THEN
            IF CURRENT_TIMESTAMP>REC_EVENTO.Fecha_Evento_FIN THEN
                RAISE NOTICE 'No se puede sumar aforo a un evento que ya finalizo ';
                RETURN NEW;
            ELSE
                IF REC_EVENTO.Aforo_Registrado>REC_EVENTO.Aforo_Maximo THEN
                    RAISE NOTICE 'No se puede registar ya que el evento se encuntra lleno';
                    RETURN NEW;
                ELSE
                    REC_EVENTO.Aforo_Registrado=REC_EVENTO.Aforo_Registrado+1;
                    IF REC_EVENTO.Aforo_Registrado<REC_EVENTO.Aforo_Maximo THEN
                        UPDATE Tab_Evento SET Aforo_Registrado=REC_EVENTO.Aforo_Registrado
                        WHERE Id_Evento=NEW.Id_Evento;
                        IF FOUND THEN
                            RAISE NOTICE 'SE SUMO LA ASISTENCIA AL AFORO';
                            RETURN NEW;
                        END IF;
                    ELSE IF REC_EVENTO.Aforo_Registrado=REC_EVENTO.Aforo_Maximo THEN
                        UPDATE Tab_Evento SET Aforo_Registrado=REC_EVENTO.Aforo_Registrado
                        WHERE Id_Evento=NEW.Id_Evento;
                        IF FOUND THEN
                            RAISE NOTICE 'SE SUMO LA ASISTENCIA AL AFORO Y SE DESACTIVA POR QUE ALCANZO EL MAXIMO';
                            UPDATE Tab_Evento SET Estado_Boolean=FALSE
                            WHERE Id_Evento=NEW.Id_Evento;
                            RETURN NEW;
                        END IF;
                         
                    ELSE
                        RAISE NOTICE 'NO SE SUMO LA ASISTENCIA AL AFORO POR QUE SOBRE PASA EL AFORO MAXIMO';
                        RETURN NEW;
                    END IF; 
                END IF;
            END IF;
        END IF;
    END IF;
	END IF;

 
END;
$$
LANGUAGE PLPGSQL;



CREATE OR REPLACE FUNCTION RESTAURA_AFORO_AFTER_DELETE() RETURNS "trigger" AS
$$
DECLARE REC_EVENTO      RECORD;
BEGIN
     SELECT a.Fecha_Evento,a.Fecha_Evento_FIN,a.Aforo_Maximo,a.Aforo_Registrado INTO REC_EVENTO FROM Tab_Evento a
        WHERE Id_Evento=OLD.Id_Evento;
        RAISE NOTICE '%',OLD.Id_Evento;
        IF FOUND THEN
        RAISE NOTICE 'PASE UN WHERE ';
            IF CURRENT_TIMESTAMP>REC_EVENTO.Fecha_Evento_FIN THEN
                RAISE NOTICE 'No se puede restar aforo a un evento que ya finalizo ';
                RETURN NEW;
            ELSE
                REC_EVENTO.Aforo_Registrado=REC_EVENTO.Aforo_Registrado-1;
                RAISE NOTICE 'ACAESTOY';
                IF REC_EVENTO.Aforo_Registrado=REC_EVENTO.Aforo_Maximo THEN
                    UPDATE Tab_Evento SET Aforo_Registrado=REC_EVENTO.Aforo_Registrado
                    WHERE Id_Evento=OLD.Id_Evento;
                    RETURN NEW;
                

                ELSE
                    UPDATE Tab_Evento SET Aforo_Registrado=REC_EVENTO.Aforo_Registrado,Estado_Boolean=TRUE
                    WHERE Id_Evento=OLD.Id_Evento;
                    RETURN NEW;
                END IF;
            END IF;
            END IF;
        

        RAISE NOTICE 'NO HICE UN CULO ';
        
    RETURN NEW;

    
END;
$$
LANGUAGE PLPGSQL;




























------------------------------------------------------------------------------------------------------------
--TRIGGERS--

-- TRIGGER PARA Tab_Rol ---------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_delete_tabla_rol AFTER DELETE ON Tab_Rol
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE TRIGGER tri_actividad_tabla_rol BEFORE INSERT OR UPDATE ON Tab_Rol
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();


-- TRIGGER PARA Tab_Usuario --------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_delete_tabla_USUARIO AFTER DELETE ON Tab_Usuario
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE TRIGGER tri_actividad_tabla_USUARIO BEFORE INSERT OR UPDATE ON Tab_Usuario
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE TRIGGER tri_UPDATE_USUARIO_PRIMERAVEZ AFTER  UPDATE ON Tab_Usuario
FOR EACH ROW EXECUTE PROCEDURE UPDATE_USUARIO_PRIMERAVEZ();





-- TRIGGER PARA Tab_Etiqueta --------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_delete_tabla_ETIQUETA AFTER DELETE ON Tab_Etiqueta
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE TRIGGER tri_actividad_tabla_ETIQUETA BEFORE INSERT OR UPDATE ON Tab_Etiqueta
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

-- TRIGER PARA Tab_Evento  -----------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_delete_tabla_EVENTO AFTER DELETE ON Tab_Evento
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE TRIGGER tri_actividad_tabla_EVENTO BEFORE INSERT OR UPDATE ON Tab_Evento
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

-- TRIGGER PARA Tab_Premio --------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_delete_tabla_PREMIO AFTER DELETE ON Tab_Premio
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE TRIGGER tri_actividad_tabla_PREMIO BEFORE INSERT OR UPDATE ON Tab_Premio
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

-- TRIGGER PARA Tab_Empresa --------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_delete_tabla_EMPRESA AFTER DELETE ON Tab_Empresa
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE TRIGGER tri_actividad_tabla_EMPRESA BEFORE INSERT OR UPDATE ON Tab_Empresa
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE TRIGGER tri_CREAR_USUARIO_LOGIN_EMPRESAS BEFORE INSERT  ON Tab_Empresa
FOR EACH ROW EXECUTE PROCEDURE CREAR_USUARIO_LOGIN_EMPRESAS();






-- TRIGGER PARA Tab_Colaborador --------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_delete_tabla_cuenta_COLABORADOR AFTER DELETE ON Tab_Colaborador
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE TRIGGER tri_actividad_tabla_cuenta_COLABORADOR BEFORE INSERT OR UPDATE ON Tab_Colaborador
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE TRIGGER tri_CREAR_USUARIO_LOGIN_COLABORADORES BEFORE INSERT ON Tab_Colaborador
FOR EACH ROW EXECUTE PROCEDURE CREAR_USUARIO_LOGIN_COLABORADORES();




-- TRIGGER PARA Tab_EtiquetasXColaborador ---------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_delete_tabla_EtiquetasXColaborador AFTER DELETE ON Tab_EtiquetasXColaborador
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE TRIGGER tri_actividad_tabla_EtiquetasXColaborador BEFORE INSERT OR UPDATE ON Tab_EtiquetasXColaborador
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

-- TRIGGER PARA Tab_RegistroXEvento ---------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_delete_tabla_Tab_RegistroXEvento AFTER DELETE ON Tab_RegistroXEvento
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE TRIGGER tri_actividad_tabla_Tab_RegistroXEvento BEFORE INSERT OR UPDATE ON Tab_RegistroXEvento
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE TRIGGER trigger_despues_de_UPDATE_ASISTENCIA BEFORE UPDATE ON Tab_RegistroXEvento
FOR EACH ROW EXECUTE FUNCTION Inserta_Puntos_PostUpdate_Asistencia();


CREATE TRIGGER trigger_RESTAURA_AFORO_AFTER_DELETE BEFORE DELETE ON Tab_RegistroXEvento
FOR EACH ROW EXECUTE FUNCTION RESTAURA_AFORO_AFTER_DELETE();

CREATE TRIGGER trigger_CALCULO_AFORO_POST_INSERT_RESERVA_INSERT BEFORE INSERT ON Tab_RegistroXEvento
FOR EACH ROW EXECUTE FUNCTION CALCULO_AFORO_POST_INSERT_RESERVA();







-- TRIGGER PARA Tab_PuntosXColaborador ---------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_delete_tabla_Tab_PuntosXColaborador AFTER DELETE ON Tab_PuntosXColaborador
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE TRIGGER tri_actividad_tabla_Tab_PuntosXColaborador BEFORE INSERT OR UPDATE ON Tab_PuntosXColaborador
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE OR REPLACE TRIGGER tri_insert_TbPuntosXColaborador BEFORE INSERT ON Tab_PuntosXColaborador 
FOR EACH ROW EXECUTE PROCEDURE ACTUALIZAR_PUNTOSTOTALES_COLABORADOR();


-- TRIGGER PARA Tab_PuntosXEmpresa ---------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_delete_tabla_Tab_PuntosXEmpresa AFTER DELETE ON Tab_PuntosXEmpresa
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE TRIGGER tri_actividad_tabla_Tab_PuntosXEmpresa BEFORE INSERT OR UPDATE ON Tab_PuntosXEmpresa
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE OR REPLACE TRIGGER tri_insert_TbPuntosXempresa BEFORE INSERT ON Tab_PuntosXEmpresa 
FOR EACH ROW EXECUTE PROCEDURE ACTUALIZAR_PUNTOSTOTALES_EMPRESA();

-- TRIGGER PARA Tab_Premio_Reclamado ---------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_delete_tabla_Tab_Premio_Reclamado AFTER DELETE ON Tab_Premio_Reclamado
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE TRIGGER tri_actividad_tabla_Tab_Premio_Reclamado BEFORE INSERT OR UPDATE ON Tab_Premio_Reclamado
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE OR REPLACE TRIGGER tri_insert_TbPremioReclamado BEFORE INSERT ON Tab_Premio_Reclamado 
FOR EACH ROW EXECUTE PROCEDURE INSERTAR_PUNTOSXCOLABORADOR_TRAS_RECLAMARPREMIO();

-- TRIGGER PARA Tab_Comentario ---------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_delete_tabla_Tab_Comentario AFTER DELETE ON Tab_Comentario
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE TRIGGER tri_actividad_tabla_Tab_Comentario BEFORE INSERT OR UPDATE ON Tab_Comentario
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE OR REPLACE TRIGGER tri_insert_tbcomentario BEFORE INSERT ON Tab_Comentario 
FOR EACH ROW EXECUTE PROCEDURE INSERTAR_PUNTOSXCOLABORADOR_TRAS_COMENTARIO();

-- TRIGGER PARA Tab_Parametros_Puntos ---------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_delete_tabla_Tab_Parametros_Puntos AFTER DELETE ON Tab_Parametros_Puntos
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();

CREATE TRIGGER tri_actividad_tabla_Tab_Parametros_Puntos BEFORE INSERT OR UPDATE ON Tab_Parametros_Puntos
FOR EACH ROW EXECUTE PROCEDURE fun_act_tabla();













