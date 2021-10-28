Object subclass: #Ficha
    instanceVariableNames: 'estado'
    classVariableNames: ''
    category: 'Senku'!

!Ficha methodsFor: 'accesing' stamp: 'GRUPO5 10/27/2021 09:09'!
    estado: unEstado
    "setter del estado"
    estado:= unEstado.! !

!Ficha methodsFor: 'accesing' stamp: 'GRUPO5 10/27/2021 09:09'!
    estado
    "getter del estado"
    ^estado.! !

!Ficha methodsFor: 'all' stamp: 'GRUPO5 10/27/2021 09:09'!
    eliminar_ficha
    "cambia el estado de una ficha a vacio"
    self estado: 0.! !

!Ficha methodsFor: 'all' stamp: 'GRUPO5 10/27/2021 09:09'!
    colocar_ficha
    "cambia el estado de una ficha a lleno"
    self estado: 1.! !



Array2D subclass: #Tablero
    instanceVariableNames: 'cant_fichas'
    classVariableNames: ''
    category: 'Senku'!
    
    
!Tablero methodsFor: 'all' stamp: 'GRUPO5 10/27/2021 09:09'!
    cargaTablero
    "metodo que carga el tablero"
    1 to: 11 do: [:i| 
        1 to:11 do:[:j |
         self at:i at:j put: Ficha new]  ].
    1 to: 11 do:[:i | 1 to:11 do:[:j| (self at:i at:j) estado:1.].].
    (self at:6 at:6) estado: 0.! !

!Tablero methodsFor: 'accesing' stamp: 'GRUPO5 10/27/2021 09:09'!
    cantFichas: unValor
    "modifica la cantidad de fichas"
    cant_fichas:= unValor.! !


!Tablero methodsFor: 'accesing' stamp: 'GRUPO5 10/27/2021 09:09'!
    cantFichas
    "muestra la cantidad de fichas"
    ^cant_fichas.! !

!Tablero methodsFor: 'all' stamp: 'GRUPO5 10/27/2021 09:09'!
    saltar: i j m n
    "cambia el estado de la ficha actual y el de la ficha (m n)"
    
    (self at:i at:j) eliminar_ficha.
    (self at: m at: n) colocar_ficha.
     self cant_fichas: cant_fichas  - 1.! !
    

!Tablero methodsFor: 'all' stamp: 'GRUPO5 10/27/2021 09:09'!
    "verifica si un salto es válido en base a la direccion y la posicion actual"
    |pos_validas|
    pos_validas:=#(1 2 3 4 5 6 7 8 9 10 11)."(n= 11 array new: n| despues cargar con con un 1 to: n) puede ser"
    ((unaPosI includes: pos_validas) and: (unaPosJ includes: pos_validas)) ifTrue:[
    (self at: unaPosI at: unaPosJ) estado =1 
    ifTrue:[(direccion=1) 
        ifTrue:[ ((self at: unaPosI at:unaPosJ+1) estado=1 and: ((self at: unaPosI at:unaPosJ+2) estado=0)) 
			ifTrue:[ self saltar: unaPosI atJ: unaPosJ atM:unaPosI atN: (unaPosJ+2) ]] 
    	ifFalse:[(direccion=2) 
			ifTrue:[ ((self at: unaPosI at:unaPosJ-1) estado=1 and: ((self at: unaPosI at:unaPosJ-2) estado=0)) 
				ifTrue:[ self saltar: unaPosI atJ:unaPosJ atM:unaPosI atN:(unaPosJ-2) ]]
		ifFalse:[(direccion=3) 
			ifTrue:[((self at: unaPosI-1 at:unaPosJ) estado=0 and: ((self at: unaPosI-2 at:unaPosJ) estado=1)) 
				ifTrue:[ self saltar: unaPosI atJ:unaPosJ atM:(unaPosI -2) atN:unaPosJ ]]
		ifFalse:[(direccion=4) 
			ifTrue:[((self at: unaPosI+1 at:unaPosJ) estado=1 and: ((self at: unaPosI+2 at:unaPosJ) estado=0))
				ifTrue:[ self saltar: unaPosI atJ:unaPosJ  atM:(unaPosI+2) atN:unaPosJ ]]
		ifFalse:[ self error: 'numero no existente']]]]]]



    "verificar_salto: direccion i: unaPosI j: unaPosJ 
    verifica si un salto es válido en base a la direccion y la posicion actual"
    |pos_validas|
    pos_validas:=#(1 2 3 4 5 6 7 8 9 10 11). "(n= 11 array new: n| despues cargar con con un 1 to: n) puede ser
    ((unaPosI includes: pos_validas) and: (unaPosJ includes: pos_validas)) ifTrue:[
    (self at: unaPosI at: unaPosJ) estado =1 
    ifTrue:[
        (direccion=1) 
        ifTrue:[ (self at: unaPosI at:unaPosJ+1) estado=1 and: (self at: unaPosI at:unaPosJ+2) estado=0 ifTrue:[ self saltar: i j i (j+2) ] 
                ] 
        ifFalse:[
                        (direccion=2) 
                                ifTrue:[ (self at: unaPosI at:unaPosJ-1) estado=1 and: (self at: unaPosI at:unaPosJ-2) estado=0 
                                                ifTrue:[ self saltar: i j i (j-2) ] 
                                        ]
                                ifFalse:[
                                        (direccion=3) 
                                        ifTrue:[(self at: unaPosI-1 at:unaPosJ) estado=0 and: (self at: unaPosI-2 at:unaPosJ) estado=1 
                                                                ifTrue:[ self saltar: i j (i-2) j ] 
                                                ]
                                        ifFalse:[  
                                             (direccion=4) 
                                             ifTrue:[(self at: unaPosI+1 at:unaPosJ) estado=1 and: (self at: unaPosI+2 at:unaPosJ) estado=0
                                                                    ifTrue:[ self saltar: i j (i+2) j ]
                                                    ]
                                            ifFalse:[ self error: 'numero no existente'].
                                                ]
                                        ]
                    ]
    ]"
    .! !





1 to: 11 do:[:i | 1 to:11 tabldo:[:j| Transcript show: (arreglo at:i at:j) estado.
											Transcript show:'  '
															].
						Transcript cr
										].


"                                                                          ifFalse:[ self error: 'numero no existente']]]].! !
 (direccion=1) ifTrue:[ self saltar_arriba ]
                    ifFalse:[ 
                        (direccion=2) ifTrue:[self saltar_abajo ]
                                    ifFalse:[
                                        (direccion=3) ifTrue:[self saltar_izquierda ]
                                                    ifFalse:[  
                                                        (direccion=4) ifTrue:[self saltar_derecha]
 "