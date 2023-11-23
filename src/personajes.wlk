import wollok.game.*
import proyectiles.*
import direcciones.*
import niveles.*
import juego.*
import nivel1.*
import nivel2.*

//en este archivos se modelaran los personajes los cuales seran el tanque y los enemigos
class Personajes {

	var property position = null

	//este metodo devuelve si el casillero esta vacio
	method elCasilleroEstaVacioEn(unaPosicion) = game.getObjectsIn(unaPosicion).isEmpty()
	
	//parametrizo los movimientos con un objeto direccion y con la imagen que va a ir cambiando 
	// dependiendo a la direccion que se quiera mover el personaje
	
	method moverPersonajeA(unaDireccion, imagen) {}
	
	//te devuelve uno de los objetos direccionables avanzando una posicion
	method proximaDireccion(unaDireccion) = unaDireccion.proximaPosicion(position)
	
	//este metodo ejecuta el disparo dependiendo de la imagen y la direccion
	
	method dispararEnDireccion(dondeMiraElProyectil, unaDireccion) {
		const proyectil = dondeMiraElProyectil
		game.addVisual(proyectil)
		proyectil.impacto()
		proyectil.desplazarProyectilEnDireccion(unaDireccion)
	}
	


}

object tanqueJugador inherits Personajes {

	var property image = "tanque_arriba.png"
	var cantidadDePuntos = 0

	method crear() {
		game.addVisual(self)
	}
	// mover personaje a necesita un parametro de direccion y una imagen mirando a la misma
		// las direcciones las creamos como objetos con un metodo que te responda para la proxima posicion
	override method moverPersonajeA(unaDireccion, imagen) {
		const proximaDireccion = self.proximaDireccion(unaDireccion)
		if (self.elCasilleroEstaVacioEn(proximaDireccion)) {
			image = imagen
			position = proximaDireccion
		}
	}

	method elPersonajeEstaMirandoA(unaImagen) = image == unaImagen
	
	method disparar() {
		
		if (self.elPersonajeEstaMirandoA("tanque_arriba.png")) {
			
			self.dispararEnDireccion(new Balas(position = self.position().up(1), image = "bala_arriba.jpg"), arriba)
			
		} else if (self.elPersonajeEstaMirandoA("tanque_abajo.png")) {
			
			self.dispararEnDireccion(new Balas(position = self.position().down(1), image = "bala_abajo.jpg"), abajo)
			
		} else if (self.elPersonajeEstaMirandoA("tanque_derecha.png")) {
			
			self.dispararEnDireccion(new Balas(position = self.position().right(1), image = "bala_derecha.jpg"), derecha)
			
		} else {
			
			self.dispararEnDireccion(new Balas(position = self.position().left(1), image = "bala_izquierda.jpg"), izquierda)
			
		}
		
	}
	
	method teImpactoUnProyectil() {game.removeVisual(self)}
	
	method puntaje(unPuntaje) { cantidadDePuntos += unPuntaje }

	method cantidadDePuntos() = "Tengo" + cantidadDePuntos + "puntos"
	
	method tePisoLaNave() {}
}


 class Enemigos inherits Personajes {

	var property image = "enemigo.png"
	const puntaje = 500

	method crear() {
		game.addVisual(self)
		self.atacarBase()
		self.pisar()
	}

	method puntajeQueOtorga() = puntaje

	method atacarBase() { 
		game.onTick(3000, "acercarse", { self.darUnPaso(base.position()) } )
	}

	method darUnPaso(destino) { position = game.at(self.acercarseEnXA(destino), self.acercarseEnYA(destino)) }

	method acercarseEnXA(destino) = position.x() - (position.x() - destino.x()) / 2

	method acercarseEnYA(destino) = position.y() - (position.y() - destino.y()) / 2

	method pisar() { game.onCollideDo(self, { unObjeto => unObjeto.tePisoLaNave()}) }

	method tePisoLaNave() { }

	method teImpactoUnProyectil() {
		organizarNiveles.nivelActual().eliminarEnemigos(self)
		game.removeVisual(self)
		tanqueJugador.puntaje(puntaje)
	}
}

object base {

	var property image = "Aguila.png"
	const position = game.at(9, 1)

	method crear() { game.addVisual(self) }

	method tePisoLaNave() {
		game.removeVisual(self)
		organizarNiveles.perderVida()
	}
	
	method teImpactoUnProyectil() { 
		if (organizarNiveles.nivelActual().noHayEnemigos()){
			game.removeVisual(self)
			organizarNiveles.cargarSiguienteNivel()
		}
	}

	method position() = position
	
}