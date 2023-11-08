import Nave.*
import CriteriosDeVoto.*

object reducirOxigeno {
	method realizarsePor(unImpostor, _unJugador){
		if(nave.alguienTiene("tuboDeOxigeno")) 
			nave.disminuirOxigenoEn(10)
	}
}

object impugnarJugador {
	method realizarsePor(unImpostor, unJugador){
		const criterio = unJugador.criterioDeVotacion()
		unJugador.criterioDeVotacion(new Impugnado(criterioOriginal = criterio))
	}
}