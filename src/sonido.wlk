import wollok.game.*

object sonido{
	var activo = false
	var musica = game.sound("musica_general.mp3")
	
	method iniciar(){
		musica.shouldLoop(true)
		activo = true
		musica.play()
	}

	method activar(){
		activo = true
		musica.resume()
	}
					
	method pausar(){
		activo = false
		musica.pause()
	}
	
	method cambiar(){
		if(activo) self.pausar() else self.activar()
	}
	
	method ganar(){
		if (activo) musica.pause()
		musica = game.sound("musica_fin.mp3")
		musica.play()
	}
}