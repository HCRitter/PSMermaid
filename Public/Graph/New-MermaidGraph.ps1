function New-MermaidGraph {
    [CmdletBinding()]
    param (
        [ValidateSet("TB","TD","BT","RL","LR")]
        $Direction,
        [PSCustomObject[]] $NodeConnections,
        [switch] $Append,
        [string[]] $ClassDefinitions
    )
    
    begin {
        $output = [System.Text.StringBuilder]::new()
        
    }
    
    process {
        $Output.AppendLine("graph $Direction") | Out-Null
        foreach($NodeConnection in $NodeConnections){
            $Output.AppendLine("`t$NodeConnection") | Out-Null
        }
        foreach($ClassDefinition in $ClassDefinitions){
            $output.AppendLine("`t$ClassDefinition") | Out-Null
        }
    }
    
    end {
        if(-not $Append){
            $output.Insert(0,"``````mermaid`n") | Out-Null
            $output.AppendLine('```') | Out-Null
        }
        return $output.ToString()
    }
}