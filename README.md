# Docker image for building latex
Run latexmk in a docker container for building latex.

[![CircleCI](https://circleci.com/gh/Oga-Jun/docker-latex/tree/master.svg?style=svg&circle-token=ae10f69566493df21ccb2c5d2f517fb690118a76)](https://circleci.com/gh/Oga-Jun/docker-latex/tree/master)

[![Docker Stars](https://img.shields.io/docker/stars/ogajun/latex.svg?maxAge=2592000)](https://hub.docker.com/r/ogajun/latex/)

# Usage
```
./latex_build.sh target_latex_file [target_directory_path]
```

`[target_directory_path]` is optional.

If `target_directory_path` isn't specified, this script set current working directory as target directory.

## Example Usage
This repository has example latex file in tex\_src.

```
./latex_build.sh example ./tex_src
```
Built pdf will be placed in `./tex_src`

## Requirements
You should have `latexmkrc` in target directory.
