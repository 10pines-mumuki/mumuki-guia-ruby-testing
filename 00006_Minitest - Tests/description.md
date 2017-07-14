Bien. Ya tenemos la clase de test. Ahora vamos a empezar a agregar nuestros tests.

**Un test es un método dentro de una clase de tests.**

Además, los tests se caracterizan por tener una _aserción_. Una aserción, como vimos antes, es una comprobación, mediante código, de que cierto comportamiento pasó o no pasó. 

Empecemos a probar el `votar!` de `ReunionEstrategica`.

> Implementá un método que se llame `test_votar_en_reunion_suma_un_voto_al_tema`.

En ese método, creá un usuario, un tema y una reunión, llamá al método `votar!` de la reunión pasando el tema y el usuario por parámetro, y utilizá una aserción para verificar que el tema ahora tiene un voto (usando `Tema#votos`).

*Nota: Existe una aserción para comparar valores llamada `assert_equals` (¿te suena familiar?) que recibe dos parámetros: el primero es el valor esperado, y el segundo es el valor que se está probando.*
