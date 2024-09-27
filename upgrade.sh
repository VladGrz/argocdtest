#!/bin/bash

set -e

new_version=$1

echo "new version: $new_version"

docker build -t vladgrz/my-flask-app:latest ./my_flask_app
docker tag vladgrz/my-flask-app:latest vladgrz/my-flask-app:$new_version
docker push vladgrz/my-flask-app:$new_version

tmp_dir=$(mktemp -d)
echo $tmp_dir

git clone git@github.com:VladGrz/argocdtest.git $tmp_dir

sed -i -e "s/vladgrz\/my-flask-app:.*/vladgrz\/my-flask-app:$new_version/g" $tmp_dir/my-app/deployment.yaml

cd $tmp_dir
git add .
git commit -m "Update image to $new_version"
git push

rm -rf $tmp_dir