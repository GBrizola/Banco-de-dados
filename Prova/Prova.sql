-- DDL (Data Definition Language)
-- Criando a tabela aluno
CREATE TABLE aluno (
    id_aluno INT PRIMARY KEY,
    nome_aluno VARCHAR(50),
    cpf_aluno BIGINT,
    idade_aluno INT
);

-- Criando a tabela endereco
CREATE TABLE endereco (
	id_aluno INT,
	FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    país_aluno VARCHAR(30),
	estado_aluno VARCHAR(30),
	cidade_aluno VARCHAR(30),
	rua_aluno VARCHAR(30),
	num_casa_aluno VARCHAR(10)
);

-- Criando a tabela contato
CREATE TABLE contato (
	id_aluno INT,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    ddd INT,
	telefone_aluno INT,
	celular_aluno INT,
	email_aluno VARCHAR(30)
);

-- Criando a tabela departamento
CREATE TABLE departamento (
    id_dep INT PRIMARY KEY,
    nome_dep VARCHAR(30)
);

-- Criando a tabela curso
CREATE TABLE curso (
    id_curso INT PRIMARY KEY,
	id_dep INT,
	FOREIGN KEY (id_dep) REFERENCES departamento(id_dep),
    nome_curso VARCHAR(30)
);

-- Criando a tabela disciplina
CREATE TABLE disciplina (
    id_disci INT PRIMARY KEY,
    nome_disci VARCHAR(30),
	optativa BOOL
);

-- Criando a tabela matriculas
CREATE TABLE matriculas(
	ra VARCHAR(10) PRIMARY KEY,
	id_aluno INT,
	FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
	id_curso INT,
	FOREIGN KEY (id_curso) REFERENCES curso(id_curso),
	status_aluno VARCHAR(15)
);

-- Criando a tabela curso_disciplina
CREATE TABLE curso_disciplina (
	id_curso INT,
	FOREIGN KEY (id_curso) REFERENCES curso(id_curso),
	id_disci INT,
	FOREIGN KEY (id_disci) REFERENCES disciplina(id_disci)
);

-- Criando a tabela matricula_disciplina
CREATE TABLE matricula_disciplina(
	ra VARCHAR(10),
	FOREIGN KEY (ra) REFERENCES matriculas(ra),
	id_disci INT,
	FOREIGN KEY (id_disci) REFERENCES disciplina(id_disci)
);

-- DML (Data Manipulation Language)
-- Populando a tabela aluno
INSERT INTO aluno (id_aluno, nome_aluno, cpf_aluno, idade_aluno) VALUES
(1, 'João Silva', 12345678901, 20),
(2, 'Maria Santos', 98765432109, 22),
(3, 'Pedro Oliveira', 45678912303, 21),
(4, 'Ana Souza', 78945612307, 23),
(5, 'Lucas Pereira', 32165498705, 19),
(6, 'Carla Fernandes', 65498732102, 20),
(7, 'Mariana Costa', 15935785204, 21),
(8, 'Rafaela Martins', 75315985206, 22),
(9, 'Bruno Almeida', 36985214708, 20),
(10, 'Gustavo Santos', 25874136900, 23);

-- Populando a tabela endereco
INSERT INTO endereco (id_aluno, país_aluno, estado_aluno, cidade_aluno, rua_aluno, num_casa_aluno) VALUES
(1, 'Brasil', 'São Paulo', 'São Paulo', 'Rua A', '123'),
(2, 'Brasil', 'Rio de Janeiro', 'Rio de Janeiro', 'Rua B', '456'),
(3, 'Brasil', 'Belo Horizonte', 'Minas Gerais', 'Rua C', '789'),
(4, 'Brasil', 'Porto Alegre', 'Rio Grande do Sul', 'Rua D', '1011'),
(5, 'Brasil', 'Salvador', 'Bahia', 'Rua E', '1213'),
(6, 'Brasil', 'Curitiba', 'Paraná', 'Rua F', '1415'),
(7, 'Brasil', 'Recife', 'Pernambuco', 'Rua G', '1617'),
(8, 'Brasil', 'Fortaleza', 'Ceará', 'Rua H', '1819'),
(9, 'Brasil', 'Brasília', 'Distrito Federal', 'Rua I', '2021'),
(10, 'Brasil', 'Manaus', 'Amazonas', 'Rua J', '2223');

-- Populando a tabela contato
INSERT INTO contato (id_aluno, ddd, telefone_aluno, celular_aluno, email_aluno) VALUES
(1, 11, 123456789, 987654321, 'joao@example.com'),
(2, 21, 987654321, 123456789, 'maria@example.com'),
(3, 31, 456789123, 321654987, 'pedro@example.com'),
(4, 41, 789456123, 654987321, 'ana@example.com'),
(5, 51, 321654987, 159357852, 'lucas@example.com'),
(6, 61, 654987321, 753159852, 'carla@example.com'),
(7, 71, 159357852, 369852147, 'mariana@example.com'),
(8, 81, 753159852, 258741369, 'rafaela@example.com'),
(9, 91, 369852147, 147258369, 'bruno@example.com'),
(10, 101, 258741369, 369147258, 'gustavo@example.com');

-- Populando a tabela departamento
INSERT INTO departamento (id_dep, nome_dep) VALUES
(1, 'Tecnologia'),
(2, 'Engenharia'),
(5, 'Saúde'),
(8, 'Humanas');

-- Populando a tabela curso
INSERT INTO curso (id_curso, id_dep, nome_curso) VALUES
(1, 1, 'Ciência da Computação'),
(2, 2, 'Engenharia Elétrica'),
(3, 2, 'Engenharia Mecânica'),
(4, 2, 'Engenharia Civil'),
(5, 5, 'Medicina'),
(6, 8, 'Direito'),
(7, 8, 'Administração de Empresas'),
(8, 8, 'Psicologia'),
(9, 8, 'História'),
(10, 8, 'Literatura Inglesa');

-- Populando a tabela disciplina
INSERT INTO disciplina (id_disci, nome_disci, optativa) VALUES
(1, 'Introdução à Programação', false),
(2, 'Análise de Circuitos', false),
(3, 'Termodinâmica', false),
(4, 'Análise Estrutural', false),
(5, 'Anatomia', false),
(6, 'Direito Constitucional', false),
(7, 'Marketing', false),
(8, 'Psicologia Cognitiva', false),
(9, 'História Mundial', false),
(10, 'Literatura Shakespeareana', false);

-- Populando a tabela matriculas
INSERT INTO matriculas (ra, id_aluno, id_curso, status_aluno) VALUES
('RA001', 1, 1, 'Matriculado'),
('RA002', 2, 2, 'Formado'),
('RA003', 3, 3, 'Matriculado'),
('RA004', 4, 4, 'Matriculado'),
('RA005', 5, 5, 'Formado'),
('RA006', 6, 6, 'Matriculado'),
('RA007', 7, 7, 'Trancado'),
('RA008', 8, 8, 'Matriculado'),
('RA009', 9, 9, 'Trancado'),
('RA010', 10, 10, 'Matriculado');

-- Populando a tabela curso_disciplina
INSERT INTO curso_disciplina (id_curso, id_disci) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10);

-- Populando a tabela matricula_disciplina
INSERT INTO matricula_disciplina (ra, id_disci) VALUES
('RA001', 1),
('RA001', 2),
('RA002', 3),
('RA002', 4),
('RA003', 5),
('RA003', 6),
('RA004', 7),
('RA004', 8),
('RA005', 9),
('RA005', 10);

-- DQL(Data Query Language)

-- Dado o RA ou o Nome do Aluno, buscar no BD todos os demais dados do aluno.
SELECT * FROM (SELECT nome_aluno, cpf_aluno, idade_aluno FROM aluno WHERE nome_aluno = 'João Silva') NATURAL INNER JOIN
(SELECT ddd, telefone_aluno, celular_aluno, email_aluno FROM contato 
WHERE id_aluno = (SELECT id_aluno FROM aluno WHERE nome_aluno = 'João Silva'))
NATURAL INNER JOIN(SELECT país_aluno, estado_aluno, cidade_aluno, rua_aluno, num_casa_aluno FROM endereco 
WHERE id_aluno = (SELECT id_aluno FROM aluno WHERE nome_aluno = 'João Silva'))
NATURAL INNER JOIN matriculas WHERE ra = 'RA001'

-- Dado o nome de um departamento, exibir o nome de todos os cursos associados a ele.
SELECT nome_curso FROM curso WHERE id_dep = (SELECT id_dep FROM departamento WHERE nome_dep = 'Engenharia')

-- Dado o nome de uma disciplina, exibir a qual ou quais cursos ela pertence.
SELECT nome_curso FROM curso NATURAL INNER JOIN curso_disciplina WHERE id_disci = (SELECT id_disci FROM disciplina 
WHERE nome_disci = 'Introdução à Programação')

-- Dado o CPF de um aluno, exibir quais disciplinas ele está cursando.
SELECT nome_disci FROM disciplina NATURAL INNER JOIN matricula_disciplina WHERE ra = (SELECT ra FROM matriculas
WHERE id_aluno = (SELECT id_aluno FROM aluno WHERE cpf_aluno = '98765432109'))

-- Filtrar todos os alunos matriculados em um determinado curso.
SELECT nome_aluno FROM aluno NATURAL INNER JOIN matriculas WHERE id_curso = (SELECT id_curso FROM curso WHERE
nome_curso = 'Direito')

-- Filtrar todos os alunos matriculados em determinada disciplina.
SELECT nome_aluno FROM aluno NATURAL INNER JOIN matriculas
NATURAL INNER JOIN matricula_disciplina WHERE id_disci = (SELECT id_disci FROM disciplina WHERE
nome_disci = 'Análise de Circuitos')

-- Filtrar alunos formados.
SELECT nome_aluno FROM aluno NATURAL INNER JOIN matriculas WHERE status_aluno = 'Formado'

-- Filtrar alunos ativos.
SELECT nome_aluno FROM aluno NATURAL INNER JOIN matriculas WHERE status_aluno = 'Matriculado'

-- Apresentar a quantidade de alunos ativos por curso.
SELECT nome_curso, COUNT(nome_aluno)FROM aluno 
NATURAL INNER JOIN matriculas 
NATURAL INNER JOIN curso 
WHERE status_aluno = 'Matriculado' 
GROUP BY nome_curso;

-- Apresentar a quantidade de alunos ativos por disciplina.
SELECT nome_disci, COUNT(nome_aluno)FROM aluno 
NATURAL INNER JOIN matriculas
NATURAL INNER JOIN matricula_disciplina
NATURAL INNER JOIN disciplina
WHERE status_aluno = 'Matriculado' 
GROUP BY nome_disci;

SELECT * FROM aluno
SELECT * FROM contato
SELECT * FROM curso
SELECT * FROM curso_disciplina
SELECT * FROM departamento
SELECT * FROM disciplina
SELECT * FROM endereco
SELECT * FROM matricula_disciplina
SELECT * FROM matriculas