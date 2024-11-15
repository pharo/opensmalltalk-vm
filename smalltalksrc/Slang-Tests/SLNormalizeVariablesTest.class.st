Class {
	#name : 'SLNormalizeVariablesTest',
	#superclass : 'SlangAbstractTestCase',
	#category : 'Slang-Tests',
	#package : 'Slang-Tests'
}

{ #category : 'running' }
SLNormalizeVariablesTest >> setUp [ 
	super setUp. 
	ccg addClass: SLNormalizeVariablesTestClass.
	ccg prepareMethods
]

{ #category : 'tests-methods-with-unused-locals-and-variables' }
SLNormalizeVariablesTest >> testMethodWithUnusedArguments [
	"the two parameters does not appear in the parseTree, they doesn't change"

	| method |
	method := ccg methodNamed: #methodWithUnusedArguments:arg:.
	self assert: method allLocals isEmpty.
	self assert: method args equals: (OrderedCollection new
			 add: #arg1;
			 add: #arg2;
			 yourself)
]

{ #category : 'tests-methods-with-unused-locals-and-variables' }
SLNormalizeVariablesTest >> testMethodWithUnusedVariables [
	"var1 and arg1 doesn't appear in the parseeTree, they doesn't change"
	| method |
	method := ccg methodNamed: #methodWithUnusedVariables.
	self assert: method allLocals equals: (Set new
			 add: #var1;
			 add: #var2;
			 yourself).
	self assert: method args isEmpty
]

{ #category : 'tests-methods-with-unused-locals-and-variables' }
SLNormalizeVariablesTest >> testMethodWithUsedAndUnusedArguments [
	"arg2 doesn't appear in the parseeTree, it doesn't change. Normalize the var2"

	| method |
	method := ccg methodNamed: #methodWithUsedAndUnusedArguments:arg:.
	self assert: method args equals: (OrderedCollection new
			 add: #_arg1;
			 add: #arg2;
			 yourself).
	self assert: method locals isEmpty
]

{ #category : 'tests-methods-with-unused-locals-and-variables' }
SLNormalizeVariablesTest >> testMethodWithUsedAndUnusedVariables [
	"var1 doesn't appear in the parseeTree, it doesn't change. Normalize the var2"

	| method |
	method := ccg methodNamed: #methodWithUsedAndUnusedVariables.
	self assert: method allLocals equals: (Set new
			 add: #var1;
			 add: #_var2;
			 yourself).
	self assert: method args isEmpty
]

{ #category : 'tests-methods-with-unused-locals-and-variables' }
SLNormalizeVariablesTest >> testMethodWithUsedAndUnusedVariablesAndArgument [
	"var1 and arg1 doesn't appear in the parseeTree, they doesn't change"
	| method |
	method := ccg methodNamed: #methodWithUsedAndUnusedVariablesAndArguments:arg:.
	self assert: method allLocals equals: (Set new
			 add: #var1;
			 add: #_var2;
			 yourself).
	self assert: method args equals: (OrderedCollection new
			 add: #arg1;
			 add: #_arg2;
			 yourself)
]

{ #category : 'tests-methods-with-used-locals-and-arguments' }
SLNormalizeVariablesTest >> testMethodWithUsedVariables [

	| method |
	method := ccg methodNamed: #methodWithUsedVariables.
	self assert: method allLocals equals: (Set new
			 add: #_var1;
			 add: #_var2;
			 yourself).
	self assert: method args isEmpty
]
