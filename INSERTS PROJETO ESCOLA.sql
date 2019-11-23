use PROJETOESCOLA;

GO
INSERT INTO Estado([idEstado],[nome],[sigla]) VALUES
(1,'São Paulo','SP'),(2,'Paraná','PR'),(3,'Maranhão','MA'),(4,'Minas Gerais','MG'),
(5,'Acre','AC'),(6,'Alagoas','AL'),(7,'Amapá','AP'),
(8,'Amazonas','AM'),(9,'Bahia','BA'),(10,'Ceará','CE'),
(11,'Distrito Federal','DF'),(12,'Espírito Santo','ES'),(13,'Goiás','GO'),
(14,'Mato Grosso','MT'),(15,'Mato Grosso do Sul','MS'),(16,'Pará','PA'),
(17,'Paraíba','PB'), (18,'Pernambuco','PE'),(19,'Piauí','PI'),(20,'Rio de Janeiro','RJ'),
(21,'Rio Grande do Norte','RN'),(22,'Rio Grande do Sul','RS'),
(23,'Rondônia','RO'),(24,'Roraima','RR'),(25,'Santa Catarina','SC'),
(26,'Sergipe','SE'),(27,'Tocantins','TO');

GO
INSERT INTO Endereco([idEndereco],[rua],[bairro],[numero],[complemento],[CEP],[idEstado],[cidade]) VALUES
(1,'Rua da Graça','Azul',73,NULL,'96456958',22,'Caxias do Sul'),
(2,'Rua Limão','Verde',40,NULL ,'18455139',1,'Ribeirão Preto'),
(3,'Rua Laranja','Amarelo',19,NULL,'30051385',4,'Governador Valadares'),
(4,'Rua Manga','Laranja',43,NULL,'61938813',10,'Crato'),
(5,'Rua Morango','Vermelho',92,NULL,'91231918',22,'Porto Alegre'),
(6,'Rua Linguiça','Marrom',45,NULL,'63352300',10,'Juazeiro do Norte'),
(7,'Rua Manteiga','Preto',45,NULL,'14778142',1,'Ribeirão Preto'),
(8,'Rua Margarina','Rosa',98,NULL,'83993140',2,'Ponta Grossa'),
(9,'Rua Uva','Massa',2,NULL,'17025932',1,'Piracicaba'),
(10,'Rua Água','Gravida',56,NULL,'89380977',25,'Joinville'),
(11,'Rua Rio doce','Semper',99,NULL,'45694544',9,'Juazeiro'),
(12,'Avenida Raimundo','PC',32,NULL,'23834690',20,'Niterói'),
(13,'Avenida Bola de Cristal','Noki',58,NULL,'89396120',25,'Florianópolis'),
(14,'Avenida SQL Server','Ipsum',42,NULL,'42388467',9,'Salvador'),
(15,'Avenida MySQL','Aliqueta',40,NULL,'20436984',20,'São Gonçalo'),
(16,'Alameda Nothmann','Matti',15,NULL,'48222824',9,'Itabuna'),
(17,'Alameda dos Santos','Sagitti',92,NULL,'19954782',1,'Ribeirão Preto'),
(18,'Alameda da Silva','Pretium',3,NULL,'11580196',1,'Osasco'),
(19,'Alameda Ribeiro','Industries',20,NULL,'58985450',17,'Santa Rita'),
(20,'Rua Macarrão','Aenean',93,NULL,'30654436',4,'Montes Claros'),
(21,'Rua Arroz','Male',18,NULL,'66238148',16,'Marabá'),
(22,'Rua Feijão','Miado',12,NULL,'83782214',2,'São José dos Pinhais'),
(23,'Rua Peixe','Lorem',6,NULL,'86240364',2,'Colombo'),
(24,'Rua Carne','Cursus',4,NULL,'89448794',25,'Itajaí'),
(25,'Rua Salsicha','Cinza',32,NULL,'17321703',1,'Diadema'),
(26,'Rua Yakisoba','Sedento',66,NULL,'15430026',1,'Mauá'),
(27,'Avenida Gohan','Interdum',23,NULL,'14417276',1,'Mauá'),
(28,'Avenida Tilápia','Libero',25,NULL,'43638312',9,'Feira de Santana'),
(29,'Avenida Salmão','Nunca',97,NULL,'44001191',9,'Vitória da Conquista'),
(30,'Avenida Pacu','Netus',63,NULL,'21960912',20,'Belford Roxo'),
(31,'Alameda Carpa','Turpis ',30,NULL,'41383694',9,'Lauro de Freitas'),
(32,'Alameda Bagre','Pellentesque',70,NULL,'63508585',10,'Juazeiro do Norte'),
(33,'Alameda Catfish','Augue',40,NULL,'22482941',20,'Rio de Janeiro'),
(34,'Alameda Pintado','Arco',63,NULL,'76773087',13,'Aparecida de Goiânia'),
(35,'Avenida Piau','Accusa',14,NULL,'21449958',20,'Nova Iguaçu'),
(36,'Rua Tucunaré','Lacus',33,NULL,'36294883',4,'Betim'),
(37,'Rua Tambaqui','Nulla',7,NULL,'24842992',20,'Niterói'),
(38,'Rua Carangueijo','Faucibus',66,NULL,'39970654',4,'Ribeirão das Neves'),
(39,'Rua Golfinho','Quisque',92,NULL,'76792057',13,'Valparaíso de Goiás'),
(40,'Rua Tubarão','Sagitário',19,NULL,'12178994',1,'Carapicuíba');

GO
INSERT INTO Pessoa([idPessoa],[idEndereco],[nomePessoa],[sobrenome],[CPF],[RG],[sexo]) VALUES
(1,1,'Nevada','Eaton','16830712791','495887197','F'),
(2,2,'Ariana','Berg','16330109944','352275581','F'),
(3,3,'Nicholas','Crosby','16870115346','210780228','M'),
(4,4,'Rhiannon','Brooks','16920412731','68903599','M'),
(5,5,'Harrison','Davis','16760422859','179110059','M'),
(6,6,'Sharon','Mckee','16821122733','213974661','F'),
(7,7,'Adena','Finley','16871107969','356840644','F'),
(8,8,'Myles','Dickson','16231111296','435235611','M'),
(9,9,'Beau','Adams','16251106792','480249887','M'),
(10,10,'Carissa','Mccarthy','16061017533','241571939','F'),
(11,11,'Sawyer','Lane','16810311036','218002323','M'),
(12,12,'Lucy','Alvarado','16060107734','443792856','F'),
(13,13,'Harriet','Cross','16560811353','290982766','M'),
(14,14,'Giacomo','Moon','16440822231','131128363','M'),
(15,15,'Victor','Maldonado','16301024549','121902389','M'),
(16,16,'Baxter','Bender','16940120968','216278895','M'),
(17,17,'Madeline','House','16691113518','389437905','F'),
(18,18,'Jasmine','Holcomb','16660728770','280591130','F'),
(19,19,'Chancellor','Kinney','16350816126','435110665','M'),
(20,20,'Mercedes','Dudley','16590704180','105454619','M'),
(21,21,'Nelle','Bowen','16590422558','139438981','F'),
(22,22,'Wyatt','Yang','16951209596','297226886','F'),
(23,23,'Eric','Valdez','16640715180','383268893','M'),
(24,24,'Marvin','Hooper','16720121218','157030884','M'),
(25,25,'David','Hess','16311024546','318084750','M'),
(26,26,'Nichole','Orr','16641019645','483300743','F'),
(27,27,'Hakeem','Waters','16660418836','348733125','F'),
(28,28,'Trevor','Solis','16691016671','307323060','M'),
(29,29,'Craig','Davis','16220705685','286440711','M'),
(30,30,'Evangeline','Moore','16071105169','348851454','F'),
(31,31,'Lydia','Dominguez','16370523323','297918807','F'),
(32,32,'Trevor','Conrad','16140108571','378170249','M'),
(33,33,'Ronan','Ramirez','16370321533','481444251','M'),
(34,34,'Ashely','Blake','16770715999','121593706','F'),
(35,35,'Violet','Potts','16201217704','324332014','F'),
(36,36,'Victor','Gonzales','16440108065','411105584','M'),
(37,37,'Isabelle','Figueroa','16101124612','239487297','F'),
(38,38,'Guy','Leonard','16240109233','64639349','M'),
(39,39,'Amanda','Kane','16460919809','94942845','F'),
(40,40,'Erich','Barron','16340415750','232023317','M');

GO
INSERT INTO Aluno([idPessoa],[ProntuarioAluno]) VALUES
(1,100),(2,105),(3,110),(4,115),(5,120),(6,125),(7,130),(8,135),(9,140),(10,145),
(11,150),(12,155),(13,160),(14,165),(15,170),(16,175),(17,180),(18,185),(19,190),(20,195),
(21,200),(22,205),(23,210),(24,215),(25,220),(26,225),(27,230),(28,235),(29,240),(30,245);

GO
INSERT INTO Departamento([idDepartamento],[sigla],[descricao]) VALUES
(10,'EXA','Exatas'),
(20,'HUM','Humanas'),
(30,'BIO','Biológicas'),
(40,'OUT','Outros');

GO
INSERT INTO Professor([prontuarioProf],[IdPessoa],[salario],[dataEntrada],[dataSaida],[idDepartamento],[titulacao]) VALUES
(1000,31,9447,'2006-03-13',NULL,10,'Graduação'),
(1030,32,1249.5,'2012-03-31',NULL,20,'Pós-Graduação'),
(1060,33,8650,'2006-10-14',NULL,30,'Graduação'),
(1090,34,8862,'2016-05-04',NULL,40,'Pós-Graduação'),
(1120,35,1223.77,'2016-07-04',NULL,10,'Pós-Graduação'),
(1150,36,14240,'2010-08-09',NULL,20,'Mestre'),
(1180,37,11510,'2012-04-19',NULL,30,'Graduação'),
(1210,38,11491,'2002-11-05',NULL,40,'Mestre'),
(1240,39,1438.09,'2016-12-05 ',NULL,10,'Doutor'),
(1270,40,11645.45,'2015-06-27 ','2018-12-15',20,'Doutor');

GO
INSERT INTO Telefone([idTelefone],[IdPessoa],[DDD],[numero]) VALUES
(2000,1,12,910000000),(2001,2,13,913450078),(2002,3,14,950000156),
(2003,4,15,910000234),(2004,5,16,91543312),(2005,6,17,950000390),
(2006,7,18,910000468),(2007,8,19,918760546),(2008,9,20,910000624),(2009,10,21,910000702),
(2010,11,22,910000780),(2011,12,23,910909858),(2012,13,24,910000936),
(2013,14,25,910001014),(2014,15,26,920001092),(2015,16,27,960001170),
(2016,17,28,910001248),(2017,18,29,920001326),(2018,19,30,960001404),(2019,20,31,910001482),
(2020,21,32,910001560),(2021,22,33,930001638),(2022,23,34,970001716),
(2023,24,35,910001794),(2024,25,36,930001872),(2025,26,37,970001950),
(2026,27,38,910002028),(2027,28,39,940002106),(2028,29,40,970002184),(2029,30,41,910002262),
(2030,31,42,910002340),(2031,32,43,940002418),(2032,33,44,980002496),
(2033,34,45,910002574),(2034,35,46,940002652),(2035,36,47,980002730),
(2036,37,48,910002808),(2037,38,49,940002886),(2038,39,50,990002964),(2039,40,51,990003042);

GO
INSERT INTO Curso([idCurso],[nomeCurso],[sigla],[totalSemestres]) VALUES
(300,'Análise de Sistemas','ADS',6),(310,'Ciência da Computação','CC',8),(320,'Sistemas da Informação','SI',6),
(330,'Informática','INFO',5),(340,'Tecnologia e Ciência','TUR',5),(350,'Engenharia Tecnomecânica','EM',8),
(360,'Engenharia da Informação','EQ',8),(370,'Engenharia de Hardware','EP',8),(380,'Administração Tecnológica','ADM',8),(390,'Medicina Tecnológica','MED',10);

GO
INSERT INTO Matricula([matricula],[ProntuarioAluno],[idCurso]) VALUES
(100,100,300),(105,105,320),(110,110,340),(115,115,360),(120,120,380),
(125,125,300),(130,130,320),(135,135,340),(140,140,360),(145,145,380),
(150,150,300),(155,155,320),(160,160,340),(165,165,360),(170,170,380),
(175,175,310),(180,180,330),(185,185,350),(190,190,370),(195,195,390),
(200,200,310),(205,205,330),(210,210,350),(215,215,370),(220,220,390),
(225,225,310),(230,230,330),(235,235,350),(240,240,370),(245,245,390);

GO
INSERT INTO CordenadorCurso([idCordenadorCurso],[prontuarioProf],[idCurso],[dataEntrada],[dataSaida],[comissao]) VALUES
(1000,1000,300,'2019-09-11',NULL,0.3),
(1030,1030,310,'2020-03-02',NULL,0.1),
(1060,1060,320,'2019-11-14',NULL,0.1),
(1090,1090,330,'2018-11-17',NULL,0.2),
(1120,1120,340,'2020-02-14',NULL,0.1),
(1150,1150,350,'2020-02-10',NULL,0.2),
(1180,1180,360,'2020-06-19',NULL,0.1),
(1210,1210,370,'2020-04-16',NULL,0.3),
(1240,1240,380,'2019-09-28',NULL,0.1),
(1270,1270,390,'2019-06-07','2018-12-15',0.5);

GO
INSERT INTO Disciplina([idDisciplina],[codigo],[nome],[cargaHoraria],[aulas]) VALUES
(10,'MAT','Matemática',300,300),
(11,'LOP','Lógica de Programação',500,500),
(12,'LGP','Linguagem de Programação',500,500),
(13,'BD','Banco de Dados',500,500),
(14,'ADM','Administração',100,100),
(15,'ING','Inglês',100,100),
(16,'WEB','Desenvolvimento Web',100,100),
(17,'SEG','Segurança da Informação',100,100),
(18,'HIS','História',100,100),
(19,'PS','Primeiros Socorros',100,100);

GO
INSERT INTO CurriculoCurso([idCurso],[idDisciplina],[semestre]) VALUES
(300,10,1),(300,11,2),(300,12,3),(300,13,4),(300,14,5),(300,15,6),
(310,10,1),(310,11,2),(310,12,3),(310,13,4),(310,14,5),(310,15,6),(310,16,7),(310,17,8),
(320,10,1),(320,11,2),(320,12,3),(320,13,4),(320,14,5),(320,15,6),
(330,10,1),(330,11,2),(330,12,3),(330,13,4),(330,14,5),
(340,10,1),(340,11,2),(340,12,3),(340,13,4),(340,14,5),
(350,10,1),(350,11,2),(350,12,3),(350,13,4),(350,14,5),(350,15,6),(350,16,7),(350,17,8),
(360,10,1),(360,11,2),(360,12,3),(360,13,4),(360,14,5),(360,15,6),(360,16,7),(360,17,8),(360,18,8),(360,19,8),
(370,10,1),(370,11,2),(370,12,3),(370,13,4),(370,14,5),(370,15,6),(370,16,7),(370,17,8),
(380,10,1),(380,11,2),(380,12,3),(380,13,4),(380,14,5),(380,15,6),(380,16,7),(380,17,8),
(390,10,1),(390,11,2),(390,12,3),(390,13,4),(390,14,5),(390,15,6),(390,16,7),(390,17,8),(390,18,9),(390,19,10);

GO
UPDATE curriculoCurso SET vagas = 15 WHERE idCurso = 300;
GO
UPDATE curriculoCurso SET vagas = 15 WHERE idCurso = 310;
GO
UPDATE curriculoCurso SET vagas = 15 WHERE idCurso = 320;
GO
UPDATE curriculoCurso SET vagas = 15 WHERE idCurso = 330;
GO
UPDATE curriculoCurso SET vagas = 15 WHERE idCurso = 340;
GO
UPDATE curriculoCurso SET vagas = 15 WHERE idCurso = 350;
GO
UPDATE curriculoCurso SET vagas = 15 WHERE idCurso = 360;
GO
UPDATE curriculoCurso SET vagas = 15 WHERE idCurso = 370;
GO
UPDATE curriculoCurso SET vagas = 15 WHERE idCurso = 380;
GO
UPDATE curriculoCurso SET vagas = 15 WHERE idCurso = 390;

GO
INSERT INTO Turma([idTurma],[idDisciplina],[periodo],[prontuarioProf]) VALUES
(700,10,'M',1000),
(701,11,'M',1030),
(702,12,'M',1060),
(703,13,'M',1090),
(704,14,'M',1120),
(705,15,'M',1150),
(706,16,'M',1180),
(707,17,'M',1210),
(708,18,'M',1240),
(709,19,'M',1270),
(710,10,'N',1000),
(711,11,'N',1030),
(712,12,'N',1060),
(713,13,'N',1090),
(714,14,'N',1120),
(715,15,'N',1150),
(716,16,'N',1180),
(717,17,'N',1210),
(718,18,'N',1240),
(719,19,'N',1270);

GO
INSERT INTO turmaAluno([idTurmaAluno],[ProntuarioAluno],[idTurma]) VALUES
(700,100,700),(701,105,701),(702,110,702),
(703,115,703),(704,120,704),(705,125,705),
(706,130,706),(707,135,707),(708,140,708),(709,145,709),
(710,150,710),(711,155,711),(712,160,712),
(713,165,713),(714,170,714),(715,175,715),
(716,180,716),(717,185,717),(718,190,718),(719,195,719),
(720,200,700),(721,205,701),(722,210,702),
(723,215,703),(724,220,704),(725,225,705),
(726,230,706),(727,235,707),(728,240,708),(729,245,709);

GO
INSERT INTO Frequencia([idFrequencia],[idTurmaAluno],[presencas]) VALUES
(800,700,1876),(805,701,1723),(810,702,1341),
(815,703,1156),(820,704,1543),(825,705,1643),
(830,706,1469),(835,707,1985),(840,708,1334),(845,709,1743),
(850,710,1577),(855,711,1978),(860,712,1189),
(865,713,1409),(870,714,1256),(875,715,1499),
(880,716,1680),(885,717,1497),(890,718,1721),(895,719,1549),
(900,720,1320),(905,721,1817),(910,722,1129),
(915,723,1932),(920,724,1214),(925,725,1266),
(930,726,1447),(935,727,1765),(940,728,1375),(945,729,1226);

GO 
UPDATE Curso SET nivel = 'Tecnologo' WHERE idCurso = 300;
GO 
UPDATE Curso SET nivel = 'Tecnologo' WHERE idCurso = 340;
GO 
UPDATE Curso SET nivel = 'Superior' WHERE idCurso = 310;
GO 
UPDATE Curso SET nivel = 'Superior' WHERE idCurso = 320;
GO 
UPDATE Curso SET nivel = 'Superior' WHERE idCurso = 350;
GO 
UPDATE Curso SET nivel = 'Superior' WHERE idCurso = 360;
GO 
UPDATE Curso SET nivel = 'Superior' WHERE idCurso = 370;
GO 
UPDATE Curso SET nivel = 'Superior' WHERE idCurso = 380;
GO 
UPDATE Curso SET nivel = 'Superior' WHERE idCurso = 390;
GO 
UPDATE Curso SET nivel = 'Tecnico' WHERE idCurso = 330;
GO 
UPDATE Curso SET sigla = 'TEC' WHERE idCurso = 340;
GO 
UPDATE Curso SET sigla = 'ET' WHERE idCurso = 350;
GO 
UPDATE Curso SET sigla = 'EI' WHERE idCurso = 360;
GO 
UPDATE Curso SET sigla = 'EH' WHERE idCurso = 370;

GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,100,6,2,8,7,NULL),
(11,100,3,6,9,10,NULL),
(12,100,10,5,4,8,NULL),
(13,100,1,1,7,6,NULL),
(14,100,2,9,6,6,NULL),
(15,100,7,7,3,5,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,105,4,2,6,6,NULL),
(11,105,4,1,2,9,NULL),
(12,105,7,10,9,10,NULL),
(13,105,10,1,9,4,NULL),
(14,105,3,9,9,1,NULL),
(15,105,10,1,6,10,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,110,4,6,1,3,NULL),
(11,110,1,4,8,6,NULL),
(12,110,1,6,7,8,NULL),
(13,110,6,1,5,10,NULL),
(14,110,9,10,6,2,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,115,9,2,2,10,NULL),
(11,115,7,9,1,3,NULL),
(12,115,3,5,4,10,NULL),
(13,115,2,9,4,9,NULL),
(14,115,5,7,6,4,NULL),
(15,115,2,3,6,8,NULL),
(16,115,8,5,4,1,NULL),
(17,115,3,10,3,5,NULL),
(18,115,10,1,6,10,NULL),
(19,115,8,6,8,8,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,120,7,5,8,4,NULL),
(11,120,4,6,8,2,NULL),
(12,120,10,5,5,6,NULL),
(13,120,6,6,8,2,NULL),
(14,120,10,3,1,3,NULL),
(15,120,9,2,4,4,NULL),
(16,120,7,8,4,6,NULL),
(17,120,9,1,5,2,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,125,2,3,7,10,NULL),
(11,125,8,1,7,9,NULL),
(12,125,9,10,6,9,NULL),
(13,125,9,10,9,9,NULL),
(14,125,10,7,1,7,NULL),
(15,125,1,2,4,2,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,130,2,1,10,5,NULL),
(11,130,8,10,10,4,NULL),
(12,130,4,5,3,6,NULL),
(13,130,6,3,2,1,NULL),
(14,130,7,1,2,8,NULL),
(15,130,1,8,2,10,NULL);
go
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,135,8,3,9,2,NULL),
(11,135,3,2,7,1,NULL),
(12,135,8,3,6,3,NULL),
(13,135,1,1,3,9,NULL),
(14,135,7,5,1,4,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,140,5,4,3,5,NULL),
(11,140,6,8,2,10,NULL),
(12,140,6,5,6,2,NULL),
(13,140,3,1,4,9,NULL),
(14,140,1,8,8,8,NULL),
(15,140,4,3,5,10,NULL),
(16,140,3,7,6,8,NULL),
(17,140,1,5,6,1,NULL),
(18,140,1,8,10,4,NULL),
(19,140,1,9,3,9,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,145,5,4,1,6,NULL),
(11,145,9,7,3,9,NULL),
(12,145,9,7,10,2,NULL),
(13,145,10,8,1,1,NULL),
(14,145,10,10,9,8,NULL),
(15,145,7,8,1,7,NULL),
(16,145,6,1,3,6,NULL),
(17,145,10,9,5,6,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,150,5,4,1,4,NULL),
(11,150,9,6,8,7,NULL),
(12,150,3,10,9,8,NULL),
(13,150,5,2,2,3,NULL),
(14,150,5,7,7,8,NULL),
(15,150,9,6,8,7,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,155,2,9,5,8,NULL),
(11,155,2,8,5,2,NULL),
(12,155,2,8,9,1,NULL),
(13,155,2,8,6,9,NULL),
(14,155,3,8,3,8,NULL),
(15,155,2,6,6,5,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,160,6,2,8,7,NULL),
(11,160,3,6,9,10,NULL),
(12,160,10,5,4,8,NULL),
(13,160,1,1,7,6,NULL),
(14,160,2,9,6,6,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,165,4,2,6,6,NULL),
(11,165,4,1,2,9,NULL),
(12,165,7,10,9,10,NULL),
(13,165,10,1,9,4,NULL),
(14,165,3,9,9,1,NULL),
(15,165,10,1,6,10,NULL),
(16,165,4,2,9,4,NULL),
(17,165,3,6,1,2,NULL),
(18,165,8,9,4,4,NULL),
(19,165,8,5,10,9,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,170,4,6,1,3,NULL),
(11,170,1,4,8,6,NULL),
(12,170,1,6,7,8,NULL),
(13,170,6,1,5,10,NULL),
(14,170,9,10,6,2,NULL),
(15,170,5,6,9,3,NULL),
(16,170,7,1,3,3,NULL),
(17,170,7,10,4,7,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,175,9,2,2,10,NULL),
(11,175,7,9,1,3,NULL),
(12,175,3,5,4,10,NULL),
(13,175,2,9,4,9,NULL),
(14,175,5,7,6,4,NULL),
(15,175,2,3,6,8,NULL),
(16,175,8,5,4,1,NULL),
(17,175,3,10,3,5,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,180,7,5,8,4,NULL),
(11,180,4,6,8,2,NULL),
(12,180,10,5,5,6,NULL),
(13,180,6,6,8,2,NULL),
(14,180,10,3,1,3,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,185,2,3,7,10,NULL),
(11,185,8,1,7,9,NULL),
(12,185,9,10,6,9,NULL),
(13,185,9,10,9,9,NULL),
(14,185,10,7,1,7,NULL),
(15,185,1,2,4,2,NULL),
(16,185,5,8,8,10,NULL),
(17,185,7,6,8,10,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,190,2,1,10,5,NULL),
(11,190,8,10,10,4,NULL),
(12,190,4,5,3,6,NULL),
(13,190,6,3,2,1,NULL),
(14,190,7,1,2,8,NULL),
(15,190,1,8,2,10,NULL),
(16,190,5,5,5,7,NULL),
(17,190,8,1,2,7,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,195,8,3,9,2,NULL),
(11,195,3,2,7,1,NULL),
(12,195,8,3,6,3,NULL),
(13,195,1,1,3,9,NULL),
(14,195,7,5,1,4,NULL),
(15,195,6,5,2,3,NULL),
(16,195,3,5,9,6,NULL),
(17,195,8,6,5,2,NULL),
(18,195,5,4,7,5,NULL),
(19,195,3,10,1,9,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,200,5,4,3,5,NULL),
(11,200,6,8,2,10,NULL),
(12,200,6,5,6,2,NULL),
(13,200,3,1,4,9,NULL),
(14,200,1,8,8,8,NULL),
(15,200,4,3,5,10,NULL),
(16,200,3,7,6,8,NULL),
(17,200,1,5,6,1,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,205,5,4,1,6,NULL),
(11,205,9,7,3,9,NULL),
(12,205,9,7,10,2,NULL),
(13,205,10,8,1,1,NULL),
(14,205,10,10,9,8,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,210,5,4,1,4,NULL),
(11,210,9,6,8,7,NULL),
(12,210,3,10,9,8,NULL),
(13,210,5,2,2,3,NULL),
(14,210,5,7,7,8,NULL),
(15,210,9,6,8,7,NULL),
(16,210,4,6,10,3,NULL),
(17,210,7,1,2,5,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,215,2,9,5,8,NULL),
(11,215,2,8,5,2,NULL),
(12,215,2,8,9,1,NULL),
(13,215,2,8,6,9,NULL),
(14,215,3,8,3,8,NULL),
(15,215,2,6,6,5,NULL),
(16,215,7,2,8,1,NULL),
(17,215,3,3,3,3,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,220,5,4,1,4,NULL),
(11,220,9,6,8,7,NULL),
(12,220,3,10,9,8,NULL),
(13,220,5,2,2,3,NULL),
(14,220,5,7,7,8,NULL),
(15,220,9,6,8,7,NULL),
(16,220,4,6,10,3,NULL),
(17,220,7,1,2,5,NULL),
(18,220,3,6,1,10,NULL),
(19,220,1,8,4,7,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,225,2,9,5,8,NULL),
(11,225,2,8,5,2,NULL),
(12,225,2,8,9,1,NULL),
(13,225,2,8,6,9,NULL),
(14,225,3,8,3,8,NULL),
(15,225,2,6,6,5,NULL),
(16,225,7,2,8,1,NULL),
(17,225,3,3,3,3,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,230,6,2,8,7,NULL),
(11,230,3,6,9,10,NULL),
(12,230,10,5,4,8,NULL),
(13,230,1,1,7,6,NULL),
(14,230,2,9,6,6,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,235,4,2,6,6,NULL),
(11,235,4,1,2,9,NULL),
(12,235,7,10,9,10,NULL),
(13,235,10,1,9,4,NULL),
(14,235,3,9,9,1,NULL),
(15,235,10,1,6,10,NULL),
(16,235,4,2,9,4,NULL),
(17,235,3,6,1,2,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,240,4,6,1,3,NULL),
(11,240,1,4,8,6,NULL),
(12,240,1,6,7,8,NULL),
(13,240,6,1,5,10,NULL),
(14,240,9,10,6,2,NULL),
(15,240,5,6,9,3,NULL),
(16,240,7,1,3,3,NULL),
(17,240,7,10,4,7,NULL);
GO
INSERT INTO Notas([idDisciplina],[ProntuarioAluno],[n1],[n2],[n3],[n4],[aprovado]) VALUES
(10,245,9,2,2,10,NULL),
(11,245,7,9,1,3,NULL),
(12,245,3,5,4,10,NULL),
(13,245,2,9,4,9,NULL),
(14,245,5,7,6,4,NULL),
(15,245,2,3,6,8,NULL),
(16,245,8,5,4,1,NULL),
(17,245,3,10,3,5,NULL),
(18,245,10,1,6,10,NULL),
(19,245,8,6,8,8,NULL);
