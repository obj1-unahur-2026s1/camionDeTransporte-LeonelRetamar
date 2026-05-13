object camion {
  const cosasCargadas = []

  method cargarCosa(cosa) {
    cosasCargadas.add(cosa)
  }
  method descargarCosa(cosa) {
    cosasCargadas.remove(cosa)
  }
  method cargarCosas(lista) {
    cosasCargadas.addAll(lista)
  }

  method peso() = 1000 + cosasCargadas.sum({c => c.peso()})
  method todosLosPesosSonPares() = cosasCargadas.all({c => c.peso().even()})
  method hayAlgunaCargaQuePasa(peso) = cosasCargadas.any({c => c.peso()} == peso) 
  method primeraCargaConPeligrosidadIgualA(peligrosidad) = cosasCargadas.findOrDefault({c => c.nivelDePeligrosidad()== peligrosidad},"no hay Cosa" )
  method cosasQueSuperanPeligrosidad(peligrosidad) = cosasCargadas.filter({c => c.nivelDePeligrosidad() > peligrosidad}) 
  method cosasCargadasQueSuperanPeligrosidadDe(cosa) = self.cosasQueSuperanPeligrosidad(cosa.nivelDePeligrosidad())
  method estaEcxedidoDePeso() = self.peso() > 2500 
  method puedeCircularEnRuta(nivelMaximo) = self.estaEcxedidoDePeso() and self.cosasCargadasQueSuperanPeligrosidadDe(nivelMaximo)

  method algunaCargaPesaEntre(min,max) = cosasCargadas.any({c => c.peso().between(min, max)})


}