Class {
	#name : 'SLNormalizeVariablesTestClass',
	#superclass : 'SlangClass',
	#category : 'Slang-Tests',
	#package : 'Slang-Tests'
}

{ #category : 'helpers' }
SLNormalizeVariablesTestClass >> emptyMethod: arg [ 
	^ arg
]

{ #category : 'methods' }
SLNormalizeVariablesTestClass >> methodWith2Arguments: arg1 arg: arg2 [

	
]

{ #category : 'methods' }
SLNormalizeVariablesTestClass >> methodWithVariables [

	| var1 var2 |
	self emptyMethod: var2.
	self emptyMethod: 'var'.
	self emptyMethod: 12.
	'var'.
	12
]

{ #category : 'methods' }
SLNormalizeVariablesTestClass >> methodWithVariablesAnd2Arguments: arg1 arg: arg2 [

	| var1 var2 |
	self emptyMethod: var2.
	self emptyMethod: 'var'.
	self emptyMethod: 12.
	'var'.
	12
]
