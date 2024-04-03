CREATE TABLE Paciente(
	ID_Paciente INT PRIMARY KEY,
	Nome VARCHAR(100),
	Data_Nascimento DATE
);

CREATE TABLE Medico(
	ID_Medico INT PRIMARY KEY,
	Nome VARCHAR(100),
	Especialização VARCHAR(30)
);

CREATE TABLE Registro_Medico(
	ID_Registro INT PRIMARY KEY,
    ID_Paciente INT,
    ID_medico INT,
    Data DATE,
    FOREIGN KEY (ID_Paciente) REFERENCES Paciente(ID_Paciente),
    FOREIGN KEY (ID_medico) REFERENCES medico(ID_medico)
);

INSERT INTO Paciente (ID_Paciente, Nome, Data_Nascimento)
VALUES
    (4, 'Ana', '1995-07-12'),
    (5, 'Carlos', '1980-09-25'),
    (6, 'Mariana', '1972-11-30'),
    (7, 'Felipe', '1988-04-03'),
    (8, 'Laura', '1998-02-18'),
    (9, 'Rafael', '1975-06-21'),
    (10, 'Sandra', '1992-08-07'),
    (11, 'Bruno', '1983-12-14'),
    (12, 'Juliana', '1979-10-05'),
    (13, 'Lucas', '2000-03-28');

INSERT INTO medico (ID_medico, Nome, Especialização)
VALUES
    (104, 'Dra. Lima', 'Dermatologia'),
    (105, 'Dr. Costa', 'Neurologia'),
    (106, 'Dra. Almeida', 'Ginecologia'),
    (107, 'Dr. Fernandes', 'Oftalmologia'),
    (108, 'Dra. Souza', 'Endocrinologia'),
    (109, 'Dr. Carvalho', 'Psiquiatria'),
    (110, 'Dra. Oliveira', 'Radiologia'),
    (111, 'Dr. Rodrigues', 'Urologia'),
    (112, 'Dra. Martins', 'Oncologia'),
    (113, 'Dr. Santos', 'Otorrinolaringologia');

INSERT INTO Registro_Medico (ID_Registro, ID_Paciente, ID_medico, Data)
VALUES
    (4, 4, 104, '2024-03-18'),
    (5, 5, 105, '2024-03-19'),
    (6, 6, 106, '2024-03-20'),
    (7, 7, 107, '2024-03-21'),
    (8, 8, 108, '2024-03-22'),
    (9, 9, 109, '2024-03-23'),
    (10, 10, 110, '2024-03-24'),
    (11, 11, 111, '2024-03-25'),
    (12, 12, 112, '2024-03-26'),
    (13, 13, 113, '2024-03-27');

SELECT * FROM medico
SELECT * FROM paciente
SELECT * FROM registro_medico

-- a)
SELECT paciente.ID_Paciente,paciente.nome FROM Paciente 
INNER JOIN Registro_Medico ON paciente.ID_Paciente = registro_medico.ID_Paciente
WHERE registro_medico.ID_medico = 104;

-- b)
SELECT Medico.ID_Medico, Medico.Nome FROM Medico
INNER JOIN Registro_Medico ON Medico.ID_Medico = Registro_Medico.ID_medico
WHERE Registro_Medico.ID_Paciente = 4;	

-- c)
SELECT AVG(contagem_pacientes) AS numero_medio_pacientes_por_medico 
FROM (SELECT COUNT(ID_Paciente) AS contagem_pacientes FROM Registro_Medico 
GROUP BY ID_medico)





