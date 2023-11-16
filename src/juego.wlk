import wollok.game.*
import configuraciones.*
import niveles.*
import sonido.*
import visuales.*


// aca vamos a programas las instancias del juego en la que podes iniciar ganar y perder

object juego{
	method iniciar(){
		// el metodo iniciar llama al objeto config (configuraciones) para agregar las configuraciones de pantalla
		// ponemos una imagen de inicio (mas adelante)
		// llamamos al objetos organizar niveles para que inicie en el nivel 1 que esta inicializado con una variable
		config.configurarPantalla()
		imagenInicio.mostrar()
		game.schedule(5000, {organizarNiveles.nivelActual().iniciar(); sonido.iniciar()}) // forma de organizar los niveles
		game.start()
		
	}
	
	method ganar(){
		// cuando ganas se limpia el tablero y se muestra una imagen ganadora
		// ejecuta el sonido ganar
		// y se para el juego
		
		game.clear()
		//imagenGanadora.mostrar()
		sonido.ganar()
		game.schedule(1000,{game.stop()})
	}
	
	method perder(){
		//se limpia el tablero
		//muestra imagen de derrota
		//y se reinicia desde el nivel 1 a los 5 segundos
		
		game.clear()
		imagenGameOver.mostrar()
		game.schedule(5000,{organizarNiveles.volverAEmpezar()})
	}
	
	
}