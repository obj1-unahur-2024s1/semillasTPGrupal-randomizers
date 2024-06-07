import semillas.*

class Parcela{
	var ancho
	var largo 
	var horasDeSol
	const plantasEnLaParcela = []

	method superficie() = ancho * largo
	method cantidadMaximaDePlantas() = if(ancho > largo) self.superficie() / 5 else self.superficie() / 3 + largo
	method complicaciones(){
		return plantasEnLaParcela.any({planta => planta.horasDeSolToleradas() < horasDeSol})
	}
	method plantar(planta){
			plantasEnLaParcela.add(planta)
			return if(plantasEnLaParcela.size() > self.cantidadMaximaDePlantas() or planta.horasDeSolToleradas() % horasDeSol > 2)
			 "Error"
			else "Plantada con exito"
	}

}

