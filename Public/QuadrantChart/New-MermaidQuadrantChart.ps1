function New-MermaidQuadrantChart {
    [CmdletBinding()]
    param (
        $Title,
        $XAxis,
        $YAxis,
        [string[]]$Quadrant,
        [string[]]$DataSet
        
    )
    
    begin {
        $output = [System.Text.StringBuilder]::new()
        $output.AppendLine("quadrantChart") | Out-Null
    }
    
    process {
        if(-not ([string]::IsNullOrEmpty($Title))){
            $output.AppendLine("`ttitle $Title") | Out-Null
        }
        $output.AppendLine("`t$XAxis") | Out-Null
        $output.AppendLine("`t$yAxis") | Out-Null
        foreach($QuadrantElement in $Quadrant){
            $output.AppendLine("`t$QuadrantElement") | Out-Null
        }
        foreach($DataSetElement in $DataSet){
            $output.AppendLine("`t$DataSetElement") | Out-Null
        }
    }
    
    end {
        return $output.ToString()
    }
}