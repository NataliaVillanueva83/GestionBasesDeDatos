
--Obtener el número de serie, material y color de todas las piernas que pertenezcan al lado derecho.
SELECT 
    p.id_serie AS numero_serie, 
    p.material, 
    c.nombre_color
FROM Piernas p
JOIN Modelos m ON p.id_modelo = m.id_modelo
JOIN Colores c ON m.id_color = c.id_color
WHERE p.lado = 'Derecha';

--Mostrar todas las cabezas que fueron fabricadas después de una fecha específica (ej. '2026-01-01')
SELECT 
    id_serie, 
    material, 
    fecha_fabricacion, 
    id_modelo
FROM Cabezas
WHERE fecha_fabricacion > '2026-01-01';

--Listar todos los torsos cuyo talle sea 'mediano' o ‘largo', ordenados por material de  forma alfabética.
SELECT 
    t.id_serie, 
    t.material, 
    m.nombre_modelo, 
    m.talle
FROM Torsos t
JOIN Modelos m ON t.id_modelo = m.id_modelo
WHERE m.talle IN ('Mediano', 'Grande')
ORDER BY t.material ASC;

--Realizar un conteo total de cuántas piezas hay en la base de datos agrupadas por su material (ej. cuántas de madera, cuántas de plástico).
SELECT 
    material, 
    COUNT(*) AS total_piezas
FROM (
    SELECT material FROM Torsos
    UNION ALL
    SELECT material FROM Cabezas
    UNION ALL
    SELECT material FROM Brazos
    UNION ALL
    SELECT material FROM Piernas
) AS TodasLasPiezas
GROUP BY material
ORDER BY total_piezas DESC;

--Mostrar el código del Maniquí Completo junto con la fecha de ensamblaje y el ID/serie de la cabeza que se le asignó.
SELECT 
    numero_serie, 
    fecha_ensamble, 
    id_cabeza
FROM Maniquies;

--Buscar todas las piezas (de cualquier tipo) que tengan un color o acabado específico (ej. "Negro Mate").
SELECT 
    Piezas.tipo_pieza, 
    Piezas.id_serie, 
    Piezas.material, 
    c.nombre_color
FROM (
    SELECT 'Torso' AS tipo_pieza, id_serie, material, id_modelo FROM Torsos
    UNION ALL
    SELECT 'Cabeza', id_serie, material, id_modelo FROM Cabezas
    UNION ALL
    SELECT 'Brazo', id_serie, material, id_modelo FROM Brazos
    UNION ALL
    SELECT 'Pierna', id_serie, material, id_modelo FROM Piernas
) AS Piezas
JOIN Modelos m ON Piezas.id_modelo = m.id_modelo
JOIN Colores c ON m.id_color = c.id_color
WHERE c.nombre_color = 'Negro Brillante';
