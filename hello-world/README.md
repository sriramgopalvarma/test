# hello-world

## Description
sample description

## Usage

### Fetch the package
`kpt pkg get REPO_URI[.git]/PKG_PATH[@VERSION] hello-world`
Details: https://kpt.dev/reference/cli/pkg/get/

### View package content
`kpt pkg tree hello-world`
Details: https://kpt.dev/reference/cli/pkg/tree/

### Apply the package
```
kpt live init hello-world
kpt live apply hello-world --reconcile-timeout=2m --output=table
```
Details: https://kpt.dev/reference/cli/live/
