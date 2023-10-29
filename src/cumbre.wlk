import paises.*
import participantes.*
import actividades.*

object cumbre {
	const property paisesAuspiciantes = []
	const property participantes = #{}
	var property commitsEstablecidos = 300
	const property partRegistrados = []
	const property actividades = #{}
	
	method agregarPaisAuspiciante(unPais){
		paisesAuspiciantes.add(unPais)
	}
	
	method registrar(unParticipante){
		partRegistrados.add(unParticipante)
	}
	
	method puedeIngresar(unParticipante) = unParticipante.requisitos() && !self.esAccesoRestringidoPara(unParticipante)
				
	method esAccesoRestringidoPara(unParticipante) = self.tieneConflictoCon(unParticipante.pais()) && 
			(!self.esAuspiciante(unParticipante.pais()) || 
				self.elPaisYaEstaRegistrado(unParticipante.pais()))
	
	method agregarParticipante(unParticipante){
		self.registrar(unParticipante)
		if(!self.puedeIngresar(unParticipante)){
			self.error("No puede registrarse por motivos de conflicto país o porque el cupo de participantes de su
							país esta lleno")
		}
		participantes.add(unParticipante)
	}
	
	method elPaisYaEstaRegistrado(unPais) =  self.conjuntoPaisesParticipantes().contains(unPais)
	
	method agregarParticipantes(listaParticipantes){
		participantes.addAll(listaParticipantes)
	}
	
	method conjuntoPaisesParticipantes() = participantes.map({p => p.pais()}).asSet()
		
	method cantidadParticipantesDeUnPais(unPais) = participantes.count({p => p.pais() == unPais})
	
	method paisConMasParticipantes() = 
	self.conjuntoPaisesParticipantes().max({p => self.cantidadParticipantesDeUnPais(p)})
	
	method tieneConflictoCon(unPais){
		return ! unPais.paisesConConflicto().intersection(paisesAuspiciantes).isEmpty()
	}	
	
	method esAuspiciante(unPais) = paisesAuspiciantes.contains(unPais)
	
	method participantesExtranjeros() = 
	participantes.filter({p => !self.esAuspiciante(p.pais())})

	method esRelevante() = participantes.all({p => p.esCape()})
	
	method esSegura() = partRegistrados.all({p => self.puedeIngresar(p)})
	
	method realizarActividad(actividad){
		participantes.forEach({p => p.hacerUnaActividad(actividad)})
	}
	
	method totalDeActividadesRealizadasPor(participante) = participante.conocimientos().filter
	({c => actividades.contains(c)})
	
	method totalDeHorasDeActividadPor(participante) = 
	self.totalDeActividadesRealizadasPor(participante).sum({a => a.horas()})

	method totalHorasActividades() = participantes.sum({p => self.totalDeHorasDeActividadPor(p)})
}

object nullActividades{
	
}
