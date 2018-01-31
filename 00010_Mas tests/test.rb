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
      
- name: 'si el assert está mal, debería fallar el ejercicio'
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