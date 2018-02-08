examples:
- name: 'si el codigo es correcto, los tests pasan'
  fixture: |
    class Asamblea
      def votar!(tema, asambleista)
        raise 'El asambleista no tiene mas votos'if asambleista.votos <= 0
        
        tema.sumar_voto! asambleista
        asambleista.restar_voto_disponible!
      end
      
      def desvotar!(tema, asambleista)
        tema.restar_voto!(asambleista)
        asambleista.sumar_voto_disponible!
      end
    end
  postconditions:
      status: passed
      
- name: 'si la asamblea suma de mas, debería fallar el tesst'
  fixture: |
    class Asamblea
      def votar!(tema, asambleista)
        raise 'El asambleista no tiene mas votos'if asambleista.votos <= 0
        
        tema.sumar_voto! asambleista
        tema.sumar_voto! asambleista
        tema.sumar_voto! asambleista
        asambleista.restar_voto_disponible!
      end
      
      def desvotar!(tema, asambleista)
        tema.restar_voto!(asambleista)
        asambleista.sumar_voto_disponible!
      end
    end
  postconditions:
      status: failed
      
- name: 'si la asamble resta de mas, debería fallar el test'
  fixture: |
    class Asamblea
      def votar!(tema, asambleista)
        raise 'El asambleista no tiene mas votos'if asambleista.votos <= 0
        
        tema.sumar_voto! asambleista
        asambleista.restar_voto_disponible!
        asambleista.restar_voto_disponible!
      end
      
      def desvotar!(tema, asambleista)
        tema.restar_voto!(asambleista)
        asambleista.sumar_voto_disponible!
      end
    end
  postconditions:
      status: failed
      
- name: 'si la asamble resta de menos en desvotar, debería fallar el test'
  fixture: |
    class Asamblea
      def votar!(tema, asambleista)
        raise 'El asambleista no tiene mas votos'if asambleista.votos <= 0
        
        
        tema.sumar_voto! asambleista
        asambleista.restar_voto_disponible!
      end
      
      def desvotar!(tema, asambleista)
        asambleista.sumar_voto_disponible!
      end
    end
  postconditions:
      status: failed
      
- name: 'si la asamblea suma de menos, deberia fallar el test'
  fixture: |
    class Asamblea
      def votar!(tema, asambleista)
        raise 'El asambleista no tiene mas votos'if asambleista.votos <= 0
        
        tema.sumar_voto! asambleista
        asambleista.restar_voto_disponible!
      end
      
      def desvotar!(tema, asambleista)
        tema.restar_voto!(asambleista)
      end
    end
  postconditions:
      status: failed

- name: 'si el bug persiste, deberían fallar los tests'
  fixture: |
    class Asamblea
      def votar!(tema, asambleista)
        raise 'El asambleista no tiene mas votos'if asambleista.votos <= 0
        tema.sumar_voto!
        asambleista.restar_voto_disponible!
      end
      
      def desvotar!(tema, asambleista)
        tema.restar_voto!(asambleista)
        asambleista.sumar_voto_disponible!
      end
    end
  postconditions:
      status: failed