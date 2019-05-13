#!/usr/bin/env bash

# source:
# ruby and stdin
# https://stackoverflow.com/questions/273262/best-practices-with-stdin-in-ruby
# yaml to json
# https://gist.github.com/otobrglez/66274639697f377de8ec8047a248b8f0
# yaml (ruby 1.9+)
# https://ruby-doc.org/stdlib-1.9.3/libdoc/yaml/rdoc/YAML.html


# ruby -ryaml -e "puts YAML.load_file('./testdata.yaml')"

cat <<"EOF" | ruby -ryaml -e "puts YAML.load(ARGF.read())"
apiVersion: apiextensions.k8s.io/v1beta1
kind: CustomResourceDefinition
metadata:
  name: prowjobs.prow.k8s.io
spec: []
EOF

cat <<"EOF" | ruby -ryaml -e "puts YAML.load(ARGF.read())"
apiVersion: apiextensions.k8s.io/v1beta1
kind: [] CustomResourceDefinition
#     ^^ illegal syntax
metadata:
  name: prowjobs.prow.k8s.io
spec: []
EOF
