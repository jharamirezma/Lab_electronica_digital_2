# Lab03: Unidad Aritmético-Lógica y banco registro.

### Contenido:

1. [Objetivos de aprendizaje](#1-objetivos-de-aprendizaje)

2. [Fundamento teórico](#2-fundamento-teórico)

3. [Procedimiento](#3-procedimiento)

4. [Entregables](#5-entregables)


## 1. Objetivos de aprendizaje

* Comprender el funcionamiento de la Unidad Aritmético-Lógica (ALU) y el banco de registros como bloques fundamentales en la microarquitectura de un procesador.

* Implementar un módulo de banco de registros para almacenar operandos y resultados, facilitando el flujo de datos.

* Desarrollar un sistema de visualización para monitorear los datos almacenados en el banco de registros, permitiendo analizar el comportamiento interno del procesador.

* Diseñar y simular un testbench que valide el correcto funcionamiento de la ALU y el banco de registros en un entorno digital.

* Integrar los módulos desarrollados en una plataforma de hardware (Vivado), utilizando dispositivos de entrada/salida para interactuar y observar el procesamiento de datos.



## 2. Fundamento teórico

Una ALU es el bloque dentro del procesador encargado de realizar las operaciones matemáticas y lógicas básicas sobre los datos. En la microarquitectura de un procesador, la ALU es un bloque dentro del datapath conectado a los registros y se encarga de realizar operaciones aritméticas como suma, resta, multiplicación simple y división básica, operaciones lógicas como AND, OR, XOR, NOT y desplazamientos. 

El banco registro, es un conjunto de registros que permite almacenar temporalmente datos y resultados intermedios de las operaciones realizadas por la ALU. El banco registro facilita el acceso rápido a los datos necesarios para las operaciones, mejorando la eficiencia del procesador. En sistemas digitales, tanto la ALU como el banco registro son fundamentales para la ejecución de instrucciones y el procesamiento de información, ya que permiten realizar cálculos, tomar decisiones lógicas y gestionar el flujo de datos dentro del sistema.





## 3. Procedimiento



1. Implemente un modulo banco registro que permita almacenar los operandos y resultado de las operaciones realizadas por la ALU.

2. Implemente un modulo que permita realizar la visualización de los datos guardados en el banco registro, ya sean los operandos, el resultado o la dirección de memoria.

3. Integrar los módulos necesarios en un modulo `top`.

4. Cree el testbench para realizar la respectiva simulación.

5. Una vez corroboré el comportamiento esperado en simulación, cree un proyecto en vivado y realice la respectiva implementación utilizando switches y un dispositivo de visualización.



## 5. Entregables

1. Realice la documentación requeria en base al archivo ```README.md``` que encontrará al aceptar la tarea de github classroom.

2. Cree una carpeta en el repositorio asignado de classroom con el nombre ```scr``` donde guarde las fuentes y el testbench del proyecto.

3. Realice cada uno de los pasos descritos en [Procedimiento](#3-procedimiento) y muestre las respectivas evidencias en clase y en el ```README.md```.

4. Adjunte las evidencias en su respectivo repositorio en Github classroom.