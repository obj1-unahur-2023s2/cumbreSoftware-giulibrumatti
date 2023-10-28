class Pais {
	const property paisesConConflicto = #{}
	
	method registrarConflictoCon(nuevoPais){
		paisesConConflicto.add(nuevoPais)
	}
	
	method estaEnConflicto(nuevoPais) = paisesConConflicto.contains(nuevoPais)
	
}
