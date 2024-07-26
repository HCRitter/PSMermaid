function New-MermaidGanttChart {
    [CmdletBinding()]
    param (
        $Title = $null,
        $dateFormat = 'YYYY-MM-DD',
        $axisFormat = '%a%d',
        [string[]] $Section
    )
    
    begin {
        $output = [System.Text.StringBuilder]::new()
        $output.AppendLine("gantt") | Out-Null
        if(-not([string]::IsNullOrEmpty($Title))){
            $output.AppendLine("`ttitle $Title")  | Out-Null
        }
        $Output.AppendLine("`tdateFormat $dateFormat") | Out-Null
        $Output.AppendLine("`texcludes weekends") | Out-Null
        $Output.AppendLine("`taxisFormat $axisFormat") | Out-Null
    }
    
    process {
        foreach($SectionElement in $Section){
            $output.AppendLine($SectionElement) |Out-Null
        }
    }
    
    end {
        return $output.ToString()
    }
}