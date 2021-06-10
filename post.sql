-- Desafio Operaciones en una tabla
--DROP DATABASE posts;

--PARTE 1
-- 1. Crear una base de datos con nombre “Posts”
CREATE DATABASE Posts;
\c posts

--2. Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación, contenido y descripción.
CREATE TABLE post(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(20),
    fecha DATE,
    contenido VARCHAR(70),
    descripcion VARCHAR(70)
);

-- --3. Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos".
INSERT INTO post(nombre, fecha, contenido, descripcion)
VALUES('Pamela', now(), 'Primer post de Pamela', 'Hola soy Pamela');

INSERT INTO post(nombre, fecha, contenido, descripcion)
VALUES('Pamela', now(), 'Segundo post de Pamela', 'Chao soy Pamela');

INSERT INTO post(nombre, fecha, contenido, descripcion)
VALUES('Carlos', now(), 'Primer post de Carlos', 'Hola soy Carlos');

--4. Modificar la tabla post, agregando la columna título.
ALTER TABLE post ADD titulo VARCHAR(20);

--5. Agregar título a las publicaciones ya ingresadas.
UPDATE post SET titulo = 'Título 1' WHERE id = 1;
UPDATE post SET titulo = 'Título 2' WHERE id = 2;
UPDATE post SET titulo = 'Título 3' WHERE id = 3;

--6. Insertar 2 post para el usuario "Pedro".
INSERT INTO post(nombre, fecha, contenido, descripcion, titulo) 
VALUES ('Pedro' , now() , 'Primer post de Pedro', 'Hola soy Pedro', 'Título 4');

INSERT INTO post(nombre, fecha, contenido, descripcion, titulo) 
VALUES ('Pedro' , now() , 'Segundo post de Pedro', 'Chao soy Pedro', 'Título 5');

--7. Eliminar el post de Carlos.
DELETE FROM post WHERE nombre = 'Carlos';

--8. Ingresar un nuevo post para el usuario "Carlos".
INSERT INTO post(nombre, fecha, contenido, descripcion, titulo)
VALUES('Carlos', now(), 'Segundo post de Carlos', 'Hola, volví', 'Título 6');

-- --PARTE 2
--1. Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de creación y contenido, que se relacione con la tabla posts.
CREATE TABLE comentarios(
    id SERIAL PRIMARY KEY,
    id_post INT, 
    fecha DATE, 
    hora TIME, 
    contenido VARCHAR(50),
    FOREIGN KEY (id_post) REFERENCES post(id)
);

--2. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos".
INSERT INTO comentarios(id_post, fecha, hora, contenido)
VALUES(1, now(), current_time, 'Comentario 1 post Pamela');

INSERT INTO comentarios(id_post, fecha, hora, contenido)
VALUES(2, now(), current_time, 'Comentario 2 post Pamela');

INSERT INTO comentarios(id_post, fecha, hora, contenido)
VALUES(6, now(), current_time, 'Comentario 1 post Carlos');

INSERT INTO comentarios(id_post, fecha, hora, contenido)
VALUES(6, now(), current_time, 'Comentario 2 post Carlos');

INSERT INTO comentarios(id_post, fecha, hora, contenido)
VALUES(6, now(), current_time, 'Comentario 3 post Carlos');

INSERT INTO comentarios(id_post, fecha, hora, contenido)
VALUES(6, now(), current_time, 'Comentario 4 post Carlos');

--3. Crear un nuevo post para "Margarita".
INSERT INTO post(nombre, fecha, contenido, descripcion, titulo) 
VALUES ('Margarita' , now() , 'Primer post de Margarita','Hola soy Margarita', 'Título 7');

--4. Ingresar 5 comentarios para el post de Margarita.
INSERT INTO comentarios(id_post, fecha, hora, contenido)
VALUES(7, now(), current_time, 'Comentario 1 post Margarita');

INSERT INTO comentarios(id_post, fecha, hora, contenido)
VALUES(7, now(), current_time, 'Comentario 2 post Margarita');

INSERT INTO comentarios(id_post, fecha, hora, contenido)
VALUES(7, now(), current_time, 'Comentario 3 post Margarita');

INSERT INTO comentarios(id_post, fecha, hora, contenido)
VALUES(7, now(), current_time, 'Comentario 4 post Margarita');

INSERT INTO comentarios(id_post, fecha, hora, contenido)
VALUES(7, now(), current_time, 'Comentario 5 post Margarita');


