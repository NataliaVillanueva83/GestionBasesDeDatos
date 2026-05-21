CREATE DATABASE IF NOT EXISTS fabrica_maniquies;
USE fabrica_maniquies;

-- 1. Colores (tabla normalizada, evita duplicar color_acabado en cada pieza)
CREATE TABLE Colores (
    id_color INT AUTO_INCREMENT PRIMARY KEY,
    nombre_color VARCHAR(50) NOT NULL UNIQUE  
);

-- 2. Modelos 
CREATE TABLE Modelos (
    id_modelo    INT AUTO_INCREMENT PRIMARY KEY,
    nombre_modelo VARCHAR(100) NOT NULL,
    genero       ENUM('Femenino', 'Masculino', 'Unisex') NOT NULL,
    rango_edad   ENUM('Adulto', 'Infantil', 'Adolescente') NOT NULL
);
-- 2. Modelos (ahora centraliza color y talle)
CREATE TABLE Modelos (

    talle         ENUM('Chico', 'Mediano', 'Grande') NOT NULL,
    id_color      INT NOT NULL,
    FOREIGN KEY (id_color) REFERENCES Colores(id_color)
);

-- 3. Piezas (solo material, fecha y modelo)
CREATE TABLE Torsos (
    id_serie          INT AUTO_INCREMENT PRIMARY KEY,
    material          VARCHAR(50) NOT NULL,
    fecha_fabricacion DATE NOT NULL,
    id_modelo         INT NOT NULL,
    FOREIGN KEY (id_modelo) REFERENCES Modelos(id_modelo)
);

CREATE TABLE Cabezas (
    id_serie          INT AUTO_INCREMENT PRIMARY KEY,
    material          VARCHAR(50) NOT NULL,
    fecha_fabricacion DATE NOT NULL,
    id_modelo         INT NOT NULL,
    FOREIGN KEY (id_modelo) REFERENCES Modelos(id_modelo)
);

CREATE TABLE Brazos (
    id_serie          INT AUTO_INCREMENT PRIMARY KEY,
    material          VARCHAR(50) NOT NULL,
    fecha_fabricacion DATE NOT NULL,
    lado              ENUM('Izquierdo', 'Derecho') NOT NULL,
    id_modelo         INT NOT NULL,
    FOREIGN KEY (id_modelo) REFERENCES Modelos(id_modelo)
);

CREATE TABLE Piernas (
    id_serie          INT AUTO_INCREMENT PRIMARY KEY,
    material          VARCHAR(50) NOT NULL,
    fecha_fabricacion DATE NOT NULL,
    lado              ENUM('Izquierda', 'Derecha') NOT NULL,
    id_modelo         INT NOT NULL,
    FOREIGN KEY (id_modelo) REFERENCES Modelos(id_modelo)
);

-- 4. Maniquies
CREATE TABLE Maniquies (
    id_maniqui     INT AUTO_INCREMENT PRIMARY KEY,
    numero_serie   VARCHAR(50) NOT NULL UNIQUE,
    fecha_ensamble DATE NOT NULL,
    id_modelo      INT NOT NULL,
    id_torso       INT NOT NULL UNIQUE,
    id_cabeza      INT NOT NULL UNIQUE,
    id_brazo_izq   INT NOT NULL UNIQUE,
    id_brazo_der   INT NOT NULL UNIQUE,
    id_pierna_izq  INT NOT NULL UNIQUE,
    id_pierna_der  INT NOT NULL UNIQUE,
    FOREIGN KEY (id_modelo)    REFERENCES Modelos(id_modelo),
    FOREIGN KEY (id_torso)     REFERENCES Torsos(id_serie),
    FOREIGN KEY (id_cabeza)    REFERENCES Cabezas(id_serie),
    FOREIGN KEY (id_brazo_izq) REFERENCES Brazos(id_serie),
    FOREIGN KEY (id_brazo_der) REFERENCES Brazos(id_serie),
    FOREIGN KEY (id_pierna_izq) REFERENCES Piernas(id_serie),
    FOREIGN KEY (id_pierna_der) REFERENCES Piernas(id_serie)
);


ALTER TABLE Modelos
    ADD COLUMN talle ENUM('Chico', 'Mediano', 'Grande') NOT NULL,
    ADD COLUMN id_color INT NOT NULL,
    ADD CONSTRAINT fk_modelos_color
        FOREIGN KEY (id_color) REFERENCES Colores(id_color);
