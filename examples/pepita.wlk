object pepita {
	var energia = 100
	const
	
	method energia() { return energia }
	
	method esFuerte() { 
        return energia > 50
    }

	method volar(kms) {
		energia = energia - (kms + 10)
	}
	
	method comer(gramos) {
		energia = energia + 4 * gramos
	}
}
