import Nave.*
import VotoEnBlanco.*

class CriterioDeVoto {
	method votarAUnoDe(unVotante, jugadoresEnNave){
		try	{
			const elegido = self.elegirUnoDe(jugadoresEnNave)
			unVotante.votarA(elegido)
		} catch exc : ElementNotFoundException {
			unVotante.votarEnBlanco()
		}
	}
	method elegirUnoDe(jugadoresEnNave) //la idea es que se lo redefina
}

object troll inherits CriterioDeVoto {
	override method elegirUnoDe(jugadoresEnNave) = 
		jugadoresEnNave.find {jugador => not jugador.esSospechoso()}
}

object detective inherits CriterioDeVoto {
	override method elegirUnoDe(jugadoresEnNave) = 
		jugadoresEnNave.maxIfEmpty{jug => jug.sospecha()}
}

object materialista inherits CriterioDeVoto {
	override method elegirUnoDe(jugadoresEnNave) = 
		jugadoresEnNave.find {jugador => jugador.mochilaVacia()}
}

class Impugnado {
	var turnos = 1
	const criterioOriginal
	
	method votarAUnoDe(unVotante, jugadoresEnNave){
		unVotante.votarEnBlanco()
		turnos--
		if (turnos == 0) unVotante.criterioDeVotacion(criterioOriginal)
	}
}
