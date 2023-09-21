
# Create a list of names
names=(Alice Bob Carol)

# Convert the list of names to a JSON string
json_string=$(jq -r '.[] | @json' <<< "${names[@]}")

# Append the JSON string to the JSON payload
json_payload=$(jq -r '. + [.[]]' <<< "${json_string} ${json_payload}")

# Write the updated JSON payload to a file
echo "${json_payload}" > payload.json
