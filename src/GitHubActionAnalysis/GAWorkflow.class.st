Class {
	#name : #GAWorkflow,
	#superclass : #GAObject,
	#instVars : [
		'filename',
		'name',
		'jobs'
	],
	#category : #GitHubActionAnalysis
}

{ #category : #adding }
GAWorkflow >> addJob: aJob [
	jobs add: aJob
]

{ #category : #accessing }
GAWorkflow >> filename [

	^ filename
]

{ #category : #accessing }
GAWorkflow >> filename: aFilenameAsString [

	filename := aFilenameAsString
]

{ #category : #initialization }
GAWorkflow >> initialize [
	super initialize.
	jobs := OrderedCollection new
]

{ #category : #accessing }
GAWorkflow >> jobs [

	^ jobs
]

{ #category : #accessing }
GAWorkflow >> jobs: anObject [

	jobs := anObject
]

{ #category : #accessing }
GAWorkflow >> name [

	^ name
]

{ #category : #accessing }
GAWorkflow >> name: aString [

	name := aString
]

{ #category : #'as yet unclassified' }
GAWorkflow >> numberOfJobs [
	^ jobs size
]

{ #category : #initialization }
GAWorkflow >> numberOfSteps [
	jobs ifEmpty:[ ^ 0 ].
	^ (jobs collect: #numberOfSteps) sum
]

{ #category : #printing }
GAWorkflow >> printOn: str [
	str nextPut: $<.
	name ifNotNil: [ str nextPutAll: name ].
	str nextPut: $>.
]
