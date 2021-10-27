SimpleSwitchMorph subclass: #LOCell
	instanceVariableNames: 'mouseAction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PBE-Senku'!

!LOCell methodsFor: 'initialization' stamp: 'GRUPO5 10/27/2021 07:53'!
initialize
	"inicializando"
	super initialize. 
	self label: ''.
	self borderWidth: 2.
	bounds:= 0@0 corner: 16@16.
	offColor:= Color paleYellow.
	onColor:= Color paleBlue darker.
	self useSquareCorners.
	self turnOff.! !


BorderedMorph subclass: #LOGame
	instanceVariableNames: 'cells'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PBE-Senku'!

!LOGame methodsFor: 'intialization' stamp: 'GRUPO5 10/27/2021 07:58'!
initialize 
	"Inicializando"

	| sampleCell width height n |
	super initialize.
	n:= self cellsPerSide. 
	sampleCell:= LOCell new. 
	width:= sampleCell width.
	height:= sampleCell height.
	self bounds: (5@5 extent: ((width*n) @ (height*n)) + (2* self borderWidth)).
	cells:= Matrix new: n tabulate: [ :i :j | self newCellAt: i at: j ].! !

!LOGame methodsFor: '' stamp: 'GRUPO5 10/27/2021 08:27'!
cellsPerSide 
	"Cantidad de celdas a lo largo de cada lado del juego"
	^10 

!LOGame methodsFor: '' stamp: 'GRUPO5 10/27/2021 08:27'!
	"Crea una celda para la posicion (i,j) y agreguela on-screen. Representa la posicion apropiada de la pantalla"
	| c orgin | 
	c:= LOCell new. 
	origin := self innerBounds origin. 
	self addMorph:= c. 
	c position: ((i-1)* width) @ ((j-1)* c height) + origin. 
	c mouseAction: [self toggleNeighboursOfCellAt: i at: j].
	^c









