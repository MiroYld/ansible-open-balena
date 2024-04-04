#!/bin/bash

if [ $# -ne 4 ]; then
    echo "Usage: $0 <secrets_file> <api_version_file> <quickstart_script> <domain_name>"
    exit 1
fi

extract_data() {
    file_path="$1"
    while IFS='=' read -r var val; do
	if [[ $var == "export "* ]]; then
	    var=${var#"export "}
	    eval "$var='$val'"
	fi
    done < "$file_path"
}

secrets_file="$1"
api_version_file="$2"
quickstart_script="$3"
domain_name="$4"

extract_data "$secrets_file"
echo "OPENBALENA_JWT_SECRET : $OPENBALENA_JWT_SECRET"
echo "OPENBALENA_S3_ACCESS_KEY : $OPENBALENA_S3_ACCESS_KEY"
echo "OPENBALENA_S3_SECRET_KEY : $OPENBALENA_S3_SECRET_KEY"

extract_data "$api_version_file"
echo "OPENBALENA_API_VERSION_TAG : $OPENBALENA_API_VERSION_TAG"

"$quickstart_script" \
    -j "$OPENBALENA_JWT_SECRET" \
    -v "$OPENBALENA_API_VERSION_TAG" \
    -a "$OPENBALENA_S3_ACCESS_KEY" \
    -s "$OPENBALENA_S3_SECRET_KEY" \
    -d "$domain_name"
