function New-MermaidJourney {
    [CmdletBinding()]
    param (
        $Title,
        [string[]] $Section
    )
    
    begin {
        $output = [System.Text.StringBuilder]::new()
        $output.AppendLine("journey")  | Out-Null
    }
    
    process {
        $output.AppendLine("`ttitle $Title")  | Out-Null
        foreach($SectionElement in $Section){
            $output.AppendLine($SectionElement) |Out-Null
        }
    }
    
    end {
        return $output.ToString()
    }
}