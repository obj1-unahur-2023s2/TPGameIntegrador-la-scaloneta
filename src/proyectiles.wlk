import wollok.game.*

class Balas {

	var property image
	var property position

	method siElProyectilEstaEnElTablero() = position.x() > game.width()

	method desplazarArriba() {
		image = "bala_arriba.jpg"
		game.onTick(50, "municion", { self.moverArriba()})
	}

	method desplazarAbajo() {
		image = "bala_abajo.jpg"
		game.onTick(50, "municion", { self.moverAbajo()})
	}

	method desplazarseDerecha() {
		image = "bala_derecha.jpg"
		game.onTick(50, "municion", { self.moverDerecha()})
	}

	method desplazarseIzquierda() {
		image = "bala_izquierda.jpg"
		game.onTick(50, "municion", { self.moverIzquierda()})
	}

	method moverAbajo() {
		position = position.down(1)
		if (self.siElProyectilEstaEnElTablero()) {
			self.removerImagen()
		}
	}

	method moverArriba() {
		position = position.up(1)
		if (self.siElProyectilEstaEnElTablero()) {
			self.removerImagen()
		}
	}

	method moverIzquierda() {
		position = position.left(1)
		if (self.siElProyectilEstaEnElTablero()) {
			self.removerImagen()
		}
	}

	method moverDerecha() {
		position = position.right(1)
		if (self.siElProyectilEstaEnElTablero()) {
			self.removerImagen()
		}
	}

	method removerImagen() {
		game.removeTickEvent("municion")
	}

	method teImpactoUnProyectil() {
		game.removeVisual(self)
	}

	method impacto() {
		game.onCollideDo(self, { unObjeto =>
			unObjeto.teImpactoUnProyectil()
			game.removeVisual(self)
		})
	}
	
	method tePisoLaNave(){}

}

class Laser inherits Balas {

//esta clase hace exactamente lo mismo que las balas pero se le cambia la imagen de bala por un laser
	override method desplazarArriba() {
		image = "laser_arriba.jpg"
		game.onTick(50, "municion", { self.moverArriba()})
	}

	override method desplazarAbajo() {
		image = "laser_abajo.jpg"
		game.onTick(50, "municion", { self.moverAbajo()})
	}

	override method desplazarseDerecha() {
		image = "laser_derecha.jpg"
		game.onTick(50, "municion", { self.moverDerecha()})
	}

	override method desplazarseIzquierda() {
		image = "laser_izquierda.jpg"
		game.onTick(50, "municion", { self.moverIzquierda()})
	}

}

