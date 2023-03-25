#!/bin/bash

main() {
    sed '/<title>[^<]*<\/title>/Title:<\/title>/g' $1
}

main $1