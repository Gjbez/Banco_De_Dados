-- 01. Contar quantos animais são de pequeno porte.
SELECT nm_animal "Nome Animal", COUNT(*) "Quantidade"
FROM animal 
WHERE tp_porte = "G";

-- 02. Listar o valor total de notas fiscais emitidas por mês.
SELECT nf.dt_emissao, AVG(nf.vl_total)
FROM nota_fiscal nf
GROUP BY nf.dt_emissao;

-- 03. Listar o total de agendamentos realizados por cada prestador de serviço.
SELECT a.cd_prestador, COUNT(*)
FROM agendamento a
GROUP BY a.cd_prestador;

-- 04. Calcular o valor total dos serviços prestados por cada agendamento.
SELECT ags.nr_agendamento, ags.vl_servico, SUM(ags.vl_servico * ags.qt_servico)
FROM agendamento_servico ags
GROUP BY ags.nr_agendamento;

-- 05. Calcular a média de idade dos animais de cada raça.
SELECT a.cd_raca, AVG(20241127 - a.dt_nascimento)
FROM animal a
GROUP BY a.cd_raca;

-- 06. Listar o total de produtos cadastrados por categoria.
SELECT p.nm_produto, COUNT(*)
FROM produto p
GROUP BY p.cd_categoria;

-- 07. Listar as cidades com o número de clientes cadastrados, ordenando pelo maior número.
SELECT m.nm_municipio, COUNT(c.cd_cliente)
FROM cliente c, endereco e, municipio m 
WHERE c.cd_endereco = e.cd_endereco AND e.cd_municipio = m.cd_municipio;

-- 08. Calcular o valor total de vendas para cada cliente em notas fiscais.
SELECT c.nm_cliente, SUM(nf.vl_total)
FROM cliente c, nota_fiscal nf
WHERE c.cd_cliente = nf.cd_cliente;

-- 09. Obter o nome do prestador de serviço com o número de agendamentos.
SELECT p.nm_prestador, a.nr_agendamento
FROM prestador p, agendamento a
WHERE p.cd_prestador = a.cd_prestador
GROUP BY p.nm_prestador;

-- 10. Calcular a receita total de serviços prestados por cada prestador.
SELECT p.nm_prestador, s.vl_servico, SUM(s.vl_servico)
FROM prestador p, servico_prestador sp, servico s
WHERE p.cd_prestador = sp.cd_prestador AND sp.cd_servico = s.cd_servico
GROUP BY p.nm_prestador;

-- 11. Calcular o valor médio dos produtos vendidos por categoria.
SELECT c.ds_categoria, AVG(p.vl_venda)
FROM produto p, categoria c
WHERE p.cd_categoria = c.cd_categoria
GROUP BY c.cd_categoria;

-- 12. Listar os clientes (feito com prestador) que realizaram mais de 5 agendamentos.
SELECT p.nm_prestador, COUNT(a.nr_agendamento)
FROM prestador p, agendamento a
WHERE p.cd_prestador = a.cd_prestador
GROUP BY p.nm_prestador
HAVING COUNT(a.nr_agendamento) > 2;


-- 13. Calcular a receita média de cada prestador de serviço em agendamentos.
SELECT p.nm_prestador, AVG(ags.vl_servico)
FROM prestador p, agendamento a, agendamento_servico ags
WHERE p.cd_prestador = a.cd_prestador AND a.nr_agendamento = ags.nr_agendamento
GROUP BY p.nm_prestador;

-- 14. Listar as espécies com mais de 3 raças cadastradas.
SELECT e.nm_especie
FROM raca r, especie e
WHERE r.cd_especie = e.cd_especie
GROUP BY e.nm_especie
HAVING COUNT(r.cd_raca) > 3;

-- 15. Listar os clientes que possuem mais de um animal cadastrado.
SELECT c.nm_cliente
FROM cliente c, animal a
WHERE c.cd_cliente = a.cd_cliente
GROUP BY c.nm_cliente
HAVING COUNT(a.cd_animal) > 1;