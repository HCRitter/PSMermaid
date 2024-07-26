function New-MermaidGanttChartSection {
    [CmdletBinding()]
    param (
        $Title,
        [string[]]$Events
    )
    
    begin {
        $output = [System.Text.StringBuilder]::new()
        $output.Append(" section $Title`n")  | Out-Null
    }
    
    process {
        foreach($EventElement in $Events){
            $output.AppendLine("  $EventElement") | Out-Null
        }
    }
    
    end {
        return $output.ToString()
    }
}