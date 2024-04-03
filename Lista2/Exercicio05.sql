CREATE TABLE Departamentos (
    ID_dep INT PRIMARY KEY,
    Nome_dep VARCHAR(100)
);

CREATE TABLE Funcionarios (
    ID_func INT PRIMARY KEY,
    ID_dep INT,
    Nome VARCHAR(100),
    Data_adm DATE,
    Cargo VARCHAR(100),
    FOREIGN KEY (ID_dep) REFERENCES Departamentos(ID_dep)
);

INSERT INTO Departamentos (ID_dep, Nome_dep)
VALUES 
    (1, 'Recursos Humanos'),
    (2, 'Marketing'),
    (3, 'Finanças'),
    (4, 'Vendas'),
    (5, 'Engenharia'),
    (6, 'Atendimento ao Cliente'),
    (7, 'Tecnologia da Informação'),
    (8, 'Pesquisa e Desenvolvimento'),
    (9, 'Operações'),
    (10, 'Garantia de Qualidade');

INSERT INTO Funcionarios (ID_func, ID_dep, Nome, Data_adm, Cargo)
VALUES
    (1, 1, 'João Silva', '2023-01-15', 'Desenvolvedor'),
    (2, 2, 'Maria Santos', '2023-02-20', 'Analista de Marketing'),
    (3, 3, 'Pedro Oliveira', '2023-03-10', 'Analista Financeiro'),
    (4, 4, 'Ana Costa', '2023-04-05', 'Gerente de Vendas'),
    (5, 5, 'Carlos Pereira', '2023-05-15', 'Engenheiro de Software'),
    (6, 6, 'Fernanda Souza', '2023-06-20', 'Atendente'),
    (7, 7, 'Lucas Rodrigues', '2023-07-10', 'Gerente de TI'),
    (8, 8, 'Mariana Lima', '2023-08-05', 'Pesquisador'),
    (9, 9, 'Gustavo Santos', '2023-09-15', 'Operador'),
    (10, 10, 'Juliana Costa', '2023-10-20', 'Analista de Qualidade');

-- a)
SELECT Funcionarios.nome FROM Funcionarios
INNER JOIN Departamentos ON Funcionarios.ID_dep = Departamentos.ID_dep
WHERE Departamentos.ID_dep = '4';

-- b)
SELECT Departamentos.Nome_dep FROM Departamentos
INNER JOIN Funcionarios ON Departamentos.ID_dep = Funcionarios.ID_dep
WHERE Funcionarios.ID_func = 5;

-- c)
SELECT Gerentes.ID_func , Gerentes.Nome, 
COUNT(Funcionarios.ID_func) AS Num_Funcionarios_Gerenciados
FROM Funcionarios AS Gerentes
INNER JOIN Funcionarios ON Gerentes.ID_func = Funcionarios.ID_dep
GROUP BY Gerentes.ID_func, Gerentes.Nome;


