USE KPDATABASE;

CREATE TABLE Profissao (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50)
);
INSERT INTO Profissao (Nome) VALUES
    ('analista'),
    ('advogado'),
    ('auxiliar'),
    ('administrador'),
    ('eng. civil');

CREATE TABLE Pessoas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50),
    Profissao_ID INT,
    Data_Nascimento DATE,
    FOREIGN KEY (Profissao_ID) REFERENCES Profissao(ID)
);

CREATE TABLE Telefones (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Pessoas_ID INT,
    Telefone VARCHAR(15),
    FOREIGN KEY (Pessoas_ID) REFERENCES Pessoas(ID)
);

INSERT INTO Pessoas (Nome, Profissao_ID, Data_Nascimento) VALUES
    ('Joao', 1, '1985-06-15'),
    ('Maria', 2, '1999-11-25'),
    ('Jose', 3, '2006-02-14');

INSERT INTO Telefones (Pessoas_ID, Telefone) VALUES
    (1, '123-456'),
    (1, '789-012'),
    (2, '234-567'),
    (2, '890-123');

SELECT * FROM Pessoas;

SELECT * FROM Telefones;

SELECT p.ID, p.Nome, pf.Nome as Profissao, p.Data_Nascimento, t.Telefone
FROM Pessoas p
INNER JOIN Profissao pf ON pf.ID = p.Profissao_ID
INNER JOIN Telefones t ON t.Pessoas_ID = p.ID;

SELECT * FROM Profissao;

