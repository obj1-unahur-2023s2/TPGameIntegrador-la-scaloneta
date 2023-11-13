import wollok.game.*
import configuraciones.*
import niveles.*
import sonido.*
import visuales.*
import personajes.*

// aca vamos a programas las instancias del juego en la que podes iniciar ganar y perder
object juego {

	method iniciar() {
		config.configurarPantalla()
		imagenInicio.mostrar()
		game.schedule(5000, { organizarNiveles.nivelActual().iniciar()
		; sonido.iniciar()
		}) // forma de organizar los niveles
		game.start()
	}

	method ganar() {
		game.clear()
			// imagenGanadora.mostrar()
		sonido.ganar()
		game.schedule(10000, { game.stop()})
	}

	method perder() {
		game.clear()
		imagenGameOver.mostrar()
		game.schedule(10000, { organizarNiveles.volverAEmpezar()})
	}

}

