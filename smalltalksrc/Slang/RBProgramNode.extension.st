Extension { #name : 'RBProgramNode' }

{ #category : '*Slang' }
RBProgramNode >> asTranslatorNodeIn: aTMethod [
	"Answer a TParseNode subclass equivalent of me"
	self subclassResponsibility
]

{ #category : '*Slang' }
RBProgramNode >> commentOrNil [
	
	| comments |
	comments := self propertyAt: #comments ifAbsent: [ ^ nil ].
	^ comments collect: #contents
]

{ #category : '*Slang' }
RBProgramNode >> isBlockNode [
	^false
]

{ #category : '*Slang' }
RBProgramNode >> isConstantNumber [  "Overridden in RBLiteralValueNode"
	^false
]
