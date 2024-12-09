# WDL GitHub Actions Test Runner

Run [local tests](https://docs.dockstore.org/en/latest/getting-started/getting-started-with-wdl.html#testing-locally) on WDL workflows in CI with GitHub Actions and Dockstore.

## Usage

In a GitHub actions file:

```yaml
- name: Run workflow with test parameters
  uses: gks-anvil/wdl-test@main
  with:
    # Path to WDL file to test. Required.
    wdl_file: path/to/file.wdl
    # Path to test input parameters. See https://docs.dockstore.org/en/latest/getting-started/getting-started-with-wdl.html#set-up-local-data.
    # Required.
    test_parameters: path/to/parameters.json
```
