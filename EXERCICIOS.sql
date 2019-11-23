--FUNCTION 1		
--Função para deixar as datas formatadas
USE PROJETOESCOLA;

GO
CREATE FUNCTION formatarData (@DATA AS DATETIME)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN
 DATENAME(DW, @DATA)+ ', ' +
 DATENAME(DAY, @DATA)+ ' de ' +
 DATENAME(MONTH, @DATA)+ ', ' +
 DATENAME(YEAR, @DATA)
END;

--Algumas opções de consulta
--1
SELECT dbo.formatarData(dataEntrada) as [Data de Admissao] FROM Professor;
--2
SELECT p.nomePessoa, p.sobreNome, dbo.formatarData(prof.dataEntrada) as [Data de Admissao] FROM Professor prof
INNER JOIN Pessoa p ON prof.idPessoa = p.idPessoa;
--3
SELECT dbo.formatarData(dataSaida) as [Data de Demissao] FROM Professor where dataSaida is not null;
--4
SELECT p.nome, p.sobreNome, dbo.formatarData(dataSaida) as [Data de Demissao] FROM Professor pro
INNER JOIN Pessoa p ON pro.idPessoa = p.idPessoa where dataSaida is not null;
--5
SELECT p.nome, p.sobreNome, dbo.formatarData(dataEntrada) as [Data de Admissao] FROM Professor pro
INNER JOIN Pessoa p ON pro.idPessoa = p.idPessoa where prontuario = 1000;



--FUNCTION 2		
--Função para calcular as faltas
GO
create FUNCTION calculaFaltas (@codAluno INT)
RETURNS int AS
BEGIN
	RETURN(SELECT DISTINCT f.presencas - d.aulas FROM Disciplina d 
			INNER JOIN Turma t ON d.idDisciplina = t.idDisciplina
			INNER JOIN turmaAluno ta ON t.idTurma = ta.idTurma
			INNER JOIN curriculoCurso c ON d.idDisciplina = c.idDisciplina
			INNER JOIN Curso cur ON c.idCurso = cur.idCurso
			INNER JOIN Aluno a ON ta.ProntuarioAluno = a.ProntuarioAluno
			INNER JOIN Pessoa p ON a.idPessoa = p.idPessoa 
			INNER JOIN Frequencia f ON ta.idTurmaAluno = f.idTurmaAluno WHERE @codAluno = ta.ProntuarioAluno)
END
--Algumas opções de consulta
--1
select dbo.calculaFaltas(ProntuarioAluno) AS FALTAS from Aluno where ProntuarioAluno = 100;
--2
select p.nomePessoa, a.ProntuarioAluno, dbo.calculaFaltas(ProntuarioAluno) AS FALTAS from Aluno a 
inner join Pessoa p ON a.idPessoa = p.idPessoa where ProntuarioAluno = 245;



--FUNCTION 3		
--Função que possui apenas os professores que ainda estão na escola
GO
CREATE FUNCTION professoresAtuais (@codProf int)
RETURNS TABLE
AS
RETURN (SELECT p.prontuarioProf, p.salario, p.dataEntrada, p.idDepartamento, p.titulacao, pe.nomePessoa, pe.sobrenome FROM  Professor p
		INNER JOIN Pessoa pe ON p.idPessoa = pe.idPessoa WHERE dataSaida is null and @codProf = prontuarioProf);

--Algumas opções de consulta
--1
SELECT * FROM professoresAtuais(1000);
--2
SELECT * FROM professoresAtuais(1270); -- Não funciona pois o professor de prontuario 1270 não está mais na escola


--FUNCTION 4		
--Função para mostrar há quanto tempo o professor trabalha na escola em MESES
GO
CREATE FUNCTION tempoNaEscola(@codProf int)
RETURNS int
AS
begin
	declare @dataDemissao date;
	set @dataDemissao = (select dataSaida from Professor where @codProf = prontuarioProf);
	
	IF (@dataDemissao is null)   
	begin
     RETURN (SELECT DATEDIFF(MONTH, dataEntrada, getdate()) FROM Professor where prontuarioProf = @codProf);
	end
    
     RETURN (SELECT DATEDIFF(MONTH, dataEntrada, dataSaida) FROM Professor where prontuarioProf = @codProf);
end

--Algumas opções de consulta
--1
SELECT dbo.TempoNaEscola(prontuarioProf) as [Tempo na Escola] FROM PROFESSOR WHERE prontuarioProf = 1000;
--2
SELECT pe.nomePessoa, pe.sobrenome, p.prontuarioProf, dbo.TempoNaEscola(prontuarioProf) as [Tempo na Escola], p.dataSaida FROM Professor p 
		 INNER JOIN Pessoa pe ON p.idPessoa = pe.idPessoa where prontuarioProf= 1000;
--3
SELECT pe.nomePessoa, pe.sobrenome, p.prontuarioProf, dbo.TempoNaEscola(prontuarioProf) as [Tempo na Escola], p.dataSaida FROM Professor p 
		 INNER JOIN Pessoa pe ON p.idPessoa = pe.idPessoa where prontuarioProf = 1270;
--4
SELECT pe.nomePessoa, pe.sobrenome, p.prontuarioProf, dbo.TempoNaEscola(prontuarioProf) as [Tempo na Escola], p.dataSaida FROM Professor p 
		 INNER JOIN Pessoa pe ON p.idPessoa = pe.idPessoa;

--FUNCTION 5 
--Função para calcular a média das notas dos alunos
GO
CREATE FUNCTION calculaMedia (@n1 float, @n2 float, @n3 float,@n4 float )
RETURNS FLOAT
AS
begin

	declare @media float;
	SET @media = (@n1+@n2+@n3+@n4)/4;
     RETURN @media;
end;

SELECT * FROM dbo.calculaMedia(10,10,10,10);

--VIEW 1
--View para mostrar os alunos e suas notas
GO
CREATE VIEW alunoNotas
AS
SELECT p.nomePessoa, p.sobrenome, a.ProntuarioAluno, d.nome, n.n1, n.n2, n.n3, n.n4 FROM Pessoa p
INNER JOIN Aluno a ON p.idPessoa = a.idPessoa
INNER JOIN Notas n ON a.ProntuarioAluno = n.ProntuarioAluno
INNER JOIN Disciplina d ON n.idDisciplina = d.idDisciplina;

--Consultando
SELECT * FROM alunoNotas;
--Outra opcao
SELECT * FROM alunoNotas order by nomePessoa;

--VIEW 2
--View para mostrar os enderecos das pessoas cadastradas
GO
CREATE VIEW enderecoPessoas
AS
SELECT p.nomePessoa, p.sobrenome, p.idPessoa, e.Rua, e.Bairro, e.Numero, e.Complemento, e.CEP, e.cidade, es.nome as estado  FROM Pessoa p
INNER JOIN Endereco e ON p.idEndereco = e.idEndereco
INNER JOIN Estado es ON e.idEstado = es.idEstado;

--Consultando
SELECT * FROM enderecoPessoas;
--Outra opcao
SELECT * FROM enderecoPessoas order by nomePessoa;

--VIEW 3
--View para mostrar as disciplinas de cada CURSO
GO
CREATE VIEW disciplinaCurso
AS
SELECT d.nome, c.[nomeCurso], c.idCurso, d.idDisciplina FROM Disciplina d
INNER JOIN curriculoCurso cc ON d.idDisciplina = cc.idDisciplina
INNER JOIN Curso c ON cc.idCurso = c.idCurso;

--Consultando
SELECT * FROM disciplinaCurso;
--Outra opcao
SELECT * FROM disciplinaCurso order by nome;

--VIEW 4
--View para mostrar as turmas e suas informacoes
GO
CREATE VIEW mostraTurmas
AS
SELECT ta.idTurmaAluno, t.idTurma, t.periodo, pe.nomePessoa, pe.sobrenome AS professor FROM Turma t 
INNER JOIN turmaAluno ta ON t.idTurma = ta.idTurma
INNER JOIN Professor p ON t.prontuarioProf = p.prontuarioProf
INNER JOIN Pessoa pe ON p.idPessoa = pe.idPessoa;

--Consultando
SELECT * FROM mostraTurmas;
--Outra opcao
SELECT * FROM mostraTurmas order by nomePessoa;

--VIEW 5
--View para mostrar os alunos matriculados em cada curso
GO
CREATE VIEW alunoMatricula
AS
SELECT m.prontuarioAluno, c.nomeCurso, p.nomePessoa, p.sobrenome FROM Matricula m 
INNER JOIN Aluno a ON m.prontuarioAluno = a.prontuarioAluno
INNER JOIN Pessoa p ON a.idPessoa = p.idPessoa
INNER JOIN Curso c ON m.idCurso = c.idCurso;

--Consultando
SELECT * FROM alunoMatricula order by nomeCurso;
--Outra opcao
SELECT * FROM alunoMatricula;


--TRIGGER 1
--Função para atualizar o status de aprovação do aluno

GO
CREATE TRIGGER atualizaAprovado
ON Notas
AFTER INSERT, UPDATE
AS
	declare @prontuario int;
	declare @disciplina int;
	declare @media float;
	declare @n1 float;
	declare @n2 float;
	declare @n3 float;
	declare @n4 float;
	SELECT @n1 = n1 FROM inserted;
	SELECT @n2 = n2 FROM inserted;
	SELECT @n3 = n3 FROM inserted;
	SELECT @n4 = n4 FROM inserted;;
	SELECT @prontuario = prontuario FROM inserted;;
	SELECT @disciplina = idDisciplina FROM inserted;;

	IF @n1 is not null AND @n2 is not null AND @n3 is not null AND @n4 IS NOT NULL
		SET  @media = (SELECT * FROM dbo.calculaMedia(@n1, @n2, @n3, @n4));
	IF @media >=7
		UPDATE Notas SET aprovado = 0 WHERE prontuarioAluno = @prontuario AND idDisciplina = @disciplina;
	else
		UPDATE Notas SET aprovado = 1 WHERE prontuarioAluno = @prontuario AND idDisciplina = @disciplina;


GO
UPDATE Notas SET n4 = 1 WHERE idDisciplina = 10 AND prontuario = 100;

SELECT * FROM NOTAS WHERE prontuarioAluno = 100;



--TRIGGER 2	
--Trigger para atualizar o numero de faltas
GO
CREATE TRIGGER atualizaPresencas
ON Frequencia
AFTER UPDATE
AS
DECLARE @presencas int;
DECLARE @faltas int;
SELECT @presencas = presencas FROM inserted;



-- TRIGGER 3
-- Atualizar data de edição no cadastro da pessoa/
GO
ALTER TABLE PESSOA ADD dataAtualizacao DATE NULL;
GO
CREATE TRIGGER dataAtualizacao 
on Pessoa
after update
as
	declare @idPessoa int;
	SELECT @idPessoa = idPessoa FROM inserted;
	UPDATE PESSOA SET dataAtualizacao = GETDATE() where idPessoa = @idPessoa;
	print ('A data de atualizacao foi alterada');

--TESTANDO
UPDATE PESSOA SET nomePessoa = 'Ana Maria' where idPessoa = 1;

-- TRIGGER 4
-- Calcular quantos aprovados na turma quando o periodo estiver fechado. 
go
CREATE TRIGGER contaAprovados
on turma
after UPDATE
as
	DECLARE @periodoFechado tinyint;
	DECLARE @total int;
	DECLARE @idTurma int;

	select @periodoFechado = periodoFechado FROM inserted;
	select @idTurma = idTurma FROM inserted;

	begin
		IF @periodoFechado = 1 
			SET @total = (SELECT count(*) FROM TURMA t
			inner join turmaAluno ta
			on ta.idTurma = t.idTurma
			inner join notas n
			on t.idDisciplina = n.idDisciplina AND n.ProntuarioAluno = ta.ProntuarioAluno
			WHERE n.aprovado = 1 AND t.periodoFechado = 1);

			UPDATE turma SET aprovados = @total WHERE idTurma = @idTurma;
			print('Os dados foram alterados');
	end

--TESTANDO 
GO
UPDATE turma SET periodoFechado = 1  WHERE idTurma = 700;
select * from Turma;

-- TRIGGER 5
-- Atualizar vagasRestantes quando um aluno sair da turma/disciplina 

GO
CREATE TRIGGER atualizaVagas
ON turmaAluno 
AFTER delete
as
	DECLARE @turma int;
	DECLARE @vagas int;
	SELECT @turma = idTurma FROM inserted;
	SELECT @vagas = vagas FROM curriculoCurso c 
	inner join Turma t ON c.idDisciplina = t.idDisciplina where t.idTurma = @turma;
	UPDATE curriculoCurso SET vagas = @vagas+1 (select vagas from curriculoCurso c 
												inner join Turma t ON c.idDisciplina = t.idDisciplina WHERE idTurma = @turma);


--PROCEDURE 1
-- Calcular o salário do prof cordenador
GO
CREATE PROCEDURE salarioProf
	@idpProf int
	AS
		SELECT p.salario+c.comissao FROM Professor p
		INNER JOIN CordenadorCurso c
		on p.prontuarioProf = c.prontuarioProf WHERE p.prontuarioProf = @idpProf;

-- PROCEDURE 2
-- Tirar um aluno da turma
GO
CREATE PROCEDURE deletarAluno
@aluno int
AS 
	DELETE FROM turmaAluno WHERE turmaAluno.ProntuarioAluno = @aluno;

-- PROCEDURE 3
-- Ver matrículas que uma pessoa possui 
GO 
CREATE procedure matriculasAluno
@aluno int
as 
	SELECT * FROM Matricula M WHERE m.prontuario = @aluno;

-- PROCEDURE 4
-- criar campo media e um update pra atribuir
GO
CREATE PROCEDURE atribuiMedia (@n1 float, @n2 float, @n3 float,@n4 float, @codAluno int )
AS
begin
	declare @media float;
	SET @n1 = (select n1 from Notas n 
					inner join Turma t on n.idDisciplina = t.idDisciplina 
					inner join turmaAluno ta ON t.idTurma = ta.idTurma
					inner join Aluno a ON ta.ProntuarioAluno = a.ProntuarioAluno
					where @codAluno = ProntuarioAluno);
	SET @n2 = (select n2 from Notas n 
					inner join Turma t on n.idDisciplina = t.idDisciplina 
					inner join turmaAluno ta ON t.idTurma = ta.idTurma
					inner join Aluno a ON ta.ProntuarioAluno = a.ProntuarioAluno
					where @codAluno = ProntuarioAluno);
	SET @n3 = (select n3 from Notas n 
					inner join Turma t on n.idDisciplina = t.idDisciplina 
					inner join turmaAluno ta ON t.idTurma = ta.idTurma
					inner join Aluno a ON ta.ProntuarioAluno = a.ProntuarioAluno
					where @codAluno = ProntuarioAluno);
	SET @n4 = (select n4 from Notas n 
					inner join Turma t on n.idDisciplina = t.idDisciplina 
					inner join turmaAluno ta ON t.idTurma = ta.idTurma
					inner join Aluno a ON ta.ProntuarioAluno = a.ProntuarioAluno
					where @codAluno = ProntuarioAluno);
	SET @media = (@n1+@n2+@n3+@n4)/4;
	update Notas set media = @media where @codAluno = ProntuarioAluno;
     RETURN @media;
end;

-- PROCEDURE 5
--

