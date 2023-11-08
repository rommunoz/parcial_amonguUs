import Nave.*
import Jugador.*

class Tripulante inherits Jugador {
	
	override method completoTodasSusTareas() {
		return tareas.all{tarea => tarea.fueCompletada()}
	}
	
	method realizarTarea(_unaTarea){
		//no hacen nada
	}
}
