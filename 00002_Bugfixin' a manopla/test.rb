describe "Asamblea" do 
  let(:un_tema) { Tema.new }
  let(:un_asambleista) { Asambleista.new }
  let(:una_asamblea) { Asamblea.new }
  
  subject do
    una_asamblea.votar! un_tema, un_asambleista
  end
  
  describe "si un asambleista vota una vez" do 

    it "el asambleista pierde un voto" do
      expect(un_asambleista.votos).to eq 3
      subject
      expect(un_asambleista.votos).to eq 2
    end
    
    it "el tema gana un voto" do
      expect(un_tema.votos).to eq 0
      subject
      expect(un_tema.votos).to eq 1
    end
  end
  
  describe "si el asambleista vota tres veces" do 
    before do
      3.times { una_asamblea.votar! un_tema, un_asambleista }
    end

    it "la votación falla por lo que el asambleista no pierde votos" do 
      expect { una_asamblea.votar! un_tema, un_asambleista  }.to raise_error
      expect(un_asambleista.votos_disponibles).to eq 0
    end
    
    it "la votación falla por lo que el tema no gana votos" do 
      expect { una_asamblea.votar! un_tema, un_asambleista }.to raise_error
      expect(un_tema.votos).to eq 3
    end
  end
end