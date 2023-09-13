using namespace System.Management.Automation

function New-MermaidGitGraphEntry {
    [CmdletBinding()]
    param()
    dynamicparam{
        $TypeParameter = [ordered]@{
            "commit"    = @("id","tag","type")
            "Branch"    = @("name")
            "Merge"     = @("name","id","tag","type")
            "Checkout"  = @("name")
            "Cherrypick"= @("id")
        }
        $TypeName = $PSCmdlet.MyInvocation.InvocationName -replace 'New-MermaidGitGraphEntry'
        $SelectedType = $TypeParameter[$TypeName]
        $paramDictionary = [RuntimeDefinedParameterDictionary]::new()
        foreach($TypeParameterElement in $SelectedType){
            $paramDictionary.add($TypeParameterElement,$([RuntimeDefinedParameter]::new(
                $TypeParameterElement,
                [String],
                [Attribute[]]@(
                    [Parameter]::new()
                )
            )))
        }
        # Return the collection of dynamic parameters
        $paramDictionary
        
    }
       
    end {
        if($TypeName -eq "cherrypick"){
            $TypeName = "cherry-pick"
        }
        # Make sure if a 'Name" parameter exists to set this right after the type
        $ReturnString = "{0} {1}" -f $($TypeName.ToLower()), $($PSBoundParameters['Name'])
        
        # Itterate through all parameters and add them to the return string with their value
        foreach ($ParameterName in $PSBoundParameters.Keys) {
            switch -Regex ($ParameterName) {
                'ID|TAG'   { $ReturnString += " $($PSItem): `"$($PSBoundParameters[$PSItem])`"" }
                'Type'     { $ReturnString += " $($PSItem): $($PSBoundParameters[$PSItem])" }
            }
        }

        # Clean things up before returning:
        $ReturnString = $ReturnString -replace '\s+', ' '
        return $ReturnString
    }
}