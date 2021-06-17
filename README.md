# GitHubActionAnalysis
[![CI](https://github.com/bergel/GitHubActionAnalysis/actions/workflows/blank.yml/badge.svg)](https://github.com/bergel/GitHubActionAnalysis/actions/workflows/blank.yml)

Small metamodel to analyse YML workflows for GitHub Actions.

```Smalltalk
[ Metacello new
    baseline: 'Roassal3';
    repository: 'github://bergel/GitHubActionAnalysis:main';
    load: 'Full' ] on: MCMergeOrLoadWarning do: [ :warning | warning load ]
```
