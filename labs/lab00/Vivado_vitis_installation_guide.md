# Tutorial para instalar y configurar FPGA Design Software - Vivado.

Índice:

* [Descargar e instalar Vivado- vitis](#descargar-e-instalar-intel-quartus-prime).
* [Configurar la variable de entorno](#configuración-de-la-variable-de-entorno)
* [Entregables](#entregables)


*  *  *  *  *

## Descargar e instalar Vivado™ Edition - 2025.1:

* Cree un cuenta en la pagina de Xilinx en el siguiente [link](https://www.amd.com/en/registration/create-account.html).

* Descargue los archivos de instalación de Vivado y Vitis en el  siguiente [link](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/2025-1.html):

* Seleccione la versión 2025-1 ( AMD Unified Installer for FPGAs & Adaptive SoCs 2025.1: Linux Self Extracting Web Installer (BIN - 335.53 MB)) para el sistema operativo, en este caso Linux! 

![descarga](/labs/lab00/pics/descarga.png)

<font color="red">NOTA</font>: Antes de ejecutar el instalador de vivado, identifique la versión de su sistema operativo y si este cuenta con la libreria ```libtinfo5```. Las versiones mas recientes de Ubuntu y Linux Mint cuentan con una versión actualizada de dicha libreria, pero vivado requiere especificamente ```libtinfo5``` para ejecutarse. Una forma de corroborar si su sistema operativo cuenta con dicha libreria es ejecutar el siguiente comando:

```
dpkg -s libtinfo5
```

Si al ejecutart el comando anteriror este devuelve las siguientes lineas, es porque si cuenta con la libreria:

```
Package: libtinfo5
Status: install ok installed
Priority: optional
Section: libs
Installed-Size: ...
Maintainer: ...
Architecture: ...
    ...
```

Si por el contraria devuelve las siguientes lineas es porque no cuenta con dicho paquete:

```
dpkg-query: package 'libtinfo5' is not installed and no information is available
Use dpkg --info (= dpkg-deb --info) to examine archive files.
```

Si logra identificar que su sistema operativo no cuenta con ```libtinfo5```, ejecute los siguientes comandos uno por uno en consola:


```
sudo apt update
sudo apt install libtinfo-dev
sudo ln -s /lib/x86_64-linux-gnu/libtinfo.so.6 /lib/x86_64-linux-gnu/libtinfo.so.5
sudo apt-get install libtinfo5
```

Y luego proceda con la instalación de Vivado.

* Instalación:

    * Abra una terminal en la carpeta donde descargo el archivo de instalación.

    * Ejecute el instalador con permisos de super usuario como se muestra en el siguiente comando:

        ``` 
        sudo ./*.bin
        ```
        Donde debe remplazar ```*```  con el nombre del archivo ```.bin```, por ejemplo:

        ``` 
        sudo ./FPGAs_AdaptiveSoCs_Unified_SDI_2025.1_0530_0145_Lin64.bin
        ```
    * En la ventana de selección de producto, elija la opcion de vivado.

    ![Selecciondeproducto](/labs/lab00/pics/Select_product.png)


    * En la ventana de selección de editión, elija la opción Vivado ML Standard.


    ![Selecciondeedicion](/labs/lab00/pics/Select_edition.png)

    * En la ventana Vivado ML Standard seleccione las siguila variable de entornoentes herramientas:

    ![Selecciondeherramientas](/labs/lab00/pics/Vivado_tools.png)

    * Despues de leer y aceptar los terminos del software, este empezará a descargarse e instalarse.

    ![instalacion](/labs/lab00/pics/Instalacion.png)

    * Al finalizar la instalación y si no modifico la ruta de instalación que venia por defecto, ejecute los siguientes comandos los cual deberian abrir el software:

    ```
    cd /tools/Xilinx/2025.1/Vivado/bin
    ```

    ``` 
    sudo ./vivado
    ```