function New-MermaidClass {
    [CmdletBinding()]
    param (
        $Name,
        [String[]]$Property,
        [String[]]$Method
    )
    
    begin {
        $output = [System.Text.StringBuilder]::new()
        $output.AppendLine("class $Name{")  | Out-Null
    }
    
    process {
        foreach($PropertyItem in $Property){
            $output.AppendLine("`t$PropertyItem")  | Out-Null
        }
        foreach($MethodItem in $Method){
            $output.AppendLine("`t$MethodItem")  | Out-Null
        }
    }
    
    end {
        $output.AppendLine("}") | Out-Null
        return $output.ToString()
    }
}