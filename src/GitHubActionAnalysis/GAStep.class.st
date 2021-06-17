Class {
	#name : #GAStep,
	#superclass : #GAObject,
	#instVars : [
		'name',
		'content'
	],
	#category : #GitHubActionAnalysis
}

{ #category : #accessing }
GAStep >> content [

	^ content
]

{ #category : #accessing }
GAStep >> content: contentAsString [

	content := contentAsString
]

{ #category : #accessing }
GAStep >> name [

	^ name
]

{ #category : #accessing }
GAStep >> name: aString [

	name := aString
]
