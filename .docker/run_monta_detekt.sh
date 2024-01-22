#!/bin/sh

# $1 is the path to the project to be analyzed (must be relative and contained within $PWD)
java -jar /detekt/detekt.jar \
    --config /detekt/detekt.yml \
    --base-path "$PWD" \
    --excludes "**/build/**" \
    --plugins /detekt/detekt-formatting.jar 2>/dev/null \
    | grep -v "^Property"