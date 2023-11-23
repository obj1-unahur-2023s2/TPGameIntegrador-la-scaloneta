import wollok.game.*
import direcciones.*

class Proyectiles {

	var property position

	method desplazarProyectilEnDireccion(unaDireccion) {}

	method siElProyectilNoEstaEnElTablero() = position.x() > game.width() and position.y() > game.height()

	method moverEnDireccion(unaDireccion) {}

}

class Balas inherits Proyectiles {
	var property image 

	override method desplazarProyectilEnDireccion(unaDireccion) {
		game.onTick(50,"balas", { self.moverEnDireccion(unaDireccion)})
	}

	override method moverEnDireccion(unaDireccion) {
		
		position = 	unaDireccion.proximaPosicion(position)

		if (self.siElProyectilNoEstaEnElTablero()) {
			self.teImpactoUnProyectil()
		}
		
	}
	
	method teImpactoUnProyectil() {  game.removeVisual(self) }

	method impacto() { game.onCollideDo(self, { unObjeto =>unObjeto.teImpactoUnProyectil(); self.teImpactoUnProyectil()}) }
	
	method tePisoLaNave() {}

}


