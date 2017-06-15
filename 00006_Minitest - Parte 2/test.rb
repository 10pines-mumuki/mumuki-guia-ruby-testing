#TODO

=begin

class ReunionEstrategicaTest < Minitest::Test
  
  def test_votar_en_reunion_suma_un_voto_al_tema_pasado
    
    usuario = Usuario.new
    tema = Tema.new
    reunion = ReunionEstrategica.new
    
    reunion.votar!(tema, usuario)
    
    assert_equals 1, tema.votos
    
  end
  
end

=end