CREATE TABLE Curso (
  id_curso INT PRIMARY KEY,
  nome_curso VARCHAR(50),
  descricao VARCHAR(100)
);

CREATE TABLE modulo (
  id_modulo INT PRIMARY KEY,
  nome_modulo VARCHAR(100),
  descricao VARCHAR(100),
  id_curso INT,
  FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

CREATE TABLE turma (
  id_turma INT PRIMARY KEY,
  nome_turma VARCHAR(20),
  id_curso INT,
  id_modulo INT,
  data_criacao DATE,
  status_ativa BOOLEAN,
  turno VARCHAR(10),
  FOREIGN KEY (id_curso) REFERENCES Curso(id_curso),
  FOREIGN KEY (id_modulo) REFERENCES modulo(id_modulo)
);

CREATE TABLE aluno (
  aluno_matricula INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100),
  data_nascimento DATE,
  cpf VARCHAR(11),
  endereco VARCHAR(255),
  id_turma INT,
  FOREIGN KEY (id_turma) REFERENCES turma(id_turma)
);

CREATE TABLE professor (
  professor_matricula INT PRIMARY KEY AUTO_INCREMENT,
  formacao VARCHAR(255),
  nome VARCHAR(100),
  cpf VARCHAR(11),
  endereco VARCHAR(255),
  disponivel_manha BOOLEAN,
  disponivel_tarde BOOLEAN,
  disponivel_noite BOOLEAN
);

CREATE TABLE professor_turma (
  professor_matricula INT,
  id_turma INT,
  FOREIGN KEY (professor_matricula) REFERENCES professor(professor_matricula),
  FOREIGN KEY (id_turma) REFERENCES turma(id_turma)
);