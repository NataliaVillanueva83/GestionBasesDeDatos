// ==========================================
// ENUMS
// ==========================================
Enum genero_enum {
  Femenino
  Masculino
  Unisex
}

Enum rango_edad_enum {
  Adulto
  Infantil
  Adolescente
}

Enum talle_enum {
  Chico
  Mediano
  Grande
}

Enum lado_brazo_enum {
  Izquierdo
  Derecho
}

Enum lado_pierna_enum {
  Izquierda
  Derecha
}

// ==========================================
// TABLAS
// ==========================================
Table Colores {
  id_color int [primary key, increment]
  nombre_color varchar(50) [not null, unique]
}

Table Modelos {
  id_modelo int [primary key, increment]
  nombre_modelo varchar(100) [not null]
  genero genero_enum [not null]
  rango_edad rango_edad_enum [not null]
  talle talle_enum [not null]
  id_color int [not null]
}

Table Torsos {
  id_serie int [primary key, increment]
  material varchar(50) [not null]
  fecha_fabricacion date [not null]
  id_modelo int [not null]
}

Table Cabezas {
  id_serie int [primary key, increment]
  material varchar(50) [not null]
  fecha_fabricacion date [not null]
  id_modelo int [not null]
}

Table Brazos {
  id_serie int [primary key, increment]
  material varchar(50) [not null]
  fecha_fabricacion date [not null]
  lado lado_brazo_enum [not null]
  id_modelo int [not null]
}

Table Piernas {
  id_serie int [primary key, increment]
  material varchar(50) [not null]
  fecha_fabricacion date [not null]
  lado lado_pierna_enum [not null]
  id_modelo int [not null]
}

Table Maniquies {
  id_maniqui int [primary key, increment]
  numero_serie varchar(50) [not null, unique]
  fecha_ensamble date [not null]
  id_modelo int [not null]
  id_torso int [not null, unique]
  id_cabeza int [not null, unique]
  id_brazo_izq int [not null, unique]
  id_brazo_der int [not null, unique]
  id_pierna_izq int [not null, unique]
  id_pierna_der int [not null, unique]
}

// ==========================================
// RELACIONES (FOREIGN KEYS)
// ==========================================

// Relaciones 1 a N (Muchos a Uno)
Ref: Modelos.id_color > Colores.id_color
Ref: Torsos.id_modelo > Modelos.id_modelo
Ref: Cabezas.id_modelo > Modelos.id_modelo
Ref: Brazos.id_modelo > Modelos.id_modelo
Ref: Piernas.id_modelo > Modelos.id_modelo
Ref: Maniquies.id_modelo > Modelos.id_modelo

// Relaciones 1 a 1 (Un maniquí usa exactamente una pieza específica)
Ref: Maniquies.id_torso - Torsos.id_serie
Ref: Maniquies.id_cabeza - Cabezas.id_serie
Ref: Maniquies.id_brazo_izq - Brazos.id_serie
Ref: Maniquies.id_brazo_der - Brazos.id_serie
Ref: Maniquies.id_pierna_izq - Piernas.id_serie
Ref: Maniquies.id_pierna_der - Piernas.id_serie
