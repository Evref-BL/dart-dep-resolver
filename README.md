# dart-dep-resolver
A file dependency resolver for Dart project based on their imports declaration. Output a mermaid graph. 

## Installation

	The metacello command to run in a playground, to install your packages.

```smalltalk
Metacello new
  githubUser: 'Evref-BL' project: 'dart-dep-resolver' commitish: 'main' path: 'src';
  baseline: 'BaselineOfDependenciesDartResolver';
  load
```

## Example 

Paste this smalltalk code into a playground to test it.  

```smalltalk
myRootFolder := ('<path-to-folder-root-of-your-dart-project>') asFileReference .

DartDependenciesResolver new rootFolder: myRootFolder ; resolve.
```

## API 

Note that this API is a work in progress and will evolve over time. 
 
  TODO

