#!/bin/sh
java -jar /detekt/detekt.jar \
    --config /detekt/detekt.yml \
    --base-path "$PWD" \
    --excludes "**/build/**" \
    --plugins /detekt/detekt-formatting.jar 2>/dev/null \
    | grep -v "^Property"
