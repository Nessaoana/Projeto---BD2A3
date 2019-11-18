--FUNCTION 1		
--Função para deixar as datas formatadas
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
SELECT p.nome, p.sobreNome, dbo.formatarData(dataEntrada) as [Data de Admissao] FROM Professor pro
INNER JOIN Pessoa p ON pro.idPessoa = p.idPessoa;
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
			INNER JOIN Aluno a ON ta.prontuario = a.Prontuario
			INNER JOIN Pessoa p ON a.idPessoa = p.idPessoa 
			INNER JOIN Frequencia f ON ta.idTurmaAluno = f.idTurmaAluno WHERE @codAluno = ta.prontuario)
END
--Algumas opções de consulta
--1
select dbo.calculaFaltas(Prontuario) AS FALTAS from Aluno where Prontuario = 100;
--2
select p.nome, a.Prontuario, dbo.calculaFaltas(Prontuario) AS FALTAS from Aluno a 
inner join Pessoa p ON a.idPessoa = p.idPessoa where Prontuario = 245;



--FUNCTION 3		
--Função que possui apenas os professores que ainda estão na escola
GO
CREATE FUNCTION professoresAtuais (@codProf int)
RETURNS TABLE
AS
RETURN (SELECT p.prontuario, p.salario, p.dataEntrada, p.idDepartamento, p.titulacao, pe.nomePessoa, pe.sobrenome FROM  Professor p
		INNER JOIN Pessoa pe ON p.idPessoa = pe.idPessoa WHERE dataSaida is null and @codProf = prontuario);

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
	set @dataDemissao = (select dataSaida from Professor where @codProf = prontuario);
	
	IF (@dataDemissao is null)   
	begin
     RETURN (SELECT DATEDIFF(MONTH, dataEntrada, getdate()) FROM Professor where prontuario = @codProf);
	end
    
     RETURN (SELECT DATEDIFF(MONTH, dataEntrada, dataSaida) FROM Professor where prontuario = @codProf);
end

--Algumas opções de consulta
--1
SELECT dbo.TempoNaEscola(prontuario) as [Tempo na Escola] FROM PROFESSOR WHERE prontuario = 1000;
--2
SELECT pe.nome, pe.sobrenome, p.prontuario, dbo.TempoNaEscola(prontuario) as [Tempo na Escola], p.dataSaida FROM Professor p 
		 INNER JOIN Pessoa pe ON p.idPessoa = pe.idPessoa where prontuario = 1000;
--3
SELECT pe.nome, pe.sobrenome, p.prontuario, dbo.TempoNaEscola(prontuario) as [Tempo na Escola], p.dataSaida FROM Professor p 
		 INNER JOIN Pessoa pe ON p.idPessoa = pe.idPessoa where prontuario = 1270;
--4
SELECT pe.nome, pe.sobrenome, p.prontuario, dbo.TempoNaEscola(prontuario) as [Tempo na Escola], p.dataSaida FROM Professor p 
		 INNER JOIN Pessoa pe ON p.idPessoa = pe.idPessoa;

--FUNCTION 5  ARRUMAR PQ N FUNCIONA
--Função para calcular a média das notas dos alunos
GO
CREATE FUNCTION calculaMedia (@prontuario int, @idDisciplina int)
RETURNS FLOAT
AS
begin
	declare @n1 float;
	declare @n2 float;
	declare @n3 float;
	declare @n4 float;
	SELECT @n1 = n1 FROM Notas where @prontuario = prontuario AND @idDisciplina = idDisciplina;
	SELECT @n2 = n2 FROM Notas where @prontuario = prontuario AND @idDisciplina = idDisciplina;
	SELECT @n3 = n3 FROM Notas where @prontuario = prontuario AND @idDisciplina = idDisciplina;
	SELECT @n4 = n4 FROM Notas where @prontuario = prontuario AND @idDisciplina = idDisciplina;
	/*set @n1 = (select n1 from Notas where @prontuario = prontuario and @idDisciplina = idDisciplina);
	set @n2 = (select n2 from Notas where @prontuario = prontuario and @idDisciplina = idDisciplina);
	set @n3 = (select n3 from Notas where @prontuario = prontuario and @idDisciplina = idDisciplina);
	set @n4 = (select n4 from Notas where @prontuario = prontuario and @idDisciplina = idDisciplina);*/

	declare @media float;
	SELECT @media = (n1+n2+n3+n4)/4 FROM Notas where @prontuario = prontuario AND @idDisciplina = idDisciplina;
	--set @media = (@n1+@n2+@n3+@n4)/4 ;
	IF (@media >= 7)   
	begin
	 --UPDATE Notas SET aprovado = 1 WHERE @prontuario = prontuario and @idDisciplina = idDisciplina;
     RETURN (SELECT n1, n2, n3, n4 FROM Notas where @prontuario = ( SELECT prontuario FROM Aluno WHERE @prontuario = Prontuario));
	end
     RETURN (SELECT n1, n2, n3, n4 FROM Notas where @prontuario = prontuario AND @idDisciplina = idDisciplina);
end



--iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
--VIEW 1
--View para mostrar os alunos e suas notas
GO
CREATE VIEW alunoNotas
AS
SELECT p.nomePessoa, p.sobrenome, a.prontuario, d.nome, n.n1, n.n2, n.n3, n.n4 FROM Pessoa p
INNER JOIN Aluno a ON p.idPessoa = a.idPessoa
INNER JOIN Notas n ON a.Prontuario = n.prontuario
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
INNER JOIN Professor p ON t.prontuarioProf = p.prontuario
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
SELECT m.prontuario, c.nomeCurso, p.nomePessoa, p.sobrenome FROM Matricula m 
INNER JOIN Aluno a ON m.prontuario = a.Prontuario
INNER JOIN Pessoa p ON a.idPessoa = p.idPessoa
INNER JOIN Curso c ON m.idCurso = c.idCurso;

--Consultando
SELECT * FROM alunoMatricula order by nomeCurso;
--Outra opcao
SELECT * FROM alunoMatricula;

/*
--iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
--TRIGGER 1
--Função para mostrar há quanto tempo o professor trabalha na escola em MESES
GO
CREATE TRIGGER atualizaAprovado
ON Notas
AFTER UPDATE, INSERT, DELETE
AS
DECLARE @n1 FLOAT;
DECLARE @n2 FLOAT;
DECLARE @n3 FLOAT;
DECLARE @n4 FLOAT;
DECLARE @media FLOAT;
SELECT @n1 = n1 FROM inserted;
SELECT @n2 = n2 FROM inserted;
SELECT @n3 = n3 FROM inserted;
SELECT @n4 = n4 FROM inserted;
SELECT @media = @media = (n1+n2+n3+n4)/4 FROM inserted;

UPDATE Notas SET aprovado = 1 WHERE ;
PRINT('A DATA DE MODIFICACAO FOI ATUALIZADA');


--TRIGGER 2		000000000000000000000000000000000000000000000000000000000000000000000000000000000
--Trigger para atualizar o numero de faltas
GO
CREATE TRIGGER atualizaPresencas
ON Frequencia
AFTER UPDATE
AS
DECLARE @presencas int;
DECLARE @faltas int;
SELECT @presencas = presencas FROM inserted;
UPDATE REPRESENTANTE SET dataDeAtualizacao = GETDATE() WHERE CODIGOREPRESENTANTE = @codigoRepresentante;
PRINT('A DATA DE MODIFICACAO FOI ATUALIZADA');

--TRIGGER 3		000000000000000000000000000000000000000000000000000000000000000000000000000000000
--Trigger para atualizar o numero de faltas
GO
drop TRIGGER dataDemissao
ON Professor
AFTER INSERT, UPDATE
AS
DECLARE @dataDemissao date;
DECLARE @prontuario int;
SELECT @dataDemissao = dataSaida FROM inserted;
UPDATE Professor SET dataSaida = @dataDemissao WHERE prontuario = @prontuario;
PRINT('A DATA DE DESLIGAMENTO FOI INSERIDA');

UPDATE Professor SET dataSaida = '2019-11-17' WHERE prontuario = 1000;
*/