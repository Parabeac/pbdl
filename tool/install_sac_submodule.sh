# Script to verify that SAC was pulled and pointing to master 
# This script is intended to be run from the root directory of the PBDL package.

parentCom=`git rev-parse HEAD`

cd SketchAssetConverter

git fetch

currentCom=`git rev-parse HEAD`

if [ $parentCom == $currentCom ]
then
    cd ..
    git submodule update --init
    git pull --recurse-submodules
    cd SketchAssetConverter
    git fetch
    currentCom=`git rev-parse HEAD`
    echo "Downloading submodule SketchAssetConverter"
else
    cd ..
    masterCom=`git rev-parse @:SketchAssetConverter`

    if [ $masterCom == $currentCom ]
    then
        echo "Sketch Asset Converter is up to date!"
    else
        echo "Sketch Asset Converter is behind master."
    fi
fi
