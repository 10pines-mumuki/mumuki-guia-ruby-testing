#TODO
=begin
class AsambleaTest < Minitest::Test
  
  def test_votar_en_reunion_suma_un_voto_al_tema_pasado
    
    asambleista = Asambleista.new
    tema = Tema.new
    asamblea = Asamblea.new
    
    asamblea.votar!(tema, asambleista)
    
    assert_equals 1, tema.votos
    
  end
  
end
=end
