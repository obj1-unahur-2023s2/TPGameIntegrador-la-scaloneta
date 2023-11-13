import wollok.game.*
import niveles.*

//en este archivos vamos a crear las modelaciones de los objetos de nivel 
// que depues seran creadas en la clase nivel con el metodo crear todos
// seran los argumentos de ese metodo

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
//esta clase  esta aparte por que son para las imagenes que apareceran en pantalla

	var property image
	var property position 
	
	method mostrar(){ game.addVisual(self) }
}

const imagenInicio = new Visual(image = "imagenInicio.jpg", position = game.at(0,5))
const imagenGameOver = new Visual(image = "gameOver.jpg", position = game.at(0,5))
const imagenGanadora = new Visual(image = "imagenGanadora.jpg", position = game.at(0,5))














