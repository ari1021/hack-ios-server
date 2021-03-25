-- MySQL Script generated by MySQL Workbench
-- Fri Feb 14 23:09:20 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Table `hack_ios_server_api`.`users`
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS  `hack_ios_server_api` DEFAULT CHARACTER SET utf8mb4 ;
USE `hack_ios_server_api`;

SET CHARSET utf8mb4;
SET sql_mode = ALLOW_INVALID_DATES;

CREATE TABLE IF NOT EXISTS `users` (
    `id` VARCHAR(128) NOT NULL COMMENT 'ユーザID',
    `password` VARCHAR(128) NOT NULL COMMENT 'パスワード',
    `name` VARCHAR(64) NOT NULL COMMENT 'ユーザ名',
    `created_at` timestamp NOT NULL COMMENT '作成日時',
    `updated_at` timestamp NOT NULL COMMENT '更新日時',
    `deleted_at` timestamp NOT NULL COMMENT '削除日時',
    PRIMARY KEY (`id`),
    INDEX `idx_created_at` (`created_at` ASC))
    ENGINE = InnoDB
    COMMENT = 'ユーザ';


-- -----------------------------------------------------
-- Table `hack_ios_server_api`.`tasks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tasks` (
    `id` VARCHAR(128) NOT NULL COMMENT 'タスクID',
    `name` VARCHAR(64) NOT NULL COMMENT 'タスク名',
    `description` VARCHAR(128) NOT NULL COMMENT '詳細',
    `done` BIT NOT NULL COMMENT '状態',
    PRIMARY KEY (`id`))
    ENGINE = InnoDB
    COMMENT = 'タスク';


-- -----------------------------------------------------
-- Table `hack_ios_server_api`.`user_task`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user_tasks` (
    `user_id` VARCHAR(128) NOT NULL COMMENT 'ユーザID',
    `task_id` VARCHAR(128) NOT NULL COMMENT 'タスクID',
    PRIMARY KEY (`user_id`, `task_id`),
    INDEX `fk_user_tasks_user_idx` (`user_id` ASC),
    INDEX `fk_user_tasks_task_idx` (`task_id` ASC),
    CONSTRAINT `fk_user_tasks_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `hack_ios_server_api`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_user_tasks_task`
    FOREIGN KEY (`task_id`)
    REFERENCES `hack_ios_server_api`.`tasks` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB
    COMMENT = 'ユーザ所持タスク';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
