-- Generado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   en:        2020-03-13 21:18:52 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE alternativa (
    idalternativa        INTEGER NOT NULL,
    descripcion          VARCHAR2(200 CHAR),
    correcta             CHAR(1),
    porcpuntaje          FLOAT(3),
    pregunta_idpregunta  INTEGER NOT NULL
);

ALTER TABLE alternativa ADD CONSTRAINT alternativa_pk PRIMARY KEY ( idalternativa );

CREATE TABLE alumno (
    idalumno       INTEGER NOT NULL,
    nombre         VARCHAR2(100 CHAR),
    dni            VARCHAR2(15 CHAR),
    curso_idcurso  INTEGER
);

ALTER TABLE alumno ADD CONSTRAINT alumno_pk PRIMARY KEY ( idalumno );

CREATE TABLE asigprograma (
    test_idtest          INTEGER NOT NULL,
    programa_idprograma  INTEGER NOT NULL,
    programaasignado     INTEGER
);

ALTER TABLE asigprograma ADD CONSTRAINT asigprograma_pk PRIMARY KEY ( test_idtest,
                                                                      programa_idprograma );

CREATE TABLE curso (
    idcurso              INTEGER NOT NULL,
    nombre               VARCHAR2(5 CHAR),
    programa_idprograma  INTEGER
);

ALTER TABLE curso ADD CONSTRAINT curso_pk PRIMARY KEY ( idcurso );

CREATE TABLE pregunta (
    idpregunta       INTEGER NOT NULL,
    enunciado        VARCHAR2(400 CHAR),
    puntajeasociado  INTEGER,
    test_idtest      INTEGER
);

ALTER TABLE pregunta ADD CONSTRAINT pregunta_pk PRIMARY KEY ( idpregunta );

CREATE TABLE programa (
    idprograma  INTEGER NOT NULL,
    nombre      VARCHAR2(50 CHAR)
);

ALTER TABLE programa ADD CONSTRAINT programa_pk PRIMARY KEY ( idprograma );

CREATE TABLE respuesta (
    idrespuesta          INTEGER NOT NULL,
    marca                INTEGER,
    alumno_idalumno      INTEGER,
    pregunta_idpregunta  INTEGER
);

ALTER TABLE respuesta ADD CONSTRAINT respuesta_pk PRIMARY KEY ( idrespuesta );

CREATE TABLE test (
    idtest               INTEGER NOT NULL,
    nombre               VARCHAR2(100 CHAR),
    descripcion          VARCHAR2(200 CHAR),
    unidad               INTEGER,
    autor                VARCHAR2(100 CHAR),
    fechacreacion        DATE,
    programa_idprograma  INTEGER NOT NULL
);

ALTER TABLE test ADD CONSTRAINT test_pk PRIMARY KEY ( idtest );

ALTER TABLE alternativa
    ADD CONSTRAINT alternativa_pregunta_fk FOREIGN KEY ( pregunta_idpregunta )
        REFERENCES pregunta ( idpregunta );

ALTER TABLE alumno
    ADD CONSTRAINT alumno_curso_fk FOREIGN KEY ( curso_idcurso )
        REFERENCES curso ( idcurso );

ALTER TABLE asigprograma
    ADD CONSTRAINT asigprograma_programa_fk FOREIGN KEY ( programa_idprograma )
        REFERENCES programa ( idprograma );

ALTER TABLE asigprograma
    ADD CONSTRAINT asigprograma_test_fk FOREIGN KEY ( test_idtest )
        REFERENCES test ( idtest );

ALTER TABLE curso
    ADD CONSTRAINT curso_programa_fk FOREIGN KEY ( programa_idprograma )
        REFERENCES programa ( idprograma );

ALTER TABLE pregunta
    ADD CONSTRAINT pregunta_test_fk FOREIGN KEY ( test_idtest )
        REFERENCES test ( idtest );

ALTER TABLE respuesta
    ADD CONSTRAINT respuesta_alumno_fk FOREIGN KEY ( alumno_idalumno )
        REFERENCES alumno ( idalumno );

ALTER TABLE respuesta
    ADD CONSTRAINT respuesta_pregunta_fk FOREIGN KEY ( pregunta_idpregunta )
        REFERENCES pregunta ( idpregunta );

ALTER TABLE test
    ADD CONSTRAINT test_programa_fk FOREIGN KEY ( programa_idprograma )
        REFERENCES programa ( idprograma );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             17
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
