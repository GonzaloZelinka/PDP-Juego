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

!Ficha methodsFor: 'accesing' stamp: 'GRUPO5 10/27/2021 09:09'!
    eliminar
    "cambia el estado de una ficha de lleno a vacio"
    estado: 0.! !

!Ficha methodsFor: 'all' stamp: 'GRUPO5 10/27/2021 09:09'!
    salto i j arreglo
     "cambia el estado de la ficha actual a vacio y llena la ficha en la pos i j"
    .! ! 

Array2D subclass: #Tablero
    instanceVariableNames: 'tablero'
    classVariableNames: ''
    category: 'Senku'!

!Tablero methodsFor: 'initialize' stamp: 'GRUPO5 10/27/2021 09:09'!
        super initialize. 
        tablero:= Array2D new: 11. 
        1 to: 11 do:[:i | 
            1 to: 11 do:[:j| 
                arreglo at:i at:j put: Ficha new]].
        1 to: 11 do:[:i | 
            1 to:11 do:[:j| 
                (arreglo at:i at:j) estado: 1]].! !

!Tablero methodsFor: 'all' stamp: 'GRUPO5 10/27/2021 09:09'!
    saltar: i j m n
    "cambia el estado de la ficha actual y el de la ficha (i j)"
    
    (self at:i at:j) estado: 0.
    (self at: m at: n) estado: 1.! !
    
    


!Tablero methodsFor: 'all' stamp: 'GRUPO5 10/27/2021 09:09'!
    verificar_salto: unaPosI unaPosJ direccion
    "verifica si un salto es válido en base a la direccion y la posicion actual"

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
    ].! !





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