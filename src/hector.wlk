import wollok.game.*

object hector {
	var property position = game.at(3,3)
	
	method image() = "player.png"
	
	method move(nuevaPosicion) { self.position(nuevaPosicion) }
	
	method sembrar(planta) {
		game.addVisual(planta)
		
	}
	
	method regar(planta) {
		planta.serRegada()
	}
	
}
