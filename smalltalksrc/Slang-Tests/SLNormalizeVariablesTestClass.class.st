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

{ #category : 'methods-with-used-locals-and-arguments' }
SLNormalizeVariablesTestClass >> methodWithReservedArgumentsName [

	| cascade var1 var2 |
	self.
	super.
	cascade.
	var1.
	var2
]

{ #category : 'methods-with-used-locals-and-arguments' }
SLNormalizeVariablesTestClass >> methodWithReservedArgumentsName: cascade arg: arg1 [

	self emptyMethod: self.
	self emptyMethod: super.
	self emptyMethod: cascade.
	self emptyMethod: arg1
]

{ #category : 'methods-with-used-locals-and-arguments' }
SLNormalizeVariablesTestClass >> methodWithReservedLocalsName [

	| cascade var1 var2 |
	self.
	super.
	cascade.
	"necessary to get a TVariableNode with a 'nil' in it, the traduction for nil is a TConstantNode except for selectors containing ifNotNil with non empty arguments or certain statements during inlining, this comportement looks like a leftover"
	nil ifNotNil: [ :arg |  ].
	var1.
	var2
]

{ #category : 'methods-with-unused-locals-and-arguments' }
SLNormalizeVariablesTestClass >> methodWithUnusedArguments: arg1 arg: arg2 [

	
]

{ #category : 'methods-with-unused-locals-and-arguments' }
SLNormalizeVariablesTestClass >> methodWithUnusedLocals [

	| var1 var2 |
	
]

{ #category : 'methods-with-unused-locals-and-arguments' }
SLNormalizeVariablesTestClass >> methodWithUsedAndUnusedArguments: arg1 arg: arg2 [

	arg1
]

{ #category : 'methods-with-unused-locals-and-arguments' }
SLNormalizeVariablesTestClass >> methodWithUsedAndUnusedLocals [

	| var1 var2 |
	var2.
]

{ #category : 'methods-with-unused-locals-and-arguments' }
SLNormalizeVariablesTestClass >> methodWithUsedAndUnusedLocalsAndArguments: arg1 arg: arg2 [

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
SLNormalizeVariablesTestClass >> methodWithUsedLocals [

	| var1 var2 |
	var1.
	var2.
	[
	| var3 var4 |
	var3.
	var4 ]
]
