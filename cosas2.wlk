import camionDeTransporte-LeonelRetamar.cosas.*
object knightRider {
    method peso() = 500
    method peligrosidad() = 10  
    method bulto() = 1
    method consecuenciaDeLaCarga() {}  
}

object bumblebee {
    var formaActual= auto
    method peso() = 800
    method peligrosidad() = formaActual.nivel()
    method cambiarForma(forma) {
      formaActual= forma
    } 
    method bulto() = 2 
    method consecuenciaDeLaCarga() {
      self.cambiarForma(robot)
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
    method bulto() {
      if (cantidadLadrillos < 100) {
        return 1
      } else if (cantidadLadrillos.between(100, 300)) {
          return 2
      } else {
          return 3
      }
    }
    
    method consecuenciaDeLaCarga() {
      cantidadLadrillos += 12
    }
}

object arenaAGranel {
  var property peso = 30 
  method peligrosidad() = 1 
  method bulto() = 1
  method consecuenciaDeLaCarga() {
    peso= (peso-10).max(0)
  }
}

object bateria {
  var estaConMisiles= false
  method peso() = if(estaConMisiles) 300 else 200
  method peligrosidad() = if(estaConMisiles) 100 else 0
  method cargarYDescargarMisiles() { estaConMisiles = !estaConMisiles}
  method bulto() = if(!estaConMisiles) 1 else 2
  method consecuenciaDeLaCarga() {
    estaConMisiles=true
  }
}

object contenedor {
  const cosasDentro= []
  method peso() = 100 + self.pesoDeCosasDentro()
  method pesoDeCosasDentro() = cosasDentro.sum({c => c.peso()})
  method peligrosidad() = if(not cosasDentro.isEmpty() )cosasDentro.cosaContenidaMasPeligrosa().peligrosidad() else 0
  method cosaContenidaMasPeligrosa() = cosasDentro.max({c => c.peligrosidad()})
  method meterElementos(lista) {
    cosasDentro.addAll(lista)
    cosasDentro.forEach({c => c.consecuenciaDeLaCarga()})
  }
  method bulto() = 1 + self.bultoDeCosasContenidas() 
  method bultoDeCosasContenidas() = cosasDentro.sum({c => c.bulto()})
  method consecuenciaDeLaCarga() {
    cosasDentro.forEach({c => c.consecuenciaDeLaCarga()})
  }
}

object residuos {
  var property peso = 10
  method peligrosidad() = 200  
  method bulto() = 1 
  method consecuenciaDeLaCarga() {
    peso = peso + 15
  }
}

object embalaje {
  var cosaQueEnvuelve= residuos
  method peso() = cosaQueEnvuelve.peso()
  method peligrosidad() = cosaQueEnvuelve.peligrosidad() / 2 
  method cambiarLoQueEnvuelve(cosa) {
    cosaQueEnvuelve= cosa
  }
  method bulto() = 2 
  method consecuenciaDeLaCarga() {  }
}