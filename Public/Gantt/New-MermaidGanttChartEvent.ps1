function New-MermaidGanttChartEvent {
    [CmdletBinding()]
    param (
        $Label,
        [ValidateSet('active', 'done', 'crit','milestone')]$Tag = $null,
        $TID,
        $Startdate,
        $Enddate

    )
    
    begin {
        $ReturnString = ""
    }
    
    process {
        $ReturnString = "  {0} : {1} ,{2}, {3:yyyy-MM-dd}, {4:yyyy-MM-dd}" -f $Label, $Tag, $TID, $Startdate, $Enddate
    }
    
    end {
        return $ReturnString
    }
}

