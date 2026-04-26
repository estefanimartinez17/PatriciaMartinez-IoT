# Uso y Documentación de Makefiles

**Escuela Superior de Cómputo - Instituto Politécnico Nacional** 
**Carrera:** Ingeniería en Sistemas Computacionales
**UA:** Internet Of Things [Grupo] 
**Autor:** Martinez Ortiz Patricia Estefania  

---

## 1.- Análisis y documentación del Makefile ejemplo.

El archivo `Makefile` presentado es utilizado esencialmente para automatizar la compilación de un programa escrito en C. Así pues, conlleva el propósito de ilustrar la posibilidad de estandarizar el proceso de construcción de software, reduciendo la posibilidad de errores manuales al invocar el compilador directamente.

Lo anterior es debido a que el uso `Makefile` implica escribir el comando de compilación una sola vez. De modo que cualquier eprsona que descargue el código utilizará los mismos parámetros, y el acto de delegar dicho trabajo repetitivo reduce errores provocados por fallos humanos.

#### Variables
Las variables facilitan los cambios en el proyecto centralizando la configuración.
* `CC = gcc`: Define qué compilador a utilizar.
* `CFLAGS = -Wall -Wextra -O2`: Establece las banderas o parámetros del compilador. `-Wall` y `-Wextra` exigen que se muestren advertencias de código, y `-O2` optimiza el rendimiento del ejecutable resultante.
* `TARGET = hola`: Define el nombre final del ejecutable.
* `SRCS = main.c`: Lista los archivos de código fuente.
* `OBJS = $(SRCS:.c=.o)`: Conversión automática de archvios fuente a objetos.

#### Objetivos .PHONY
`.PHONY: all run clean help rebuild` Indica a `make` que son tareas y no archivos reales, evitando conflictos si existiera un archivo llamado igual en la carpeta.

#### Reglas
* **(`%.o: %.c`):** Generaliza cómo compilar código, usando las variables automáticas $< y $@.. `$<` para referirse al archivo fuente y `$@` para el archivo generado.
* **La regla de enlazado (`$(TARGET): $(OBJS)`):** Toma todos los archivos objeto compilados previamente y los enlaza a través de GCC para generar el ejecutable final.
* **(`clean`):** Regla de limpieza que llama a comandos del sistema operativo para borrar los binarios generados.

### Resultado de ejecución de las instrucciones
*Es importante destacar el uso de `mingw32-make` por ser usuario de Windows*

* `make help`: Muestró una lista de los comandos disponibles y su función.
* `make`: Compiló el código fuente y generó el archivo ejecutable llamado `hola`.
* `make run`: Verificó si existían cambios, compiló el programa (si era necesario) y lo ejecutó inmediatamente.
* `make clean`: Eliminó los archivos objeto (`.o`) y el ejecutable, manteniendo el repositorio limpio.
* `make rebuild`: Ejecutó una limpieza completa del entorno seguida de una compilación desde cero.

---

## 2.- Análisis y documentación del Makefile para el proyecto "Implementación de Cifrado César en C"

### Descripción del proyecto.
El presente proyecto es una implementación modular del algoritmo de Cifrado César en lenguaje C, diseñado con el objetivo es aplicar los conocimientos adquiridos para crear un `Makefile` propio, documentarlo y organizar la compilación de manera automática y ordenada.

Nótese que la lógica matemática del criptosistema (`encipher.c`) se encuentra separada de la ejecución del programa principal (`main.c`).

### Análisis técnico del Makefile.

El funcionamiento del código de automatización se basa en los siguientes componentes, garantizando que el proceso de compilación esté estandarizado:

#### Variables
* **`CC = gcc`**: Define el compilador estándar a utilizar.
* **`CFLAGS = -Wall -Wextra -O2`**: Banderas de compilación. `-Wall` y `-Wextra` activan las advertencias para evitar errores lógicos, mientras que `-O2` optimiza el rendimiento del código resultante mediante la eliminación decódigo muerto y reordenación de instrucciones.
* **`TARGET = cifrado`**: Establece el nombre del archivo ejecutable final.
* **`SRCS = main.c encipher.c`**: Lista de archivos fuente. Al ser modular, el Makefile sabe que debe rastrear ambos archivos.
* **`OBJS = $(SRCS:.c=.o)`**: Convierte dinámicamente la lista de `.c` en dependencias de objetos `.o` (`main.o` y `encipher.o`).

#### Reglas
* **Regla de Patrón (`%.o: %.c`)**: Instrucción genérica que indica a Make cómo transformar cualquier archivo fuente en su correspondiente archivo objeto antes de unirlos. Utiliza variables automáticas (`$<` y `$@`).
* **Regla de Enlazado (`$(TARGET): $(OBJS)`)**: Toma los archivos compilados en el paso anterior y los enlaza para generar el ejecutable final.
* **Reglas de Acción (`run`, `clean`, `rebuild`)**: Objetivos marcados como `.PHONY` para ejecutar tareas de terminal en lugar de crear archivos. `run` revisa dependencias y ejecuta el binario, `clean` invoca comandos de borrado y `rebuild` secuencia la limpieza seguida de una nueva compilación completa.

### Control de Versiones con `.gitignore`
Para complementar la automatización del proyecto y asegurar buenas prácticas, se implementó un archivo `.gitignore` adecuado. La finalidad de este componente es excluir de manera automática archivos innecesarios o temporales que se generan durante el ciclo de vida de la compilación. 

Al ignorar elementos como los binarios (`cifrado`, `*.exe`) y los archivos objeto intermedios (`*.o`), se garantiza compartir únicamente los archivos necesarios, logrando que el repositorio sea claro, funcional y limpio.

### Instrucciones de Ejecución

#### En Windows (PowerShell / CMD con MinGW)
1. Abrir la terminal en el directorio del proyecto.
2. **Compilar y ejecutar automáticamente:** `mingw32-make run`
3. **Limpiar el entorno:** `mingw32-make clean`
4. **Recompilar el proyecto desde cero:** `mingw32-make rebuild`

#### En Linux (Ubuntu / Debian / WSL)
1. Abrir la terminal en el directorio del proyecto.
2. **Compilar y ejecutar automáticamente:** `make run`
3. **Limpiar el entorno:** `make clean`
4. **Recompilar el proyecto desde cero:** `make rebuild`

### Reporte de Resultados de Ejecución
Al ejecutar el objetivo principal, la herramienta evalúa las dependencias y compila exitosamente el sistema, reportando los siguientes resultados en la consola y explicando cómo se logra la automatización:

#### Flujo de Ejecución del Makefile

1. **Compila `main.c` y `encipher.c` a código objeto (`.o`)**: Utiliza la regla de patrón genérica (`%.o: %.c`) para compilar cada módulo fuente por separado, generando `main.o` y `encipher.o`.
2. **Enlaza los objetos para crear el ejecutable `cifrado`**: Toma los binarios intermedios (`main.o` y `encipher.o`) y los une utilizando el compilador GCC para generar el programa final.
3. **Ejecuta el binario**: Llama automáticamente al archivo ejecutable generado (`./cifrado`) para iniciar el procesamiento de datos.
4. **Procesa y muestra el resultado**: El programa aplica el algoritmo de desplazamiento al texto definido y muestra el mensaje cifrado final directamente en la terminal.

#### Comandos automatizados ejecutados:

`gcc -Wall -Wextra -O2 -c main.c -o main.o`
`gcc -Wall -Wextra -O2 -c encipher.c -o encipher.o`
`gcc -Wall -Wextra -O2 main.o encipher.o -o cifrado`

#### Salida del programa

`Cifrado Cesar utilizando una llave=3 en C`
`Mensaje original: IoTEmbebidos`
`Mensaje cifrado: IrTEpehelgrv`