#TODO

=begin

class ReunionEstrategicaTest < Minitest::Test
  
  def test_votar_en_reunion_resta_un_voto_al_usuario_pasado
    
    usuario = Usuario.new
    tema = Tema.new
    reunion = ReunionEstrategica.new
    
    reunion.votar!(tema, usuario)
    
    assert_equals 2, usuario.cantidad_votos_disponibles
    
  end
  
end

=end