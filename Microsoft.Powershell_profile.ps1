# Set variable for PowerShell directory
$posh_dir = "$ENV:USERPROFILE\Documents\WindowsPowerShell"

#--------
# PATH
#--------
$pathArray = @(
    # Apps
    "$env:ProgramW6432\KiTTY\",
    "$env:ProgramW6432\PuTTY\",
    # Posh
    "$(split-path $PROFILE)\Scripts\",
    "$(split-path $PROFILE)\Scripts\gforces\",
    "$(split-path $PROFILE)\Scripts\gforces\New-GforcesTour\",
    "$(split-path $PROFILE)\Scripts\tours\",
    "$(split-path $PROFILE)\Scripts\tours\New-Tour\"
    # Bin
    "$($env:HOME)bin\clustergit\",
    "$($env:HOME)bin\misc\",
    "$($env:HOME)bin\newvt\",
    "$($env:HOME)bin\tours\"
    )

foreach ($item in $pathArray) { $env:path += ';' + $item }

# Staff only for Terminal
if ( $Host.Name -eq "ConsoleHost" ) {
    Import-Module PSReadline
    Set-PSReadlineOption -EditMode Emacs
    Import-Module posh-git
    Import-Module ISESteroids
}

#Staff only for ISE Console
#if ( $Host.Name -eq "Windows PowerShell ISE Host")
#{
#}

Import-Module TabExpansionPlusPlus
Import-Module z

# Start in my Home directory
cd C:\Users\Rafael

# Appearance
. "$(split-path $PROFILE)\Conf\posh_appearance.ps1"
# Aliases
. "$(split-path $PROFILE)\Conf\posh_aliases.ps1"
# Funtions
. "$(split-path $PROFILE)\Conf\posh_defun.ps1"