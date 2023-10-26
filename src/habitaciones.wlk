import personas.*
 
class Habitacion {
	const property ocupantes = []
	
	method nivelDeConfort(unaPersona) = 10
	
	method puedeIngresar(unaPersona) = ocupantes.isEmpty()
	
	method ingresar(unaPersona){
		if(self.puedeIngresar(unaPersona)){
			ocupantes.add(unaPersona)
		}
		else{
			self.error("La persona no puede Ingresar")
		}
	}
	
	method hayPersonaDe4oMenos() = ocupantes.any({o=> o.edad() <= 4})
	
	method esOcupante(unaPersona) = ocupantes.contains(unaPersona)

}

class UsoGeneral inherits Habitacion{
	
}

class Banio inherits Habitacion{
	
	override method nivelDeConfort(unaPersona){
		if(self.hayPersonaDe4oMenos()){
			return super(unaPersona) + 2
		}
		else{
			return super(unaPersona) + 4	
		}
	}
	
	override method puedeIngresar(unaPersona) = super(unaPersona) or self.hayPersonaDe4oMenos()
	
			
}		


class Dormitorio inherits Habitacion{
	const ocupantesEnElMomento = []
	
	method cantidadDePersonas() = ocupantes.size()	
	
	override method nivelDeConfort(unaPersona){
		if(self.esOcupante(unaPersona)){
			return super(unaPersona) + 10 / self.cantidadDePersonas()
		}
		else{
			return super(unaPersona)
		}	
	}
	
	override method puedeIngresar(unaPersona) = super(unaPersona) or self.esOcupante(unaPersona) or self.estanTodosEnlaHabitacion()
	
	method ocupanteEstaEnElMomento(unaPersona){
		return ocupantesEnElMomento.contains(unaPersona)
	}	
		
	method estanTodosEnlaHabitacion(){
		return ocupantes.all({o=> self.ocupanteEstaEnElMomento(o)})
	}					
		
}


class Cocina inherits Habitacion{
	const m2

	override method nivelDeConfort(unaPersona){
		if(unaPersona.tieneHabilidadesDeCocina()){
			return super(unaPersona) +  m2 * procentajeDeConfortExtra.valor()
		}
		else{
			return super(unaPersona)	
		}
	}
	
	method hayCocinero() = ocupantes.any({o=> o.tieneHabilidadesDeCocina()})
	
	override method puedeIngresar(unaPersona) = super(unaPersona) or unaPersona.tieneHabilidadesDeCocina() and not self.hayCocinero()
	
}


object procentajeDeConfortExtra{
	var property valor = 0.1
	
}

 







//asdhgjh








