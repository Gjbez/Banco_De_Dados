-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-09-11 13:31:17.048

-- tables
-- Table: aluno
CREATE TABLE aluno (
    cd_aluno int  NOT NULL,
    nm_aluno varchar(50)  NOT NULL,
    dt_nascimento date  NOT NULL,
    fl_genero char(1)  NOT NULL,
    nr_telefone varchar(15)  NOT NULL,
    ds_email varchar(50)  NOT NULL,
    vl_peso decimal(4,1)  NOT NULL,
    vl_altura decimal(3,2)  NOT NULL,
    cd_endereco int  NOT NULL,
    nr_cartao int  NOT NULL,
    cd_profissao int  NOT NULL,
    cd_nivel_escolaridade int  NOT NULL,
    cd_plano int  NOT NULL,
    tp_pagamento char(1)  NOT NULL,
    CONSTRAINT aluno_pk PRIMARY KEY (cd_aluno)
);

-- Table: endereco
CREATE TABLE endereco (
    cd_endereco int  NOT NULL,
    ds_logradouro varchar(50)  NOT NULL,
    ds_complemento varchar(30)  NOT NULL,
    nm_bairro varchar(30)  NOT NULL,
    nr_cep char(8)  NOT NULL,
    cd_municipio int  NOT NULL,
    CONSTRAINT endereco_pk PRIMARY KEY (cd_endereco)
);

-- Table: instrutor
CREATE TABLE instrutor (
    cd_instrutor int  NOT NULL,
    nm_instrutor varchar(50)  NOT NULL,
    fl_genero char(1)  NOT NULL,
    nr_telefone varchar(15)  NOT NULL,
    ds_email varchar(50)  NOT NULL,
    cd_endereco int  NOT NULL,
    CONSTRAINT instrutor_pk PRIMARY KEY (cd_instrutor)
);

-- Table: matricula
CREATE TABLE matricula (
    cd_aluno int  NOT NULL,
    cd_turma int  NOT NULL,
    dt_matricula date  NOT NULL,
    CONSTRAINT matricula_pk PRIMARY KEY (cd_aluno,cd_turma)
);

-- Table: modalidade
CREATE TABLE modalidade (
    cd_modalidade int  NOT NULL,
    nm_modalidade varchar(50)  NOT NULL,
    ds_detalhamento varchar(100)  NOT NULL,
    CONSTRAINT modalidade_pk PRIMARY KEY (cd_modalidade)
);

-- Table: modalidade_instrutor
CREATE TABLE modalidade_instrutor (
    cd_modalidade int  NOT NULL,
    cd_instrutor int  NOT NULL,
    CONSTRAINT modalidade_instrutor_pk PRIMARY KEY (cd_modalidade,cd_instrutor)
);

-- Table: municipio
CREATE TABLE municipio (
    cd_municipio int  NOT NULL,
    nm_municipio varchar(50)  NOT NULL,
    sg_uf char(2)  NOT NULL,
    CONSTRAINT municipio_pk PRIMARY KEY (cd_municipio)
);

-- Table: nivel_escolaridade
CREATE TABLE nivel_escolaridade (
    cd_nivel_escolaridade int  NOT NULL,
    ds_nivel_escolaridade varchar(50)  NOT NULL,
    CONSTRAINT nivel_escolaridade_pk PRIMARY KEY (cd_nivel_escolaridade)
);

-- Table: plano
CREATE TABLE plano (
    cd_plano int  NOT NULL,
    nm_plano varchar(50)  NOT NULL,
    ds_plano varchar(100)  NOT NULL,
    vl_mensal decimal(6,2)  NOT NULL,
    vl_trimestral decimal(6,2)  NOT NULL,
    vl_semestral decimal(6,2)  NOT NULL,
    vl_anual decimal(6,2)  NOT NULL,
    qt_turmas int  NOT NULL,
    CONSTRAINT plano_pk PRIMARY KEY (cd_plano)
);

-- Table: profissao
CREATE TABLE profissao (
    cd_profissao int  NOT NULL,
    nm_profissao varchar(50)  NOT NULL,
    CONSTRAINT profissao_pk PRIMARY KEY (cd_profissao)
);

-- Table: registro_presenca
CREATE TABLE registro_presenca (
    id_registro int  NOT NULL,
    dt_registro date  NOT NULL,
    hr_registro time  NOT NULL,
    cd_aluno int  NOT NULL,
    cd_turma int  NOT NULL,
    CONSTRAINT registro_presenca_pk PRIMARY KEY (id_registro)
);

-- Table: tipo_pagamento
CREATE TABLE tipo_pagamento (
    tp_pagamento char(1)  NOT NULL,
    ds_tipo char(30)  NOT NULL,
    CONSTRAINT tipo_pagamento_pk PRIMARY KEY (tp_pagamento)
);

-- Table: turma
CREATE TABLE turma (
    cd_turma int  NOT NULL,
    hr_inicio time  NOT NULL,
    nr_duracao int  NOT NULL,
    nr_vagas int  NOT NULL,
    ds_informacao_add varchar(100)  NOT NULL,
    cd_modalidade int  NOT NULL,
    cd_instrutor int  NOT NULL,
    CONSTRAINT turma_pk PRIMARY KEY (cd_turma)
);

-- foreign keys
-- Reference: Table_19_instrutor (table: modalidade_instrutor)
ALTER TABLE modalidade_instrutor ADD CONSTRAINT Table_19_instrutor
    FOREIGN KEY (cd_instrutor)
    REFERENCES instrutor (cd_instrutor)  
;

-- Reference: Table_19_modalidade (table: modalidade_instrutor)
ALTER TABLE modalidade_instrutor ADD CONSTRAINT Table_19_modalidade
    FOREIGN KEY (cd_modalidade)
    REFERENCES modalidade (cd_modalidade)  
;

-- Reference: Table_20_aluno (table: matricula)
ALTER TABLE matricula ADD CONSTRAINT Table_20_aluno
    FOREIGN KEY (cd_aluno)
    REFERENCES aluno (cd_aluno)  
;

-- Reference: Table_20_turma (table: matricula)
ALTER TABLE matricula ADD CONSTRAINT Table_20_turma
    FOREIGN KEY (cd_turma)
    REFERENCES turma (cd_turma)  
;

-- Reference: aluno_endereco (table: aluno)
ALTER TABLE aluno ADD CONSTRAINT aluno_endereco
    FOREIGN KEY (cd_endereco)
    REFERENCES endereco (cd_endereco)  
;

-- Reference: aluno_nivel_escolaridade (table: aluno)
ALTER TABLE aluno ADD CONSTRAINT aluno_nivel_escolaridade
    FOREIGN KEY (cd_nivel_escolaridade)
    REFERENCES nivel_escolaridade (cd_nivel_escolaridade)  
;

-- Reference: aluno_plano (table: aluno)
ALTER TABLE aluno ADD CONSTRAINT aluno_plano
    FOREIGN KEY (cd_plano)
    REFERENCES plano (cd_plano)  
;

-- Reference: aluno_profissao (table: aluno)
ALTER TABLE aluno ADD CONSTRAINT aluno_profissao
    FOREIGN KEY (cd_profissao)
    REFERENCES profissao (cd_profissao)  
;

-- Reference: aluno_tipo_pagamento (table: aluno)
ALTER TABLE aluno ADD CONSTRAINT aluno_tipo_pagamento
    FOREIGN KEY (tp_pagamento)
    REFERENCES tipo_pagamento (tp_pagamento)  
;

-- Reference: endereco_municipio (table: endereco)
ALTER TABLE endereco ADD CONSTRAINT endereco_municipio
    FOREIGN KEY (cd_municipio)
    REFERENCES municipio (cd_municipio)  
;

-- Reference: instrutor_endereco (table: instrutor)
ALTER TABLE instrutor ADD CONSTRAINT instrutor_endereco
    FOREIGN KEY (cd_endereco)
    REFERENCES endereco (cd_endereco)  
;

-- Reference: registro_presenca_matricula (table: registro_presenca)
ALTER TABLE registro_presenca ADD CONSTRAINT registro_presenca_matricula
    FOREIGN KEY (cd_aluno, cd_turma)
    REFERENCES matricula (cd_aluno, cd_turma)  
;

-- Reference: turma_modalidade_instrutor (table: turma)
ALTER TABLE turma ADD CONSTRAINT turma_modalidade_instrutor
    FOREIGN KEY (cd_modalidade, cd_instrutor)
    REFERENCES modalidade_instrutor (cd_modalidade, cd_instrutor)  
;

-- End of file.

