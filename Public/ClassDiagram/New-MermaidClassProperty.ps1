function New-MermaidClassProperty {
    [CmdletBinding()]
    param (
        $Accessability = "Public",
        $Datatype,
        $Name
    )
    
    begin {
        $ReturnString = ""

    }
    
    process {
        switch ($Accessability) {
            'private' {$ReturnString = '-'  }
            Default {$ReturnString = '+'}
        } 
        $ReturnString += "{0} {1}" -f $Datatype,$Name
    }
    
    end {
        return $ReturnString
    }
}