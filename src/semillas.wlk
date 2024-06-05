class Planta {
	var anioDeLaSemilla
	var altura
	
	method horasDeSolToleradas() = 0
	method esFuerte() = self.horasDeSolToleradas() > 10
	method nuevaSemilla() = self.esFuerte() 
	method espacioOcupado() = 0 
}

class Menta inherits Planta {
	override method horasDeSolToleradas() = 6
	override method nuevaSemilla()=  altura > 0.4
	override method espacioOcupado() = altura * 3
}

class Soja inherits Planta{
	override method horasDeSolToleradas() = if(altura > 0.5) 6 else if(altura.between(0.5, 1)) 7 else 9
	override method nuevaSemilla() = anioDeLaSemilla > 2007 and altura > 1
	override method espacioOcupado() = altura / 2 
}

 class Quinoa inherits Planta{
 	var property horasDeSolToleradas 
 	override method nuevaSemilla() = anioDeLaSemilla < 2005
 	override method espacioOcupado() = 0.5
 }
 
 class SojaTransgenica inherits Soja{
 	override method nuevaSemilla() = false
 }
 
 class Hierbabuena inherits Menta{
 	override method espacioOcupado(){
 		return super() * 2
 	}
 }