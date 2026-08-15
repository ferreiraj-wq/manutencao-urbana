USE manutencao_urbana;

INSERT INTO usuario (nome, email, telefone, tipo_usuario) VALUES
('João Silva', 'joao@email.com', '67999990001', 'CIDADAO'),
('Maria Souza', 'maria@email.com', '67999990002', 'CIDADAO'),
('Gestor Municipal', 'gestor@prefeitura.gov.br', '6730000000', 'GESTOR');

INSERT INTO categoria (nome, descricao) VALUES
('Buraco na via', 'Problemas de pavimentação e crateras'),
('Semáforo com defeito', 'Falha, queima ou mau funcionamento de semáforo'),
('Sinalização danificada', 'Placas ou sinalizações viárias danificadas');

INSERT INTO status_ocorrencia (nome, descricao) VALUES
('Aberta', 'Ocorrência registrada e aguardando análise'),
('Em análise', 'Ocorrência em avaliação'),
('Em atendimento', 'Equipe responsável em atendimento'),
('Concluída', 'Ocorrência resolvida');

INSERT INTO orgao_responsavel (nome, setor, contato) VALUES
('Prefeitura Municipal', 'Manutenção Viária', 'manutencao@prefeitura.gov.br'),
('Prefeitura Municipal', 'Sinalização e Trânsito', 'transito@prefeitura.gov.br');

INSERT INTO ocorrencia
(titulo, descricao, endereco, latitude, longitude, id_usuario, id_categoria, id_status, id_orgao)
VALUES
('Buraco próximo ao cruzamento',
 'Buraco de grande porte causando risco aos veículos.',
 'Avenida Afonso Pena, Centro',
 -20.4599000, -54.6156000, 1, 1, 1, 1),
('Semáforo apagado',
 'Semáforo sem funcionamento no sentido centro.',
 'Rua Ceará, Santa Fé',
 -20.4488000, -54.5932000, 2, 2, 3, 2);

INSERT INTO imagem (nome_arquivo, caminho_arquivo, id_ocorrencia) VALUES
('buraco-afonso-pena.jpg', 'uploads/buraco-afonso-pena.jpg', 1),
('semaforo-ceara.jpg', 'uploads/semaforo-ceara.jpg', 2);

INSERT INTO atualizacao_ocorrencia (observacao, id_ocorrencia, id_status) VALUES
('Ocorrência recebida pelo sistema.', 1, 1),
('Equipe técnica encaminhada ao local.', 2, 3);
