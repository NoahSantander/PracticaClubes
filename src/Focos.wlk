import Socios.*
import Clubes.*
import Actividades.*

object profesional {
	method cumpleCondicion(jugador, club, valor) = jugador.valorDelPase() > valor
}

object comunitario {
	method estaEnMasDe3Actividades(jugador, actividades) = actividades.
	count({ actividad => actividad.pertenece(jugador) }) > 3
	
	method cumpleCondicion(jugador, club, valor) = self.estaEnMasDe3Actividades(jugador, club.actividades())
}

object tradicional {
	method cumpleCondicion(jugador, club, valor) = profesional.cumpleCondicion(jugador, club, valor) 
	&& comunitario.cumpleCondicion(jugador, club, valor)
}