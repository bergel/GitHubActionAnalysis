Class {
	#name : #BaselineOfGitHubActionAnalysis,
	#superclass : #BaselineOf,
	#category : #BaselineOfGitHubActionAnalysis
}

{ #category : #baselines }
BaselineOfGitHubActionAnalysis >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec baseline: 'Roassal3' with: [ spec repository: 'github://ObjectProfile/Roassal3/src'; loads: #('Full') ].
			spec 
   				baseline: 'PetitParser' 
   				with: [ spec repository: 'github://moosetechnology/PetitParser/src' ].
			
			"Packages"
			spec package: 'GitHubActionAnalysis' with: [ spec requires: #('PetitParser'  'Roassal3') ].

			"Groups"
			spec
				group: 'default' with: #('GitHubActionAnalysis') ]
]
