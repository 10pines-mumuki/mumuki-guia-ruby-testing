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
  def votos
    @votos_disponibles
  end
end

class Tema
  def initialize
    @votantes = []
  end
  def sumar_voto!(asambleista)
    asambleista.restar_voto_disponible!
    @votos = @votos + 1
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