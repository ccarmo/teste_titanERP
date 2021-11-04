-- Author: Carlos Henrique
-- Version: 1.0

-- -----------------------------------------------------
-- Database db_titan
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `db_titan` DEFAULT CHARACTER SET utf8;
USE `db_titan`;

-- -----------------------------------------------------
-- Table `db_titan`.`tb_loja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_titan`.`tb_loja` (
  `loj_prod` INT(8) UNSIGNED NOT NULL,
  `desc_loj` CHAR(40) NULL,
  PRIMARY KEY (`loj_prod`)
);

-- -----------------------------------------------------
-- Table `db_titan`.`tb_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_titan`.`tb_produto` (
  `cod_prod` INT(8) UNSIGNED UNIQUE NOT NULL,
  `loj_prod` INT(8) UNSIGNED NOT NULL,
  `desc_prod` CHAR(40) NULL,
  `dt_inclu_prod` DATE NULL,
  `preco_prod` DECIMAL(8,3) NULL,
  PRIMARY KEY (`cod_prod`)
);
ALTER TABLE `db_titan`.`tb_produto` ADD FOREIGN KEY (`loj_prod`) REFERENCES `db_titan`.`tb_loja`(`loj_prod`);

-- -----------------------------------------------------
-- Table `db_titan`.`tb_estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_titan`.`tb_estoque` (
  `cod_prod` INT(8) UNSIGNED UNIQUE NOT NULL,
  `loj_prod` INT(8) UNSIGNED NOT NULL,
  `qtd_prod` DECIMAL(15,3) NULL

);
ALTER TABLE `db_titan`.`tb_estoque` ADD FOREIGN KEY (`cod_prod`) REFERENCES `db_titan`.`tb_produto`(`cod_prod`);
ALTER TABLE `db_titan`.`tb_estoque` ADD FOREIGN KEY (`loj_prod`) REFERENCES `db_titan`.`tb_loja`(`loj_prod`);
 
-- -----------------------------------------------------
-- Insert
-- -----------------------------------------------------

INSERT `db_titan`.`tb_loja` (loj_prod, desc_loj)
VALUES
   (1, 'CENTRO'),
   (2, 'ZONA LESTE'),
   (3, 'ZONA SUL');


INSERT `db_titan`.`tb_produto` (cod_prod, loj_prod, desc_prod, dt_inclu_prod, preco_prod)
VALUES
   (170, 2, 'LEITE CONDESADO MOCOCA', '2010-12-30', 45.40),
   (174, 2, 'PAO SOVADO', '2010-12-30', 7.99),
   (171, 2, 'SUCO DE LARANJA', '2010-12-29', 10.40),
   (130, 2, 'BOLINHO ANA MARIA', '2010-12-22', 1.50),
   (140, 2, 'LEITE DESNATADO', '2010-01-29', 5.40),
   
   
   (160, 1, 'BICICLETA', '2010-10-22', 1500.50),
   (109, 1, 'TV LED 40', '2010-08-23', 4500.00),
   (190, 1, 'VIDEO GAME NINTENDO', '2010-03-14', 1200.00),
   (110, 1, 'NOTEBOOK ASUS', '2010-02-16', 3500.99),
   (172, 1, 'CELULAR MOTOROLA', '2010-09-11', 650.00),
   
   
   (159, 3, 'SABONETE DOVE', '2010-02-14', 3.00),
   (153, 3, 'SHAMPOO ANTI-CASPA', '2010-03-07', 12.10),
   (133, 3, 'ESCOVA DE DENTE SUAVE', '2010-08-10', 3.20),
   (214, 3, 'PASTA DE DENTE COLGATE', '2010-05-15', 2.50),
   (178, 3, 'DESODORANTE AXE', '2010-04-24', 8.90);
   
INSERT `db_titan`.`tb_estoque` (cod_prod, loj_prod, qtd_prod)
VALUES
   (170, 2, 10.000),
   (174, 2, 5.000),
   (171, 2, 50.000),
   (178, 3, 100.000),
   (133, 3, 200.000),
   (214, 3, 150.000),
   (159, 3, 300.000),
   (153, 3, 60.000),
   (110, 1, 15.000),
   (190, 1, 5.000),
   (160, 1, 1.000),
   (109, 1, 1.000),
   (172, 1, 1.000),
   (130, 2, 150.000);
