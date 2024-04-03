CREATE TABLE Curso (
    id_curso INT PRIMARY KEY,
    Nome VARCHAR(100)
);

CREATE TABLE Turma (
    id_turma INT PRIMARY KEY,
    Professor_ID INT,
    id_Curso INT,
    Nome VARCHAR(100),
    FOREIGN KEY (id_Curso) REFERENCES Curso(id_curso)
);

CREATE TABLE Aluno (
    id_aluno INT PRIMARY KEY,
    Nome VARCHAR(100),
    DataNascimento DATE
);

CREATE TABLE Turma_alunos (
    id_aluno INT,
    id_turma INT,
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma),
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno)
);

INSERT INTO Aluno (id_aluno, Nome, DataNascimento) 
VALUES 
    (1001, 'Maria Oliveira', '2003-05-05'),
    (1002, 'Maria Eduarda', '2004-05-25'),
    (1003, 'Maria Prado', '2005-03-13'),
    (1004, 'Maria Silva', '2006-01-17'),
	(1005, 'Maria Clara', '2005-02-13'),
	(1006, 'Maria Luiza ', '2005-01-01'),
	(1007, 'Maria Júlia', '2004-03-20'),
	(1008, 'Maria Cecília', '2006-11-17'),
	(1009, 'Maria Alice', '2007-01-17'),
	(1010, 'Maria Helena', '2004-11-27');

INSERT INTO Curso (id_curso, Nome) 
VALUES 
    (501, 'Análise e desenvolvimento de sistemas'),
    (502, 'Educação Fisica'),
    (503, 'Mecatrônica'),
    (504, 'Engenharia civil'),
    (505, 'Engenharia de produção'),
    (506, 'Engenharia mecânica'),
    (507, 'Engenharia elétrica'),
    (508, 'Engenharia química'),
    (509, 'Logística'),
    (510, 'Artes');
	
INSERT INTO Turma (id_turma, ID_Curso , Professor_ID, Nome) 
VALUES 
    (101, 501,1, 'ADS'),
	(102, 502,2, 'EDF'),
    (103, 503,3, 'MECA'),
    (104, 504,4, 'ENGC'),
    (105, 505,5, 'ENGP'),
	(106, 506,5, 'ENGM'),
	(107, 507,6, 'ENGE'),
    (108, 508,6, 'ENGQ'),
	(109, 509,7, 'LOG'),
	(110, 510,8, 'ART5');
	
INSERT INTO Turma_alunos (id_turma, id_aluno) 
VALUES 
    (101, 1001),
    (102, 1002),
    (103, 1003),
	(104, 1004),
	(105, 1005),
	(106, 1006),
	(107, 1007),
	(108, 1008),
	(109, 1009),
    (110, 1010);

-- a)
SELECT aluno.nome, turma.nome FROM 
(turma NATURAL INNER JOIN Turma_alunos)
INNER JOIN aluno USING (id_aluno)
WHERE turma.nome = 'ADS'

-- b)
SELECT turma.id_turma, curso.nome FROM 
(turma NATURAL INNER JOIN Turma_alunos)
INNER JOIN curso USING (id_curso)
WHERE turma.id_turma = '101'

-- c)
SELECT turma.id_turma, turma.Nome AS Nome_Turma, COUNT(turma_alunos.ID_Aluno) AS Numero_de_Alunos FROM Turma
LEFT JOIN Turma_alunos ON turma.ID_Turma = turma_alunos.ID_Turma
GROUP BY turma.ID_Turma, turma.Nome;

