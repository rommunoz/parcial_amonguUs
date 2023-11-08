import Nave.*
import Tareas.*

class Jugador {
	var property expulsado
	var votos = 0
	var mochila = []
	var color
	var sospecha = 40
	var tareasPendientes = new List()
	
	//1
	method esSospechoso() = sospecha > 50
	//2
	method buscarItem(unItem){
		mochila.add(unItem)
	}
	
	//3
	method completoTodasSusTareas() = tareasPendientes.isEmpty() //por mi cambio de modelado
	
	//4
	method realizarTareaPendiente(){
		const pendiente = tareasPendientes.findOrDefault(
			{tarea => self.puedoRealizar(tarea)}, noHacerNada
		)
		self.realizarTarea(pendiente)
		nave.verificarGanadores()
	}
	
	method puedoRealizar(unaTarea){
		return unaTarea.puedeRealizarsePor(self)
	}

	method realizarTarea(unaTarea)
	
	method usarItem(unItem){
		mochila.remove(unItem)
	}
	
	method aumentarSospechaEn(unaCantidad){
		sospecha += unaCantidad
	}
	
	method tieneItem(unItem) = mochila.contains(unItem)
	
}
