SHOW CREATE TABLE Pessoa;
select * from Pessoa;
SELECT 
    pj.codigo, pj.cnpj, 
    p.nome, p.telefone, p.rua, p.numero, p.cidade, p.estado
FROM 
    PessoaJuridica pj
JOIN 
    Pessoa p ON pj.codigo = p.codigo;
SELECT p.codigo, p.nome, p.telefone, p.rua, p.numero, p.cidade, p.estado, pf.rg, pf.cpf
FROM Pessoa p
JOIN PessoaFisica pf ON p.codigo = pf.codigo;
SHOW CREATE TABLE Conta;
SHOW CREATE TABLE Contaespecial;
SHOW CREATE TABLE Poupanca;
SELECT * FROM conta;
-- Mostra todas as contas especiais com seus limites
SELECT ce.numero, ce.limite, c.data_abertura, c.saldo, c.codigo_pessoa
FROM contaespecial ce
JOIN conta c ON ce.numero = c.numero;
SELECT p.numero, p.data_aniversario, c.saldo, c.data_abertura
FROM poupanca p
JOIN conta c ON p.numero = c.numero;
SELECT * FROM poupanca;
