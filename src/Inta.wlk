import parcelas.*
import semillas.*

object inta {
	const coleccionParcelas = []
	method addParcela(parcela){
		coleccionParcelas.add(parcela)
	}
	method promedioDePlantas(){
		return coleccionParcelas.sum{parcela => parcela.plantasEnLaParcela().size()}  / coleccionParcelas.size()
	}
	method tiene4Plantas() = coleccionParcelas.map{parcela => parcela.plantasEnLaParcela().size() > 4}
	method parcelaAutoSustentable(){
		return self.tiene4Plantas().max{parcela => parcela.porcentajeDeBienAsociadas()} 
	}
}

