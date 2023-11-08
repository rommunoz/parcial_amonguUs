import Excepciones.*
import VotoEnBlanco.*

object nave {
	const impostoresEnNave = new List()
	const tripulantesEnNave = new List()
	const jugadores = impostoresEnNave + tripulantesEnNave
	var oxigeno
	
	//4
	method verificarGanadores(){
		if (self.todosCompletaronSusTareas()) throw AllTasksFinish //finished
	}
	
	method todosCompletaronSusTareas(){
		return jugadores.all {tripulante => tripulante.completoTodasSusTareas()}
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
	
	//5
	method alguienTiene(unItem) =
		tripulantesEnNave.any {jugador => jugador.tieneItem(unItem)} //decidi que se fije todos los jugadores
	
	method jugadoresEnNave() = impostoresEnNave + tripulantesEnNave // cuando se lo llama devuelve actualizada
	
	//6
	method reunionDeEmergencia(){
		const elMasVotado = self.masVotadoEntre(self.jugadoresEnNave())
		self.expulsarA(elMasVotado)
		self.resetearVotosDeJugadores()
	}
	
	method masVotadoEntre(jugadoresEnNave) {
		jugadoresEnNave.forEach { jugador => jugador.votarAUnoDe(jugadoresEnNave)}
		jugadoresEnNave.add(votoEnBlanco) //lo tengo recien aca en cuenta 
		return jugadoresEnNave.max { jugador => jugador.votosEnContra()} //votoEnBlanco entiende el mismo msj
	}
	
	method expulsarA(elMasVotado) {
		elMasVotado.serExpulsado()
		self.verificarGanadorPorExpulsion()
	}
	
	method expulsarImpostor(unImpostor){
		impostoresEnNave.remove(unImpostor)
	}
	
	method expulsarTripulante(unTripulante){
		tripulantesEnNave.remove(unTripulante)
	}
	
	method verificarGanadorPorExpulsion(){
		if (impostoresEnNave.size() == 0 ) 							throw LibresDelMal
		if (impostoresEnNave.size() == tripulantesEnNave.size())	throw YaNoSonMayoria
	}
	
	method noExpulsadosDe(unosJugadores) = 
		unosJugadores.filter {jugador => not jugador.serExpulsado()}
		
	method resetearVotosDeJugadores(){
		(self.jugadoresEnNave() + [votoEnBlanco]).forEach {votable => votable.resetearVotosEnContra()}
	}
	
}
