DROP DATABASE IF EXISTS consultorio_database;

CREATE DATABASE consultorio_database;
USE consultorio_database;

CREATE TABLE USUARIO(
    cui INT NOT NULL,
    tipo VARCHAR(40) NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    nombre_usuario VARCHAR(40) NOT NULL,
    contraseña VARCHAR(40) NOT NULL,
    direccion VARCHAR(40) NOT NULL,
    correo_electronico VARCHAR(40) NOT NULL,
    fecha_de_nacimiento VARCHAR(40) NOT NULL,
    saldo DECIMAL NOT NULL,
    PRIMARY KEY(cui)
);

CREATE TABLE ADMIN(
    cui INT NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    nombre_usuario VARCHAR(40) NOT NULL,
    contraseña VARCHAR(40) NOT NULL,
    correo_electronico VARCHAR(40) NOT NULL,
    fecha_de_nacimiento VARCHAR(40) NOT NULL,
    saldo DECIMAL NOT NULL,
    PRIMARY KEY(cui)
);

CREATE TABLE MEDICO(
    id INT NOT NULL AUTO_INCREMENT,
    cui INT NOT NULL,
    especialidad VARCHAR(40) NOT NULL,
    costo DECIMAL NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT FK_CUIMEDICO FOREIGN KEY(cui)
    REFERENCES USUARIO(cui)
);

CREATE TABLE HORARIO(
    id INT NOT NULL AUTO_INCREMENT,
    cui INT NOT NULL,
    hora INT NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT FK_CUIHORARIO FOREIGN KEY(cui)
    REFERENCES USUARIO(cui)
);

CREATE TABLE ESPECIALIDAD(
    id INT NOT NULL AUTO_INCREMENT,
    cui INT NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    descripcion VARCHAR(40) NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT FK_CUIESPECIALIDAD FOREIGN KEY(cui)
    REFERENCES USUARIO(cui)
);

CREATE TABLE LABORATORIO(    
    id INT NOT NULL AUTO_INCREMENT,
    cui INT NOT NULL,
    tipo_examen VARCHAR(40) NOT NULL,
    costo DECIMAL NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT FK_CUILAB FOREIGN KEY(cui)
    REFERENCES USUARIO(cui)
);

CREATE TABLE CONSULTA(
    id INT NOT NULL AUTO_INCREMENT,
    fecha_inicio VARCHAR(40) NOT NULL,
    fecha_fin VARCHAR(40) NOT NULL,
    porcentaje INT NOT NULL,
    paciente VARCHAR(40) NOT NULL,
    medico VARCHAR(40) NOT NULL,
    costo VARCHAR(40) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE EXAMEN(
    id INT NOT NULL AUTO_INCREMENT,
    fecha_solicitud VARCHAR(40) NOT NULL,
    fecha_fin VARCHAR(40) NOT NULL,
    estado INT NOT NULL,
    paciente VARCHAR(40) NOT NULL,
    laboratorio VARCHAR(40) NOT NULL,
    porcentaje VARCHAR(40) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE TIPOEXAMEN(
    id INT NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    descripcion VARCHAR(40) NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT FK_IDEXAMEN FOREIGN KEY(id)
    REFERENCES EXAMEN(id)
);

CREATE TABLE COSTOEXAMEN(
    id INT NOT NULL AUTO_INCREMENT,
    costo DECIMAL NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT FK_IDCOSTO FOREIGN KEY(id)
    REFERENCES EXAMEN(id)
);



