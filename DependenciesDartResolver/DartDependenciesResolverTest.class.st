Class {
	#name : #DartDependenciesResolverTest,
	#superclass : #TestCase,
	#instVars : [
		'dartDependenciesResolver'
	],
	#category : #DependenciesDartResolver
}

{ #category : #initialization }
DartDependenciesResolverTest >> setUp [ 

	dartDependenciesResolver := DartDependenciesResolver new. 
]

{ #category : #initialization }
DartDependenciesResolverTest >> testParser [

	| path |
	path := 'D:\projets\apk_flutter-v6.3.3@76ff503bae0\lib\'.
	dartDependenciesResolver rootFolder: path.
	self assert: dartDependenciesResolver rootFolder equals: path
]

{ #category : #initialization }
DartDependenciesResolverTest >> testResolve [

	| path |
	path := 'D:\projets\apk_flutter-v6.3.3@76ff503bae0\lib\'.
	dartDependenciesResolver rootFolder: path.
	dartDependenciesResolver resolve.
	self assert: false equals: true. 
]

{ #category : #initialization }
DartDependenciesResolverTest >> testRootFolder [
	|path|
	path := 'D:\projets\apk_flutter-v6.3.3@76ff503bae0\lib\'.
	dartDependenciesResolver rootFolder:
		path.
		self assert: dartDependenciesResolver rootFolder equals: path.
		
]
