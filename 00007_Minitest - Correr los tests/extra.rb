class AsambleaTest < Minitest::Test
  def test_votar_en_asamblea_suma_un_voto_al_tema
    asambleista = Asambleista.new
    tema = Tema.new
    asamblea = Asamblea.new
    
    asamblea.votar!(tema, asambleista)
    
    assert_equal 1, tema.votos
  end   
end