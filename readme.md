#Sólidos de revolución
###Creando Interfaces de usuario - Práctica 2

##Introducción
Los sólidos de revolución son una técnica sencilla de generar formas tridimensionales simétricas a partir de un perfil bidimensional, ahorrando trabajo de diseño.
El presente prototipo permite dibujar perfiles y generar a partir de ellos tales sólidos por medio de una superficie de revolución. 
Es también son un buen punto de partida para estudiar el modelado de formas tridimensionales a partir de mallas y la construcción de estas vértice a vértice.

![Profile example](https://github.com/CaptainChameleon/Revolution-Solid-Generator/images/Perfil.png) | ![Resulting solid](https://github.com/CaptainChameleon/Revolution-Solid-Generator/images/Donut.png)

##Perfil
Para permitir el dibujo de perfiles se recoge la posición del ratón cada vez que se pulsa el botón izquierdo del ratón, todo ello tomando como origen el centro de la pantalla. 
Internamente estos vértices se almacenan en un *Array* y, cada vez que se registra o elimina un vértice, se genera un objeto tipo `PShape` con sus contenidos.

###UX/UI y Previsualización de línea
Como ayuda en el dibujo, además de mostrar las instrucciones de uso, se representa un eje de simetría y las coordenadas del puntero en todo momento. Para garantizar el control
y la libertad del usuario se permite eliminar los vértices añadidos anteriormente mediante el botón derecho del ratón.

Otra herramienta fundamental para el dibujo es la posibilidad de previsualizar la línea a dibujar. Esto se consigue trazando una línea desde el último vértice añadido hasta la 
posición actual del puntero en cada iteración.

##Solido de revolución
Una vez se está satisfecho con el diseño del perfil, generar el sólido implica construir una malla a partir de él. Para ello es necesario rotar los vértices sobre el eje de 
simetría. Se divide el espacio de 360º en partes iguales (meridianos) y se toman los vértices de dos en dos ya que, una vez se represente el par, al calcular las posiciones 
del par siguiente tras rotar se formará un triángulo al registrar el primer vértice del segundo par. Esto permite ir construyendo tiras o *stripes* que irán conformando la 
malla, tal y como se muestra en las imágenes.

![Perfil básico](https://github.com/CaptainChameleon/Revolution-Solid-Generator/images/Perfil_basico.png) | ![Solido básico](https://github.com/CaptainChameleon/Revolution-Solid-Generator/images/Solido_basico.png)

##Algunos ejemplos
![Copa](https://github.com/CaptainChameleon/Revolution-Solid-Generator/images/Copa.png) | ![Diamante](https://github.com/CaptainChameleon/Revolution-Solid-Generator/images/Diamante.png) | ![Cosa rara](https://github.com/CaptainChameleon/Revolution-Solid-Generator/images/Cosa_rara.png)