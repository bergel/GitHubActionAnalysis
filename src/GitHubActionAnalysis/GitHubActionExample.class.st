Class {
	#name : #GitHubActionExample,
	#superclass : #Object,
	#category : #GitHubActionAnalysis
}

{ #category : #'as yet unclassified' }
GitHubActionExample >> visualizeExamples2 [
	<script: 'self new visualizeExamples2 inspect'>
	| model |
	model := GAModel new.
	model addWorkflowAsString: GitHubActionAnalysisTest new exampleYML.
	model addWorkflowAsString: GitHubActionAnalysisTest new exampleYML2.
	model addWorkflowAsString: GitHubActionAnalysisTest new exampleYML3.
	^ model
]
