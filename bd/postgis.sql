CREATE EXTENSION IF NOT EXISTS postgis;

-- 2. Tabela de Polígonos (Bairros)
CREATE TABLE bairros (                                                 
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    geom GEOMETRY(Polygon, 4326) -- SRID 4326 = WGS 84 (Coordenadas geográficas padrão)
);

-- 3. Tabela de Pontos (Pontos de Coleta / Ocorrências)
CREATE TABLE pontos_coleta (
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    tipo VARCHAR(30),
    geom GEOMETRY(Point, 4326)
);

-- 4. Inserção de Dados de Exemplo (Bairros)
INSERT INTO bairros (nome, geom) VALUES
('Centro', ST_GeomFromText('POLYGON((-46.640 -23.550, -46.630 -23.550, -46.630 -23.560, -46.640 -23.560, -46.640 -23.550))', 4326)),
('Jardins', ST_GeomFromText('POLYGON((-46.660 -23.560, -46.640 -23.560, -46.640 -23.570, -46.660 -23.570, -46.660 -23.560))', 4326));

-- 5. Inserção de Dados de Exemplo (Pontos de Coleta)
INSERT INTO pontos_coleta (descricao, tipo, geom) VALUES
('EcoPonto Centro', 'Reciclagem', ST_SetSRID(ST_MakePoint(-46.635, -23.555), 4326)),
('Lixeira Inteligente Paulista', 'Resíduo Orgânico', ST_SetSRID(ST_MakePoint(-46.650, -23.565), 4326)),
('Posto de Coleta Oeste', 'Eletrônicos', ST_SetSRID(ST_MakePoint(-46.670, -23.580), 4326));


-- Retorna os bairros e pontos em texto legível (WKT Well Known Text)
SELECT nome AS identificacao, ST_AsText(geom) AS geometria FROM bairros
UNION ALL
SELECT descricao AS identificacao, ST_AsText(geom) AS geometria FROM pontos_coleta;

 -- Retorna os bairros e pontos em JSON
SELECT nome AS identificacao, ST_AsGeoJSON(geom) AS geometria FROM bairros
UNION ALL
SELECT descricao AS identificacao, ST_AsGeoJSON(geom) AS geometria FROM pontos_coleta;

-- Crie uma consulta que permita visualizar os pontos de coleta que fazem intersecção com áreas marcadas nos bairros
SELECT
    p.id AS ponto_id,
    p.tipo AS ponto_tipo,
    p.descricao AS ponto_descricao,
    b.id AS bairro_id,
    b.nome AS bairro_nome
FROM pontos_coleta p
INNER JOIN bairros b ON ST_Intersects(p.geom, b.geom);

-- Crie uma consulta que permita visualizar os pontos de coleta que não fazem intersecção com áreas marcadas nos bairros
SELECT
    p.id AS ponto_id,
    p.tipo AS ponto_tipo,
    p.descricao AS ponto_descricao,
    b.id AS bairro_id,
    b.nome AS bairro_nome
FROM pontos_coleta p
LEFT JOIN bairros b ON ST_Intersects(p.geom, b.geom)
WHERE b.id IS NULL;
