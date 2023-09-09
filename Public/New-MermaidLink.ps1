class LinkType : System.Management.Automation.IValidateSetValuesGenerator {
    [String[]] GetValidValues() {
        $Global:LinkTypes = @{ 
            'OpenLink' = '---'
            'ArrowLink' = '-->'
            'DottedLink' = '-.->'
            'ThickLink' = '==>'
            'InvisibleLink' = '~~~' 
        }
        return ($Global:LinkTypes).Keys
    }
}

function New-MermaidLink {
    [CmdletBinding()]
    param (
        $Text ='',
        [ValidateSet([LinkType],ErrorMessage="Value '{0}' is invalid. Try one of: {1}")]
        $Linktype = 'ArrowLink'
    )
    
    begin {
        $ReturnString = ''
        $SelectedLinkType = $Global:LinkTypes[$Linktype]
    }
    
    process {
        if(-not [string]::IsNullOrEmpty($Text)){
            $Text = "|$Text|"
        }
        $ReturnString = "{0}{1}" -f $SelectedLinkType, $Text
    }
    
    end {
        return $ReturnString
    }
}