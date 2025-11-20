CREATE SCHEMA movies_schema

CREATE TABLE movies_schema.generos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE movies_schema.peliculas (
    id INT IDENTITY(1,1) PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    anio INT NOT NULL,
    duracion VARCHAR(100) NOT NULL,
    descripcion VARCHAR(1000) NOT NULL,
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
    pelicula_id INT,
    actor_id INT,
    PRIMARY KEY (pelicula_id, actor_id),
    FOREIGN KEY (pelicula_id) REFERENCES movies_schema.peliculas(id),
    FOREIGN KEY (actor_id) REFERENCES movies_schema.actores(id)
);

DROP TABLE movies_schema.resenias;


CREATE TABLE movies_schema.usuarios (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre_usuario VARCHAR(100) NOT NULL,
    email VARCHAR(200) NOT NULL
);


CREATE TABLE movies_schema.resenias (
    id INT IDENTITY(1,1) PRIMARY KEY,
    pelicula_id INT,
    usuarios_id INT,
    calificacion VARCHAR(2) NOT NULL,
    comentario VARCHAR(1000),
    FOREIGN KEY (pelicula_id) REFERENCES movies_schema.peliculas(id),
    FOREIGN KEY (usuarios_id) REFERENCES movies_schema.usuarios(usuarios_id)
);

INSERT INTO [movies_schema].[peliculas] ([titulo], [anio], [duracion], [descripcion], [genero_id])
        VALUES (?, ?, ?, ?, ?);

select [id]
       ,[titulo]
       ,[anio]
       ,[duracion]
       ,[descripcion]
from [movies_schema].[peliculas]
where [id] = ?;

INSERT INTO movies_schema.generos (nombre)
VALUES
    ('Acción'),
    ('Comedia'),
    ('Drama'),
    ('Ciencia ficción'),
    ('Terror');

SELECT * FROM movies_schema.peliculas;

SELECT * FROM movies_schema.resenias;

EXEC sp_rename 'movies_schema.resenias.usuarios_id', 'usuario_id', 'COLUMN';

