# using smartAliases
foreach($EntryType in @('Commit',"Branch",'Merge','Checkout','Cherrypick')){
    New-Alias -Name "New-MermaidGitGraphEntry$EntryType" -Value New-MermaidGitGraphEntry
}

$FunctionFiles = $("$PSScriptRoot\Public\","$PSScriptRoot\Private\")| Get-Childitem -file -Recurse -Include "*.ps1" -ErrorAction SilentlyContinue

foreach($FunctionFile in $FunctionFiles){
    try {
        . $FunctionFile.FullName
    }
    catch {
        Write-Error -Message "Failed to import function: '$($FunctionFile.FullName)': $_"
    }
}

Export-ModuleMember -Function $FunctionFiles.BaseName -Alias *