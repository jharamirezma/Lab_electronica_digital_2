# Lab02: Unidad Aritmético-Lógica (ALU).

### Contenido:

1. [Objetivos de aprendizaje](#1-objetivos-de-aprendizaje)

2. [Fundamento teórico](#2-fundamento-teórico)

3. [Procedimiento](#3-procedimiento)

4. [Entregables](#5-entregables)


## 1. Objetivos de aprendizaje

* Implementar una unidad aritmético-lógica que pueda realizar operaciones de 4 bits, Suma, Resta, multiplicación, corrimiento y un operador lógico a elección.

* Comprender el funcionamiento de la ALU y el modo de selección de las operaciones mediante un multiflexor.

* Comprender la función de la ALU en la microarquitectura del procesador.

* Sintetizar e implementar el diseño en la tarjeta de desarrollo usando una descripción en HDL.

* Validar el funcionamiento del diseño implementado mediante simulación y pruebas en hardware.



## 2. Fundamento teórico

Una ALU es el bloque dentro del procesador encargado de realizar las operaciones matemáticas y lógicas básicas sobre los datos. En la microarquitectura de un procesador, la ALU es un bloque dentro del datapath conectado a los registros y se encarga de realizar operaciones aritméticas como suma, resta, multiplicación simple y división básica, operaciones lógicas como AND, OR, XOR, NOT y desplazamientos. 







#### Ejemplo 

Si el procesador debe ejecutar la siguiente instrucción:

```
ADD R1, R2, R3;
```

1. La unidad de control decodifica ADD.

2. Se leen los registros R2 y R3.

3. Los valores van a la ALU, con la señal de control "suma".

4. La ALU entrega el resultado → se escribe en R1.

5. Si hubo overflow, el flag correspondiente se activa.




## 3. Procedimiento

<p align="center">
  <img src="/labs/lab02/pics/ALU.png" alt="ALU">
</p>


1. A partir del diagrama de la ALU,realicen la descripción de hardware de la ALU con operadores de 4 bits, que incluya las siguientes operaciones:

    * Suma.
    * Resta.
    * Multiplicación.
    * Una operación lógica a elección del grupo.
    * Corrimiento.

    Debe incluir las salidas de ```overflow``` y de ```zero```, la cual debe indicar  si el resultado de la operación es cero.

2. Cree el testbench para realizar la respectiva simulación.

3. Una vez corroboré el comportamiento esperado en simulación, cree un proyecto en vivado y realice la respectiva implementación utilizando switches y leds.


<span style="color: red;">NOTA:</span> Si requiere incluir alguna entrada adicional para algún operador, téngala en cuenta. 

## 5. Entregables

1. Realice la documentación requeria en base al archivo ```README.md``` que encontrará al aceptar la tarea de github classroom.

2. Cree una carpeta en el repositorio asignado de classroom con el nombre ```scr``` donde guarde las fuentes y el testbench del proyecto.

3. Realice cada uno de los pasos descritos en [Procedimiento](#3-procedimiento) y muestre las respectivas evidencias en clase y en el ```README.md```.

4. Adjunte las evidencias en su respectivo repositorio en Github classroom.