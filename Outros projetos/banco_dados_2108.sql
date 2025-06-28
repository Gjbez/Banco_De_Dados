CREATE TABLE sala (
  id_sala CHAR(5)  NOT NULL  ,
  nm_sala VARCHAR(30)  NULL  ,
  qt_metros DECIMAL(4,1)  NULL    ,
PRIMARY KEY(id_sala));



CREATE TABLE software (
  id_software INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nm_software VARCHAR(50)  NULL  ,
  sd_software VARCHAR(100)  NULL    ,
PRIMARY KEY(id_software));



CREATE TABLE equipamento (
  id_equipamento CHAR(6)  NOT NULL  ,
  id_sala CHAR(5)  NOT NULL  ,
  ds_configuracao VARCHAR(50)  NULL  ,
  dt_aquisicao DATE  NULL    ,
PRIMARY KEY(id_equipamento)  ,
INDEX equipamento_FKIndex1(id_sala),
  FOREIGN KEY(id_sala)
    REFERENCES sala(id_sala)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE equipamento_software (
  id_equipamento CHAR(6)  NOT NULL  ,
  id_software INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(id_equipamento, id_software)  ,
INDEX equipamento_has_software_FKIndex1(id_equipamento)  ,
INDEX equipamento_has_software_FKIndex2(id_software),
  FOREIGN KEY(id_equipamento)
    REFERENCES equipamento(id_equipamento)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(id_software)
    REFERENCES software(id_software)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




