#!/bin/sh

set -e

if [ $# -eq 1 ]
then
  MOUNT_DIR=$PWD
elif [ $# -eq 2 ]
then
  TMP_DIR=`pwd`
  cd $2
  MOUNT_DIR=`pwd`
  cd $TMP_DIR
else
  echo 'invalid argument'
  echo 'usage:'
  echo "\t ./latex_build.sh <target_tex_file_name> [<tex_src_directory_path>]"
  exit 1
fi

exec docker run --rm -i --net=none -v ${MOUNT_DIR}:/data ogajun/latex /bin/sh -c "latexmk $1"
