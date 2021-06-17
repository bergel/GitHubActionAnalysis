Class {
	#name : #GAJob,
	#superclass : #GAObject,
	#instVars : [
		'name',
		'steps'
	],
	#category : #GitHubActionAnalysis
}

{ #category : #adding }
GAJob >> addStep: aStep [
	steps add: aStep
]

{ #category : #initialization }
GAJob >> initialize [
	super initialize.
	steps := OrderedCollection new
]

{ #category : #accessing }
GAJob >> name [

	^ name
]

{ #category : #accessing }
GAJob >> name: aString [

	name := aString
]

{ #category : #initialization }
GAJob >> numberOfSteps [
	^ steps size
]

{ #category : #accessing }
GAJob >> steps [

	^ steps
]

{ #category : #accessing }
GAJob >> steps: collectionOfSteps [

	steps := collectionOfSteps
]
