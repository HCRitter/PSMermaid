function New-MermaidTimelineDataSet {
    [CmdletBinding()]
    param (
        $TimePeriod,
        [string[]]$Events
    )
    
    begin {
        $ReturnString = ""
    }
    
    process {
        $ReturnString = "{0} : {1}" -f $TimePeriod, $($Events -join " : ")
    }
    
    end {
        return $ReturnString
    }
}