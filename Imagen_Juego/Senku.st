PackageManifest subclass: #ManifestSenku
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Senku-Manifest'!
!ManifestSenku commentStamp: '<historical>' prior: 0!
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

ManifestSenku class
	instanceVariableNames: ''!

!ManifestSenku class methodsFor: 'code-critics' stamp: 'GRUPO5 10/28/2021 10:20'!
ruleRBLongMethodsRuleV1FalsePositive
	^ #(#(#(#RGClassDefinition #(#Tablero)) #'2021-10-28T10:20:50.152728-03:00') )! !

!ManifestSenku class methodsFor: 'code-critics' stamp: 'GRUPO5 10/28/2021 10:20'!
ruleRBCodeCruftLeftInMethodsRuleV1FalsePositive
	^ #(#(#(#RGMethodDefinition #(#Tablero #mostrarTablero #false)) #'2021-10-28T10:20:32.259728-03:00') #(#(#RGClassDefinition #(#Tablero)) #'2021-10-28T10:20:46.921728-03:00') )! !

!ManifestSenku class methodsFor: 'code-critics' stamp: 'GRUPO5 10/28/2021 11:26'!
ruleRBExcessiveArgumentsRuleV1FalsePositive
	^ #(#(#(#RGClassDefinition #(#Tablero)) #'2021-10-28T11:26:01.787728-03:00') )! !
Object subclass: #Ficha
	instanceVariableNames: 'estado'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Senku'!
!Ficha commentStamp: 'GRUPO5 10/28/2021 10:27' prior: 0!
Esta clase se encarga de todo lo relacionado con la fichas de cada tablero. 
Sus funciones son: cambiar el estado de la ficha (0 y 1). 
!


!Ficha methodsFor: 'acccessing' stamp: 'GRUPO5 10/28/2021 09:17'!
estado
	"getter del estado"
	^estado! !

!Ficha methodsFor: 'acccessing' stamp: 'GRUPO5 10/28/2021 09:16'!
estado: unEstado
	"setter del estado"
	estado:= unEstado.! !


!Ficha methodsFor: 'all' stamp: 'GRUPO5 10/28/2021 10:43'!
colocar_ficha
	"cambia el estado de una ficha a lleno"
	self estado: 1.! !

!Ficha methodsFor: 'all' stamp: 'GRUPO5 10/28/2021 10:43'!
eliminar_ficha
	"cambia el estado de una ficha a vacio"
	self estado: 0.! !


Array2D subclass: #Tablero
	instanceVariableNames: 'cant_fichas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Senku'!
!Tablero commentStamp: 'GRUPO5 10/28/2021 10:29' prior: 0!
Esta subclase se encarga del tablero de juego, donde se encuentran el conjunto de fichas que se pueden ir moviendo.
Sus funciones son: cargar el tablero, mostrarlo y realizar los movimientos de las fichas. !


!Tablero methodsFor: 'testing' stamp: 'GRUPO5 10/28/2021 12:33'!
verificarFinJuego
	"metodo que se encarga de finalizar el juego"
	(cant_fichas = 1) 
	ifTrue: [^true] 
	"ifFalse: [( ver como usar verificar_salto para ver si quedan movimientos diponibles )ifTrue:[
			^false]]".
	
	
	
	! !


!Tablero methodsFor: 'all' stamp: 'GRUPO5 10/28/2021 12:10'!
seleccionColumna
	"Seleccionar la columna que se debe mover la ficha"
	|columna|
	columna:=UIManager default
   		chooseFrom: #(A B C D E F G H I J K)
    	values: #(1 2 3 4 5 6 7 8 9 10 11)
    	lines: #(1 2 3 4 5 6 7 8 9 10 11)
    	title: 'SELECCIONE COLUMNA'.
	^columna! !

!Tablero methodsFor: 'all' stamp: 'GRUPO5 10/28/2021 10:51'!
mostrarTablero
	"metodo que carga el tablero"
	|letras|
	Transcript clear.
	letras:=('ABCDEFGHIJK').
	Transcript cr.
	Transcript show: ('       A   B   C   D   E   F   G   H   I   J   K   ').
	Transcript cr.
	Transcript show: ('                                                   ').
	Transcript cr.
	Transcript show: ('     |---|---|---|---|---|---|---|---|---|---|---| ').
	Transcript cr.
	1 to: 11 do:[:i |  Transcript show:' '.
                      Transcript show: (letras at:i).
                      Transcript show:'   |'.
                      1 to:11 do:[:j| Transcript show:' '.
                                            Transcript show: (self at:i at:j) estado.
                                            Transcript show:' |'].
                        Transcript cr.
                        Transcript show: ('     |---|---|---|---|---|---|---|---|---|---|---| ').
                        Transcript cr].
	
	! !

!Tablero methodsFor: 'all' stamp: 'GRUPO5 10/28/2021 10:47'!
cargaTablero
	"metodo que carga el tablero"
	self cant_fichas: 120.
	1 to: 11 do: [:i| 
		1 to:11 do:[:j |
		 self at:i at:j put: Ficha new]  ].
	1 to: 11 do:[:i | 1 to:11 do:[:j| (self at:i at:j) estado:1.].].
	(self at:6 at:6) estado: 0.
	
	! !

!Tablero methodsFor: 'all' stamp: 'GRUPO5 10/28/2021 12:10'!
seleccionDireccion
	"Seleccionar la direccion que se debe mover la ficha"
	|direccion|
	direccion:=UIManager default
    	chooseFrom: #('MOVER A DERECHA' 'MOVER A IZQUIERDA' 'MOVER A ARRIBA' 'MOVER A ABAJO')
    	values: #(1 2 3 4)
    	lines: #(1 2 3 4)
    	title: 'SELECCIONE DIRECCIÓN'.
	^direccion! !

!Tablero methodsFor: 'all' stamp: 'GRUPO5 10/28/2021 11:58'!
verificar_salto: direccion i: i j: j 
    "verifica si un salto es válido en base a la direccion y la posicion actual"
    |pos_validas|
    pos_validas:=#(1 2 3 4 5 6 7 8 9 10 11)."(n= 11 array new: n| despues cargar con con un 1 to: n) puede ser"
    ((pos_validas includes: i) and: (pos_validas includes: j)) ifTrue:[
    (self at: i at: j) estado =1 
    	ifTrue:[
			(direccion=1) 		"Derecha"
     	   		ifTrue:[ ((self at: i at:j+1) estado=1 and: ((self at: i at:j+2) estado=0)) 
					ifTrue:[ self saltar: direccion atI: i atJ: j atM:i atN: (j+2) ]
					ifFalse: [UIManager default alert: 'EL MOVIMIENTO ES INVALIDO' title: 'ERROR']].
			
	    	(direccion=2) 		"Izquierda"
				ifTrue:[ ((self at: i at:j-1) estado=1 and: ((self at: i at:j-2) estado=0)) 
					ifTrue:[ self saltar: direccion atI: i atJ:j atM:i atN:(j-2) ]
					ifFalse: [UIManager default alert: 'EL MOVIMIENTO ES INVALIDO' title: 'ERROR']].
		
			(direccion=3) 		"Arriba"
				ifTrue:[((self at: i-1 at:j) estado=1 and: ((self at: i-2 at:j) estado=0)) 
					ifTrue:[ self saltar: direccion atI: i atJ:j atM:(i -2) atN:j ]
					ifFalse: [UIManager default alert: 'EL MOVIMIENTO ES INVALIDO' title: 'ERROR']].
		
			(direccion=4) 		"Abajo"
				ifTrue:[((self at: i+1 at:j) estado=1 and: ((self at: i+2 at:j) estado=0))
					ifTrue:[ self saltar: direccion atI: i atJ:j  atM:(i+2) atN:j ]
					ifFalse: [UIManager default alert: 'EL MOVIMIENTO ES INVALIDO' title: 'ERROR']]]
			
			ifFalse: [UIManager default alert: 'LA POSICION SELECCIONADA YA ESTA VACIA' title: 'ERROR']]
		
		ifFalse: [UIManager default alert: 'LA POSICION SELECCIONADA ES INVALIDA' title: 'ERROR']! !

!Tablero methodsFor: 'all' stamp: 'GRUPO5 10/28/2021 12:02'!
saltar: direccion atI: i atJ: j atM: m atN: n    
	"cambia el estado de la ficha actual y el de la ficha (m n)"
   (self at:i at:j) estado: 0.
	(direccion = 1)ifTrue: [ (self at: i at: j+1) estado: 0].
	(direccion = 2)ifTrue: [ (self at: i at: j-1) estado: 0].
	(direccion = 3)ifTrue: [ (self at: i-1 at: j) estado: 0].
	(direccion = 4)ifTrue: [ (self at: i at: j+1) estado: 0].
   (self at: m at: n) estado: 1.
   self cant_fichas: (cant_fichas  - 1).! !

!Tablero methodsFor: 'all' stamp: 'GRUPO5 10/28/2021 12:08'!
seleccionFila
	"Seleccionar la fila que se debe mover la ficha"
	|fila|
	fila:=UIManager default
   		chooseFrom: #(A B C D E F G H I J K)
    	values: #(1 2 3 4 5 6 7 8 9 10 11)
    	lines: #(1 2 3 4 5 6 7 8 9 10 11)
    	title: 'SELECCIONE FILA'.
	^fila! !


!Tablero methodsFor: 'accessing' stamp: 'GRUPO5 10/28/2021 09:27'!
cant_fichas: unValor
	"modifica la cantidad de fichas"
	cant_fichas:= unValor.! !

!Tablero methodsFor: 'accessing' stamp: 'GRUPO5 10/28/2021 09:27'!
cant_fichas
	"modifica la cantidad de fichas"
	^cant_fichas.! !
