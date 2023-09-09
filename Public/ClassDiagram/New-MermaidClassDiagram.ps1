function New-MermaidClassDiagram {
    [CmdletBinding()]
    param (
        [string[]] $Notes,
        [string[]] $Class,
        [string[]] $Relationship
    )
    
    begin {
        $output = [System.Text.StringBuilder]::new()
        $output.AppendLine("classDiagram")  | Out-Null
    }
    
    process {
        foreach($ClassItem in $Class){
            $output.Append($ClassItem) | Out-Null
        }
        foreach($RelationShipItem in $Relationship){
            $output.AppendLine($RelationShipItem) | Out-Null
        }
    }
    
    end {
        return $output.ToString()
    }
}