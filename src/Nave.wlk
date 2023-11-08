import Excepciones.*

object nave {
	const impostores = new List()
	const tripulantes = new List()
	var oxigeno
	
	//4
	method verificarGanadores(){
		if (self.todosCompletaronSusTareas()) throw AllTasksFinish //finished
	}
	
	method todosCompletaronSusTareas(){
		return self.jugadores().all {tripulante => tripulante.completoTodasSusTareas()}
	}
	
	method aumentarOxigeno(unaCantidad){
		oxigeno += unaCantidad
	}
	
	method disminuirOxigenoEn(unaCantidad){
		oxigeno = 0.max(oxigeno - unaCantidad)
		self.verificarOxigeno()
	}
	
	method verificarOxigeno(){
		if (oxigeno == 0) throw SeTerminoElOxigeno
	}
	
	method jugadores() = impostores + tripulantes
}
