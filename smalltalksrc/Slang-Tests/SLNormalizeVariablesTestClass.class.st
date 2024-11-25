Class {
	#name : 'SLNormalizeVariablesTestClass',
	#superclass : 'SlangClass',
	#instVars : [
		'instanceVariable1',
		'instanceVariable2'
	],
	#classVars : [
		'constant1',
		'constant2'
	],
	#pools : [
		'SLNormalizeVariablesTestSharedPoolClass'
	],
	#category : 'Slang-Tests',
	#package : 'Slang-Tests'
}

{ #category : 'helpers' }
SLNormalizeVariablesTestClass >> emptyMethod: arg [ 
	^ arg
]

{ #category : 'initialization' }
SLNormalizeVariablesTestClass >> initialize [

	super initialize.
	instanceVar1 := 3.
	instanceVar2 := 5
]

{ #category : 'tests-methods-referencing-struct-classes' }
SLNormalizeVariablesTestClass >> methodReferencingStructClass [
	SLNormalizeVariablesTestStructClass
]

{ #category : 'methods-with-globals-variables' }
SLNormalizeVariablesTestClass >> methodWithInstancesVariables [

	instanceVariable1.
	instanceVariable2
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
	var1.
	var2
]

{ #category : 'methods-with-globals-variables' }
SLNormalizeVariablesTestClass >> methodWithSharedVariables [ 
	constant1. 
	constant2
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
SLNormalizeVariablesTestClass >> methodWithUsedArguments: arg1 arg: arg2 [

	self emptyMethod: arg1.
	self emptyMethod: (self emptyMethod: arg2).
	self emptyMethod: [ :arg3 | arg3 ]
]

{ #category : 'methods-with-used-locals-and-arguments' }
SLNormalizeVariablesTestClass >> methodWithUsedLocals [

	| var1 var2 |
	var1.
	var2.
	[
	| var3 var4 |
	var3.
	var4.
	[
	| var5 var6 |
	var5.
	var6 ] ]
]

{ #category : 'methods-with-globals-variables' }
SLNormalizeVariablesTestClass >> methodWithVariablesFromSharedPools [

	constant3.
	constant4
]
