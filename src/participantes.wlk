import conocimientos.*
import cumbre.*
import actividades.*
import empresas.*

class Participante {
	const property pais
	const property conocimientos = #{}
	var commits
	
	method commits() = commits
	
	method esCape()
	
	method requisitos() = conocimientos.contains(programacionBasica) && self.requisitosAdicionales()
	
	method requisitosAdicionales()
	
	method hacerUnaActividad(actividad){
		conocimientos.add(actividad)
		commits += actividad.cantidadCommits()
	}
}

class Programador inherits Participante{
	var cantHoras = 0
	
	override method esCape() = commits > 500	
	
	override method requisitosAdicionales() = commits > cumbre.commitsEstablecidos() 

	override method hacerUnaActividad(actividad){
		super(actividad)
		cantHoras += actividad.horas()
	}
}

class Especialista inherits Participante{
	
	override method esCape() = conocimientos.size() > 2
	
	override method requisitosAdicionales() = commits >= cumbre.commitsEstablecidos() - 100 && conocimientos.contains(objetos)

}

class Gerente inherits Participante{
	var empresa
	
	method empresa() = empresa
	
	override method esCape() = empresa.esMultinacional()
	
	override method requisitosAdicionales() = conocimientos.contains(manejoDeGrupos)
}


