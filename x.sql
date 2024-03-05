-- H2 2.1.214;
;             
CREATE USER IF NOT EXISTS "SA" SALT '462276970a10dd81' HASH '24cd49fb118a2e540b6bba51a30e5d7435800e9472db4dc50543082b866db0fb' ADMIN;         
CREATE SEQUENCE "PUBLIC"."GEN" START WITH 1 RESTART WITH 2974 INCREMENT BY 50;
CREATE MEMORY TABLE "PUBLIC"."FUENTE"(
    "ID" BIGINT NOT NULL,
    "BARRIO" CHARACTER VARYING(255),
    "COD_BARRIO" INTEGER NOT NULL,
    "CODIGO_INTERNO" CHARACTER VARYING(255),
    "DIRECCION" CHARACTER VARYING(255),
    "DIRECCION_AUX" CHARACTER VARYING(255),
    "DISTRITO" CHARACTER VARYING(255),
    "ESTADO" INTEGER,
    "GIS_X" DOUBLE PRECISION NOT NULL,
    "GIS_Y" DOUBLE PRECISION NOT NULL,
    "IMAGEN" CHARACTER VARYING(255),
    "LATITUD" DOUBLE PRECISION NOT NULL,
    "LONGITUD" DOUBLE PRECISION NOT NULL,
    "MEDIA_VALORACION" INTEGER NOT NULL,
    "MODELO" CHARACTER VARYING(255),
    "NUM_VALORACIONES" INTEGER NOT NULL,
    "OLOR" INTEGER NOT NULL,
    "SABOR" INTEGER NOT NULL,
    "SUMA_VALORACIONES" INTEGER NOT NULL,
    "TEMPERATURA" INTEGER NOT NULL
);           
ALTER TABLE "PUBLIC"."FUENTE" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_7" PRIMARY KEY("ID");       
-- 1918 +/- SELECT COUNT(*) FROM PUBLIC.FUENTE;               
CREATE MEMORY TABLE "PUBLIC"."FUENTE_VALORACIONES"(
    "FUENTE_ID" BIGINT NOT NULL,
    "VALORACIONES_ID" BIGINT NOT NULL
);              
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.FUENTE_VALORACIONES;     
CREATE MEMORY TABLE "PUBLIC"."IWUSER"(
    "ID" BIGINT NOT NULL,
    "ENABLED" BOOLEAN NOT NULL,
    "FIRST_NAME" CHARACTER VARYING(255),
    "LAST_NAME" CHARACTER VARYING(255),
    "PASSWORD" CHARACTER VARYING(255) NOT NULL,
    "PFP" CHARACTER VARYING(255),
    "ROLES" CHARACTER VARYING(255),
    "USERNAME" CHARACTER VARYING(255) NOT NULL
);            
ALTER TABLE "PUBLIC"."IWUSER" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_8" PRIMARY KEY("ID");       
-- 2 +/- SELECT COUNT(*) FROM PUBLIC.IWUSER;  
INSERT INTO "PUBLIC"."IWUSER" VALUES
(1, TRUE, NULL, NULL, '{bcrypt}$2a$10$2BpNTbrsarbHjNsUWgzfNubJqBRf.0Vz9924nRSHBqlbPKerkgX.W', '/img/users/default.jpg', 'ADMIN,USER', 'a'),
(2, TRUE, NULL, NULL, '{bcrypt}$2a$10$2BpNTbrsarbHjNsUWgzfNubJqBRf.0Vz9924nRSHBqlbPKerkgX.W', '/img/users/default.jpg', 'USER', 'b');      
CREATE MEMORY TABLE "PUBLIC"."MESSAGE"(
    "ID" BIGINT NOT NULL,
    "DATE_READ" TIMESTAMP,
    "DATE_SENT" TIMESTAMP,
    "TEXT" CHARACTER VARYING(255),
    "RECIPIENT_ID" BIGINT,
    "SENDER_ID" BIGINT
);        
ALTER TABLE "PUBLIC"."MESSAGE" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_6" PRIMARY KEY("ID");      
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.MESSAGE; 
CREATE MEMORY TABLE "PUBLIC"."REPORTE"(
    "ID" BIGINT NOT NULL,
    "COMENTARIO" CHARACTER VARYING(255),
    "COMENTARIO_REPORTE" CHARACTER VARYING(255),
    "ESTADO" INTEGER,
    "PRIORIDAD" INTEGER NOT NULL,
    "TIPO" INTEGER,
    "FUENTE_ID" BIGINT,
    "USUARIO_ID" BIGINT
);           
ALTER TABLE "PUBLIC"."REPORTE" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_6C" PRIMARY KEY("ID");     
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.REPORTE; 
CREATE MEMORY TABLE "PUBLIC"."RESPUESTA"(
    "ID" BIGINT NOT NULL,
    "COMENTARIO" CHARACTER VARYING(255),
    "USUARIO_ID" BIGINT,
    "VALORACION_ID" BIGINT
);      
ALTER TABLE "PUBLIC"."RESPUESTA" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_3" PRIMARY KEY("ID");    
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.RESPUESTA;               
CREATE MEMORY TABLE "PUBLIC"."USUARIO"(
    "ID" BIGINT NOT NULL,
    "COD_POSTAL" INTEGER NOT NULL,
    "FIRST_NAME" CHARACTER VARYING(255),
    "LAST_NAME" CHARACTER VARYING(255),
    "MAIL" CHARACTER VARYING(255) NOT NULL,
    "PASSWORD" CHARACTER VARYING(255) NOT NULL,
    "PFP" CHARACTER VARYING(255),
    "USERNAME" CHARACTER VARYING(255) NOT NULL
);
ALTER TABLE "PUBLIC"."USUARIO" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_2" PRIMARY KEY("ID");      
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.USUARIO; 
CREATE MEMORY TABLE "PUBLIC"."USUARIO_FRIENDS"(
    "USUARIO_ID" BIGINT NOT NULL,
    "FRIENDS_ID" BIGINT NOT NULL
);      
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.USUARIO_FRIENDS;         
CREATE MEMORY TABLE "PUBLIC"."USUARIO_FUENTES"(
    "USUARIO_ID" BIGINT NOT NULL,
    "FUENTES_ID" BIGINT NOT NULL
);      
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.USUARIO_FUENTES;         
CREATE MEMORY TABLE "PUBLIC"."VALORACION"(
    "ID" BIGINT NOT NULL,
    "COMENTARIO" CHARACTER VARYING(255),
    "PUNTUACION" INTEGER NOT NULL,
    "FUENTE_ID" BIGINT,
    "USUARIO_ID" BIGINT
);     
ALTER TABLE "PUBLIC"."VALORACION" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_6F" PRIMARY KEY("ID");  
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.VALORACION;              
ALTER TABLE "PUBLIC"."USUARIO" ADD CONSTRAINT "PUBLIC"."UK_ICS8O4KC1RVJCM04KQCJ4MR9B" UNIQUE("MAIL");         
ALTER TABLE "PUBLIC"."IWUSER" ADD CONSTRAINT "PUBLIC"."UK_D2IR61JG0CAX4VX7AB3EA3F9G" UNIQUE("USERNAME");      
ALTER TABLE "PUBLIC"."FUENTE_VALORACIONES" ADD CONSTRAINT "PUBLIC"."UK_OX6M5XRHKXBWMQXY8ILU10U0Y" UNIQUE("VALORACIONES_ID");  
ALTER TABLE "PUBLIC"."USUARIO" ADD CONSTRAINT "PUBLIC"."UK_863N1Y3X0JALATOIR4325EHAL" UNIQUE("USERNAME");     
ALTER TABLE "PUBLIC"."REPORTE" ADD CONSTRAINT "PUBLIC"."FKFGOF8KTQAUQQ5C4E8XHC98XAE" FOREIGN KEY("USUARIO_ID") REFERENCES "PUBLIC"."USUARIO"("ID") NOCHECK;   
ALTER TABLE "PUBLIC"."VALORACION" ADD CONSTRAINT "PUBLIC"."FK9N4HTV6H6QDA5RSG5MQ1462" FOREIGN KEY("USUARIO_ID") REFERENCES "PUBLIC"."USUARIO"("ID") NOCHECK;  
ALTER TABLE "PUBLIC"."FUENTE_VALORACIONES" ADD CONSTRAINT "PUBLIC"."FK45A8TH53WFJT9VKB63TA78SJO" FOREIGN KEY("FUENTE_ID") REFERENCES "PUBLIC"."FUENTE"("ID") NOCHECK;         
ALTER TABLE "PUBLIC"."RESPUESTA" ADD CONSTRAINT "PUBLIC"."FKBAV8T76MOKI46X3SJ13TNL05C" FOREIGN KEY("VALORACION_ID") REFERENCES "PUBLIC"."VALORACION"("ID") NOCHECK;           
ALTER TABLE "PUBLIC"."REPORTE" ADD CONSTRAINT "PUBLIC"."FK7LSJ7I7HJKYE6A7CY8X8N7GT4" FOREIGN KEY("FUENTE_ID") REFERENCES "PUBLIC"."FUENTE"("ID") NOCHECK;     
ALTER TABLE "PUBLIC"."FUENTE_VALORACIONES" ADD CONSTRAINT "PUBLIC"."FK3TU9UMBC8JNB6J3OXEEHV80V8" FOREIGN KEY("VALORACIONES_ID") REFERENCES "PUBLIC"."VALORACION"("ID") NOCHECK;               
ALTER TABLE "PUBLIC"."RESPUESTA" ADD CONSTRAINT "PUBLIC"."FKCTN14LJJYRUO647PIXTK6C9E7" FOREIGN KEY("USUARIO_ID") REFERENCES "PUBLIC"."USUARIO"("ID") NOCHECK; 
ALTER TABLE "PUBLIC"."USUARIO_FRIENDS" ADD CONSTRAINT "PUBLIC"."FKS6LXG2C4PONRUIXSBKHLFP3Q4" FOREIGN KEY("FRIENDS_ID") REFERENCES "PUBLIC"."USUARIO"("ID") NOCHECK;           
ALTER TABLE "PUBLIC"."USUARIO_FRIENDS" ADD CONSTRAINT "PUBLIC"."FK2EQIS7QR8LUAT32RFK0OD4MKN" FOREIGN KEY("USUARIO_ID") REFERENCES "PUBLIC"."USUARIO"("ID") NOCHECK;           
ALTER TABLE "PUBLIC"."USUARIO_FUENTES" ADD CONSTRAINT "PUBLIC"."FKSJJMJV9UWYW2D5169ST6BCL63" FOREIGN KEY("FUENTES_ID") REFERENCES "PUBLIC"."FUENTE"("ID") NOCHECK;            
ALTER TABLE "PUBLIC"."USUARIO_FUENTES" ADD CONSTRAINT "PUBLIC"."FKF134KSVP0GVX3P5J08QHVV2A3" FOREIGN KEY("USUARIO_ID") REFERENCES "PUBLIC"."USUARIO"("ID") NOCHECK;           
ALTER TABLE "PUBLIC"."MESSAGE" ADD CONSTRAINT "PUBLIC"."FKXQR9WQ16K3403YBEPWGPGY0N" FOREIGN KEY("SENDER_ID") REFERENCES "PUBLIC"."IWUSER"("ID") NOCHECK;      
ALTER TABLE "PUBLIC"."MESSAGE" ADD CONSTRAINT "PUBLIC"."FKNCAXW3LCT4F38N1NXO5BCAR54" FOREIGN KEY("RECIPIENT_ID") REFERENCES "PUBLIC"."IWUSER"("ID") NOCHECK;  
ALTER TABLE "PUBLIC"."VALORACION" ADD CONSTRAINT "PUBLIC"."FKIA30XUYWYAJ7GY6HNR2FEGOX6" FOREIGN KEY("FUENTE_ID") REFERENCES "PUBLIC"."FUENTE"("ID") NOCHECK;  