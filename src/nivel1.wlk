import wollok.game.*
import niveles.*
import nivel2.*
import visuales.*
import personajes.*

//en esta seccion se modelara el nivel con 1 variable para utilizar la clase nivel
// despues lo referenciamos en el objeto organizar nivel en la variable nivel actual


//aca vamos a modelar el nivel con los objetos 
const nivel1 = new Nivel(
 siguienteNivel = nivel2,
bordes = [
		//borde izquierdo
		new Borde(position = game.at(0,0)),
		new Borde(position = game.at(0,1)),
		new Borde(position = game.at(0,2)),
		new Borde(position = game.at(0,3)),
		new Borde(position = game.at(0,4)),
		new Borde(position = game.at(0,5)),
		new Borde(position = game.at(0,6)),
		new Borde(position = game.at(0,7)),
		new Borde(position = game.at(0,8)),
		new Borde(position = game.at(0,9)),
		new Borde(position = game.at(0,10)),
		new Borde(position = game.at(0,11)),
		new Borde(position = game.at(0,12)),
		new Borde(position = game.at(0,13)),
		new Borde(position = game.at(0,14)),
		new Borde(position = game.at(0,15)),
		new Borde(position = game.at(0,16)),
		new Borde(position = game.at(0,17)),
		new Borde(position = game.at(0,18)),
		new Borde(position = game.at(0,19)),
		new Borde(position = game.at(0,20)),
		
		//borde abajo
		new Borde(position = game.at(1,0)),
		new Borde(position = game.at(2,0)),
		new Borde(position = game.at(3,0)),
		new Borde(position = game.at(4,0)),
		new Borde(position = game.at(5,0)),
		new Borde(position = game.at(6,0)),
		new Borde(position = game.at(7,0)),
		new Borde(position = game.at(8,0)),
		new Borde(position = game.at(9,0)),
		new Borde(position = game.at(10,0)),
		new Borde(position = game.at(11,0)),
		new Borde(position = game.at(12,0)),
		new Borde(position = game.at(13,0)),
		new Borde(position = game.at(14,0)),
		new Borde(position = game.at(15,0)),
		new Borde(position = game.at(16,0)),
		new Borde(position = game.at(17,0)),
		new Borde(position = game.at(18,0)),
		new Borde(position = game.at(19,0)),
		new Borde(position = game.at(20,0)),
		
		//borde derecho
		new Borde(position = game.at(19,1)),
		new Borde(position = game.at(19,2)),
		new Borde(position = game.at(19,3)),
		new Borde(position = game.at(19,4)),
		new Borde(position = game.at(19,5)),
		new Borde(position = game.at(19,6)),
		new Borde(position = game.at(19,7)),
		new Borde(position = game.at(19,8)),
		new Borde(position = game.at(19,9)),
		new Borde(position = game.at(19,10)),
		new Borde(position = game.at(19,11)),
		new Borde(position = game.at(19,12)),
		new Borde(position = game.at(19,13)),
		new Borde(position = game.at(19,14)),
		new Borde(position = game.at(19,15)),
		new Borde(position = game.at(19,16)),
		new Borde(position = game.at(19,17)),
		new Borde(position = game.at(19,18)),
		new Borde(position = game.at(19,19)),
		
		//borde arriba
		new Borde(position = game.at(0,19)),
		new Borde(position = game.at(1,19)),
		new Borde(position = game.at(2,19)),
		new Borde(position = game.at(3,19)),
		new Borde(position = game.at(4,19)),
		new Borde(position = game.at(5,19)),
		new Borde(position = game.at(6,19)),
		new Borde(position = game.at(7,19)),
		new Borde(position = game.at(8,19)),
		new Borde(position = game.at(9,19)),
		new Borde(position = game.at(10,19)),
		new Borde(position = game.at(11,19)),
		new Borde(position = game.at(12,19)),
		new Borde(position = game.at(13,19)),
		new Borde(position = game.at(14,19)),
		new Borde(position = game.at(15,19)),
		new Borde(position = game.at(16,19)),
		new Borde(position = game.at(17,19)),
		new Borde(position = game.at(18,19)),
		new Borde(position = game.at(19,19))
	] ,
	ladrillos = [
		new Ladrillo(position = game.at(4,2)),
		new Ladrillo(position = game.at(6,2)),
	
		
		new Ladrillo(position = game.at(12,2)),
		new Ladrillo(position = game.at(14,2)),
		new Ladrillo(position = game.at(16,2)),
		
		new Ladrillo(position = game.at(4,4)),
		new Ladrillo(position = game.at(6,4)),
		new Ladrillo(position = game.at(8,4)),
		new Ladrillo(position = game.at(10,4)),
		new Ladrillo(position = game.at(12,4)),
		new Ladrillo(position = game.at(14,4)),
		new Ladrillo(position = game.at(16,4)),
		
		new Ladrillo(position = game.at(3,6)),
		new Ladrillo(position = game.at(6,6)),
		new Ladrillo(position = game.at(9,6)),
		new Ladrillo(position = game.at(12,6)),
		new Ladrillo(position = game.at(15,6)),
		new Ladrillo(position = game.at(18,6)),
		
		new Ladrillo(position = game.at(3,8)),
		new Ladrillo(position = game.at(6,8)),
		new Ladrillo(position = game.at(9,8)),
		new Ladrillo(position = game.at(12,8)),
		new Ladrillo(position = game.at(15,8)),
		new Ladrillo(position = game.at(18,8)),
		
		new Ladrillo(position = game.at(4,12)),
		new Ladrillo(position = game.at(6,12)),
		new Ladrillo(position = game.at(8,12)),
		new Ladrillo(position = game.at(10,12)),
		new Ladrillo(position = game.at(12,12)),
		new Ladrillo(position = game.at(14,12)),
		new Ladrillo(position = game.at(16,12)),
		
		new Ladrillo(position = game.at(4,14)),
		new Ladrillo(position = game.at(6,14)),
		new Ladrillo(position = game.at(8,14)),
		new Ladrillo(position = game.at(10,14)),
		new Ladrillo(position = game.at(12,14)),
		new Ladrillo(position = game.at(14,14)),
		new Ladrillo(position = game.at(16,14)),
		
		new Ladrillo(position = game.at(3,16)),
		new Ladrillo(position = game.at(6,16)),
		new Ladrillo(position = game.at(9,16)),
		new Ladrillo(position = game.at(12,16)),
		new Ladrillo(position = game.at(15,16)),
		new Ladrillo(position = game.at(18,16)),
		
		new Ladrillo(position = game.at(3,18)),
		new Ladrillo(position = game.at(6,18)),
		new Ladrillo(position = game.at(9,18)),
		new Ladrillo(position = game.at(12,18)),
		new Ladrillo(position = game.at(15,18)),
		
		new Ladrillo(position = game.at(2,18))
	
	],
	enemigos = [
	  new Enemigos(position = game.at(1, 18)),
	  new Enemigos(position = game.at(4, 18)),
	  new Enemigos(position = game.at(7, 18)),
	  new Enemigos(position = game.at(10, 18)),
	  new Enemigos(position = game.at(11, 18))
	],
	
  	posInicial = game.at(2,2)
  )