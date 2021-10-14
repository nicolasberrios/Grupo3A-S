-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Autor` (
  `idAutor` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAutor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Editorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Editorial` (
  `idEditorial` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEditorial`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categoría`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Categoría` (
  `idCategoría` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategoría`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Libro` (
  `idLibro` INT NOT NULL,
  `nombre` VARCHAR(80) NOT NULL,
  `paginas` INT(6) NOT NULL,
  `estado` int NOT NULL,
  `Autor_idAutor` INT NOT NULL,
  `Editorial_idEditorial` INT NOT NULL,
  `Categoría_idCategoría` INT NOT NULL,
  PRIMARY KEY (`idLibro`, `Autor_idAutor`, `Editorial_idEditorial`, `Categoría_idCategoría`),
  INDEX `fk_Libro_Autor1_idx` (`Autor_idAutor` ASC) VISIBLE,
  INDEX `fk_Libro_Editorial1_idx` (`Editorial_idEditorial` ASC) VISIBLE,
  INDEX `fk_Libro_Categoría1_idx` (`Categoría_idCategoría` ASC) VISIBLE,
  CONSTRAINT `fk_Libro_Autor1`
    FOREIGN KEY (`Autor_idAutor`)
    REFERENCES `mydb`.`Autor` (`idAutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Libro_Editorial1`
    FOREIGN KEY (`Editorial_idEditorial`)
    REFERENCES `mydb`.`Editorial` (`idEditorial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Libro_Categoría1`
    FOREIGN KEY (`Categoría_idCategoría`)
    REFERENCES `mydb`.`Categoría` (`idCategoría`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Préstamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Préstamo` (
  `idPrestamo` INT NOT NULL,
  `fecha_de_inicio_préstamo` date NOT NULL,
  `fecha_término_de_préstamo` date NOT NULL,
  `Catalogo_idCatalogo` INT NOT NULL,
  `Usuario_idUsuarios` INT NOT NULL,
  `Libro_idLibro` INT NOT NULL,
  `Libro_Categoría_idCategoría` INT NOT NULL,
  PRIMARY KEY (`idPrestamo`, `Catalogo_idCatalogo`, `Usuario_idUsuarios`, `Libro_idLibro`, `Libro_Categoría_idCategoría`),
  INDEX `fk_Préstamo_Libro1_idx` (`Libro_idLibro` ASC, `Libro_Categoría_idCategoría` ASC) VISIBLE,
  CONSTRAINT `fk_Préstamo_Libro1`
    FOREIGN KEY (`Libro_idLibro`)
    REFERENCES `mydb`.`Libro` (`idLibro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`Devolucion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Devolucion` (
  `idDevolucion` INT NOT NULL,
  `fecha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDevolucion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estado` (
  `idEstado` INT NOT NULL,
  `Condicion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Stock` (
  `idStock` INT NOT NULL,
  `Libro_idLibro` INT NOT NULL,
  `Libro_Categoría_idCategoría` INT NOT NULL,
  PRIMARY KEY (`idStock`, `Libro_idLibro`, `Libro_Categoría_idCategoría`),
  INDEX `fk_Stock_Libro1_idx` (`Libro_idLibro` ASC, `Libro_Categoría_idCategoría` ASC) VISIBLE,
  CONSTRAINT `fk_Stock_Libro1`
    FOREIGN KEY (`Libro_idLibro`)
    REFERENCES `mydb`.`Libro` (`idLibro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Renovacion_prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Renovacion_prestamo` (
  `idRenovacion_prestamo` INT NOT NULL,
  `fecha_inicial` DATE NOT NULL,
  `Fecha_final` DATE NOT NULL,
  PRIMARY KEY (`idRenovacion_prestamo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Libro_de_baja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Libro_de_baja` (
  `idLibro de baja` INT NOT NULL,
  `idLibro` VARCHAR(45) NOT NULL,
  `fecha de baja` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLibro de baja`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Registro_prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Registro_prestamos` (
  `Préstamo_idPrestamo1` INT NOT NULL,
  `Préstamo_Catalogo_idCatalogo1` INT NOT NULL,
  `Préstamo_Usuario_idUsuarios` INT NOT NULL,
  `Renovacion_prestamo_idRenovacion_prestamo` INT NOT NULL,
  PRIMARY KEY (`Préstamo_idPrestamo1`, `Préstamo_Catalogo_idCatalogo1`, `Préstamo_Usuario_idUsuarios`, `Renovacion_prestamo_idRenovacion_prestamo`),
  INDEX `fk_Registro_prestamos_Préstamo1_idx` (`Préstamo_idPrestamo1` ASC, `Préstamo_Catalogo_idCatalogo1` ASC, `Préstamo_Usuario_idUsuarios` ASC) VISIBLE,
  INDEX `fk_Registro_prestamos_Renovacion_prestamo1_idx` (`Renovacion_prestamo_idRenovacion_prestamo` ASC) VISIBLE,
  CONSTRAINT `fk_Registro_prestamos_Préstamo1`
    FOREIGN KEY (`Préstamo_idPrestamo1` , `Préstamo_Catalogo_idCatalogo1` , `Préstamo_Usuario_idUsuarios`)
    REFERENCES `mydb`.`Préstamo` (`idPrestamo` , `Catalogo_idCatalogo` , `Usuario_idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_prestamos_Renovacion_prestamo1`
    FOREIGN KEY (`Renovacion_prestamo_idRenovacion_prestamo`)
    REFERENCES `mydb`.`Renovacion_prestamo` (`idRenovacion_prestamo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `idUsuario` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `rut` VARCHAR(45) NOT NULL,
  `dv` varchar(45) not null,
  `direccion` VARCHAR(45) NOT NULL,
  `idperfil` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Biblioteca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Biblioteca` (
  `idBiblioteca` INT NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `Libro_de_baja_idLibro de baja` INT NOT NULL,
  `Stock_idStock` INT NOT NULL,
  `Stock_Libro_idLibro` INT NOT NULL,
  `Stock_Libro_Categoría_idCategoría` INT NOT NULL,
  `Devolucion_idDevolucion` INT NOT NULL,
  PRIMARY KEY (`idBiblioteca`, `Usuario_idUsuario`, `Libro_de_baja_idLibro de baja`, `Stock_idStock`, `Stock_Libro_idLibro`, `Stock_Libro_Categoría_idCategoría`, `Devolucion_idDevolucion`),
  INDEX `fk_Biblioteca_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  INDEX `fk_Biblioteca_Libro_de_baja1_idx` (`Libro_de_baja_idLibro de baja` ASC) VISIBLE,
  INDEX `fk_Biblioteca_Stock1_idx` (`Stock_idStock` ASC, `Stock_Libro_idLibro` ASC, `Stock_Libro_Categoría_idCategoría` ASC) VISIBLE,
  INDEX `fk_Biblioteca_Devolucion1_idx` (`Devolucion_idDevolucion` ASC) VISIBLE,
  CONSTRAINT `fk_Biblioteca_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `mydb`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Biblioteca_Libro_de_baja1`
    FOREIGN KEY (`Libro_de_baja_idLibro de baja`)
    REFERENCES `mydb`.`Libro_de_baja` (`idLibro de baja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Biblioteca_Stock1`
    FOREIGN KEY (`Stock_idStock` , `Stock_Libro_idLibro` , `Stock_Libro_Categoría_idCategoría`)
    REFERENCES `mydb`.`Stock` (`idStock` , `Libro_idLibro` , `Libro_Categoría_idCategoría`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Biblioteca_Devolucion1`
    FOREIGN KEY (`Devolucion_idDevolucion`)
    REFERENCES `mydb`.`Devolucion` (`idDevolucion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

