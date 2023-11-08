import Nave.*
import Jugador.*

class Tripulante inherits Jugador {
	
	override method realizarTarea(unaTarea){
		unaTarea.serRealizadaPor(self)
		tareasPendientes.remove(unaTarea)
	}
}
