function New-MermaidQuadrantChartDataSet {
    [CmdletBinding()]
    param (
        [ValidateRange(0.0, 1.0)]
        [float]$XPosition,
        [ValidateRange(0.0, 1.0)]
        [float]$YPosition,
        $Name
    )
    
    begin {
        $ReturnString = ""
    }
    
    process {
        $ReturnString = "{0}: [{1}, {2}]" -f $Name, $XPosition, $YPosition
    }
    
    end {
        return $ReturnString
    }
}