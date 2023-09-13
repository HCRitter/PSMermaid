function New-MermaidGitGraph {
    [CmdletBinding()]
    param (
        [string[]]$Entry
    )
    
    end {
        $output = [System.Text.StringBuilder]::new()
        $output.AppendLine("gitGraph ")  | Out-Null
        foreach($EntryElement in $Entry){
            $output.AppendLine("`t$EntryElement") | Out-Null
        }
        return $output.ToString()
    }
}