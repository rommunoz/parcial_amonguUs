import Nave.*
import Tareas.*

class Jugador {
	var property expulsado
	var votos = 0
	var mochila = []
	var color
	var sospecha = 40
	var tareas = new List()
	
	//1
	method esSospechoso() = sospecha > 50
	//2
	method buscarItem(unItem){
		mochila.add(unItem)
	}
	
	//3
	method completoTodasSusTareas()
	
	//4
	method realizarTareaPendiente(){
		const pendiente = tareas.findOrDefault ({tarea => not tarea.fueCompletada()}, avisarFinish)
		if (self.puedoRealizar(pendiente))
		self.realizarTarea(pendiente)
	}
	
	method realizarTarea(unaTarea){
		unaTarea.serRealizadaPor(self)
	}
	
	method puedoRealizar(unaTarea){
		return unaTarea.puedeRealizarsePor(self)
	}
	
	method usarItem(unItem){
		mochila.remove(unItem)
	}
	
	method aumentarSospechaEn(unaCantidad){
		sospecha += unaCantidad
	}
	
	method tieneItem(unItem) = mochila.contains(unItem)
	
}
