Object subclass: #Ficha
Sus funciones son: cambiar el estado de la ficha (0 y 1). 
!
	"cambia el estado de una ficha a lleno"
	self estado: 1.! !
	"cambia el estado de una ficha a vacio"
	self estado: 0.! !
	"setter del estado"
	estado:= unEstado.! !
	"getter del estado"
	^estado! !
	^ #(#(#(#RGClassDefinition #(#Tablero)) #'2021-10-28T11:26:01.787728-03:00') )! !
	^ #(#(#(#RGClassDefinition #(#Tablero)) #'2021-10-28T10:20:50.152728-03:00') )! !
Sus funciones son: cargar el tablero, mostrarlo y realizar los movimientos de las fichas. !
	"metodo que se encarga de finalizar el juego"
	
	
	
	! !
	"modifica la cantidad de fichas"
	^cant_fichas.! !
	"modifica la cantidad de fichas"
	cant_fichas:= unValor.! !
	"cambia el estado de la ficha actual y el de la ficha (m n)"
   (self at:i at:j) estado: 'o'.
	(direccion = 1)ifTrue: [ (self at: i at: j+1) estado: 'o'.
	(direccion = 2)ifTrue: [ (self at: i at: j-1) estado: 'o'.
	(direccion = 3)ifTrue: [ (self at: i-1 at: j) estado: 'o'.
	(direccion = 4)ifTrue: [ (self at: i+1 at: j) estado: 'o'.
   (self at: m at: n) estado: '◙'.
   self cant_fichas: (cant_fichas  - 1).! !
	"Seleccionar la direccion que se debe mover la ficha"
	|direccion|
	direccion:=UIManager default
    	chooseFrom: #('MOVER A DERECHA' 'MOVER A IZQUIERDA' 'MOVER A ARRIBA' 'MOVER A ABAJO')
    	values: #(1 2 3 4)
    	lines: #(1 2 3 4)
    	title: 'SELECCIONE DIRECCIÓN'.
	^direccion! !
	"Seleccionar la columna que se debe mover la ficha"
	|columna|
	columna:=UIManager default
   		chooseFrom: #(A B C D E F G H I J K)
    	values: #(1 2 3 4 5 6 7 8 9 10 11)
    	lines: #(1 2 3 4 5 6 7 8 9 10 11)
    	title: 'SELECCIONE COLUMNA'.
	^columna! !
	"Seleccionar la fila que se debe mover la ficha"
	|fila|
	fila:=UIManager default
   		chooseFrom: #(A B C D E F G H I J K)
    	values: #(1 2 3 4 5 6 7 8 9 10 11)
    	lines: #(1 2 3 4 5 6 7 8 9 10 11)
    	title: 'SELECCIONE FILA'.
	^fila! !
	"metodo que carga el tablero"
	
	! !
	"metodo que carga el tableroCruz"
	
	! !
	"metodo que carga el tablero cuadrado"
	|letras|
	Transcript clear.
	letras:=('ABCDEFG').
	Transcript cr.
	Transcript show: ('       A   B   C   D   E   F   G    ').
	Transcript cr.
	Transcript cr.
	Transcript show: ('     ┌───┬───┬───┬───┬───┬───┬───┐ ').
	Transcript cr.
	1 to: 7 do:[:i |  Transcript show:' '.
                      Transcript show: (letras at:i).
                      Transcript show:'   │'.
                      1 to:7 do:[:j| Transcript show:' '.
                                            Transcript show: (self at:i at:j) estado.
                                            Transcript show:' │'].
                        Transcript cr.
                        Transcript cr].
	
	! !
	"metodo que carga el tableroCuadrado"
	self cant_fichas: 48.
	1 to: 7 do: [:i| 
		1 to:7 do:[:j |
		 self at:i at:j put: Ficha new]  ].
	1 to: 7 do:[:i | 1 to:7 do:[:j| (self at:i at:j) estado:'◙'.].].
	(self at:4 at:4) estado: 'o'.
	
	! !
	"metodo que carga el tableroDiamante"