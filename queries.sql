USE manutencao_urbana;

-- INSERT
INSERT INTO ocorrencia
(titulo, descricao, endereco, latitude, longitude, id_usuario, id_categoria, id_status, id_orgao)
VALUES
('Novo buraco na via',
 'Buraco identificado próximo ao ponto de ônibus.',
 'Rua 14 de Julho, Centro',
 -20.4630000, -54.6160000, 1, 1, 1, 1);

-- SELECT: listar ocorrências
SELECT
    o.id_ocorrencia,
    o.titulo,
    o.endereco,
    c.nome AS categoria,
    s.nome AS status,
    u.nome AS usuario,
    o.data_registro
FROM ocorrencia o
JOIN usuario u ON u.id_usuario = o.id_usuario
JOIN categoria c ON c.id_categoria = o.id_categoria
JOIN status_ocorrencia s ON s.id_status = o.id_status
ORDER BY o.data_registro DESC;

-- SELECT: ocorrências não concluídas
SELECT o.id_ocorrencia, o.titulo, s.nome AS status
FROM ocorrencia o
JOIN status_ocorrencia s ON s.id_status = o.id_status
WHERE s.nome <> 'Concluída';

-- SELECT: total por categoria
SELECT c.nome AS categoria, COUNT(o.id_ocorrencia) AS total
FROM categoria c
LEFT JOIN ocorrencia o ON o.id_categoria = c.id_categoria
GROUP BY c.id_categoria, c.nome
ORDER BY total DESC;

-- UPDATE
UPDATE ocorrencia
SET id_status = 3
WHERE id_ocorrencia = 1;

INSERT INTO atualizacao_ocorrencia
(observacao, id_ocorrencia, id_status)
VALUES
('Ocorrência encaminhada para atendimento.', 1, 3);

-- DELETE
DELETE FROM imagem
WHERE id_imagem = 1;

-- SELECT: histórico
SELECT
    a.id_atualizacao,
    a.data_atualizacao,
    a.observacao,
    s.nome AS status
FROM atualizacao_ocorrencia a
JOIN status_ocorrencia s ON s.id_status = a.id_status
WHERE a.id_ocorrencia = 1
ORDER BY a.data_atualizacao;
