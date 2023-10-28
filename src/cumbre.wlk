import paises.*


object cumbre {
	const property paisesAuspiciantes = []
	
	method agregarPaisesAuspiciantes(listaPaises){
		paisesAuspiciantes.addAll(listaPaises)
	}
	
	method tieneConflictoCon(unPais) =  self.esAuspiciante(unPais) && unPais.elPaisTieneConflicto()
	
	method esAuspiciante(unPais) = paisesAuspiciantes.contains(unPais)
	
	
}
