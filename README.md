## Bienvenido al repositorio de Bakelove!! 😄👋
![](https://raw.githubusercontent.com/Charisse01/trabajo_final_flutter/master/assets/img/bakelove.png)
**Instalaciones** 👀
Debes tener instalado: 
- Android Studio
- Visual Studio Code
- Flutter SDK
- NodeJS
- Dart Language


# Flutter App Pedidos

Un proyecto desarrollado en Flutter para gestionar pedidos, hacer pedidos y promociones, con un diseño moderno, modular y fácil de entender, de un restaurante de comida vegana.

## Descripción 📄

**Flutter App Pedidos** es una aplicación móvil que ofrece funciones como:
- Visualización interactiva de promociones.
- Gestión de un carrito de compras.
- Navegación por distintas secciones, incluyendo información detallada de los productos.
- Enviar la cuenta total por medio de nuestro numero vinculado con Whatsapp, mostrando los detalles de los productos seleccionados, el subtotal, el impuesto y el moto total del pedido. 

La aplicación está diseñada con una estructura modular que facilita la lectura y mantenimiento del código.

## Características principales ✍🏻

- **Modularidad:** Cada funcionalidad está separada en su propio archivo para facilitar el desarrollo.
- **Promociones interactivas:** Desplazamiento de tarjetas y detalles dinámicos.
- **Diseño amigable:** Interfaz moderna basada en el Material Design de Flutter.
- **Carrito de compras:** Sección dedicada para gestionar productos seleccionados.
- **Compatibilidad multiplataforma:** Compatible con Android, iOS, Windows, macOS, Linux y web.

## Estructura del proyecto ⭐️

La estructura de tu proyecto es la siguiente:

flutter_app_pedidos/
├── assets/                     # Recursos gráficos
│   ├── font/                   # Fuentes personalizadas 
│   ├── img/                    # Imágenes del proyecto
├── lib/                        # Código fuente principal
│   ├── carrito/                # Módulo de carrito de compras
│   ├── model/                  # Contiene la definicion de la  clase Carta y crea listas de objetos de esta clase.
│   ├── main.dart               # Punto de entrada principal
│   ├── pantallaCarrito.dart    # Pantalla para gestionar el carrito
│   ├── pantallaCarta.dart      # Pantalla para mostrar los productos
│   ├── pantallaInfo.dart       # Pantalla de información detallada
│   ├── pantallaInicio.dart     # Pantalla principal de inicio
│   ├── pantallaPromociones.dart # Pantalla de promociones
├── pubspec.yaml                # Archivo de configuración del proyecto
├── README.md                   # Archivo de documentación
