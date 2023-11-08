import Excepciones.*

object nave {
	const impostores = new List()
	const tripulantes = new List()
	
	//4
	method verificarGanadores(){
		if (self.todosCompletaronSusTareas()) throw AllTasksFinish //finished
	}
	
	method todosCompletaronSusTareas(){
		return self.jugadores().all {tripulante => tripulante.completoTodasSusTareas()}
	}
	
	method jugadores() = impostores + tripulantes
}
