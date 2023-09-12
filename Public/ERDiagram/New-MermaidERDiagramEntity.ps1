function New-MermaidERDiagramEntity {
    [CmdletBinding()]
    param (
        $Name,
        [string[]]$Attribute

    )
    
    begin {
        $output = [System.Text.StringBuilder]::new()
        $output.AppendLine("$Name {")  | Out-Null
    }
    
    process {
        foreach($AttributeElement in $Attribute){
            $output.AppendLine("`t`t$AttributeElement")  | Out-Null
        }
        $output.AppendLine("`t}")  | Out-Null
    }
    
    end {
        return $output.ToString()
    }
}