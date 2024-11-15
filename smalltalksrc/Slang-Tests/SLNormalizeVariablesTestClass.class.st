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

{ #category : 'methods-with-unused-locals-and-arguments' }
SLNormalizeVariablesTestClass >> methodWithUnusedArguments: arg1 arg: arg2 [

	
]

{ #category : 'methods-with-unused-locals-and-arguments' }
SLNormalizeVariablesTestClass >> methodWithUnusedVariables [

	| var1 var2 |
	
]

{ #category : 'methods-with-unused-locals-and-arguments' }
SLNormalizeVariablesTestClass >> methodWithUsedAndUnusedArguments: arg1 arg: arg2 [

	arg1
]

{ #category : 'methods-with-unused-locals-and-arguments' }
SLNormalizeVariablesTestClass >> methodWithUsedAndUnusedVariables [

	| var1 var2 |
	var2.
]

{ #category : 'methods-with-unused-locals-and-arguments' }
SLNormalizeVariablesTestClass >> methodWithUsedAndUnusedVariablesAndArguments: arg1 arg: arg2 [

	| var1 var2 |
	var2.
	arg2
]

{ #category : 'methods-with-used-locals-and-arguments' }
SLNormalizeVariablesTestClass >> methodWithUsedArguments [

	| var1 var2 |
	var1.
	var2
]

{ #category : 'methods-with-used-locals-and-arguments' }
SLNormalizeVariablesTestClass >> methodWithUsedVariables [

	| var1 var2 |
	var1.
	var2
]
