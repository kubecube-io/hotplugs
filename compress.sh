#Copyright 2023 KubeCube Authors
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.

#!/bin/bash

dir="charts"
dest="_output"

rm -rf $dest
mkdir -p $dest

for folder in "$dir"/*; do
  if [ -d "$folder" ]; then
    foldername=$(basename "$folder")
    filename="$dest/$foldername.tgz"
    tar czf "$filename" "$folder"
    echo "compress $foldername completed"
  fi
done