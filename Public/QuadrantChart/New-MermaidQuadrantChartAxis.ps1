function New-MermaidQuadrantChartAxis {
    [CmdletBinding()]
    param (
        $From,
        $To,
        [ValidateSet("x","y")]
        $Axis
    )
    
    begin {
        $ReturnString = ""
    }
    
    process {
        $ReturnString = "{0}-axis {1} --> {2}" -f $Axis, $From, $To
    }
    
    end {
        return $ReturnString
    }
}