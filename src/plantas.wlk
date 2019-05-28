import wollok.game.*
import hector.*

class Plantas {
	var property posicion
		
	method detecta(otraPlanta){
		
	}
}


class Maiz inherits Plantas{
	
	method image() = "corn_baby.png"
	
	method serRegada() = "corn.adult.png"
}

class Trigo inherits Plantas {
	var property etapa
	
	method image() = "wheat_0.png"
	
	method serRegada() {
		if (etapa == 1) { return "wheat_2.png" }
		if (etapa == 2) { return "wheat_3.png" }
		if (etapa == 3) { return self.image() }
		else return "wheat_1.png"
	}
}

class Tomaco inherits Plantas{
	
	method image() = "tomaco.png"
	
	method serRegada() {
		posicion.moveUp(1)
	}
}
