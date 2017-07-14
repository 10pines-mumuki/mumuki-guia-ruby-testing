Entonces, resumamos un poco: 

* Los tests no son otra cosa que métodos dentro de una clase de tests (al menos en Minitest)
* Esto es importante: **Todos los tests siempre tienen tres partes**: el _contexto_ (cuando creaste los distintos objetos), la _regla_ a ser testeada (cuando mandaste el mensaje `ReunionEstrategica#votar!` que era lo que estábamos testeando), y el _resultado esperado_ (el assert). Estos están mas o menos explícitos en cada test, pero siempre están presentes.