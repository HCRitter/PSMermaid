function New-MermaidTimelineSection {
    [CmdletBinding()]
    param (
        $Name,
        [string[]]$DataSet
    )
    
    begin {
        $output = [System.Text.StringBuilder]::new()
        $output.AppendLine("`tsection $Name")  | Out-Null
    }
    
    process {
        foreach($DataSetElement in $DataSet){
            $output.AppendLine("`t`t$DataSetElement")  | Out-Null
        }
    }
    
    end {
        return $output.ToString()
    }
}