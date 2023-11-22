# test-package

## Description
sample description

## Usage

### Fetch the package
`kpt pkg get REPO_URI[.git]/PKG_PATH[@VERSION] test-package`
Details: https://kpt.dev/reference/cli/pkg/get/

### View package content
`kpt pkg tree test-package`
Details: https://kpt.dev/reference/cli/pkg/tree/

### Apply the package
```
kpt live init test-package
kpt live apply test-package --reconcile-timeout=2m --output=table
```
Details: https://kpt.dev/reference/cli/live/
