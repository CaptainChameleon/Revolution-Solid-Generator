#S�lidos de revoluci�n
###Creando Interfaces de usuario - Pr�ctica 2

##Introducci�n
Los s�lidos de revoluci�n son una t�cnica sencilla de generar formas tridimensionales sim�tricas a partir de un perfil bidimensional, ahorrando trabajo de dise�o.
El presente prototipo permite dibujar perfiles y generar a partir de ellos tales s�lidos por medio de una superficie de revoluci�n. 
Es tambi�n son un buen punto de partida para estudiar el modelado de formas tridimensionales a partir de mallas y la construcci�n de estas v�rtice a v�rtice.

![Profile example](https://github.com/CaptainChameleon/Revolution-Solid-Generator/images/Perfil.png) | ![Resulting solid](https://github.com/CaptainChameleon/Revolution-Solid-Generator/images/Donut.png)

##Perfil
Para permitir el dibujo de perfiles se recoge la posici�n del rat�n cada vez que se pulsa el bot�n izquierdo del rat�n, todo ello tomando como origen el centro de la pantalla. 
Internamente estos v�rtices se almacenan en un *Array* y, cada vez que se registra o elimina un v�rtice, se genera un objeto tipo `PShape` con sus contenidos.

###UX/UI y Previsualizaci�n de l�nea
Como ayuda en el dibujo, adem�s de mostrar las instrucciones de uso, se representa un eje de simetr�a y las coordenadas del puntero en todo momento. Para garantizar el control
y la libertad del usuario se permite eliminar los v�rtices a�adidos anteriormente mediante el bot�n derecho del rat�n.

Otra herramienta fundamental para el dibujo es la posibilidad de previsualizar la l�nea a dibujar. Esto se consigue trazando una l�nea desde el �ltimo v�rtice a�adido hasta la 
posici�n actual del puntero en cada iteraci�n.

##Solido de revoluci�n
Una vez se est� satisfecho con el dise�o del perfil, generar el s�lido implica construir una malla a partir de �l. Para ello es necesario rotar los v�rtices sobre el eje de 
simetr�a. Se divide el espacio de 360� en partes iguales (meridianos) y se toman los v�rtices de dos en dos ya que, una vez se represente el par, al calcular las posiciones 
del par siguiente tras rotar se formar� un tri�ngulo al registrar el primer v�rtice del segundo par. Esto permite ir construyendo tiras o *stripes* que ir�n conformando la 
malla, tal y como se muestra en las im�genes.

![Perfil b�sico](https://github.com/CaptainChameleon/Revolution-Solid-Generator/images/Perfil_basico.png) | ![Solido b�sico](https://github.com/CaptainChameleon/Revolution-Solid-Generator/images/Solido_basico.png)

##Algunos ejemplos
![Copa](https://github.com/CaptainChameleon/Revolution-Solid-Generator/images/Copa.png) | ![Diamante](https://github.com/CaptainChameleon/Revolution-Solid-Generator/images/Diamante.png) | ![Cosa rara](https://github.com/CaptainChameleon/Revolution-Solid-Generator/images/Cosa_rara.png)