class Asamblea
  def votar!(tema, asambleista)
    if(asambleista.cantidad_votos_disponibles > 0)
      tema.sumar_voto!
      asambleista.restar_voto_disponible!
    else 
      raise StandardError.new('El asambleista no tiene mas votos')
    end
  end
  def desvotar!(tema, asambleista)
    tema.restar_voto!(asambleista)
    asambleista.sumar_voto_disponible!
  end
end

class Asambleista
  def initialize
    @votos_disponibles = 3
  end
  def restar_voto_disponible!
    @votos_disponibles -= 1
  end
  def sumar_voto_disponible!
    @votos_disponibles += 1
  end
  def cantidad_votos_disponibles
    @votos_disponibles
  end
end

class Tema
  def initialize
    @votantes = []
  end
  def sumar_voto!(asambleista)
    @votantes << asambleista
  end
  def restar_voto!(asambleista)
    if(@votantes.contains?(asambleista))
      @votantes.delete_at(@votantes.find_index(asambleista))
    end
  end
  def votos
    @votos
  end
end

una_asamblea = Asamblea.new
un_asambleista = Asambleista.new
un_tema = Tema.new