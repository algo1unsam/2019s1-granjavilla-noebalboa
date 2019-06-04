import wollok.game.*

object hector {
	var property position = game.at(3,3)
	var plantasParaVender = []
	var oroAcumulado = 0
	
	method image() = "player.png"
	
	method move(nuevaPosicion) { self.position(nuevaPosicion) }
	
	method mensaje() { 
		game.say(self, "Tengo " + self.monedas() + " monedas, y " + self.plantasCosechadas() + " planta/s para vender")
	}
	
	method plantasCosechadas() = plantasParaVender.size()
	
	method monedas() = oroAcumulado
	
	method sembrar(planta) {
		game.addVisualIn(planta, self.position())
	}
	
	method hayUnaPlanta() {  
		return not game.colliders(self).isEmpty()
	}
	
	method regar(planta) {
		if (self.hayUnaPlanta()){
			planta.forEach{unaPlanta => unaPlanta.serRegada()}
		}
		else game.say(self, "No tengo nada para regar")
	}
	
	method cosechar(planta){
		if (self.hayUnaPlanta()){
			planta.forEach{unaPlanta => unaPlanta.cosecharse()}
			plantasParaVender.add(planta)
		}
		else game.say(self, "No tengo nada para cosechar")
	}
	
	method venderPlantas(){
		if (self.plantasCosechadas() > 0){
			oroAcumulado += plantasParaVender.sum{unaPlanta => unaPlanta.valor()}
			plantasParaVender.clear()
		}
		else game.say(self, "No tengo plantas para vender")
	} 
}
