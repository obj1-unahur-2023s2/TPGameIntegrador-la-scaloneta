import wollok.game.*
import visuales.*
import personajes.*
import niveles.*

const nivel2 = new Nivel(

siguienteNivel = null,
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
		
		
		new Ladrillo(position = game.at(1,11)),
		new Ladrillo(position = game.at(1,10)),
		new Ladrillo(position = game.at(1,9)),
		new Ladrillo(position = game.at(1,8)),
		new Ladrillo(position = game.at(2,8)),
		new Ladrillo(position = game.at(3,8)),
		new Ladrillo(position = game.at(3,9)),
		new Ladrillo(position = game.at(3,10)),
		new Ladrillo(position = game.at(3,11)),
		
		
		new Ladrillo(position = game.at(4,15)),
		new Ladrillo(position = game.at(4,16)),
		new Ladrillo(position = game.at(4,17)),
		new Ladrillo(position = game.at(5,17)),
		new Ladrillo(position = game.at(6,15)),
		new Ladrillo(position = game.at(6,16)),
		new Ladrillo(position = game.at(6,17)),
		
		
		new Ladrillo(position = game.at(7,7)),
		new Ladrillo(position = game.at(7,8)),
		new Ladrillo(position = game.at(7,9)),
		new Ladrillo(position = game.at(7,10)),
		new Ladrillo(position = game.at(8,10)),
		new Ladrillo(position = game.at(8,8)),
		new Ladrillo(position = game.at(9,7)),				
		new Ladrillo(position = game.at(9,8)),
		new Ladrillo(position = game.at(9,9)),
		new Ladrillo(position = game.at(9,10)),
		
		new Ladrillo(position = game.at(10,14)),
		new Ladrillo(position = game.at(10,15)),
		new Ladrillo(position = game.at(10,16)),
		new Ladrillo(position = game.at(10,17)),
		new Ladrillo(position = game.at(10,18)),
		new Ladrillo(position = game.at(11,16)),
		new Ladrillo(position = game.at(12,14)),
		new Ladrillo(position = game.at(12,15)),
		new Ladrillo(position = game.at(12,16)),
		new Ladrillo(position = game.at(12,17)),
		new Ladrillo(position = game.at(12,18)),
		
		new Ladrillo(position = game.at(13,11)),
		new Ladrillo(position = game.at(13,10)),
		new Ladrillo(position = game.at(13,9)),
		new Ladrillo(position = game.at(13,8)),
		new Ladrillo(position = game.at(14,8)),
		new Ladrillo(position = game.at(15,8)),
		new Ladrillo(position = game.at(15,9)),
		new Ladrillo(position = game.at(15,10)),
		new Ladrillo(position = game.at(15,11)),
		
		new Ladrillo(position = game.at(16,13)),
		new Ladrillo(position = game.at(16,14)),
		new Ladrillo(position = game.at(16,15)),
		new Ladrillo(position = game.at(16,16)),
		new Ladrillo(position = game.at(17,16)),
		new Ladrillo(position = game.at(17,14)),
		new Ladrillo(position = game.at(18,13)),				
		new Ladrillo(position = game.at(18,14)),
		new Ladrillo(position = game.at(18,15)),
		new Ladrillo(position = game.at(18,16))
				
		
	
	],
	enemigos = [
		new Enemigos(position = game.at(1, 6)),
	  new Enemigos(position = game.at(5, 10)),
	  new Enemigos(position = game.at(10, 9)),
	  new Enemigos(position = game.at(16, 6)),
	  new Enemigos(position = game.at(18, 3))
	 
	],
	
  	posInicial = game.at(2,2)
  )