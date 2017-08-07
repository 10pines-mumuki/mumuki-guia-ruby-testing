examples:
  - name: 'si el código es correcto, los tests pasan'
    fixture: |
      class Asamblea
      
      end
      
      class Asambleista
        def initialize
          @votos_disponibles = 3
        end
        def restar_voto_disponible!
          @votos_disponibles -= 1
        end
        def sumar_voto_disponible!
          @votos_disponibles += 1
        end
        def cantidad_votos_disponibles
          @votos_disponibles
        end
      end
      
      class Tema
        def initialize
          @votantes = []
        end
        def sumar_voto!(usuario)
          @votantes << usuario
        end
        def restar_voto!(usuario)
          if(@votantes.contains?(usuario))
            @votantes.delete_at(@votantes.find_index(usuario))
          end
        end
        def votos
          @votos
        end
      end    
    postconditions:
      status: passed
      
  - name: 'si sumar voto no está implementado, deberían fallar los tests'
    fixture: |
      class Asamblea
        def votar!(tema, usuario)
          if(usuario.cantidad_votos_disponibles > 0)
            tema.sumar_voto!
            usuario.restar_voto_disponible!
          else 
            raise StandardError.new('El usuario no tiene mas votos')
          end
        end
        def desvotar!(tema, usuario)
          tema.restar_voto!(usuario)
          usuario.sumar_voto_disponible!
        end
      end
      
      class Asambleista
        def initialize
          @votos_disponibles = 3
        end
        def restar_voto_disponible!
          @votos_disponibles -= 1
        end
        def sumar_voto_disponible!
          @votos_disponibles += 1
        end
        def cantidad_votos_disponibles
          @votos_disponibles
        end
      end
      
      class Tema
        def initialize
          @votantes = []
        end
        def sumar_voto!(usuario)
        end
        def restar_voto!(usuario)
          if(@votantes.contains?(usuario))
            @votantes.delete_at(@votantes.find_index(usuario))
          end
        end
        def votos
          @votos
        end
      end    
    postconditions:
      status: failed