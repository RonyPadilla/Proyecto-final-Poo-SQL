CREATE SCHEMA movies_schema;

CREATE TABLE movies_schema.generos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE movies_schema.peliculas (
    id INT IDENTITY(1,1) PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    descripcion VARCHAR(1000) NOT NULL,
    anio INT NOT NULL,
    duracion VARCHAR(100) NOT NULL,
    genero_id INT,
    FOREIGN KEY (genero_id) REFERENCES movies_schema.generos(id)
);

CREATE TABLE movies_schema.actores (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    nacionalidad VARCHAR(100) NOT NULL
);

CREATE TABLE movies_schema.peliculas_actores (
    pelicula_id INT NOT NULL,
    actor_id INT NOT NULL,
    rol VARCHAR(100) NOT NULL,
    PRIMARY KEY (pelicula_id, actor_id),
    FOREIGN KEY (pelicula_id) REFERENCES movies_schema.peliculas(id),
    FOREIGN KEY (actor_id) REFERENCES movies_schema.actores(id)
);

CREATE TABLE movies_schema.usuarios (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre_usuario VARCHAR(100) NOT NULL,
    email VARCHAR(200) NOT NULL
);

CREATE TABLE movies_schema.resenias (
    id INT IDENTITY(1,1) PRIMARY KEY,
    pelicula_id INT NOT NULL,
    usuario_id INT NOT NULL,
    comentario VARCHAR(1000),
    calificacion VARCHAR(2) NOT NULL,
    FOREIGN KEY (pelicula_id) REFERENCES movies_schema.peliculas(id),
    FOREIGN KEY (usuario_id) REFERENCES movies_schema.usuarios(id)
);
