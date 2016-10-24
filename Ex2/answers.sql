CREATE DATABASE vtapp;

CREATE USER 'vtapp_user'@'localhost' IDENTIFIED BY 'vtapp_user';

GRANT ALL ON vtapp.* TO 'vtapp_user'@'localhost';