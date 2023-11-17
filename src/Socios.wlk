import Clubes.*
import Focos.*

class Socio {
	var antiguedad
	var esOrganizador
	
	method antiguedad() = antiguedad
	method esOrganizador() = esOrganizador
	method esEstrella(club) = antiguedad > 20
}

class Jugador inherits Socio {
	var esCapitan
	var cantidadDePartidos
	var valorDelPase
	
	method esCapitan() = esCapitan
	method cantidadDePartidos() = cantidadDePartidos
	method valorDelPase() = valorDelPase
	method esEstrella(club, valor) = if(cantidadDePartidos > 50) true else club.foco().cumpleCondicion(self, club, valor)
	
	method esExperimentado() = cantidadDePartidos > 10
	
	method nuevoClub() {
		cantidadDePartidos = 0
	}
}