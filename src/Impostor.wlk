import Nave.*
import Jugador.*

class Impostor inherits Jugador {
	
	//3
	override method completoTodasSusTareas() = true
	
	override method realizarTarea(_unaTarea){
		//no hacen nada
	}
}
