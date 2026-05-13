object knightRider {
    method peso() = 500
    method peligrosidad() = 10  
}

object bumblebee {
    var formaActual= auto
    method peso() = 800
    method peligrosidad() = formaActual.nivel()
    method cambiarForma(forma) {
      formaActual= forma
    } 
}

object auto { method nivel() = 15 }
object robot { method nivel() = 30 } 

object ladrillos {
    var cantidadLadrillos= 15
    method peso() = cantidadLadrillos * 2
    method peligrosidad() = 2
    method cambiarCantidad(cantidad) {
      cantidadLadrillos= cantidad
    }
}

object arenaAGranel {
  var property peso = 30 
  method peligrosidad() = 1 
}

object bateria {
  var estaConMisiles= false
  method peso() = if(estaConMisiles) 300 else 200
  method peligrosidad() = if(estaConMisiles) 100 else 0
  method cargarYDescargarMisiles() { estaConMisiles = !estaConMisiles}
}

object contenedor {
  const cosasDentro= []
  method peso() = 100 + self.pesoDeCosasDentro()
  method pesoDeCosasDentro() = cosasDentro.sum({c => c.peso()})
  method peligrosidad() = if(not cosasDentro.isEmpty() )cosasDentro.cosaContenidaMasPeligrosa().peligrosidad() else 0
  method cosaContenidaMasPeligrosa() = cosasDentro.max({c => c.peligrosidad()})
  method meterElementos(lista) {
    cosasDentro.addAll(lista)
  }
}

object residuos {
  var property peso = 10
  method peligrosidad() = 200  
}

object embalaje {
  var cosaQueEnvuelve= residuos
  method peso() = cosaQueEnvuelve.peso()
  method peligrosidad() = cosaQueEnvuelve.peligrosidad() / 2 
  method cambiarLoQueEnvuelve(cosa) {
    cosaQueEnvuelve= cosa
  }
}



