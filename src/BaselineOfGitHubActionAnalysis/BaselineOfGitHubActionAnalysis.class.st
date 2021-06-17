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
			
			"Packages"
			spec package: 'GitHubActionAnalysis' with: [ spec requires: 'Roassal3' ].

			"Groups"
			spec
				group: 'default' with: #('GitHubActionAnalysis') ]
]
