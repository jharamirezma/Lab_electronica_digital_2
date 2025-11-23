# Lab04: SoC Zynq-7000

----------------------------------------

### Contenido:


- [Lab04: Procesador Zynq-7000](#lab04-procesador-zynq-7000)
    - [Contenido:](#contenido)
  - [1. Objetivos de aprendizaje](#1-objetivos-de-aprendizaje)
  - [2. Fundamento teórico](#2-fundamento-teórico)
    - [¿Qué es un SoC?](#qué-es-un-soc)
  - [3. Procedimiento](#3-procedimiento)
    - [3.1 Integrar la zybo-z7 al entorno de vivado.](#31-integrar-la-zybo-z7-al-entorno-de-vivado)
    - [3.2 Crearción del SoC en vivado](#32-crearción-del-soc-en-vivado)
    - [3.3 Entorno de Vitis.](#33-entorno-de-vitis)
  - [4. Entregables](#4-entregables)
  - [5. Referencias](#5-referencias)


## 1. Objetivos de aprendizaje

* Implmentar un SoC mediante la herramienta ```Block Design``` de vivado.
* Identificar los bloques que componen el procesador del Zynq-7000.
* Identificar las partes que componen el SoC a implementar.


## 2. Fundamento teórico

### ¿Qué es un SoC?


Un *System on Chip* (SoC) es una arquitectura de hardware digital que integra todos los componentes esenciales de un sistema computacional en un solo circuito integrado o diseño programable. Generalmente incluye:

* Un procesador central (CPU).

* Memoria ROM/RAM.

* Periféricos (temporizadores, UART, GPIO, etc.).

* Interconexión interna (bus de datos/control/direcciones).

En este caso, el SoC será implementado en una FPGA, donde se integrarán los siguientes componentes:

* **Zynq 7000**: Es un Sistema en Chip (SoC) de AMD que integra un procesador ARM Cortex-A9 con lógica programable (FPGA) de la serie 7 (ver figura 1). 

* **Memoria ROM**: que contendrá el firmware embebido.

* **Memoria RAM**: para almacenamiento temporal de datos.

* **GPIO para LEDs**: que permitirá una demostración visual sencilla del funcionamiento del firmware.

* **GPIO para Switches**: que permitirá una demostración visual sencilla del funcionamiento del firmware.


<p align="center">
  <img src="/labs/Lab04/pics/zynq-7000.avif" alt="Zynq">
</p>





## 3. Procedimiento

### 3.1 Integrar la zybo-z7 al entorno de vivado.

1. Clone el repositorio del siguiente link:

```
https://github.com/Digilent/vivado-boards
```
2. En su pc dirijase a la ruta de instalación del programa vivado, en linux suele ser ```/tools/Xilinx/2025.1/Vivado/data/boards/```. 
   
3. Del repositorio que clono en el item 1, en ```vivado-boards/new/``` copie el directorio ```board_files``` y añadalo a ```/tools/Xilinx/2025.1/Vivado/data/boards/```.

### 3.2 Crearción del SoC en vivado

1. Creé un nuevo proyecto en vivado como lo ha hecho para anteriores entregas, con la diferencia de elejir la placa en vez de la FPGA. Para ello en la ventana ```Default Part``` dirijase la pestaña ```Boards``` y seleccione la tarjeta ```Zybo Z7-10``` como se muestra en la siguiente imagen:

![board](/labs/Lab04/pics/Board.png);

2. Despues de crear el proyecto, en la interfaz de vivado, seleccione en el manú de la derecha, en la categoria ```IP INTEGRATOR```, la opción ```Create Block Desig```. De un nombre al diseño y haga clic en ok.

3. En la ventana ```Diagram``` seleccione el icono ```+``` y añada uno a uno los siguientes bloques:
```
  * ZYNQ7 Processing System.
  * Processor System Reset.
  * AXI Interconnect.
  * AXI BRAM Controller.
  * Block Memory Generator.
```

![board](/labs/Lab04/pics/bloques.png)

4. Realice las conexiones como se muestra en la siguiente imagen:

![conexiones](/labs/Lab04/pics/Conexiones.png)


Si tiene dudas respecto a las conexiones, revise el video en la sección de referencias.

5. Incluya los GPIOS de los leds y los switches seleccionandolos en la ventana a la izquiera del diagrama. En la pestaña ```Board``` seleccione los GPIOs ```4 Buttons``` y ```4 LEDs```, haciendo doble clic en cada uno de ellos y dando aceptar en el cuadro de dialogo que se muestra.


![gpio](/labs/Lab04/pics/GPIO.png)

6. Realice las coneciones de ```clk``` y ```rst``` del nuevo bloque, luego haga clic izquierdo cualquier parte de la ventana de ```Diagram``` y seleccione ```Regenerate Layout```. Su Diagrama de bloques debe verse de la siguiente manera:




![Diagrama](/labs/Lab04/pics/Diagrama.png)


7. En la ventana del ```Diagram``` vaya a la pestaña ```Address Editor``` y en cualquier parte de la ventana en blanco haga clic derecho y seleccione ```Assign```. Luego cambien el rango de memoria de 64k a 4k de ```/axi_gpio_0/S_AXI```.
  

  ![Diagrama](/labs/Lab04/pics/Adreess_Editor.png)


8. Regrese a la pestaña ```Diagram``` , luego en la ventana de ```source``` a la izquiera, seleccione la fuente de diseño, que para el caso de la imagen se llama ```zynq7000```, haga clic derecho sobre este y seleccione ```Create HDL Wrapper```, en la ventana que parace seleccione la opcion ```Let Vivado manage wrapper and auto-update```, y de clic en ```ok```.

![Diagrama](/labs/Lab04/pics/wrapper.png)

9.  Despues de que se haya generado el ```wrapper``` regrese a la ventana de diagrama y en la parte superior de esta encontrara la opción ```Run Block Automatic```, de clic en ella y en la ventana de dialogo que aparece, de clic ```ok```.


![Diagrama](/labs/Lab04/pics/run_automatic.png)

10. Luego genere el ```Bitstream``` como ya lo ha hecho para laboratorios anteriores.
  

11. Luego de que se genere el ```Bitstream```, haga clic en File -> Export -> Export Hardware. En la ventana que aparece (Export Hardware Platform), haga clic en next, luego seleccione ```Include bitstream/binary``` y seleccione solamente ```Include Bitstream```, luego haga clic en next, otra vez next y finish. Con esta ultima accion se genero el archivo ```XSA``` que necesitara para el entorno de vitis.


![Diagrama](/labs/Lab04/pics/output.png)


### 3.3 Entorno de Vitis.

La Plataforma de Software Viti es un entorno de desarrollo integral diseñado para crear aplicaciones aceleradas en dispositivos de hardware adaptable de AMD, como los SoC y las FPGA. Vitis proporciona un nivel de abstracción más alto, trabajando en conjunto con una herramienta de diseño de hardware como lo es Vivado. Esto simplifica el proceso de desarrollo al ocultar la complejidad de la programación de lógica de hardware a bajo nivel.


Para continuar con el un proyecto en vitis, realice los siguientes pasos:

1. Abrir el entorno de vitis, para ello desde vivado haga clic en Tools -> Launch Vitis IDE.

![Vitis](/labs/Lab04/pics/openVitis.png)

2. En la ventana principal de vitis haga clic en <u>__Set Workspace__</u> y seleccione el fichero donde va a crear la aplicación.

3. Ahora haga clic en <u>__Create Platform Component__</u>. En la ventana ```Name and Location```, en la casilla ```Component name```, elija un nombre para la platafotma y luego de clic en ```Next```. En la pestaña ```Flow``` seleccione la opción ```Hardware Desing```, luego de clic en ```Browse```, busque y seleccione el archivo ```XSA``` que generó en vivado, luego de clic en ```Next```. En la ventana ```OS and Processor``` seleccione las opciones que aparecen en la siguiente imagen y de clic en ```Next```. En la pestaña ```Summary``` de clic en ```Finish```.

![Vitis](/labs/Lab04/pics/Platform.png)


4. En la ventana izquierda seleccione la plataforma que acaba de crear y en la parte suerior seleccione el icono ```+``` y ```Application```.


![Vitis](/labs/Lab04/pics/Application.png)

5. En la ventana ```Create Application Component - Empty Application```, en la pestaña ```Component name``` Elija un nombre para la aplicación y de clic en ```Next```. En la pestaña ```Hardware``` seleccione la plataforma que creó en el item 3 y de clic en next.

![Vitis](/labs/Lab04/pics/ApplicationPla.png)

6. En la pestaña ```Domain``` asegurese que este seleccionado el que está por defecto y creo en la plataforma, luego de clic en ```Next```.


![Vitis](/labs/Lab04/pics/ApplicationDom.png)


7. En la pestaña ```Add Source Files``` añada el archivo ```main.c``` que se enuentra en la carpeta ```scr``` en el repositorio del laboratorio 4.

8. En la pestaña ```Summary``` haga una revisión del resumen que se muestra e identifique que las opciones son correctas. De clic en ```Finish```.

9. En la ventana ````FLOW```` a la izquierda, de clic en ```Build```, si no tiene errores, conecte la ```FPGA``` y de clic en ```RUN```. Debera ver parpadear los leds de la Zybo.

![Vitis](/labs/Lab04/pics/Build.png)

## 4. Entregables

1. Realice la documentación requeria en base al archivo ```README.md``` que encontrará al aceptar la tarea de github classroom.

2. Cree una carpeta en el repositorio asignado de classroom con el nombre ```scr``` donde guarde las fuentes y el testbench del proyecto.

3. Realice cada uno de los pasos descritos en [Procedimiento](#3-procedimiento) y muestre las respectivas evidencias en clase y en el ```README.md```.

4. Adjunte las evidencias en su respectivo repositorio en Github classroom.

## 5. Referencias


- FPGAs for Beginners. (2023, 28 julio). Zynq Part 1: Vivado block diagram (no Verilog/VHDL necessary!) [Vídeo]. YouTube. https://www.youtube.com/watch?v=UZ3FnZNlcWk

- SoC AMD ZynqTM 7000. (s. f.). AMD. https://www.amd.com/es/products/adaptive-socs-and-fpgas/soc/zynq-7000.html
