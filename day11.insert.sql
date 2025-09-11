CREATE DATABASE escola;
USE escola;

CREATE TABLE professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(100) NOT NULL,                 
    especialidade VARCHAR(100),                
    salario DECIMAL(10,2),                    
    uf CHAR(2)                                   
);

CREATE TABLE disciplina (
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_professor INT, 
    carga_horaria INT,
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

CREATE TABLE aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sexo CHAR(1),
    data_nascimento DATE,
    nota_final DECIMAL(4,2),
    ativo BOOLEAN
);

CREATE TABLE curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT,
    modalidade VARCHAR(50)
);

CREATE TABLE matricula (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    data_matricula DATE,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

CREATE TABLE login (
    id_login INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    data_hora DATETIME,
    ip VARCHAR(45),
    sucesso BOOLEAN,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);

-- Professores
INSERT INTO professor (nome, especialidade, salario, uf) VALUES
('Maria Silva', 'Matemática', 5500.00, 'SP'),
('João Souza', 'História', 4800.00, 'RJ'),
('toni', 'educacao fisica', 4800.00, 'RJ'),
('pricila', 'potugues', 4800.00, 'RJ'),
('dudao', 'educacao financeira', 4800.00, 'RJ'),
('czao', 'geografia', 4800.00, 'RJ'),
('laurete', 'sociologia', 4800.00, 'RJ'),
('ferzao', 'ciencias', 4800.00, 'RJ'),
('gabi', 'quimica', 4800.00, 'RJ'),
('cleiton', 'matematica', 4800.00, 'RJ'),
('nico', 'front end', 4800.00, 'RJ');
select * from professor;

-- Disciplinas
INSERT INTO disciplina (nome, id_professor, carga_horaria) VALUES
('Matemática',1, 60),
('História',2, 60),
('educacao fisica',3, 60),
('educacao financeira',4, 60),
('geografia',5, 60),
('sociologia',6, 60),
('ciencias',7, 60),
('quimica',8, 60),
('matematica',9, 60),
('front end',10, 60);
select * from disciplina;

-- Alunos
INSERT INTO aluno (nome, sexo, data_nascimento, nota_final, ativo) VALUES
('Carlos Andrade', 'M', '2002-05-10', 8.5, TRUE),
('Fernanda Lima', 'F', '2003-08-22', 9.2, TRUE),
('cj', 'M', '2002-07-21', 8.5, TRUE),
('elda', 'f', '2002-08-10', 8.5, TRUE),
('black', 'M', '2002-01-31', 8.5, TRUE),
('Cristiano', 'M', '2002-05-20', 8.5, TRUE),
('ronaldete', 'f', '2002-03-10', 8.5, TRUE),
('jao', 'M', '2002-01-10', 8.5, TRUE),
('josefina', 'M', '2002-05-16', 8.5, TRUE),
('renaldo', 'f', '2002-01-10', 8.5, TRUE);
select * from professor;

-- Cursos
INSERT INTO curso (nome, carga_horaria, modalidade) VALUES
('Engenharia', 3600, 'Presencial'),
('Direito', 3000, 'EAD');

-- Matrículas
INSERT INTO matricula (id_aluno, id_curso, data_matricula) VALUES
(1, 1, '2024-02-01'),
(2, 2, '2024-02-10');

-- Logins
INSERT INTO login (id_aluno, data_hora, ip, sucesso) VALUES
(1, '2024-05-01 08:30:00', '192.168.1.10', TRUE),
(2, '2024-05-01 09:15:00', '192.168.1.11', FALSE);
