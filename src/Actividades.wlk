import Socios.*

class Actividad {
	const participantes = []
	
	method participantes() = participantes
	method organizador() = participantes.find({ participante => participante.esOrganizador() })
	
	method cantidadSocios() = participantes.size()
	method socioMasAntiguo() = participantes.max({ participante => participante.antiguedad() })
	method socioDestacado() = self.organizador()
	method sociosEstrellas(club) = participantes.filter({ participante => participante.esEstrella(club) })
	
	method pertenece(participante) = participantes.contains(participante)
	method recibirSancion()
	
	method esPrestigiosa(club)
	
	method removerParticipante(participante) {
		participantes.remove(participante)
	}
	
	method agregarParticipante(participante) {
		participantes.add(participante)
	}
}

class Equipo inherits Actividad {
	var cantidadDeSanciones
	var valorDelPase
	
	method cantidadDeSanciones() = cantidadDeSanciones
	override method recibirSancion() {
		cantidadDeSanciones += 1
	}
	
	method cambiarValor(valor) {
		valorDelPase = valor
	}
	
	method plantel() = participantes
	method capitan() = participantes.find({ jugador => jugador.esCapitan() })
	
	override method socioDestacado() = self.capitan()
	override method sociosEstrellas(club) = participantes.
	filter({ participante => participante.esEstrella(club, valorDelPase) })
	
	method esExperimentado() = participantes.forEach({ jugador => jugador.esExperimentado() })
	override method esPrestigiosa(club) = self.esExperimentado()
}

class ActividadSocial inherits Actividad {
	var estaSuspendida
	method estaSuspendida() = estaSuspendida
	method reaunudar() {
		estaSuspendida = false
	}
	
	override method recibirSancion() {
		estaSuspendida = true
	}
	
	override method esPrestigiosa(club) = self.sociosEstrellas(club).size() > 5
}