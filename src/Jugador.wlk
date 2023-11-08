import Nave.*
import Tareas.*
import VotoEnBlanco.*

class Jugador {
	var property expulsado
	var votosEnContra = 0
	var mochila = []
	var color
	var sospecha = 40
	var tareasPendientes = new List()
	var criterioDeVotacion 
	
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
	
	//6
	method llamarAReunionDeEmergencia(){
		nave.reunionDeEmergencia()
	}
	
	method votarAUnoDe(jugadoresEnNave){
		criterioDeVotacion.votarAUnoDe(self, jugadoresEnNave)
	}
	
	method votarEnBlanco(){
		self.votarA(votoEnBlanco)
	}
	
	method votarA(unJugador){
		unJugador.sumarVotoEnContra()
	}
	
	method sumarVotoEnContra(){
		votosEnContra++
	}
	method votosEnContra() = votosEnContra
	
	method mochilaVacia() = mochila.isEmpty()
	
	method serExpulsado(){
		self.expulsado(true)
	}
	
	method resetearVotosEnContra(){
		votosEnContra = 0
	}
}
