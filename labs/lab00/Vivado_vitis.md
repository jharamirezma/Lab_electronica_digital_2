# Tutorial de implementación en la FPGA Zybo Z7 usando Vivado


---
## Configuración básica para crear un nuevo proyecto

* Una vez instalado, debe abrir ```Vivado```.
* En la barra de herramientas, navegar en el menú ```File```--> ```Project```--> ```New```.
* En la ventana de ```Create a New Vivado Project``` damos clic en ```Next```.
* En la ventana ```Project Name``` especificamos la ruta y el nombre del proyecto y damos ```Next```.

![new_project_1](/labs/lab00/pics/New_project_1.png)


* En la ventana ```Project Type``` elegimos ```RTL Project``` y damos ```Next```.

![new_project_2](/labs/lab00/pics/New_project_2.png)

* En la ventana ```Add Sources``` podemos añadir los modulos de verilog, system verilog o vhdl que tengamos creados del proyecto, por ejemplo:

![new_project_3](/labs/lab00/pics/New_project_3.png)

* En la ventana ```Add Constraints``` debemos incluir el archivo ```.xdc``` de configuración de pines.

![new_project_3](/labs/lab00/pics/New_project_4.png)

* En la ventana ```Default Part``` debemos elejir la referencia de la FPGA que se encuentra en la tarjeta de desarrollo ZyboZ7, que para el caso de las tarjetas que tenemos en el LABDIEE, la referencia es xc7z010clg400.

![new_project_3](/labs/lab00/pics/New_project_5.png)

* En la ventana ```New Project Summary``` encontrarán un resumen de la creación del projecto. Damos clic en ```Finish``` para abrir la interfaz de edición del proyecto.

![new_project_3](/labs/lab00/pics/New_project_6.png)
 

