import Nave.*

class Tarea {
	method serRealizadaPor(_unJugador){
		nave.verificarGanadores()
	}
	
	method puedeRealizarsePor(unJugador) = true
}

object arreglarTableroElectrico inherits Tarea {

	override method serRealizadaPor(unJugador){
		unJugador.aumentarSospechaEn(10)
		unJugador.usarItem("llaveInglesa")
		super(unJugador)
	}
	
	override method puedeRealizarsePor(unJugador) = unJugador.tieneItem("llaveInglesa")
}

}

object avisarFinish inherits Tarea { 
	override method serRealizadaPor(unJugador){
		nave.verificarGanadores()
	}
}