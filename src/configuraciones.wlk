import wollok.game.*
import sonido.*
import niveles.*
import personajes.*
import nivel1.*

// en el objeto configuraciones vamos a crear las condiciones del tablero
// añadimos los personajes y configuramos los personajes que esta enlazado
// con la clase nivel en el metodo iniciar
object config {

	method configurarPantalla() {
		// este metodo establece las condiciones del tablero
		game.title("Battle City")
		game.width(20)
		game.height(20)
		game.cellSize(30)
		game.boardGround("fondo_principal.jpg")
	}

	method configurarPersonajes() {
		// todo lo que se ponga en este metodo aparecera en el nivel ya que esta en el metodo de inciar en la clase nivel
		self.configurarTeclas()
	}

	method configurarTeclas() {
		// este metodo te muestra que accion va a ocurrir cuando se presione determinada tecla
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

