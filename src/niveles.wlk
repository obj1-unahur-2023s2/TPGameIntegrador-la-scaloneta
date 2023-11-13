import wollok.game.*
import configuraciones.*
import juego.*
import nivel1.*
import nivel2.*
import visuales.*
import personajes.*


// aca vamos a crear los niveles apoyandonos en el objeto organizar niveles que tiene los metodos 
// de que le pasaria al tanque si pierde las vidas
object organizarNiveles {

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
		// indica que mientas no sea el ultimo nivel pases al que le sigue si es el ultimo 
		// se llama a juego.ganar() que hace que ganes la partida
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

// aca modelamos el nivel en si los obstaculos que va a llevar, sus posiciones de los personajes 
// y demas objetos que apareceran en pantalla
// depues a los niveles lo creamos con distintas variables y le vamos colocando cada objeto en determinada posicion
	var property ladrillos = []
	var property bordes = []
	var property posInicial = null
	var property siguienteNivel = null
	var property cantEnemigos = null
	var property enemigos = []
	var property posDeBase = null

	method iniciar() {
		// el metodo iniciar  primero limpia el tablero despues va al metodo de crear y configurar objetos
		// y por ultimo accede al objeto config para configurar los personajes
		game.clear()
		self.crearYConfigurarObjetos()
		config.configurarPersonajes()
	
	}

	method crearYConfigurarObjetos() {
		// este metodo llama a otro metodo que dice que cree los objetos de cada nivel y en esta instancia se le colola los argumentos
		// tambien declara la posicion del tanque inicial
		self.crearTodos(ladrillos + bordes + [ barraDeVidas ] + [ tanqueJugador ] + [ base ] + enemigos)
		
		base.position(posDeBase)
		tanqueJugador.position(posInicial)
	}

	method crearTodos(listaObjetos) {
		// a todos los objetos que se le pasen por parametro va a ejecutar el metodo crear()
		listaObjetos.forEach({ objeto => objeto.crear()})
	}
	

}

