# Variables de Compilación
CC = gcc

# Banderas de compilación
CFLAGS = -Wall -Wextra -O2

#Archivos del Proyecto
TARGET = cifrado
SRCS = main.c encipher.c

#Reemplaza la extensión .c por .o para generar los objetos
OBJS = $(SRCS:.c=.o)

#Declaración de Reglas
.PHONY: all run clean rebuild

all: $(TARGET)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

run: $(TARGET)
	./$(TARGET)

# Limpieza del entorno
clean:
	del /Q /F *.o *.exe

rebuild: clean all