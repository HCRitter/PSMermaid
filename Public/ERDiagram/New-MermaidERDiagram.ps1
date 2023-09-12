function New-MermaidERDiagram {
    [CmdletBinding()]
    param (
        [string[]]$Entity,
        [string[]]$Relationship
    )
    
    begin {
        $output = [System.Text.StringBuilder]::new()
        $output.AppendLine("erDiagram ")  | Out-Null
    }
    
    process {
        foreach($EntityElement in $Entity){
            $output.AppendLine("`t$EntityElement")  | Out-Null
        }
        foreach($RelationshipElement in $Relationship){
            $output.AppendLine("`t$RelationshipElement")  | Out-Null
        }
    }
    
    end {
        return $output.tostring()
    }
}