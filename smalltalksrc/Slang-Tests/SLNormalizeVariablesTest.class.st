Class {
	#name : 'SLNormalizeVariablesTest',
	#superclass : 'SlangAbstractTestCase',
	#category : 'Slang-Tests',
	#package : 'Slang-Tests'
}

{ #category : 'running' }
SLNormalizeVariablesTest >> setUp [ 
	super setUp. 
	ccg addClass: SLNormalizeVariablesTestClass 
]

{ #category : 'tests' }
SLNormalizeVariablesTest >> testMethodWithArguments [
	"normalize the two parameters, leave the other values in the parseTree unchanged"

	| method |
	method := ccg methodNamed: #methodWith2Arguments:arg:.
	self assert: method allLocals equals: Set new.
	self assert: method args equals: (OrderedCollection new
			 add: #_arg1;
			 add: #_arg2;
			 yourself)
]

{ #category : 'tests' }
SLNormalizeVariablesTest >> testMethodWithVariables [
	"normalize the two variables, leave the other values in the parseTree unchanged"

	| method |
	method := ccg methodNamed: #methodWithVariables.
	self assert: method allLocals equals: (Set new
			 add: #_var1;
			 add: #_var2;
			 yourself).
	self assert: method args equals: OrderedCollection new
]

{ #category : 'tests' }
SLNormalizeVariablesTest >> testMethodWithVariablesAndArguments [
	"normalize the two variables and parameters, leave the other values in the parseTree unchanged"

	| method |
	method := ccg methodNamed: #methodWithVariablesAnd2Arguments:arg:.
	self assert: method allLocals equals: (Set new
			 add: #_var1;
			 add: #_var2;
			 yourself).
	self assert: method args equals: (OrderedCollection new
			 add: #_arg1;
			 add: #_arg2;
			 yourself)
]
