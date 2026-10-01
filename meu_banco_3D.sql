CREATE DATABASE academiaa_bd;
USE academiaa_bd;

CREATE TABLE planos (
    id_plano INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    valor_mensal DECIMAL(8,2) NOT NULL,
    duracao_meses INT NOT NULL
);

CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_nascimento DATE NOT NULL
);

CREATE TABLE instrutores (
    id_instrutor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50) NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE matriculas (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_plano INT NOT NULL,
    id_instrutor INT,
    data_inicio DATE DEFAULT (CURRENT_DATE),
    status VARCHAR(20) DEFAULT 'Ativo',

    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_plano) REFERENCES planos(id_plano),
    FOREIGN KEY (id_instrutor) REFERENCES instrutores(id_instrutor)
);

INSERT INTO planos (nome, valor_mensal, duracao_meses) VALUES
('Mensal Básico', 89.90, 1),
('Trimestral Fit', 459.90, 3),
('Semestral Plus', 339.90, 6),
('Anual Vip', 87.90, 12);

INSERT INTO instrutores (nome, especialidade, telefone) VALUES
('Alberto', 'Musculação', '11111111111'),
('Fernado', 'Pilates', '11111231111'),
('Roberto', 'Crossfit', '11115611111'),
('Jorge', 'Natação', '11111111451');

INSERT INTO alunos (nome, cpf, telefone, data_nascimento) VALUES
('Ana clara', '111.222.333.44', '11977778888', '1985-05-14'),
('Maria', '999.222.333.44', '11977773888', '1985-05-15'),
('Diego', '111.262.333.44', '11977774888', '1985-05-16'),
('Ribeiro', '111.222.393.44', '11977779888', '1985-05-17');

INSERT INTO matriculas (id_aluno, id_plano, id_instrutor, data_inicio, status) VALUES
(1, 2, 1, '2026-01-10', 'Ativo'),
(2, 3, 2, '2026-01-01', 'Ativo'),
(3, 1, 3, '2023-01-10', 'Ativo'),
(1, 3, 3, '2020-01-10', 'Cancelado');

SELECT * FROM matriculas;
SELECT * FROM alunos;
SELECT * FROM instrutores;

SELECT nome, telefone
FROM alunos
ORDER BY nome ASC;

SELECT *
FROM planos
WHERE valor_mensal < 100.00;

SELECT *
FROM instrutores
WHERE especialidae = 'Musculação';

SELECT count(*) AS total_matriculas_ativas
FROM matriculas
WHERE status = 'Ativo';

SELECT
aluno.nome AS aluno,
matriculas.data_inicio,
matriculas.status
FROM matriculas
INNER JOIN alunos ON matriculas.id_aluno=alunos.id_aluno;