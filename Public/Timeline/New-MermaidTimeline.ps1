function New-MermaidTimeline {
    [CmdletBinding()]
    param (
        $Directive,
        [Parameter(ParameterSetName="DataSet")]
        [String[]]$DataSet,
        [Parameter(ParameterSetName="Section")]
        [String[]]$Section,
        $Title = $null
    )
    
    begin {
        $output = [System.Text.StringBuilder]::new()
        $output.AppendLine("timeline")  | Out-Null
        if(-not([string]::IsNullOrEmpty($Title))){
            $output.AppendLine("`ttitle $Title")  | Out-Null
        }
    }
    
    process {
        switch ($PSCmdlet.ParameterSetName) {
            'Section' {         
                foreach($SectionElement in $Section){
                    $output.Append($SectionElement) | Out-Null
                } 
            }
            Default {
                foreach($DataSetElement in $DataSet){
                    $output.AppendLine("`t$DataSetElement")  | Out-Null
                }
            }
        }

    }
    
    end {
        return $output.ToString()
    }
}