-- =========================================================================
-- Carga de datos de prueba para el sistema de Maniquíes.
-- =========================================================================

-- 1. Insertar Colores
INSERT INTO Colores (nombre_color) VALUES 
('Blanco Mate'),
('Negro Brillante'),
('Piel Claro'),
('Gris Cromado');

-- 2. Insertar Modelos 
-- (Incluye todos los campos resultantes tras tu ALTER TABLE)
INSERT INTO Modelos (nombre_modelo, genero, rango_edad, talle, id_color) VALUES
('Elegance Femenino', 'Femenino', 'Adulto', 'Mediano', 1), -- ID 1
('Titan Masculino', 'Masculino', 'Adulto', 'Grande', 2),   -- ID 2
('Kids Play', 'Unisex', 'Infantil', 'Chico', 3);           -- ID 3

-- =========================================================================
-- 3. Insertar Piezas (10 registros por cada tipo)
-- =========================================================================

-- TORSOS (10 registros)
INSERT INTO Torsos (material, fecha_fabricacion, id_modelo) VALUES
('Fibra de vidrio', '2023-09-01', 1), -- ID 1 (Para maniquí 1)
('Fibra de vidrio', '2023-09-02', 1), -- ID 2 (Para maniquí 2)
('Fibra de vidrio', '2023-09-03', 1), -- ID 3 (Para maniquí 3)
('Fibra de vidrio', '2023-09-04', 1), -- ID 4 (Repuesto)
('Fibra de vidrio', '2023-09-05', 1), -- ID 5 (Repuesto)
('Plástico ABS',    '2023-09-10', 2), -- ID 6 (Para maniquí 4)
('Plástico ABS',    '2023-09-11', 2), -- ID 7 (Repuesto)
('Plástico ABS',    '2023-09-12', 2), -- ID 8 (Repuesto)
('Resina',          '2023-09-20', 3), -- ID 9 (Para maniquí 5)
('Resina',          '2023-09-21', 3); -- ID 10 (Repuesto)

-- CABEZAS (10 registros)
INSERT INTO Cabezas (material, fecha_fabricacion, id_modelo) VALUES
('Fibra de vidrio', '2023-09-01', 1), -- ID 1 (Para maniquí 1)
('Fibra de vidrio', '2023-09-02', 1), -- ID 2 (Para maniquí 2)
('Fibra de vidrio', '2023-09-03', 1), -- ID 3 (Para maniquí 3)
('Fibra de vidrio', '2023-09-04', 1), -- ID 4 (Repuesto)
('Fibra de vidrio', '2023-09-05', 1), -- ID 5 (Repuesto)
('Plástico ABS',    '2023-09-10', 2), -- ID 6 (Para maniquí 4)
('Plástico ABS',    '2023-09-11', 2), -- ID 7 (Repuesto)
('Plástico ABS',    '2023-09-12', 2), -- ID 8 (Repuesto)
('Resina',          '2023-09-20', 3), -- ID 9 (Para maniquí 5)
('Resina',          '2023-09-21', 3); -- ID 10 (Repuesto)

-- BRAZOS (10 registros: 5 izquierdos, 5 derechos)
INSERT INTO Brazos (material, fecha_fabricacion, lado, id_modelo) VALUES
('Fibra de vidrio', '2023-09-01', 'Izquierdo', 1), -- ID 1 (Para maniquí 1)
('Fibra de vidrio', '2023-09-01', 'Derecho',   1), -- ID 2 (Para maniquí 1)
('Fibra de vidrio', '2023-09-02', 'Izquierdo', 1), -- ID 3 (Para maniquí 2)
('Fibra de vidrio', '2023-09-02', 'Derecho',   1), -- ID 4 (Para maniquí 2)
('Fibra de vidrio', '2023-09-03', 'Izquierdo', 1), -- ID 5 (Para maniquí 3)
('Fibra de vidrio', '2023-09-03', 'Derecho',   1), -- ID 6 (Para maniquí 3)
('Plástico ABS',    '2023-09-10', 'Izquierdo', 2), -- ID 7 (Para maniquí 4)
('Plástico ABS',    '2023-09-10', 'Derecho',   2), -- ID 8 (Para maniquí 4)
('Resina',          '2023-09-20', 'Izquierdo', 3), -- ID 9 (Para maniquí 5)
('Resina',          '2023-09-20', 'Derecho',   3); -- ID 10 (Para maniquí 5)

-- PIERNAS (10 registros: 5 izquierdas, 5 derechas)
-- Nota: Uso 'Izquierda' y 'Derecha' respetando tu ENUM específico para las piernas.
INSERT INTO Piernas (material, fecha_fabricacion, lado, id_modelo) VALUES
('Fibra de vidrio', '2023-09-01', 'Izquierda', 1), -- ID 1 (Para maniquí 1)
('Fibra de vidrio', '2023-09-01', 'Derecha',   1), -- ID 2 (Para maniquí 1)
('Fibra de vidrio', '2023-09-02', 'Izquierda', 1), -- ID 3 (Para maniquí 2)
('Fibra de vidrio', '2023-09-02', 'Derecha',   1), -- ID 4 (Para maniquí 2)
('Fibra de vidrio', '2023-09-03', 'Izquierda', 1), -- ID 5 (Para maniquí 3)
('Fibra de vidrio', '2023-09-03', 'Derecha',   1), -- ID 6 (Para maniquí 3)
('Plástico ABS',    '2023-09-10', 'Izquierda', 2), -- ID 7 (Para maniquí 4)
('Plástico ABS',    '2023-09-10', 'Derecha',   2), -- ID 8 (Para maniquí 4)
('Resina',          '2023-09-20', 'Izquierda', 3), -- ID 9 (Para maniquí 5)
('Resina',          '2023-09-20', 'Derecha',   3); -- ID 10 (Para maniquí 5)

-- =========================================================================
-- 4. Ensamblado de Maniquíes (5 registros completos)
-- =========================================================================


INSERT INTO Maniquies 
(numero_serie, fecha_ensamble, id_modelo, id_torso, id_cabeza, id_brazo_izq, id_brazo_der, id_pierna_izq, id_pierna_der) 
VALUES
('MQ-F-001', '2023-10-01', 1, 1, 1, 1, 2, 1, 2), -- Modelo Femenino Elegance
('MQ-F-002', '2023-10-05', 1, 2, 2, 3, 4, 3, 4), -- Modelo Femenino Elegance
('MQ-F-003', '2023-10-10', 1, 3, 3, 5, 6, 5, 6), -- Modelo Femenino Elegance
('MQ-M-001', '2023-10-15', 2, 6, 6, 7, 8, 7, 8), -- Modelo Masculino Titan
('MQ-K-001', '2023-10-25', 3, 9, 9, 9, 10, 9, 10); -- Modelo Infantil Kids
