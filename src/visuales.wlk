import wollok.game.*
import niveles.*

//en este archivo vamos a crear los modelos de los objetos de nivel.wlk
// que despues seran creadas en nivel.wlk con el metodo crear()o

class VisualesEnNivel {
	var property position 
	
	method crear() {game.addVisual(self)}
	method teImpactoUnProyectil(){}
	
}

class Ladrillo inherits VisualesEnNivel{
	var property image = "ladrillo.jpg"
	
	override method teImpactoUnProyectil(){game.removeVisual(self)}
	
}

class Borde inherits VisualesEnNivel{
	var property image = "bordeDeNivel.jpg"
	
}

object barraDeVidas inherits VisualesEnNivel (position = game.at(1,19)){
	var property image = "vidas-3corazon.png"
	method image() = "vidas-" + organizarNiveles.vidas().toString() + "corazon.png"
}

class Visual {
//crea las imagenes que apareceran en pantalla

	var property image
	var property position 
	
	method mostrar(){ game.addVisual(self) }
}

const imagenInicio = new Visual(image = "imagenInicio.jpg", position = game.at(0,5))
const imagenGameOver = new Visual(image = "gameOver.jpg", position = game.at(0,5))
const imagenGanadora = new Visual(image = "imagenGanadora.jpg", position = game.at(0,5))














