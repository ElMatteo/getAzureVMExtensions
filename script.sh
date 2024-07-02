#!/bin/bash

#Variables
resources=()
nbvm=0
vmextension=0
declare -a vm_list_with_extension

# Verify is azure cli installed
function is_azure_cli_installed {
    if command -v az &> /dev/null
    then
        return 0
    else
        return 1
    fi
}

# If not installed, then install azure cli
function install_azure_cli {
    echo "Installing azure cli..."
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
    if [ $? -eq 0 ]; then
        echo "Azure CLI installed successfully."
    else
        echo "Installation failed. Please mind check https://learn.microsoft.com/en-us/cli/azure/install-azure-cli"
    fi
}

# Vérifier et installer Azure CLI si nécessaire
if is_azure_cli_installed; then
    echo "Azure CLI installed. Running the script"
else
    install_azure_cli
fi

az login

# Write all targeted resource groups to the resources_groups.csv file
while IFS= read -r line || [[ -n "$line" ]]; do
    # Add each line (item) to the array
    resources+=($line)
done < "resources_groups.csv"

for resource in "${resources[@]}"; do
  echo "Processing resource : $resource"
  vmnames=$(az vm list --resource-group $resource --query "[].name" -o tsv)
  for vm in $vmnames; do
    extensions=$(az vm extension list --resource-group $resource --vm-name $vm --query "[].name" -o tsv)
    ((nbvm++))
    echo "Processing vm : $vm"
    if [[ -z "$extensions" ]]; then
      echo " "
    else
      echo "$vm's extensions: $extensions"
      ((vmextension++))
      vm_with_extension+=("$vm")
    fi
  done
done

echo "Number of VM scanned: $nbvm"
echo "Number of VM with extensions: $vmextension"

echo "Here is all VMs with extensions: "
for vmex in "${vm_list_with_extension[@]}"; do
  echo $vmex
done
