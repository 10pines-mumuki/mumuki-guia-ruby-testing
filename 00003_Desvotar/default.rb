class ReunionDemocratica
  def votar!(tema, usuario)
    if(usuario.cantidad_votos_disponibles > 0)
      tema.sumar_voto!
      usuario.restar_voto_disponible!
    else 
      raise StandardError.new('El usuario no tiene mas votos')
    end
  end
  def desvotar!(tema, usuario)
    tema.restar_voto!(usuario)
    usuario.sumar_voto_disponible!
  end
end

class Usuario
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
    @votos = 0
  end
  def sumar_voto!
    @votos += 1
  end
  def restar_voto!
    @votos -= 1
  end
end

una_reunion_democratica = ReunionDemocratica.new
un_usuario = Usuario.new
un_tema = Tema.new