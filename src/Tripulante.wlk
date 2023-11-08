import Nave.*
import Jugador.*

class Tripulante inherits Jugador {
	
	override method realizarTarea(unaTarea){
		unaTarea.serRealizadaPor(self)
		tareasPendientes.remove(unaTarea)
	}
	
	//6
	override method serExpulsado(){
		nave.expulsarTripulante(self)
		super()
	}
}
