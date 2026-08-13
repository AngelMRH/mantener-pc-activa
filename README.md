# Mantener PC Activa

Script para Windows que evita que la computadora se suspenda o bloquee automáticamente. No requiere instalar nada, funciona con PowerShell que ya viene en Windows.

---

## Archivos

| Archivo | Descripción |
|---|---|
| `mantener_activo.ps1` | Script principal |
| `mantener_activo.bat` | Lanzador (doble clic para ejecutar) |

---

## Uso rápido (manual)

1. Descarga los dos archivos en la misma carpeta
2. Doble clic en `mantener_activo.bat`
3. Se ejecuta en segundo plano — la PC no se suspenderá

Para detenerlo: busca `powershell` en el Administrador de tareas y ciérralo.

---

## Ejecutar automáticamente al iniciar Windows

Para que se inicie solo cada vez que enciendas la PC:

1. Presiona `Win + R`, escribe `shell:startup` y presiona Enter
2. Copia el archivo `mantener_activo.bat` dentro de esa carpeta
3. Listo — desde ahora se ejecutará solo al iniciar sesión

---

## Cómo funciona

Usa la función `SetThreadExecutionState` de la API de Windows para indicarle al sistema operativo que no suspenda la pantalla ni el equipo. Es el mismo método que usan aplicaciones como Netflix, Zoom o Teams para evitar que la pantalla se apague durante una reunión o video.

No mueve el mouse ni simula teclas — trabaja directamente con Windows.

---

## Desinstalar

Elimina el archivo `mantener_activo.bat` de la carpeta `shell:startup` y borra los dos archivos descargados.
