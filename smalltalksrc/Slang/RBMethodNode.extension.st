Extension { #name : 'RBMethodNode' }

{ #category : '*Slang' }
RBMethodNode >> asTranslationMethodOfClass: aTMethodClass [
 	"Answer a TMethod (or subclass) derived from the receiver."
	| additionalMethodState comment |
	additionalMethodState := AdditionalMethodState forMethod: nil selector: selector.
	pragmas ifNotNil:
		[pragmas do:
			[:pragmaNode|
			additionalMethodState := additionalMethodState copyWith: pragmaNode asPragma]].

	comment := self commentOrNil.
	self body commentOrNil ifNotNil: [ :bodyComment |
		comment := comment 
			ifNil: [ bodyComment ]
			ifNotNil: [ comment, self body commentOrNil ].
	].

	^aTMethodClass new
		setSelector: selector
		definingClass: self methodClass
		args: arguments
		locals: ((self allDefinedVariables copyWithoutAll: (arguments collect: #name)) collect: [:string| string -> string])
		block: (body lastIsReturn
					ifTrue: [body]
					ifFalse: [body shallowCopy
									addSelfReturn;
									yourself])
		primitive: ((pragmas ifNotNil:
							[pragmas detect: [:pragmaNode| pragmaNode selector beginsWith: #primitve:] ifNone: []])
						ifNil: [0]
						ifNotNil: [:pragmaNode| pragmaNode arguments first value])
		properties: additionalMethodState
		comment: comment
]

{ #category : '*Slang' }
RBMethodNode >> asTranslationMethodOfClass: aTMethodClass forCodeGenerator: aCodeGenerator [
 	"Answer a TMethod (or subclass) derived from the receiver."
	| additionalMethodState comment renamedSelector |
	additionalMethodState := AdditionalMethodState forMethod: nil selector: selector.
	pragmas ifNotNil:
		[pragmas do:
			[:pragmaNode|
			additionalMethodState := additionalMethodState copyWith: pragmaNode asPragma]].

	additionalMethodState := additionalMethodState copyWith: #codeGenerator -> aCodeGenerator.

	comment := self commentOrNil.
	self body commentOrNil ifNotNil: [ :bodyComment |
		comment := comment 
			ifNil: [ bodyComment ]
			ifNotNil: [ comment, self body commentOrNil ].
	].
	
	renamedSelector := self methodClass renameSelectorIfStaticallyResolved: selector.

	^aTMethodClass new
		setSelector: renamedSelector
		definingClass: self methodClass
		args: arguments
		locals: ((self allDefinedVariables copyWithoutAll: (arguments collect: #name)) collect: [:string| string -> string])
		block: (body lastIsReturn
					ifTrue: [body]
					ifFalse: [body shallowCopy
									addSelfReturn;
									yourself])
		primitive: ((pragmas ifNotNil:
							[pragmas detect: [:pragmaNode| pragmaNode selector beginsWith: #primitve:] ifNone: []])
						ifNil: [0]
						ifNotNil: [:pragmaNode| pragmaNode arguments first value])
		properties: additionalMethodState
		comment: comment
]

{ #category : '*Slang' }
RBMethodNode >> quickMethodReturnLiteral [
	| node |
	node := body statements last value.
	^node isVariable
		ifTrue: [node name]
		ifFalse: [node value]
]
