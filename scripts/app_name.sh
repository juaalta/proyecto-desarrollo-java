#!/bin/bash

# mvn org.apache.maven.plugins:maven-help-plugin:3.2.0:evaluate -Dexpression=project.version | sed -n -e '/^\[.*\]/ !{ /^[0-9]/ { p; q } }'

mvn help:evaluate -Dexpression=project.artifactId -q -DforceStdout
