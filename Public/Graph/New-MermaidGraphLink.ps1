class LinkType : System.Management.Automation.IValidateSetValuesGenerator {
    [String[]] GetValidValues() {
        $Global:LinkTypes = @{ 
            'Link'      = '---'
            'Thick'     = '==='
            'Dotted'    = '-.-'
            'Invisible' = '~~~' 
        }
        return ($Global:LinkTypes).Keys
    }
}
class ArrowType : System.Management.Automation.IValidateSetValuesGenerator {
    [String[]] GetValidValues() {
        $Global:ArrowTypes = @{ 
            'Dot'      = 'o'
            'Cross'    = 'x'
            'Arrow'    = '>'
        }
        return ($Global:ArrowTypes).Keys
    }
}


function New-MermaidGraphLink {
    [CmdletBinding()]
    param (
        $Text ='',
        [ValidateSet([LinkType],ErrorMessage="Value '{0}' is invalid. Try one of: {1}")]
        $Linktype = 'LinkType',
        [ValidateSet([ArrowType],ErrorMessage="Value '{0}' is invalid. Try one of: {1}")]
        $ArrowType = $null,
        [switch] $BiDirectional
    )
    
    begin {
        $ReturnString = ''
        $SelectedLinkType = $Global:LinkTypes[$Linktype]
        if(-not([string]::IsNullOrEmpty($ArrowType))){
            $SelectedArrowType = $Global:ArrowTypes[$Arrowtype]
            $SelectedLinkType += $SelectedArrowType
        }
    }
    
    process {
        if($BiDirectional -and (-not([string]::IsNullOrEmpty($ArrowType)))){
            if($ArrowType -eq "Arrow"){
                $SelectedLinkType = $SelectedLinkType -replace '^(.)', '<'
            }else{
                $SelectedLinkType = "$SelectedArrowType$SelectedLinkType"
            }
        }

        if(-not [string]::IsNullOrEmpty($Text)){
            $Text = "|$Text|"
        }
        $ReturnString = "{0}{1}" -f $SelectedLinkType, $Text
    }
    
    end {
        return $ReturnString
    }
}