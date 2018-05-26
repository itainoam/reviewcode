# reviewcode

A Node.js cli tool to run eslint rules for remote (or local) branches and view warning and errors.

## Installation

`npm install reviewcode`

edit the `eslint_config/.eslintrc` to your likings.

## Usage

`reviewcode <branch>` within the repository to lint it and view the results.

```
  Usage: reviewcode [options] <branch>

  Options:

    -V, --version           output the version number
    -c, --compare <branch>  Branch used as baseline for finding changes. Defaults to origin/master.
    -h, --help              output usage information

  ```

## License

Apache 2.0