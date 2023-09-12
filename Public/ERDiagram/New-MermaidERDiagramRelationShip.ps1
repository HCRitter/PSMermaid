class LinkType : System.Management.Automation.IValidateSetValuesGenerator {
    [String[]] GetValidValues() {
        $Global:LinkTypes = @{ 
            'Link'      = '--'
            'Dotted'    = '..'
        }
        return ($Global:LinkTypes).Keys
    }
}
function New-MermaidERDiagramRelationShip {
    [CmdletBinding()]
    param (
        $FirstEntityName,
        $SecondEntityName,
        $RelationTypeLeft,
        $RelationTypeRight,
        [ValidateSet([LinkType],ErrorMessage="Value '{0}' is invalid. Try one of: {1}")]
        $LinkType = 'Link',
        $Comment

    )
    
    begin {
        $ReturnString = ""
        if(-not ([string]::IsNullOrEmpty($Comment))){
            $Comment = ": $Comment"
        }
    }
    
    process {
        
        $ReturnString = "{0} {1}{2}{3} {4} {5}" -f $FirstEntityName, $RelationTypeLeft, $LinkType, $RelationTypeRight, $SecondEntityName, $Comment
    }
    
    end {
        return $ReturnString
    }
}