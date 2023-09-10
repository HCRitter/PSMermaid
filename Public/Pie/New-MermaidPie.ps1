function New-MermaidPie {
    [CmdletBinding()]
    param (
        $Title,
        [switch] $ShowData,
        [string[]] $DataSet,
        [float]$TextPosition = 0.5,
        $PieOuterStrokeWidth = "5px"
    )
    
    begin {
        $output = [System.Text.StringBuilder]::new()
        $Preline = '%%{init: {"pie": {"textPosition": RPTEXTPOSITION}, "themeVariables": {"pieOuterStrokeWidth": "RPPieOuterStrokeWidth"}} }%%'
        $PreLine = ($Preline.Replace('RPTEXTPOSITION',$TextPosition)).Replace('RPPieOuterStrokeWidth',$PieOuterStrokeWidth)
        $output.AppendLine($Preline)  | Out-Null
        $output.AppendLine("pie $(if($ShowData){'showData'})")  | Out-Null
    }
    
    process {
        $output.AppendLine("`ttitle $Title")  | Out-Null
        foreach($DataSetElement in $DataSet){
            $output.AppendLine("`t$DataSetElement")  | Out-Null
        }
        
    }
    
    end {
        return $output.ToString()
    }
}