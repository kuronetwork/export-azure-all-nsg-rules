
# Retrieve the list of Network Security Groups (NSGs) along with their names and resource groups.
nsgs=$(az network nsg list --query "[].{name:name, resourceGroup:resourceGroup}" -o tsv)

# Create a directory to store the exported NSG rules if it doesn't exist.
mkdir -p nsg-rules-export

# Iterate through each NSG to export its rules.
while IFS=$'\t' read -r nsgName resourceGroup; do
    echo "Exporting NSG rules for $nsgName in $resourceGroup..."
    # Export the rules of the current NSG to a JSON file in the specified directory.
    az network nsg rule list --nsg-name "$nsgName" --resource-group "$resourceGroup" -o json > "nsg-rules-export/${nsgName}_rules.json"
done <<< "$nsgs"

# Print a message indicating that all NSG rules have been exported.
echo "All NSG rules have been exported."

# List the files in the directory to confirm the export.
ls -l nsg-rules-export/
