CREATE DATABASE IF NOT EXISTS HospitalDB;
USE HospitalDB;

CREATE TABLE Paciente (
    id_paciente INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    dni VARCHAR(20),
    fecha_nacimiento DATE,
    direccion VARCHAR(255),
    telefono VARCHAR(20)
);

CREATE TABLE Medico (
    id_medico INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    especialidad VARCHAR(100)
);

CREATE TABLE Turno (
    id_turno INT PRIMARY KEY,
    fecha DATE,
    hora TIME,
    id_paciente INT,
    id_medico INT,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico)
);

CREATE TABLE Historial_Clinico (
    id_historial INT PRIMARY KEY,
    fecha DATE,
    descripcion TEXT,
    diagnostico VARCHAR(255),
    id_paciente INT,
    id_medico INT,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico)
);

CREATE TABLE Estudio (
    id_estudio INT PRIMARY KEY,
    tipo VARCHAR(100),
    fecha DATE,
    resultado TEXT,
    id_paciente INT,
    id_medico INT,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico)
);

CREATE TABLE Medicamento (
    id_medicamento INT PRIMARY KEY,
    nombre VARCHAR(100),
    dosis VARCHAR(50),
    frecuencia VARCHAR(50)
);

CREATE TABLE Prescripcion (
    id_prescripcion INT PRIMARY KEY,
    fecha DATE,
    id_paciente INT,
    id_medico INT,
    id_medicamento INT,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico),
    FOREIGN KEY (id_medicamento) REFERENCES Medicamento(id_medicamento)
);

CREATE TABLE Factura (
    id_factura INT PRIMARY KEY,
    fecha DATE,
    monto DECIMAL(10,2),
    metodo_pago VARCHAR(50),
    id_paciente INT,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente)
);

CREATE TABLE Estudio_Historial (
    id_historial INT,
    id_estudio INT,
    FOREIGN KEY (id_historial) REFERENCES Historial_Clinico(id_historial),
    FOREIGN KEY (id_estudio) REFERENCES Estudio(id_estudio)
);

CREATE TABLE Prescripcion_Historial (
    id_historial INT,
    id_prescripcion INT,
    FOREIGN KEY (id_historial) REFERENCES Historial_Clinico(id_historial),
    FOREIGN KEY (id_prescripcion) REFERENCES Prescripcion(id_prescripcion)
);
