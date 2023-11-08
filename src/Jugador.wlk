import Nave.*

class Jugador {
	var property expulsado
	var votos = 0
	var mochila = []
	var color
	var sospecha = 40
	
	method esSospechoso() = sospecha > 50
	
	method buscarItem(unItem){
		mochila.add(unItem)
	}
}
