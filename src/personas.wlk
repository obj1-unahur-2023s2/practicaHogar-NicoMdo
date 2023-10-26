import habitaciones.*

class Persona {
	const property edad
	var property nivelDeConfort = 0
	var tieneHabilidadesDeCocina = true
	
	method edad() = edad
		
	method tieneHabilidadesDeCocina() = tieneHabilidadesDeCocina
	
	method adquirirHabilidadesDeCocina(){
		tieneHabilidadesDeCocina = true
	}
	
	
	
}
