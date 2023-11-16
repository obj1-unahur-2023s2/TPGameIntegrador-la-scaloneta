import wollok.game.*
import sonido.*
import niveles.*
import personajes.*
import direcciones.*
import visuales.*

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
		
		keyboard.up().onPressDo({ tanqueJugador.moverPersonajeA(arriba,"tanque_arriba.png")})
		keyboard.down().onPressDo({ tanqueJugador.moverPersonajeA(abajo,"tanque_abajo.png")})
		keyboard.left().onPressDo({ tanqueJugador.moverPersonajeA(izquierda,"tanque_izquierda.png")})
		keyboard.right().onPressDo({ tanqueJugador.moverPersonajeA(derecha,"tanque_derecha.png")})
		keyboard.t().onPressDo({ organizarNiveles.perderVida()})
	}
	
}

