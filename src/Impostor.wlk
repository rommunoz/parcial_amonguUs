import Nave.*
import Jugador.*

class Impostor inherits Jugador {
	
	//3
	override method completoTodasSusTareas() = true
	
	override method realizarTarea(_unaTarea){
		//no hacen nada
	}
	
	//5
	method realizarSabotaje(unSabotaje, unJugador){
		unSabotaje.realizarsePor(self, unJugador)
		self.aumentarSospechaEn(5)
	}
	//6
	override method serExpulsado(){
		nave.expulsarImpostor(self)
		super()
	}
}
