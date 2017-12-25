#TODO

=begin

class AsambleaTest < Minitest::Test
  
  def test_votar_en_asamblea_resta_un_voto_al_usuario_pasado
    
    asambleista = Asambleista.new
    tema = Tema.new
    asamblea = Asamblea.new
    
    asamblea.votar!(tema, asambleista)
    
    assert_equals 2, asambleista.cantidad_votos_disponibles
    
  end
  
end

=end