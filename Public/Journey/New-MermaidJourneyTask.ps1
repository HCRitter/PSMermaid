function New-MermaidJourneyTask {
    [CmdletBinding()]
    param (
        $Name,
        [string[]] $Actor,
        [ValidateRange(0, 7)]
        [int]$Score
    )
    
    begin {
        $ReturnString = ""

    }
    
    process {
        $ReturnString = "{0}: {1}: {2}" -f $Name,$Score,$($Actor -join ",")
    }
    
    end {
        return $ReturnString
    }
}