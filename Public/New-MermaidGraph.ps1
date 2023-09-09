function New-MermaidGraph {
    [CmdletBinding()]
    param (
        [ValidateSet("TB","TD","BT","RL","LR")]
        $Direction,
        [PSCustomObject[]] $NodeConnections,
        [switch] $Append
    )
    
    begin {
        $output = [System.Text.StringBuilder]::new()
        
    }
    
    process {
        $Output.AppendLine("graph $Direction") | Out-Null
        #$Output.AppendLine("`tStart --> Stop") | Out-Null
        foreach($NodeConnection in $NodeConnections){
            $Output.AppendLine("`t$NodeConnection") | Out-Null
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