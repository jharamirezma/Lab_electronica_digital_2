# Lab01: Multiplicador de 3 bits usando Máquina de Estados

### Contenido:

1. [Objetivos de aprendizaje](#1-objetivos-de-aprendizaje)

2. [Fundamento teórico](#2-fundamento-teórico)

3. [Procedimiento](#3-procedimiento)

4. [Descripción del HDL base](#4-descripción-del-hdl-base-en-github-classroom)

5. [Entregables](#5-entregables)



## 1. Objetivos de aprendizaje

* Implementar un multiplicador secuencial de 3 bits utilizando una Máquina de Estados Algorítmica (ASM).

+ Comprender el funcionamiento interno de una multiplicación secuencial mediante productos parciales y desplazamientos.

* Sintetizar e implementar el diseño en la tarjeta de desarrollo usando una descripción en HDL.

* Validar el funcionamiento del diseño implementado mediante simulación y pruebas en hardware.

## 2. Fundamento teórico
### 2.1 Multiplicación secuencial

En la multiplicación secuencial, los operandos se procesan bit a bit a lo largo de varios ciclos de reloj. A cada ciclo se realiza una operación parcial (suma o desplazamiento), acumulando el resultado hasta obtener el producto final. Este método es eficiente en términos de área y recursos de hardware, aunque requiere más ciclos de reloj que una multiplicación combinacional.

El módulo diseñado multiplica dos operandos de 3 bits (Multiplicando: MD, Multiplicador: MR). El resultado se acumula en un registro de productos parciales (pp) de 6 bits. Una señal de control (done) indica cuando la operación ha finalizado.


### 2.2 Máquina de Estados Algorítmica (ASM)

Una Máquina de Estados Algorítmica (ASM) es un modelo de computación secuencial en el que el sistema puede encontrarse en un estado a la vez y cambia de estado en respuesta a una entrada o evento, típicamente sincronizado con un reloj.

En este diseño, la ASM se encarga de coordinar:

* La carga de operandos.

* La generación de productos parciales.

* El desplazamiento y acumulación del resultado.

* La finalización del proceso de multiplicación.

Este enfoque ordenado facilita el diseño modular y el control explícito de cada etapa del algoritmo.

### 2.3 Lógica secuencial

La lógica secuencial usa elementos de almacenamiento (como flip-flops) para mantener el estado actual. El próximo estado depende tanto de las entradas actuales como del estado anterior. Esto la diferencia de la lógica combinacional, en donde las salidas dependen únicamente de las entradas presentes.


## 3. Procedimiento

1. Teniendo en cuenta la maquina de estados, el diagrama de bloques y el diagrama de flujo realicen la descripción de hardware del multiplicador de 3 bits mediante productos parciales.

2. Cree el testbench para realizar la respectiva simulación.

3. Una vez corroboré el comportamiento esperado en simulación, cree un proyecto en vivado y realice la respectiva implementación utilizando switches y leds.


## 4. Descripción del HDL base

Para crear el modulo principal del multiplicador de 3 bits tengan en cuenta el siguiente diagrama de bloques.

 <p align="center">
 <img src="/labs/lab01/pics/bloques_mul.png" alt="alt text" width=390 >
</p>


### 4.1 Funcionamiento

El módulo multiplicador realiza la multiplicación de dos números de 3 bits cada uno (```MR``` y ```MD```) de forma **secuencial**, donde los productos parciales se suman y desplazan a lo largo de varios ciclos de reloj. El resultado final se almacena en ```pp``` (producto parcial de 6 bits) y la señal ```done``` indica que la multiplicación finalizó.

 La multiplicación secuencial implica que el módulo procesa los bits de los operandos uno a uno, acumulando los productos parciales y desplazándolos hasta obtener el resultado final. Cada ciclo de reloj corresponde a una operación específica, como sumar un producto parcial o desplazar los registros involucrados.

 A continuación podrán encontrar el diagrama de flujo del multiplicador:

 <p align="center">
 <img src="/labs/lab01/pics/flujo_mult.jpeg" alt="alt text" width=330 >
</p>

### Unidad de Control del bloque multplicador: Máquina de estados

 <p align="center">
 <img src="/labs/lab01/pics/FSM_mult.jpeg" alt="alt text" width=410 >
</p>


## 5. Entregables

1. Realice la documentación requeria en base al archivo ```README.md``` que encontrará al aceptar la tarea de github classroom.

2. Cree una carpeta en el repositorio asignado de classroom con el nombre ```scr``` donde guarde las fuentes y el testbench del proyecto.

3. Realice cada uno de los pasos descritos en [Procedimiento](#3-procedimiento) y muestre las respectivas evidencias en clase y en el ```README.md```.

4. Adjunte las evidencias en su respectivo repositorio en Github classroom.
