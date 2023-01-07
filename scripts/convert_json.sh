#!/bin/bash

# To use the script, save it to a file and make it executable (e.g., chmod +x script.sh), then pass the input JSON to the script via stdin (e.g., cat input.json | ./script.sh). The transformed JSON will be printed to stdout.

# Note: This script assumes that the input JSON is well-formed and contains all the required fields. You may want to add additional error handling to the script if the input JSON is not guaranteed to be valid.

# Read the input JSON
json=$(cat)

# Extract the values of the desired fields
name=$(echo "$json" | jq '.name')
author=$(echo "$json" | jq '.attributes[] | select(.trait_type == "author").value')
description=$(echo "$json" | jq '.description')
issues=$(echo "$json" | jq '.attributes[] | select(.trait_type == "issues").value')
rarity=$(echo "$json" | jq '.attributes[] | select(.trait_type == "rarity").value')
external_url=$(echo "$json" | jq '.external_url')


# Construct the output JSON
output=$(cat <<EOF
{
  "packets": [
    {
      "name": $name,
      "author": $author,
      "description": $description,
      "issues": $issues,
      "rarity": $rarity,
      "external_url": $external_url
    }
  ]
}
EOF
)

# Print the output JSON
echo "$output"
