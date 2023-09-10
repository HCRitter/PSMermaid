function New-MermaidJourneySection {
    [CmdletBinding()]
    param (
        $Title,
        [string[]] $Task
    )
    
    begin {
        $output = [System.Text.StringBuilder]::new()
        $output.AppendLine("`tsection $Title")  | Out-Null
    }
    
    process {
        foreach($TaskElement in $Task){
            $output.AppendLine("`t`t$TaskElement") | Out-Null
        }
    }
    
    end {
        return $output.ToString()
    }
}