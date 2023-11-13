import wollok.game.*
import configuraciones.*
import juego.*
import nivel1.*
import nivel2.*
import visuales.*
import personajes.*




object organizarNiveles {
//Se crean los niveles
	var property nivelActualNumero = 1
	var property nivelActual = nivel1
	var property vidas = 3

	method ultimoNivel() = self.nivelActual().siguienteNivel() == null

	method perderVida() {
		if (vidas == 1) {
			juego.perder()
		} else {
			vidas -= 1
			nivelActual.iniciar()
		}
	}

	method cargarSiguienteNivel() {
		// indica que mientas no sea el ultimo nivel, avance al siguiente. 
		// si es el ultimo se llama a juego.ganar() (victoria).
		if (!self.ultimoNivel()) {
			nivelActual = nivelActual.siguienteNivel()
			nivelActualNumero += 1
			vidas = 3
			nivelActual.iniciar()
		} else {
			juego.ganar()
		}
	}

	method volverAEmpezar() {
		// este metodo reinicia en el nivel 1
		vidas = 3
		nivelActual = nivel1
		nivelActualNumero = 1
		nivelActual.iniciar()
	}

}

class Nivel {

// se modelan los obstaculos y personajes. 
// se crean los niveles y se ubican en el tablero
	var property ladrillos = []
	var property bordes = []
	var property posInicial = null
	var property siguienteNivel = null
	var property cantEnemigos = null
	var property enemigos = []
	var property posDeBase = null

	method iniciar() {
		// se accede al objeto config para configurar los personajes
		game.clear()
		self.crearYConfigurarObjetos()
		config.configurarPersonajes()
	
	}

	method crearYConfigurarObjetos() {
		// este metodo llama al constructor de objetos de cada nivel
		// tambien declara la posicion del tanque inicial
		self.crearTodos(ladrillos + bordes + [ barraDeVidas ] + [ tanqueJugador ] + [ base ] + enemigos)
		
		base.position(posDeBase)
		tanqueJugador.position(posInicial)
	}

	method crearTodos(listaObjetos) {
		// ejectura el metodo crear() de todos los objetos
		listaObjetos.forEach({ objeto => objeto.crear()})
	}
	

}

