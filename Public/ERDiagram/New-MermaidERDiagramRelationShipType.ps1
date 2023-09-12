class RelationShipType : System.Management.Automation.IValidateSetValuesGenerator {
    [String[]] GetValidValues() {
        $Script:RelationShipTypes = @{ 
            'ZeroOrOne'      = '|o','o|'
            'ExactlyOne'     = '||','||'
            'ZeroOrMore'     = '}o','o{'
            'OneOrMore'      = '}|','|{'
        }
        return ($Script:RelationShipTypes).Keys
    }
}

function New-MermaidERDiagramRelationShipType {
    [CmdletBinding()]
    param (
        [ValidateSet([RelationShipType],ErrorMessage="Value '{0}' is invalid. Try one of: {1}")]
        $Relationshiptype,
        [ValidateSet("Left","Right")]
        $Direction
    )
    
    begin {
        $ReturnString =""
    }
    
    process {
        $ReturnString= switch ($Direction) {
            "Left" { $Script:RelationShipTypes[$Relationshiptype][0] }
            Default {$Script:RelationShipTypes[$Relationshiptype][1]}
        }
    }
    
    end {
        return $ReturnString
    }
}


