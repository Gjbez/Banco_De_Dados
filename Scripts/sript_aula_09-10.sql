-- exclusão das tabelas
drop table filme_ator;
drop table filme;
drop table ator;
drop table censura;
drop table genero;

-- criação da tabela genero
CREATE TABLE genero
(cd_genero INTEGER,
 ds_genero VARCHAR(30)
);

-- criação da tabela censura
CREATE TABLE censura
(cd_censura INTEGER,
 ds_censura VARCHAR(30)
);

-- criação da tabela ator
CREATE TABLE ator
(cd_ator   INTEGER,
 nm_ator   VARCHAR(50)
);

-- criação da tabela filme
CREATE TABLE filme
(cd_filme      INTEGER,
 cd_censura    INTEGER,
 cd_genero     INTEGER,
 nm_filme      VARCHAR(50),
 ds_sinopse    VARCHAR(250),
 nr_duracao	   VARCHAR(20),
 dt_lancamento DATE,
 fl_dublado    CHAR(1)
);

-- criação da tabela filme_ator
CREATE TABLE filme_ator
(cd_filme   INTEGER,
 cd_ator    integer
);
