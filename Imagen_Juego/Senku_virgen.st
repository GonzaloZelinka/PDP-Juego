Object subclass: #Ficha
Sus funciones son: cambiar el estado de la ficha (0 y 1). 
!
	"cambia el estado de una ficha a lleno"
	self estado: 1.! !
	"cambia el estado de una ficha a vacio"
	self estado: 0.! !
	"getter del estado"
	^estado! !
	"setter del estado"
	estado:= unEstado.! !
	^ #(#(#(#RGClassDefinition #(#Tablero)) #'2021-10-28T10:20:50.152728-03:00') )! !
	^ #(#(#(#RGClassDefinition #(#Tablero)) #'2021-10-28T11:26:01.787728-03:00') )! !
Sus funciones son: cargar el tablero, mostrarlo y realizar los movimientos de las fichas. !
	"metodo que carga el tablero"
	
	! !
	"Seleccionar la fila que se debe mover la ficha"
	|fila|
	fila:=UIManager default
   		chooseFrom: #(A B C D E F G H I J K)
    	values: #(1 2 3 4 5 6 7 8 9 10 11)
    	lines: #(1 2 3 4 5 6 7 8 9 10 11)
    	title: 'SELECCIONE FILA'.
	^fila! !
	"Seleccionar la columna que se debe mover la ficha"
	|columna|
	columna:=UIManager default
   		chooseFrom: #(A B C D E F G H I J K)
    	values: #(1 2 3 4 5 6 7 8 9 10 11)
    	lines: #(1 2 3 4 5 6 7 8 9 10 11)
    	title: 'SELECCIONE COLUMNA'.
	^columna! !
	"Seleccionar la direccion que se debe mover la ficha"
	|direccion|
	direccion:=UIManager default
    	chooseFrom: #('MOVER A DERECHA' 'MOVER A IZQUIERDA' 'MOVER A ARRIBA' 'MOVER A ABAJO')
    	values: #(1 2 3 4)
    	lines: #(1 2 3 4)
    	title: 'SELECCIONE DIRECCIÓN'.
	^direccion! !
	"modifica la cantidad de fichas"
	cant_fichas:= unValor.! !
	"modifica la cantidad de fichas"
	^cant_fichas.! !
	"metodo que se encarga de finalizar el juego"
	(cant_fichas = 1) 
	ifTrue: [UIManager default alert: '¡FELICIDADES, HAS GANADO!!' title: 'FIN DEL JUEGO'. 
	
	
	
	! !
	"cambia el estado de la ficha actual y el de la ficha (m n)"
   (self at:i at:j) estado: 0.
	(direccion = 1)ifTrue: [ (self at: i at: j+1) estado: 0.
	(direccion = 2)ifTrue: [ (self at: i at: j-1) estado: 0.
	(direccion = 3)ifTrue: [ (self at: i-1 at: j) estado: 0.
	(direccion = 4)ifTrue: [ (self at: i+1 at: j) estado: 0.
   (self at: m at: n) estado: 1.
   self cant_fichas: (cant_fichas  - 1).! !
	"metodo que carga el tableroCruz"
	
	! !
    "verifica si un salto es válido en base a la direccion y la posicion actual"
	"metodo que carga el tableroCuadrado"
	self cant_fichas: 120.
	1 to: 11 do: [:i| 
		1 to:11 do:[:j |
		 self at:i at:j put: Ficha new]  ].
	1 to: 11 do:[:i | 1 to:11 do:[:j| (self at:i at:j) estado:'◙'.].].
	(self at:6 at:6) estado: 'o'.
	
	! !
    "verifica si un salto es válido en base a la direccion y la posicion actual"
    |pos_validas|
    pos_validas:=#(1 2 3 4 5 6 7 8 9 10 11)."(n= 11 array new: n| despues cargar con con un 1 to: n) puede ser"
    ((pos_validas includes: i) and: (pos_validas includes: j)) 
    		(self at: i at: j) estado = '◙' 
					(direccion=1) 		"Derecha"
     	   				ifTrue:[ ((pos_validas includes: j+1) and: (pos_validas includes:j+2)) 
															ifTrue:[ ^true ]
															ifFalse: [ self mensajeMovInvalido.
			
	    			(direccion=2) 		"Izquierda"
		
					(direccion=3) 		"Arriba"
				
					(direccion=4) 		"Abajo"
			
			ifFalse: [UIManager default alert: 'LA POSICION SELECCIONADA YA ESTA VACIA' title: 'ERROR'.
		ifFalse: [UIManager default alert: 'LA POSICION SELECCIONADA ES INVALIDA' title: 'ERROR'.
	"metodo que carga el tablero cuadrado"
	|letras|
	Transcript clear.
	letras:=('ABCDEFGHIJK').
	Transcript cr.
	Transcript show: ('       A   B   C   D   E   F   G   H   I   J   K   ').
	Transcript cr.
	Transcript show: ('                                                  ').
	Transcript cr.
	Transcript show: ('     ┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┐ ').
	Transcript cr.
	1 to: 11 do:[:i |  Transcript show:' '.
                      Transcript show: (letras at:i).
                      Transcript show:'   │'.
                      1 to:11 do:[:j| Transcript show:' '.
                                            Transcript show: (self at:i at:j) estado.
                                            Transcript show:' │'].
                        Transcript cr.
                        Transcript cr].
	
	! !
	"metodo que carga el tableroDiamante"