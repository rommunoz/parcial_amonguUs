import Nave.*

class Tarea {
	const itemsNecesarios = []
	
	method serRealizadaPor(unJugador){
		itemsNecesarios.forEach {item => unJugador.usarItem(item)}
	}
	
	method puedeRealizarsePor(unJugador) = true
}

object arreglarTableroElectrico inherits Tarea(itemsNecesarios = ["llaveInglesa"]) {

	override method serRealizadaPor(unJugador){
		unJugador.aumentarSospechaEn(10)
		super(unJugador)
	}
	
	override method puedeRealizarsePor(unJugador) = unJugador.tieneItem("llaveInglesa")
}

object sacarLaBasura inherits Tarea(itemsNecesarios = ["escoba", "bolsaDeConsorcio"]) {

	override method serRealizadaPor(unJugador){
		unJugador.aumentarSospechaEn(10)
		super(unJugador)
	}
	
	override method puedeRealizarsePor(unJugador) = 
		itemsNecesarios.all { item => unJugador.tieneItem(item)}
}

object ventilarLaNave inherits Tarea {

	override method serRealizadaPor(unJugador){
		nave.aumentarOxigeno(5)
	}
	
	override method puedeRealizarsePor(unJugador) = 
		itemsNecesarios.all { item => unJugador.tieneItem(item)}
}

object noHacerNada inherits Tarea { 
	override method serRealizadaPor(unJugador){
		//
	}
}