class Participante {
	const property pais
	const property conocimientos = #{}
	
	method commits() = conocimientos.sum({c => c.commitsPorHora()})
	
}

class Programador inherits Participante{
	
	method esCape() = self.commits() > 500	
}

class Especialista inherits Participante{
	
	method esCape() = conocimientos.size() > 2
}


