CREATE DATABASE IF NOT EXISTS manutencao_urbana
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE manutencao_urbana;

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    tipo_usuario ENUM('CIDADAO', 'GESTOR') NOT NULL DEFAULT 'CIDADAO',
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL UNIQUE,
    descricao VARCHAR(255)
);

CREATE TABLE status_ocorrencia (
    id_status INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE,
    descricao VARCHAR(255)
);

CREATE TABLE orgao_responsavel (
    id_orgao INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    setor VARCHAR(120),
    contato VARCHAR(120)
);

CREATE TABLE ocorrencia (
    id_ocorrencia INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    latitude DECIMAL(10,7),
    longitude DECIMAL(10,7),
    data_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_usuario INT NOT NULL,
    id_categoria INT NOT NULL,
    id_status INT NOT NULL,
    id_orgao INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
    FOREIGN KEY (id_status) REFERENCES status_ocorrencia(id_status),
    FOREIGN KEY (id_orgao) REFERENCES orgao_responsavel(id_orgao)
);

CREATE TABLE imagem (
    id_imagem INT AUTO_INCREMENT PRIMARY KEY,
    nome_arquivo VARCHAR(255) NOT NULL,
    caminho_arquivo VARCHAR(500),
    data_envio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_ocorrencia INT NOT NULL,
    FOREIGN KEY (id_ocorrencia) REFERENCES ocorrencia(id_ocorrencia) ON DELETE CASCADE
);

CREATE TABLE atualizacao_ocorrencia (
    id_atualizacao INT AUTO_INCREMENT PRIMARY KEY,
    observacao VARCHAR(500),
    data_atualizacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_ocorrencia INT NOT NULL,
    id_status INT NOT NULL,
    FOREIGN KEY (id_ocorrencia) REFERENCES ocorrencia(id_ocorrencia) ON DELETE CASCADE,
    FOREIGN KEY (id_status) REFERENCES status_ocorrencia(id_status)
);
