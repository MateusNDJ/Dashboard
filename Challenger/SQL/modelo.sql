CREATE TABLE Usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Transacao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    valor DECIMAL(10, 2) NOT NULL,
    tipo ENUM('receita', 'despesa') NOT NULL,
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    descricao TEXT,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
);

CREATE TABLE Pagamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    valor DECIMAL(10, 2) NOT NULL,
    status ENUM('pendente', 'realizado') NOT NULL,
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    descricao TEXT,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
);

CREATE TABLE Relatorio (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT,
    tipo ENUM('vendas', 'despesas', 'fluxo de caixa') NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    data_geracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
);
