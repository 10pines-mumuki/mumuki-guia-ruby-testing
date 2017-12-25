Listo. Escribamos nuestro primer test.

**Un test es un método dentro de una clase de tests** que además **debe** tener una _aserción_. Y, como vimos antes, una **aserción** es una comprobación, mediante código, de que cierto comportamiento pasó o no pasó.

Empecemos a probar el `votar!` de `Asamblea`.

> Implementá un método que se llame `test_votar_en_asamblea_suma_un_voto_al_tema`.
>
> En ese método, creá un asambleista, un tema y una asamblea, llamá al método `votar!` de la asamblea pasando el tema y el asambleista por parámetro, y utilizá una aserción para verificar que el tema ahora tiene un voto (usando `Tema#votos`).