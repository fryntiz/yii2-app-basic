# Instrucciones para comenzar proyecto

Este apartado facilita la planificación inicial de un proyecto al proporcionar 
una estructura sencilla, preconstruida y autodesplegable en el control de 
versiones github.

## Instalar dependencias

Primero resolver dependencias:

```bash
    make install
```

Esta orden anterior nos resolverá todas las dependencias

## Crear Hitos en GitHub

→→→→ Aún no se crean los hitos, solo se comprueban

```bash
    make milestones
```

## Crear etiquetas en GitHub

Crea en el repositorio asociado (tiene que estar asociado) en GitHub una lista
de etiquetas para marcar.

```bash
    make tags
```

## Comprobar dependencias

Comprueba que se han resuelto todas las dependencias que son necesarias para
llevar a cabo las operaciones.

```bash
    make check
```

## Crear PDF con la propuesta y requisitos

Este comando genera un pdf con la propuesta y con cada uno de los requisitos

```bash
    make pdf
```
