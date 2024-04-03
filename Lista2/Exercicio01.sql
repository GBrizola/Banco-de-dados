CREATE TABLE Livro (
    ID INT PRIMARY KEY,
    Titulo VARCHAR(100),
    ISBN VARCHAR(20),
    Editora VARCHAR(50),
    AnoPublicacao INT
);

CREATE TABLE Autor (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50)
);

CREATE TABLE Livro_Autor (
    ID_Livro INT,
    ID_Autor INT,
    FOREIGN KEY (ID_Livro) REFERENCES Livro(ID),
    FOREIGN KEY (ID_Autor) REFERENCES Autor(ID)
);

INSERT INTO Livro (ID, Titulo, ISBN, Editora, AnoPublicacao)
VALUES
    (1, 'O Senhor dos Anéis: A Sociedade do Anel', '978-3-16-148410-0', 'Martins Fontes', 1954),
    (2, 'O Senhor dos Anéis: As Duas Torres', '978-3-16-148411-1', 'Martins Fontes', 1954),
    (3, 'O Guia do Mochileiro das Galáxias', '978-3-16-148412-2', 'Editora Sextante', 1979),
    (4, 'O mundo de Larissa Manoela', '978-3-16-118412-2', 'HarperCollins', 2017),
    (5, 'Cem Anos de Solidão', '978-3-16-149412-2', 'Editora Record', 1967),
    (6, '1984', '978-3-16-148422-2', 'Companhia das Letras', 1949),
    (7, 'A Culpa é das Estrelas', '978-3-16-138412-2', 'Intrínseca', 2012),
    (8, 'O Pequeno Príncipe', '978-3-16-128412-2', 'Agir', 1943),
    (9, 'Harry Potter e a Pedra Filosofal', '978-3-16-148512-2', 'Rocco', 1997),
    (10, 'Muito Mais Que 5inco Minutos', '978-3-16-147412-2', 'Paralela', 2015);

INSERT INTO Autor (ID, Nome)
VALUES
    (1, 'Douglas Adams'),
    (2, 'Gabriel García Márquez'),
    (3, 'George Orwell'),
    (4, 'John Green'),
    (5, 'J.R.R. Tolkien'),
    (6, 'Antoine de Saint-Exupéry'),
    (7, 'J.K. Rowling'),
    (8, 'Larissa Manoela'),
    (9, 'Kéfera Buchmann');

INSERT INTO Livro_Autor (ID_Livro, ID_Autor)
VALUES
    (1, 5),
    (2, 5),
    (3, 1),
    (4, 8),
    (5, 2),
    (6, 3),
    (7, 4),
    (8, 6),
    (9, 7),
    (10, 9);

-- a)
SELECT livro.titulo, autor.nome FROM 
(autor NATURAL INNER JOIN livro_autor)
INNER JOIN livro USING (id_livro)

SELECT*FROM autor
SELECT*FROM livro
SELECT * FROM livro_autor

-- b)
SELECT livro.titulo, autor.nome FROM 
(autor NATURAL INNER JOIN livro_autor)
INNER JOIN livro USING (id_livro)
WHERE autor.nome = 'J.R.R. Tolkien'

-- c)
SELECT livro.titulo, autor.nome FROM 
(autor NATURAL INNER JOIN livro_autor)
INNER JOIN livro USING (id_livro)
WHERE livro.titulo = '1984'