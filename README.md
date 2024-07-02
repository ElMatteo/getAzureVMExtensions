# Azure VM Extension Scanner

![DALL·E-2024-07-02-22 05 54-A-simple-and-clean-logo-featuring-a-cloud-icon-and-a-magnifying-glass (1)](https://github.com/ElMatteo/getAzureVMExtensions/assets/78216622/2a6be5f2-e670-48c2-822f-bfe02152949c)

## Description
Ce script Bash vérifie si l'Azure CLI est installé sur une machine Linux et l'installe si nécessaire. Ensuite, il utilise Azure CLI pour scanner les machines virtuelles (VM) dans des groupes de ressources spécifiés et identifie celles qui ont des extensions installées.

## Fonctionnalités
Vérifie et installe Azure CLI si nécessaire.<br>
Connexion à Azure avec az login.<br>
Lit les groupes de ressources cibles depuis un fichier resources_groups.csv.<br>
Liste toutes les machines virtuelles dans les groupes de ressources spécifiés.<br>
Identifie les machines virtuelles avec des extensions installées.<br>
Affiche le nombre total de machines virtuelles scannées et le nombre de machines virtuelles avec des extensions.<br>
Affiche la liste des machines virtuelles avec des extensions.<br>

## Prérequis
Linux avec accès sudo.<br>
Fichier resources_groups.csv contenant les groupes de ressources à scanner.<br>
Compte Azure avec les autorisations nécessaires pour lister les machines virtuelles et leurs extensions.<br>

## Installation
Clonez ce dépôt sur votre machine locale :<br>
git clone https://github.com/ElMatteo/getAzureVMExtensions.git<br>
cd azure-vm-extension-scanner<br>

## Exécutez le script :
chmod +x azure_vm_extension_scanner.sh<br>
./azure_vm_extension_scanner.sh<br>

## Utilisation
Assurez-vous que le fichier resources_groups.csv est présent dans le même répertoire que le script. Le fichier doit contenir une liste des groupes de ressources à scanner, un par ligne.<br>

Exemple de contenu de resources_groups.csv :<br>

```csv
resourceGroup1
resourceGroup2
resourceGroup3
```
Lorsque vous exécutez le script, il :<br>

Vérifie si Azure CLI est installé et l'installe si nécessaire.<br>
Vous demande de vous connecter à Azure.<br>
Scanne les groupes de ressources spécifiés pour trouver les machines virtuelles et leurs extensions.<br>
Affiche les résultats dans la console.<br>

## Auteur
Ghostface - ElMatteo

## Licence
Ce projet est sous licence MIT
