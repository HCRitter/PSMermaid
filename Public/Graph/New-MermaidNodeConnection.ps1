function New-MermaidNodeConnection {
    [CmdletBinding()]
    param (
        $FirstNode,
        $SecondNode,
        $Link
    )
    
    begin {
        $ReturnString = ""
    }
    
    process {
        $ReturnString = "{0}{1}{2}" -f $FirstNode, $Link, $SecondNode
    }
    
    end {
        return $ReturnString
    }
}