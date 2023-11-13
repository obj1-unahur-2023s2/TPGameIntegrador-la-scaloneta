import wollok.game.*
import sonido.*
import niveles.*
import personajes.*
import nivel1.*

// se crean las condiciones del tablero
// se añaden los personajes y se configuran los que están enlazados con nivel1.wlk en el metodo iniciar()

object config {

	method configurarPantalla() {
		// se establecen las condiciones del tablero
		game.title("Battle City")
		game.width(20)
		game.height(20)
		game.cellSize(30)
		game.boardGround("fondo_principal.jpg")
	}

	method configurarPersonajes() {
		// todo lo que se ponga en este metodo aparecera en el nivel ya que esta en el metodo de inciar en la clase nivel
		// ejecuta un bloque de codigo que aparece en el nivel ya que se ejecuta en nivel.wlk/iniciar()
		self.configurarTeclas()
	}

	method configurarTeclas() {
		keyboard.b().onPressDo({ sonido.cambiar()})
		
		keyboard.enter().onPressDo({ organizarNiveles.volverAEmpezar()})
		
		keyboard.x().onPressDo({ tanqueJugador.disparar()})
		
		keyboard.t().onPressDo({ game.say(tanqueJugador,tanqueJugador.cantidadDePuntos())})
		keyboard.up().onPressDo({ tanqueJugador.moverArriba()})
		keyboard.down().onPressDo({ tanqueJugador.moverAbajo()})
		keyboard.left().onPressDo({ tanqueJugador.moverIzquierda()})
		keyboard.right().onPressDo({ tanqueJugador.moverDerecha()})
	}

}

