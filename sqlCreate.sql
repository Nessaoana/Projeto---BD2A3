CREATE DATABASE PROJETOESCOLA;

USE PROJETOESCOLA;

GO
CREATE TABLE Estado (
  idEstado INT NOT NULL PRIMARY KEY,
  nome VARCHAR(45) NULL,
  sigla VARCHAR(45) NULL
);

GO
CREATE TABLE Endereco (
  idEndereco INT NOT NULL PRIMARY KEY,
  Rua VARCHAR(45) NULL,
  Bairro VARCHAR(45) NULL,
  Numero VARCHAR(45) NULL,
  Complemento VARCHAR(45) NULL,
  CEP INT NULL,
  idEstado INT NULL,
  cidade VARCHAR(45) NULL,
  INDEX estadoEsndereco_FK_idx (idEstado ASC),
  CONSTRAINT estadoEndereco_FK FOREIGN KEY (idEstado) REFERENCES Estado (idEstado)
);

GO
CREATE TABLE Pessoa (
  idPessoa INT NOT NULL PRIMARY KEY,
  idEndereco INT NULL,
  nome VARCHAR(45) NULL,
  sobrenome VARCHAR(45) NULL,
  CPF VARCHAR(11) NULL,
  RG VARCHAR(9) NULL,
  sexo VARCHAR(45) NULL,
  INDEX pessoaEndereco_FK_idx (idEndereco ASC),
  CONSTRAINT pessoaEndereco_FK FOREIGN KEY (idEndereco) REFERENCES Endereco(idEndereco)
);

GO
CREATE TABLE Aluno (
  idPessoa INT NOT NULL,
  Prontuario INT NOT NULL PRIMARY KEY,
  INDEX alunoPessoa_idx (idPessoa ASC),
  CONSTRAINT alunoPessoa FOREIGN KEY (idPessoa) REFERENCES Pessoa(idPessoa)
 );

 CREATE TABLE Departamento (
  idDepartamento INT NOT NULL PRIMARY KEY,
  sigla VARCHAR(3) NOT NULL,
  descricao VARCHAR(45) NULL,
);

CREATE TABLE Professor (
  prontuario INT NOT NULL PRIMARY KEY,
  idPessoa INT NULL,
  salario FLOAT NULL,
  dataEntrada DATE NULL,
  dataSaida DATE NULL,
  idDepartamento INT NULL,
  titulacao VARCHAR(45) NULL,
  INDEX professorPessoa_idx (idPessoa ASC),
  INDEX professorDepartamento_idx (idDepartamento ASC),
  CONSTRAINT professorPessoa FOREIGN KEY (idPessoa) REFERENCES Pessoa (idPessoa),

  CONSTRAINT professorDepartamento FOREIGN KEY (idDepartamento) REFERENCES Departamento (idDepartamento)
);

CREATE TABLE Telefone (
  idTelefone INT NOT NULL PRIMARY KEY ,
  idPessoa INT NULL,
  DDD NUMERIC(2) NULL,
  numero NUMERIC(9) NULL,
  INDEX pessoa_FK_idx (idPessoa ASC),
  CONSTRAINT pessoa_FK FOREIGN KEY (idPessoa) REFERENCES Pessoa (idPessoa)
);

CREATE TABLE Curso (
  idCurso INT NOT NULL PRIMARY KEY,
  nome VARCHAR(45) NULL,
  sigla VARCHAR(45) NULL,
  totalSemestres INT NULL
);

CREATE TABLE Matricula (
  matricula INT NOT NULL PRIMARY KEY, --  'taxaConclusao (procedure/function)'
  prontuario INT NULL,
  idCurso INT NULL,
  INDEX matriculaAluno_idx (prontuario ASC),
  INDEX matriculaCurso_idx (idCurso ASC),
  CONSTRAINT matriculaAluno FOREIGN KEY (prontuario) REFERENCES Aluno (Prontuario),
  CONSTRAINT matriculaCurso FOREIGN KEY (idCurso) REFERENCES Curso (idCurso)
);

CREATE TABLE CordenadorCurso (
  idCordenadorCurso INT NOT NULL PRIMARY KEY,
  prontuarioProf INT NULL,
  idCurso INT NULL,
  dataEntrada DATE NULL,
  dataSaida DATE NULL,
  comissao FLOAT NULL,
  INDEX professorCordenador_idx (prontuarioProf ASC),
  INDEX cursoCordenador_idx (idCurso ASC),
  CONSTRAINT professorCordenador FOREIGN KEY (prontuarioProf) REFERENCES Professor (prontuario),

  CONSTRAINT cursoCordenador FOREIGN KEY (idCurso) REFERENCES Curso (idCurso)
);

CREATE TABLE Disciplina (
  idDisciplina INT NOT NULL PRIMARY KEY ,
  codigo VARCHAR(45) NULL,
  nome VARCHAR(45) NOT NULL,
  cargaHoraria INT NOT NULL,
  aulas INT NULL
);

CREATE TABLE curriculoCurso (
  idCurso INT NOT NULL,
  idDisciplina INT NULL,
  semestre INT NULL,
  INDEX curso_FK_idx (idCurso ASC),
  INDEX disciplina_FK_idx (idDisciplina ASC),
  CONSTRAINT curso_FK
    FOREIGN KEY (idCurso)
    REFERENCES Curso (idCurso),
  CONSTRAINT disciplina_FK
    FOREIGN KEY (idDisciplina)
    REFERENCES Disciplina (idDisciplina)
);


CREATE TABLE Turma (
  idTurma INT NOT NULL,
  idDisciplina INT NULL,
  periodo VARCHAR(6) NULL,
  prontuarioProf INT NULL,
  PRIMARY KEY (idTurma),
  INDEX disciplinaTurma_idx (idDisciplina ASC),
  INDEX disciplinaProfessor_idx (prontuarioProf ASC),
  CONSTRAINT disciplinaTurma
    FOREIGN KEY (idDisciplina)
    REFERENCES Disciplina (idDisciplina),
  CONSTRAINT disciplinaProfessor
    FOREIGN KEY (prontuarioProf)
    REFERENCES Professor (prontuario)
);


CREATE TABLE turmaAluno (
  idTurmaAluno INT not null PRIMARY KEY,
  prontuario INT NOT NULL,
  idTurma INT NULL,

  CONSTRAINT alunoTurma_FK
    FOREIGN KEY (prontuario)
    REFERENCES Aluno (Prontuario),
  CONSTRAINT turmaAluno_FK
    FOREIGN KEY (idTurma)
    REFERENCES Turma(idTurma)
);

CREATE TABLE Frequencia (
  idFrequencia INT NOT NULL PRIMARY KEY,
  idTurmaAluno INT NULL,
  presencas INT NULL ,  -- 'Calcular por trigger/function\n'
  INDEX turmaAlunoFrequencia_idx (idTurmaAluno ASC),
  CONSTRAINT turmaAlunoFrequencia FOREIGN KEY (idTurmaAluno) REFERENCES turmaAluno (idTurmaAluno)
);