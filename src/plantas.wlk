import wollok.game.*
import hector.*

class Planta {
	method cosecharse() {
		if (self.estaListo()){
			hector.agregarPlanta(self)
			game.removeVisual(self)
		}	
	}
	
	method estaListo()
}


class Maiz inherits Planta {
	var property posicion
	var riego = 0
	
	method valor() = 150
	
	method image() {
		if (riego >= 1) { return "corn_adult.png" }
		else return "corn_baby.png"
	} 
	
	method serRegada() { riego += 1 }
	
	override method estaListo() = riego >= 1
	
}

class Trigo inherits Planta{
	var property posicion
	var property etapa
	
	method valor() = (etapa - 1) * 100
	
	method image() {
		if (etapa == 0) { return "wheat_0.png" }
		if (etapa == 1) { return "wheat_1.png" }
		if (etapa == 2) { return "wheat_2.png" }
		else return "wheat_3.png"
	}
	
 	method serRegada() {
		etapa += 1
		if (etapa > 3) { etapa = 0 }
	}
	
	override method estaListo() = etapa >= 2
}

class Tomaco inherits Planta{
	var property posicion
	
	method valor() = 80
	
	method image() = "tomaco.png"
	
	method moverse(nuevaPosicion) { self.posicion(nuevaPosicion) }
	
	method serRegada() {
		self.moverse(self.posicion().up(1))
	}
	
	override method estaListo() = true
}
