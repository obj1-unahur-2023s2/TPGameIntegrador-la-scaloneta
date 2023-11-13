import wollok.game.*
import proyectiles.*
import niveles.*
import juego.*
import nivel1.*

//en este archivos se modelaran los personajes los cuales seran el tanque y los enemigos
class Personajes {

//estos metodos te va a devolver true o false dependiendo si la posicion a la que te vas a querer mover esta vacia o no
	method estaVacioArriba(unaPosicion) = self.casilleroVacio(unaPosicion.up(1))

	method estaVacioAbajo(unaPosicion) = self.casilleroVacio(unaPosicion.down(1))

	method estaVacioALaDerecha(unaPosicion) = self.casilleroVacio(unaPosicion.right(1))

	method estaVacioALaIzquierda(unaPosicion) = self.casilleroVacio(unaPosicion.left(1))

	method casilleroVacio(unaPosicion) = game.getObjectsIn(unaPosicion).isEmpty()

}

object tanqueJugador inherits Personajes {

	var property image = "tanque_arriba.png"
	var property position = null
	var cantidadDePuntos = 0

	method crear() {
		game.addVisual(self)
	}

	// en los metodos de movimiento se va moviendo preguntando si las celdas vecinas estan vacias para avanzar
	method moverArriba() {
		if (self.estaVacioArriba(self.position())) {
			position = position.up(1)
			image = "tanque_arriba.png"
		}
	}

	method moverAbajo() {
		if (self.estaVacioAbajo(self.position())) {
			position = position.down(1)
			image = "tanque_abajo.png"
		}
	}

	method moverIzquierda() {
		if (self.estaVacioALaIzquierda(self.position())) {
			position = position.left(1)
			image = "tanque_izquierda.png"
		}
	}

	method moverDerecha() {
		if (self.estaVacioALaDerecha(self.position())) {
			position = position.right(1)
			image = "tanque_derecha.png"
		}
	}

	method estaMirandoArriba() = image == "tanque_arriba.png"

	method estaMirandoAbajo() = image == "tanque_abajo.png"

	method estaMirandoALaIzquierda() = image == "tanque_izquierda.png"

	method estaMirandoALaDerecha() = image == "tanque_derecha.png"

	// el metodo disparar va a disparar dependiendo de donde este mirando que va a depender de las imagenes
	method disparar() {
		if (self.estaMirandoArriba()) {
			self.dispararArriba()
		} else if (self.estaMirandoAbajo()) {
			self.dispararAbajo()
		} else if (self.estaMirandoALaDerecha()) {
			self.dispararDerecha()
		} else {
			self.dispararIzquierda()
		}
	}

	method dispararArriba() {
		const bala = new Balas(image = "bala_arriba.jpg", position = self.position().up(1))
		game.addVisual(bala)
		bala.impacto()
		bala.desplazarArriba()
	}

	method dispararAbajo() {
		const bala = new Balas(image = "bala_arriba.jpg", position = self.position().down(1))
		game.addVisual(bala)
		bala.impacto()
		bala.desplazarAbajo()
	}

	method dispararDerecha() {
		const bala = new Balas(image = "bala_arriba.jpg", position = self.position().right(1))
		game.addVisual(bala)
		bala.impacto()
		bala.desplazarseDerecha()
	}

	method dispararIzquierda() {
		const bala = new Balas(image = "bala_arriba.jpg", position = self.position().left(1))
		game.addVisual(bala)
		bala.impacto()
		bala.desplazarseIzquierda()
	}

	method teImpactoUnProyectil() {
		game.removeVisual(self)
		organizarNiveles.perderVida()
	}

	method puntaje(unPuntaje) {
		cantidadDePuntos += unPuntaje
	}

	method cantidadDePuntos() = "Tengo" + cantidadDePuntos + "puntos"
	

}

class Enemigos inherits Personajes {

	var property position = null
	var property image = "enemigo.png"
	const puntaje = 500

	method crear() {
		game.addVisual(self)
		self.atacarBase()
		self.pisar()
	}

	method puntajeQueOtorga() = puntaje

	method atacarBase() {
		game.onTick(3000, "acercarse", { self.darUnPaso(base.position())})
	}

	method darUnPaso(destino) {
		position = game.at(self.acercarseEnXA(destino), self.acercarseEnYA(destino))
	}

	method acercarseEnXA(destino) = position.x() - (position.x() - destino.x()) / 2

	method acercarseEnYA(destino) = position.y() - (position.y() - destino.y()) / 2

	method pisar() {
		game.onCollideDo(self, { unObjeto => unObjeto.tePisoLaNave()})
	}

	method tePisoLaNave() {
	}

	method teImpactoUnProyectil() {
		game.removeVisual(self)
		tanqueJugador.puntaje(puntaje)
	}

}

object base {

	var property image = "Aguila.png"
	const position = game.at(9, 1)

	method crear() {
		game.addVisual(self)
	}

	method tePisoLaNave() {
		game.removeVisual(self)
		organizarNiveles.perderVida()
	}

	method teImpactoUnProyectil() {
		juego.perder()
	}

	method position() = position

}

