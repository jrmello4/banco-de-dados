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
EXEC dbo.PrepararQuestao 9
GO
CREATE TABLE dbo.Monitoria (id_monitoria int not null, id_turma int not null, codigo varchar(20) not null, horas int not null, data_inicio date not null, situacao varchar(20) not null,

CONSTRAINT PK_Monitoria PRIMARY KEY (id_monitoria),
    CONSTRAINT FK_Monitoria_Turma FOREIGN KEY (id_turma) REFERENCES dbo.Turma(id_turma),
    CONSTRAINT UQ_Monitoria_Codigo UNIQUE (codigo),
    CONSTRAINT CK_Monitoria_Horas CHECK (horas > 0)


);

-- Exercicio 10
EXEC dbo.PrepararQuestao 10
GO
insert into dbo.Monitoria values (1, 10, 'MON-001', 8, '20261121', 'Planejada')
select * from dbo.Monitoria


-- Exercicio 11
EXEC dbo.PrepararQuestao 11
GO
select t.nome, m.id_matricula from dbo.Turma t INNER JOIN dbo.Matricula m on  t.id_turma = m.id_turma where m.nota is null and t.turno = 'noite'
order by t.nome, m.id_matricula

-- Exercicio 12
EXEC dbo.PrepararQuestao 12
GO
select a.nome as aluno, t.nome, m.nota from dbo.Aluno a inner join dbo.Matricula m on a.ra = m.ra_aluno inner join dbo.Turma t on m.id_turma = t.id_turma
where m.nota >= 8 and t.turno = 'noite'
order by t.nome, a.nome

-- Exercicio 13
EXEC dbo.PrepararQuestao 13
GO
select a.nome, p.valor, p.data_pagamento from dbo.Aluno a inner join dbo.Pagamento p on a.ra = p.ra_aluno where situacao = 'Pago' and data_pagamento is not null and a.cidade = 'Joinville'
order by data_pagamento asc, nome

-- Exercicio 14
EXEC dbo.PrepararQuestao 14
GO
select a.nome as aluno, count(a.ra) as total_matriculas from dbo.Aluno a inner join dbo.Matricula m on a.ra = m.ra_aluno
group by a.ra, a.nome
having count(a.ra) >=2 
order by nome

-- Exercicio 15
EXEC dbo.PrepararQuestao 15
GO
select t.nome, count(m.nota) as notas_lancadas, cast(AVG(m.nota) as decimal (10,2)) as media 
from dbo.Turma t inner join dbo.Matricula m on t.id_turma = m.id_turma where m.nota is not null
group by t.id_turma, t.nome
having count(m.nota) >= 2 and AVG(m.nota) >= 8
order by media desc, t.nome asc

-- Exercicio 16
EXEC dbo.PrepararQuestao 16
GO
select top 2 t.nome, count(*) as total_matriculas from dbo.Turma t inner join dbo.Matricula m
on t.id_turma = m.id_turma  
group by t.id_turma, t.nome
order by total_matriculas desc, t.id_turma asc

-- Exercicio 17
EXEC dbo.PrepararQuestao 17
GO
select a.cidade, count(*) as qtd_pagamentos, cast(sum(p.valor) as decimal(10,2)) as total_recebido from dbo.Aluno a
inner join dbo.Pagamento p on a.ra = p.ra_aluno where p.situacao = 'Pago' and p.data_pagamento is not null
group by a.cidade
having sum(p.valor) >= 250
order by qtd_pagamentos desc

-- Exercicio 18

