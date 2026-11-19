USE Treino_BD1_20_Questoes;
GO
-- Exercicio 1
EXEC dbo.PrepararQuestao 1;
GO
SELECT nome, idade FROM dbo.Aluno WHERE cidade = 'Joinville' AND idade > 20
ORDER BY nome
-- Exercicio 2
EXEC dbo.PrepararQuestao 2;
GO
SELECT TOP 3 ra, nome, data_cadastro FROM dbo.Aluno where data_cadastro between '20260801' and '20260815'
ORDER BY data_cadastro
-- Exercicio 3
EXEC dbo.PrepararQuestao 3;
GO
SELECT ra, UPPER(nome) as nome_maiusculo, LOWER(email) as email_minusculo, LEFT(nome, 3) as prefixo, LEN(nome) as tamanho_nome FROM dbo.Aluno
ORDER BY nome_maiusculo
-- Exercicio 4
EXEC dbo.PrepararQuestao 4;
GO
SELECT nome, MONTH(data_nascimento) as mes, DAY(data_nascimento) as dia, YEAR(data_nascimento) as ano FROM dbo.Aluno WHERE MONTH(data_nascimento) = 9
ORDER BY dia, nome
-- Exercicio 5
EXEC dbo.PrepararQuestao 5;
GO
SELECT count(id_turma) as total_matriculas, count(nota) as notas_lancadas, COUNT() - COUNT(nota) AS notas_pendentes, MIN(nota) as menor_nota, MAX(nota) as maior_nota, CAST(AVG(nota) AS decimal(4,2)) as nota_media FROM dbo.Matricula where id_turma = 10
-- Exercicio 6
EXEC dbo.PrepararQuestao 6;
GO
SELECT id_turma, COUNT() as total_matriculas FROM dbo.Matricula
GROUP BY id_turma
HAVING COUNT() >= 4
ORDER BY total_matriculas DESC, id_turma
-- Exercicio 7
EXEC dbo.PrepararQuestao 7;
GO
INSERT INTO dbo.Aluno(ra, nome, idade, cidade, email, data_nascimento, data_cadastro)
VALUES (1099, 'Marina Lopes', 22, 'Blumenau', 'MARINA@EXEMPLO.COM', '20030420', '20261120')
select * FROM dbo.Aluno where ra = 1099
UPDATE dbo.Aluno SET idade = 23, cidade = 'Joinville'
select ra, nome, idade, cidade FROM dbo.Aluno where ra = 1099
-- Exercicio 8
EXEC dbo.PrepararQuestao 8;
GO
UPDATE dbo.Pagamento SET data_pagamento = '20261120', situacao = 'Pago' where id_pagamento = 9002
DELETE FROM dbo.Pagamento WHERE id_pagamento = 9007
select * from dbo.Pagamento
-- Exercicio 9
EXEC dbo.PrepararQuestao 10
GO
CREATE TABLE dbo.Monitoria (id_monitoria int not null, id_turma int not null, codigo varchar(20) not null, horas int not null, data_inicio date not null, situacao varchar(20) not null,

CONSTRAINT PK_Monitoria PRIMARY KEY (id_monitoria),
    CONSTRAINT FK_Monitoria_Turma FOREIGN KEY (id_turma) REFERENCES dbo.Turma(id_turma),
    CONSTRAINT UQ_Monitoria_Codigo UNIQUE (codigo),
    CONSTRAINT CK_Monitoria_Horas CHECK (horas > 0)


);

insert into dbo.Monitoria values (1, 10, 'MON-001', 8, '20261121', 'Planejada')
select * from dbo.Monitoria


