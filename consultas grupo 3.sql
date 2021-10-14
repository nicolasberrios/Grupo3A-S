#consultas 
#a) Inscribir o insertar un nuevo estudiante, profesor o asistente de la educación.
insert into Usuario values(75,"Alejandro Sanz Toromazote","1458978","0","El pendejal #21","E");
#b) Inscribir o insertar un nuevo libro.
insert into Libro values("48","Historia de mi vida","1000","101","932","526","1003");
##c) Préstamos de libros a estudiante, profesor o asistente de la educación.
insert into Préstamo(idPrestamo,fechainicio,fechatermino,idCatalogo,idUsuario,idLibro,idCategoria) values ("711",2021/10/14,2021/10/18,"1","5","42","1002");
##d) Devolución de libros por parte de un estudiante, profesor o asistente de la educación.
insert into Devolucion(idDevolucion,fecha) values(666,"2021/12/12");
##e) Verificar el stock de los libros en la biblioteca y los que están en calidad de préstamos.
select * from Libro where (estado <>102);
##f) Renovar el préstamo de un libro a un estudiante, profesor o asistente de la educación.
update préstamo set fecha_término_de_préstamo = "2021/09/30" where idPrestamo =707;
##g) Consultar el material bibliográfico por su categoría (solo si consideraron la categoría en los libros) y que además entregue la cantidad de ejemplares y su estado. 
select count(*) from Libro where (Categoría_idCategoría =1001 );
select count(*) from Libro where (Categoría_idCategoría =1002 );
select count(*) from Libro where (Categoría_idCategoría =1003 );
select count(*) from Libro where (Categoría_idCategoría =1004 );
#h) Dar de baja un libro, que no es eliminarlo, sino un cambio de estado.
update Libro set estado = 102 where idLibro =9;
##i) Informar la cantidad de libros en préstamos (id libro, nombre libro, fecha de préstamo, fecha de devolución, id usuario y nombre usuario).
select * from Libro where estado=101;
#j) Eliminar o cambiar de estado a un usuario de la base de datos
Delete from Usuario where nombre = "Miles Morales";
