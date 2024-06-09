import semillas.*

class Parcela{
	var ancho
	var largo 
	const property horasDeSol
	const property plantasEnLaParcela = []

	method superficie() = ancho * largo
	method cantidadMaximaDePlantas() = if(ancho > largo) self.superficie() / 5 else self.superficie() / 3 + largo
	method complicaciones(){
		return plantasEnLaParcela.any({planta => planta.horasDeSolToleradas() < horasDeSol})
	}
	method plantar(planta){
			return if(plantasEnLaParcela.size() < self.cantidadMaximaDePlantas() and (planta.horasDeSolToleradas() % horasDeSol > 2).negate())
			 plantasEnLaParcela.add(planta)
			else "Error"
	}
}

class ParcelaEcologica inherits Parcela{
	method bienAsociada(planta){
		return self.complicaciones().negate() and planta.esIdeal(self)
	}
	method cantidadDeBienAsociadas(){
		plantasEnLaParcela.map{planta => self.bienAsociada(planta)}.size()
	}
}

class ParcelaIndustrial inherits Parcela{
	method bienAsociada(planta){
		return plantasEnLaParcela.size() <= 2 and planta.esFuerte()
	}
	method porcentajeDeBienAsociadas(){
		return plantasEnLaParcela.map{planta => self.bienAsociada(planta)}.size() * 100 / plantasEnLaParcela.size()
	}
}
