# README

## English

This script is used to export Azure Network Security Group (NSG) rules to JSON files. The script lists all NSGs and stores each NSG's rules in a directory named `nsg-rules-export`. Each NSG's rules are saved in a separate JSON file with the filename format `{NSGName}_rules.json`.

### Usage

#### Preparation
For security and environment considerations, it is recommended to use Azure Cloud Shell to run this script. Alternatively, ensure you have the Azure CLI tool installed and configured, and you are logged in to your Azure account.

#### Run the Script
After using chmod to elevate permissions, execute the script to export all NSG rules :
```bash
./export_nsg_rules.sh
