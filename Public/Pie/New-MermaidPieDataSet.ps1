function New-MermaidPieDataSet {
    [CmdletBinding()]
    param (
        $Name,
        [float]$Value
    )
    
    begin {
        $Value = [math]::Round($Value,2)
        $ReturnString = ""
    }
    
    process {
        $ReturnString = "`"{0}`" : {1}" -f $Name, $Value
    }
    
    end {
        return $ReturnString
    }
}