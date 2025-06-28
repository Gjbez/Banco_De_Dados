-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-09-04 13:47:42.327

-- tables
-- Table: categoria
CREATE TABLE categoria (
    cd_categoria int  NOT NULL,
    nm_categoria varchar(30)  NOT NULL,
    CONSTRAINT categoria_pk PRIMARY KEY (cd_categoria)
);

-- Table: cliente
CREATE TABLE cliente (
    cd_cliente int  NOT NULL,
    nm_cliente Varchar(50)  NOT NULL,
    nr_telefone Varchar(15)  NOT NULL,
    ds_email Varchar(50)  NOT NULL,
    vl_limite decimal(8,2)  NOT NULL,
    CONSTRAINT cliente_pk PRIMARY KEY (cd_cliente)
);

-- Table: endereco
CREATE TABLE endereco (
    cd_endereco int  NOT NULL,
    nm_logradouro Varchar(50)  NOT NULL,
    ds_complemento varchar(30)  NOT NULL,
    nm_bairro Varchar(30)  NOT NULL,
    nr_cep char(8)  NOT NULL,
    cd_localidade int  NOT NULL,
    cd_cliente int  NOT NULL,
    CONSTRAINT endereco_pk PRIMARY KEY (cd_endereco)
);

-- Table: item_pedido
CREATE TABLE item_pedido (
    nr_pedido int  NOT NULL,
    cd_produto int  NOT NULL,
    qt_produto int  NOT NULL,
    vl_produto decimal(8,2)  NOT NULL,
    CONSTRAINT item_pedido_pk PRIMARY KEY (nr_pedido,cd_produto)
);

-- Table: localidade
CREATE TABLE localidade (
    cd_localidade int  NOT NULL,
    nm_localidade Varchar(50)  NOT NULL,
    sg_uf char(2)  NOT NULL,
    CONSTRAINT localidade_pk PRIMARY KEY (cd_localidade)
);

-- Table: pedido
CREATE TABLE pedido (
    nr_pedido int  NOT NULL,
    dt_emissao Date  NOT NULL,
    vl_total Decimal(8,2)  NOT NULL,
    cd_cliente int  NOT NULL,
    CONSTRAINT pedido_pk PRIMARY KEY (nr_pedido)
);

-- Table: produto
CREATE TABLE produto (
    cd_produto int  NOT NULL,
    ds_produto Varchar(50)  NOT NULL,
    qt_estoque int  NOT NULL,
    vl_produto decimal(8,2)  NOT NULL,
    cd_categoria int  NOT NULL,
    CONSTRAINT produto_pk PRIMARY KEY (cd_produto)
);

-- foreign keys
-- Reference: Table_8_pedido (table: item_pedido)
ALTER TABLE item_pedido ADD CONSTRAINT Table_8_pedido FOREIGN KEY Table_8_pedido (nr_pedido)
    REFERENCES pedido (nr_pedido);

-- Reference: Table_8_produto (table: item_pedido)
ALTER TABLE item_pedido ADD CONSTRAINT Table_8_produto FOREIGN KEY Table_8_produto (cd_produto)
    REFERENCES produto (cd_produto);

-- Reference: endereco_cliente (table: endereco)
ALTER TABLE endereco ADD CONSTRAINT endereco_cliente FOREIGN KEY endereco_cliente (cd_cliente)
    REFERENCES cliente (cd_cliente);

-- Reference: endereco_localidade (table: endereco)
ALTER TABLE endereco ADD CONSTRAINT endereco_localidade FOREIGN KEY endereco_localidade (cd_localidade)
    REFERENCES localidade (cd_localidade);

-- Reference: pedido_cliente (table: pedido)
ALTER TABLE pedido ADD CONSTRAINT pedido_cliente FOREIGN KEY pedido_cliente (cd_cliente)
    REFERENCES cliente (cd_cliente);

-- Reference: produto_categoria (table: produto)
ALTER TABLE produto ADD CONSTRAINT produto_categoria FOREIGN KEY produto_categoria (cd_categoria)
    REFERENCES categoria (cd_categoria);

-- End of file.

