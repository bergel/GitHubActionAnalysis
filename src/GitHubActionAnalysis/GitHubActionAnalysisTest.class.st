Class {
	#name : #GitHubActionAnalysisTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #GitHubActionAnalysis
}

{ #category : #'as yet unclassified' }
GitHubActionAnalysisTest >> exampleYML [

^ 'name: CI

# Controls when the action will run. 
on:
  # Triggers the workflow on push or pull request events but only for the master branch
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

# A workflow run is made up of one or more jobs that can run sequentially or in parallel
jobs:
  # This workflow contains a single job called "build"
  build:
    # The type of runner that the job will run on
    runs-on: ubuntu-latest

    # Steps represent a sequence of tasks that will be executed as part of the job
    steps:
      - name: Cancel Previous Runs
        uses: styfle/cancel-workflow-action@0.9.0
        with:
          access_token: ${{ github.token }}
          
      # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
      - uses: actions/checkout@v2

      # Runs a single command using the runners shell
      - name: Run unit tests
        run: bash ./scripts/runTest.sh'
]

{ #category : #'as yet unclassified' }
GitHubActionAnalysisTest >> exampleYML2 [

^ '# This is a basic workflow to help you get started with Actions

name: Visualize coverage

# Controls when the action will run. 
on:
  # Triggers the workflow on push or pull request events but only for the master branch
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

# A workflow run is made up of one or more jobs that can run sequentially or in parallel
jobs:
  # This workflow contains a single job called "build"
  build:
    # The type of runner that the job will run on
    runs-on: ubuntu-latest

    # Steps represent a sequence of tasks that will be executed as part of the job
    steps:
      # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
      - uses: actions/checkout@v2
        with:
          persist-credentials: false # otherwise, the token used is the GITHUB_TOKEN, instead of your personal token
          fetch-depth: 0 # otherwise, you will failed to push refs to dest repo

      # Runs a single command using the runners shell
      - name: Run unit tests
        run: bash ./scripts/getCoverage.sh

      - name: Archive code coverage results
        uses: actions/upload-artifact@v2
        with:
          name: code-coverage-report
          path: coverage.png

      - name: Push the picture
        run: |
          mkdir -p ci_data
          cd ci_data
          mv ../coverage.png .
          git add coverage.png
          cat /tmp/ratio
          wget "https://img.shields.io/badge/Coverage-`cat /tmp/ratio`-green"
          mv "Coverage-`cat /tmp/ratio`-green" coverageBadge.svg
          git add coverageBadge.svg

      - name: Commit files
        run: |
          git config --local user.email "41898282+github-actions[bot]@users.noreply.github.com"
          git config --local user.name "github-actions[bot]"
          git commit -m "Add changes" -a

      - name: Push changes
        uses: ad-m/github-push-action@master
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          branch: ${{ github.ref }}'
]

{ #category : #'as yet unclassified' }
GitHubActionAnalysisTest >> exampleYML3 [

^ '# This is a basic workflow to help you get started with Actions

name: CI

# Controls when the action will run. 
on:
  # Triggers the workflow on push or pull request events but only for the master branch
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

# A workflow run is made up of one or more jobs that can run sequentially or in parallel
jobs:
  # This workflow contains a single job called "build"
  build:
    # The type of runner that the job will run on
    runs-on: ubuntu-latest

    # Steps represent a sequence of tasks that will be executed as part of the job
    steps:
      - name: Cancel Previous Runs
        uses: styfle/cancel-workflow-action@0.9.0
        with:
          access_token: ${{ github.token }}
    
      # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
      - uses: actions/checkout@v2

      # Runs a single command using the runners shell
      - name: Install GT and run examples
        run: bash ./scripts/runG.sh'
]

{ #category : #tests }
GitHubActionAnalysisTest >> setUp [

	super setUp.
	model := GAModel new
]

{ #category : #tests }
GitHubActionAnalysisTest >> testEmpty [

	self assert: model numberOfWorkflows equals: 0.
	self assert: model numberOfJobs equals: 0
]

{ #category : #tests }
GitHubActionAnalysisTest >> testExample [

	| workflow job |
	model addWorkflowAsString: self exampleYML.
	self assert: model numberOfWorkflows equals: 1.
	self assert: model numberOfJobs equals: 1.
	
	workflow := model workflows first.
	self assert: workflow name equals: 'CI'.
	self assert: workflow jobs size equals: 1.
	
	job := workflow jobs first.	
	self assert: job name equals: 'build'.
	self assert: job numberOfSteps equals: 3
	 
]

{ #category : #tests }
GitHubActionAnalysisTest >> testExample2 [

	| workflow job |
	model addWorkflowAsString: self exampleYML2.
	self assert: model numberOfWorkflows equals: 1.
	self assert: model numberOfJobs equals: 1.
	
	workflow := model workflows first.
	self assert: workflow name equals: 'Visualize coverage'.
	self assert: workflow jobs size equals: 1.
	
	job := workflow jobs first.	
	self assert: job name equals: 'build'.
	self assert: job numberOfSteps equals: 6
	 
]
