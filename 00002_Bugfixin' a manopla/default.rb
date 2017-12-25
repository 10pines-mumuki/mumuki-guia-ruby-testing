class Asamblea
  def votar!(tema, asambleista)
    tema.sumar_voto!
    asambleista.restar_voto_disponible!
  end
end

class Asambleista
  def initialize
    @votos_disponibles = 3
  end
  def restar_voto_disponible!
    @votos_disponibles -= 1
  end
  def cantidad_votos_disponibles
    @votos_disponibles
  end
end

class Tema
  def initialize
    @votos = 0
  end
  def sumar_voto!
    @votos += 1
  end
  def votos
    @votos
  end
end

una_asamblea = Asamble.new
un_asambleista = Asambleista.new
un_tema = Tema.new