describe "Asamblea" do 
  describe "si un asambleista vota una vez" do 
    before { una_asamblea.votar! un_tema, un_asambleista  }
    it "el asambleista pierde un voto" do 
      expect(una_asamblea.votos).to eq 1
    end
    it "el tema gana un voto" do
      expect(un_tema.votos).to eq 1
    end
  end
  
  describe "si el asambleista vota tres veces" do 
    before { 2.times { una_asamblea.votar! un_tema, un_asambleista }  }

    it "la votación falla y el asambleista no pierde votos" do 
      expect { una_asamblea.votar! un_tema, un_asambleista  }.to raise_error
      expect(una_asambleista.votos_disponibles).to eq 0
    end
    
    it "el tema no gana votos" do 
      una_asamblea.votar! un_tema, un_asambleista rescue nil
      expect(un_tema.votos).to eq 3
    end
  end
end