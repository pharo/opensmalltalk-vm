Extension { #name : 'RBVariableNode' }

{ #category : '*VMMakerCompatibilityForPharo6-C translation' }
RBVariableNode >> asTranslatorNodeIn: aTMethod [
	"Answer a TParseNode subclass equivalent of me"

	name = 'true' ifTrue: [ ^ TConstantNode value: true ].
	name = 'false' ifTrue: [ ^ TConstantNode value: false ].
	(#( 'nil' 'self' ) includes: name) ifTrue: [
		^ TVariableNode new setName: name ].
	^ TVariableNode new setName: #_ , name
]

{ #category : '*VMMakerCompatibilityForPharo6-testing' }
RBVariableNode >> isVariableNode [
	^true
]
