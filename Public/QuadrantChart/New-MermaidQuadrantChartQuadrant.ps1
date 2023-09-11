function New-MermaidQuadrantChartQuadrant {
    [CmdletBinding()]
    param (
        $Number,
        $Text
    )
    
    begin {
        $ReturnString = ""
    }
    
    process {
        $ReturnString = "quadrant-{0} {1}" -f $Number, $Text
    }
    
    end {
        return $ReturnString
    }
}