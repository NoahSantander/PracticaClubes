import Actividades.*
import Socios.*

class Club {
	const actividades = []
	var foco
	
	method actividades() = actividades
	method foco() = foco
	
	method sociosTotales() = actividades.sum({ actividad => actividad.cantidadSocios() })
	method socioMasAntiguo() = actividades.map({ actividad => actividad.socioMasAntiguo() }).max()
	method sociosDestacados() = actividades.map({ actividad => actividad.socioDestacado() })
	method sociosEstrellas() = actividades.map({ actividad => actividad.sociosEstrellas(self) })
	
	method recibirSancion() = actividades.forEach({ actividad => actividad.recibirSancion() })
	
	method esPrestigioso() = actividades.any({ actividad => actividad.esPrestigiosa(self) })
	
	method esSocioDestacado(jugador) = self.sociosDestacados().contains(jugador)
	method esElMismoEquipo(equipo) = actividades.contains(equipo)
	
	method transferirJugador(jugador, equipoDestino) {
		if(!self.esSocioDestacado(jugador) && !self.esElMismoEquipo(equipoDestino))
		{
			equipoDestino.agregarParticipante(jugador)
			self.removerJugadorDelClub(jugador)
			jugador.nuevoClub()
		}
	}
	
	method actividadesPertence(jugador) = actividades.
	filter({ actividad => actividad.participantes().contains(jugador) })
	
	method removerJugadorDelClub(jugador) {
		self.actividadesPertence(jugador).forEach({ actividad => actividad.removerParticipante(jugador) })
	}
}
