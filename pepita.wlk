object pepita {
	var energia = 100
	
	method comer(comida) {
		energia = energia + comida.energiaQueAporta()
	}

	method puedeComer(alimento) {
		return(true)
	}
	
	method puedeVolar(distancia) {
		return energia >= distancia + 10
	}

	method validarVolar(distancia) {
		if (not self.puedeVolar(distancia)){
			self.error("No tiene suficiente energia para volar")
		}
	}

	method volar(distancia) {
		self.validarVolar(distancia)
		energia = energia - 10 - distancia
	}
		
	method energia() {
		return energia
	}
}

object alpiste {
	method energiaQueAporta() {
		return 20
	}
}

object manzana {
	var madurez = 1
	const base = 5
	
	method madurez() {
		return madurez
	}
	
	method madurez(_madurez) {
		madurez = _madurez
	}
	
	method madurar() {
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta() {
		return base * madurez
	}
	
}

object pepon {
	var energia = 30
	var comidaAnterior = manzana
	
	method energia() {
		return energia
	}
	
	method puedeComer(comida) {
		return(comida != comidaAnterior)
	}

	method cuidarseAlComer(comida) {
		if (not self.puedeComer(comida)){
			self.error("Pepon no puede comer 2 veces la misma comida, esta a dieta")
		}
	}

	method comer(comida) {
		self.cuidarseAlComer(comida)
		energia += energia + comida.energiaQueAporta() / 2
		comidaAnterior = comida
	}

	method puedeVolar(distancia) {
		return(energia > 20 + (2 * distancia))
	}

	method validarVolar(distancia) {
		if (not self.puedeVolar(distancia)) {
			self.error("No tiene suficiente energia para volar")
		}
	}
		
	method volar(distancia) {
		self.validarVolar(distancia)
		energia = energia - 20 - 2*distancia
	}

	
}

object roque {
	var ave = pepita
	var cenas = 0;
	
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}

	method cenas() {
	  return cenas
	}

	method alimentar(alimento) {
		ave.comer(alimento)
		if (ave.puedeComer(alimento)){
			cenas = cenas + 1
		}
	}
}

object milena {
  var ave1 = pepita
  var ave2 = pepon

  method ave1(_ave1) {
		ave1 = _ave1
  }

  method ave2(_ave2) {
		ave2 = _ave2
  }

  method movilizar(distancia) {
		if (ave1.puedeVolar(distancia) && ave2.puedeVolar(distancia)){
			ave1.volar(distancia)
			ave2.volar(distancia)
		}
  }
}