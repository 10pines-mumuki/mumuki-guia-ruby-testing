class AsambleaTest < Minitest::Test
  def test_votar_en_asamblea_suma_un_voto_al_tema
    asambleista = Asambleista.new
    tema = Tema.new
    asamblea = Asamblea.new
    
    asamblea.votar!(tema, asambleista)
    
    assert_equal 1, tema.votos
  end   
end

class Asamblea
  def votar!(tema, asambleista)
    raise 'El asambleista no tiene mas votos'if asambleista.votos <= 0
    
    tema.sumar_voto! asambleista
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
  def votos
    @votos_disponibles
  end
end

class Tema
  def initialize
    @votantes = []
    @votos = 0
  end
  def sumar_voto!(asambleista)
    asambleista.restar_voto_disponible!
    @votantes << asambleista
    @votos = @votos + 1
  end
  def restar_voto!(asambleista)
    if(@votantes.include?(asambleista))
      @votantes.delete_at(@votantes.find_index(asambleista))
    end
  end
  def votos
    @votos
  end
end    

