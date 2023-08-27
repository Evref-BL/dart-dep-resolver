Class {
	#name : #BaselineOfDependenciesDartResolver,
	#superclass : #BaselineOf,
	#category : #BaselineOfDependenciesDartResolver
}

{ #category : #baselines }
BaselineOfDependenciesDartResolver >> baseline: spec [
 "donne l'ensmebe des package requis pour la baseline (à inclure dans l'archive définis par Iceberg)"
	<baseline>
	spec for: #common do: [ 
		self defineDependencies: spec.
		self definePackages: spec.
		self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfDependenciesDartResolver >> defineDependencies: spec [

	"donne les ref vers le projet qui se trouve sur un depot distance (je crois)"

	spec
		baseline: 'MermaidPharo'
		with: [ spec repository: 'github://badetitou/MermaidPharo' ]
]

{ #category : #baselines }
BaselineOfDependenciesDartResolver >> defineGroups: spec [
"aucune idée"
]

{ #category : #baselines }
BaselineOfDependenciesDartResolver >> definePackages: spec [

	"mentionne l'ensemble des packages requis"

	spec package: 'DependenciesDartResolver' with: [ 
		spec
			requires: #( 'MermaidPharo' )]
]
