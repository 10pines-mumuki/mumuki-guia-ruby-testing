examples:
- name: 'si el codigo es correcto, los tests pasan'
  fixture: |
    class Asamblea
      def votar!(tema, asambleista)
        if(asambleista.votos > 0)
          tema.sumar_voto! asambleista
          asambleista.restar_voto_disponible!
        else
          raise StandardError.new('El asambleista no tiene mas votos')
        end
      end
      def desvotar!(tema, asambleista)
        tema.restar_voto!(asambleista)
        asambleista.sumar_voto_disponible!
      end
    end
  postconditions:
      status: passed

- name: 'si el bug persiste, deberían fallar los tests'
  fixture: |
    class Asamblea
      def votar!(tema, asambleista)
        if(asambleista.votos > 0)
          tema.sumar_voto!
          asambleista.restar_voto_disponible!
        else
          raise StandardError.new('El asambleista no tiene mas votos')
        end
      end
      def desvotar!(tema, asambleista)
        tema.restar_voto!(asambleista)
        asambleista.sumar_voto_disponible!
      end
    end
  postconditions:
      status: failed