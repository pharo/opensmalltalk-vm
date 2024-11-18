Class {
	#name : 'SLNormalizeVariablesTest',
	#superclass : 'SlangAbstractTestCase',
	#category : 'Slang-Tests',
	#package : 'Slang-Tests'
}

{ #category : 'helpers' }
SLNormalizeVariablesTest >> collectArgumentsNameIn: aNodeWithArguments [

	^ aNodeWithArguments arguments collect: [ :arg | arg name ]
]

{ #category : 'helpers' }
SLNormalizeVariablesTest >> collectVariablesNameIn: aTStatementListNode [
	| variables|
	variables  := OrderedCollection new.
	aTStatementListNode nodesDo: [ :node |
		   node isVariable ifTrue: [ variables add:  node name ] ].
	^ variables asArray 

]

{ #category : 'running' }
SLNormalizeVariablesTest >> setUp [ 
	super setUp. 
	ccg addClass: SLNormalizeVariablesTestClass.
	ccg prepareMethods
]

{ #category : 'tests-methods-with-used-locals-and-arguments' }
SLNormalizeVariablesTest >> testMethodWithReservedArgumentsName [
	"the reserved name self, super, nil and cascade are not modified"

	| method body |
	method := ccg methodNamed: #methodWithReservedArgumentsName:arg:.
	body := method parseTree statements.
	"the nil variable doesnt appear in allLocals, it doesn't impact its translation "
	self
		assert: (self collectArgumentsNameIn: (body at: 1))
		equals: { #self }.
	self
		assert:
		(self collectVariablesNameIn: (method parseTree statements at: 4))
		equals: #( #_arg #_arg #nil ).
	self assert: method args isEmpty
]

{ #category : 'tests-methods-with-used-locals-and-arguments' }
SLNormalizeVariablesTest >> testMethodWithReservedVariablesName [
	"the reserved name self, super, nil and cascade are not modified"

	| method |
	method := ccg methodNamed: #methodWithReservedLocalsName.

	"the nil variable doesnt appear in allLocals, it doesn't impact its translation "
	self assert: method allLocals equals: (Set new
			 add: #_var1;
			 add: #_var2;
			 add: #cascade;
			 add: #_arg;
			 yourself).
	self
		assert:
		(self collectVariablesNameIn: (method parseTree statements at: 4))
		equals: #( #_arg #_arg #nil ).
	self assert: method args isEmpty
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
SLNormalizeVariablesTest >> testMethodWithUnusedLocals [
	"var1 and arg1 doesn't appear in the parseeTree, they doesn't change"
	| method |
	method := ccg methodNamed: #methodWithUnusedLocals.
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
SLNormalizeVariablesTest >> testMethodWithUsedAndUnusedLocals [
	"var1 doesn't appear in the parseeTree, it doesn't change. Normalize the var2"

	| method |
	method := ccg methodNamed: #methodWithUsedAndUnusedLocals.
	self assert: method allLocals equals: (Set new
			 add: #var1;
			 add: #_var2;
			 yourself).
	self assert: method args isEmpty
]

{ #category : 'tests-methods-with-unused-locals-and-variables' }
SLNormalizeVariablesTest >> testMethodWithUsedAndUnusedLocalsAndArgument [
	"var1 and arg1 doesn't appear in the parseeTree, they doesn't change"
	| method |
	method := ccg methodNamed: #methodWithUsedAndUnusedLocalsAndArguments:arg:.
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
	method := ccg methodNamed: #methodWithUsedLocals.
	self assert: method allLocals equals: (Set new
			 add: #_var1;
			 add: #_var2;
			 add: #_var3;
			 add: #_var4;
			 yourself).
	self assert: method args isEmpty
]
