Class {
	#name : #BaselineOfSecurityData,
	#superclass : #BaselineOf,
	#category : #BaselineOfSecurityData
}

{ #category : #loading }
BaselineOfSecurityData class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'securityData' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfSecurityData >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'SecurityData'
		]
]
