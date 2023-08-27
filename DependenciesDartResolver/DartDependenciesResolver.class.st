Class {
	#name : #DartDependenciesResolver,
	#superclass : #Object,
	#instVars : [
		'dartParser',
		'flowGraph',
		'rootFolder',
		'packages'
	],
	#category : #DependenciesDartResolver
}

{ #category : #accessing }
DartDependenciesResolver >> flowGraph [
	^ flowGraph
]

{ #category : #'private - resolver' }
DartDependenciesResolver >> getBaseName: aPath [
	^ aPath at: aPath size. 
]

{ #category : #initialization }
DartDependenciesResolver >> initialize [

	super initialize.
	rootFolder := ''.
	dartParser := DartParser new.
	flowGraph := MeFlowchartDiagram new.
	packages := Dictionary new. 
]

{ #category : #accessing }
DartDependenciesResolver >> packages [
	^ packages
]

{ #category : #navigating }
DartDependenciesResolver >> resolve [

	(rootFolder asFileReference allChildrenMatching: '*.dart') do: [ 
		:dartFile | self resolveDartFile: dartFile  ]
]

{ #category : #'as yet unclassified' }
DartDependenciesResolver >> resolveConfigurationUri: aString [ 
	"package:anim_search/providers/data_provider.dart"
	
	^ ((aString withoutQuoting ) substrings: '/').
]

{ #category : #'private - resolver' }
DartDependenciesResolver >> resolveDartFile: aFileReference [
	|myFileNode imports link node baseName|

	
	baseName := self getBaseName: (aFileReference asPath).
	myFileNode := MeFCNode named: baseName.
	self flowGraph addDefinition: myFileNode. 
	
	"recupere les imports"
	imports := (DartParser parseFile: aFileReference pathString asString)
		           libraryImports.
	
	"parcours les imports"
	imports do: [ :imp | 
		node := MeFCNode named: (self resolveConfigurationUri: (imp importSpecification configurableUri uri stringLiteralWithoutInterpolation value)) last. 
		link := MeFCLink newFromNode: myFileNode toNode: node.
		link toArrowType: MeFCArrowHeadType new.
		self flowGraph addDefinition: node; addDefinition: link.
		 ]
]

{ #category : #navigating }
DartDependenciesResolver >> resolvePubSpec [
	|packageName|
	"Parse the first lines of the pubspec.yaml to retrieve the package name"

	(rootFolder asFileReference allChildrenMatching: 'pubspec.yaml') do: [ 
		:pubspecFile | 
		
		"((pubspecFile readStreamDo: [:stream | stream contents]) substrings: String crlf) first."
		packageName := ((pubspecFile contents) lines detect: [
			:line | line beginsWith: 'name:'.
			] ifOne: [:line | (line withoutPrefix: 'name:') trim]).
		self packages at: packageName  put: pubspecFile pathString.
		 ]
]

{ #category : #accessing }
DartDependenciesResolver >> rootFolder [
	^ rootFolder
]

{ #category : #accessing }
DartDependenciesResolver >> rootFolder: aString [ 
	rootFolder := aString
]
