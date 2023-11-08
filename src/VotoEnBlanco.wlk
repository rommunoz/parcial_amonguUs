//polimorfico con el jugador para la nave
object votoEnBlanco {
	var votosEnContra = 0
	
	method sumarVotoEnContra(){
		votosEnContra++
	}
	
	method serExpulsado(){
		//-
	}
	
	method resetearVotosEnContra(){
		votosEnContra = 0
	}
	
	method votosEnContra() = votosEnContra
	
}
