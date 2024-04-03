CREATE TABLE Funcionarios (
	id_func SERIAL PRIMARY KEY,
	nome_func varchar(100),
	data_admissao date
)

SELECT * FROM funcionarios

CREATE TABLE Projetos(
	id_projeto SERIAL PRIMARY KEY,
	nome_projeto varchar(250),
	descricao text
)

SELECT * FROM Projetos

CREATE TABLE funcionarios_projetos(
	id_func int,
	CONSTRAINT fk_func FOREIGN KEY (id_func) REFERENCES funcionarios (id_func),
	id_projeto int,
	CONSTRAINT fk_proj FOREIGN KEY (id_projeto) REFERENCES projetos (id_projeto)
)

INSERT INTO Funcionarios (id_func, nome_func, data_admissao) VALUES
    (1, 'João Silva', '2024-03-10'),
    (2, 'Maria Santos', '2024-02-15'),
    (3, 'Pedro Oliveira', '2024-01-20'),
    (4, 'Ana Costa', '2024-04-05'),
    (5, 'Luís Pereira', '2024-05-12'),
    (6, 'Marta Ferreira', '2024-06-18'),
    (7, 'Carlos Martins', '2024-07-22'),
    (8, 'Sofia Rodrigues', '2024-08-30'),
    (9, 'Rui Gonçalves', '2024-09-14'),
    (10, 'Inês Lopes', '2024-10-03');

INSERT INTO Projetos (id_projeto, nome_projeto, descricao) VALUES
    (1, 'Sistema de Gestão de Clientes', 'Desenvolvimento de um sistema para gerenciar clientes e suas informações.'),
    (2, 'Aplicativo de Compras Online', 'Desenvolvimento de um aplicativo para compras de produtos pela internet.'),
    (3, 'Plataforma de Educação Online', 'Desenvolvimento de uma plataforma para cursos e conteúdos educacionais pela internet.'),
    (4, 'Sistema de Controle Financeiro', 'Desenvolvimento de um sistema para controle de finanças pessoais.'),
    (5, 'Aplicativo de Rastreamento de Encomendas', 'Desenvolvimento de um aplicativo para rastreamento de encomendas.'),
    (6, 'Plataforma de Streaming de Vídeo', 'Desenvolvimento de uma plataforma para streaming de vídeos.'),
    (7, 'Sistema de Reservas de Hotel', 'Desenvolvimento de um sistema para reservas de quartos de hotel.'),
    (8, 'Aplicativo de Receitas Culinárias', 'Desenvolvimento de um aplicativo para compartilhamento e busca de receitas culinárias.'),
    (9, 'Plataforma de Gerenciamento de Projetos', 'Desenvolvimento de uma plataforma para gerenciamento de projetos e equipes.'),
    (10, 'Sistema de Monitoramento de Tráfego', 'Desenvolvimento de um sistema para monitoramento e análise de tráfego urbano.');

INSERT INTO funcionarios_projetos (id_func, id_projeto) VALUES
    (1, 1),
    (2, 3),
    (3, 2),
    (4, 1),
    (5, 4),
    (6, 2),
    (7, 5),
    (8, 3),
    (9, 4),
    (10, 1);
-- a)
SELECT funcionarios.nome_func, projetos.nome_projeto FROM 
(projetos NATURAL INNER JOIN funcionarios_projetos)
INNER JOIN funcionarios USING (id_func)
WHERE projetos.nome_projeto = 'Plataforma de Educação Online'

--b)
SELECT funcionarios.nome_func, projetos.nome_projeto FROM 
(projetos NATURAL INNER JOIN funcionarios_projetos)
INNER JOIN funcionarios USING (id_func)
WHERE funcionarios.nome_func = 'Maria Santos'

--c)
SELECT AVG(contagem_funcionarios) AS media_funcionarios_por_projeto 
FROM (SELECT COUNT(id_func) AS contagem_funcionarios FROM funcionarios_projetos 
GROUP BY id_projeto)


