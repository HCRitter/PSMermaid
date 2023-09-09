class RelationShipType : System.Management.Automation.IValidateSetValuesGenerator {
    [String[]] GetValidValues() {
        $Global:RelationShipTypes = @{ 
            'Inheritance'    = '<|--'
            'Composition'   = '*--'
            'Aggregation' = 'o--'
            'Association'   = '-->'
            'LinkSolid'   = '--'
            'LinkDashed'   = '..'
            'Dependency'   = '..>'
            'Realization'   = '..|>'
        }
        return ($Global:RelationShipTypes).Keys
    }
}
class CardinalityType : System.Management.Automation.IValidateSetValuesGenerator {
    [String[]] GetValidValues() {
        $Global:CardinalityTypes = @{ 
            'OnlyOne'   = '1'
            'ZeroToOne' = '0..1'
            'OneOrMore' = '1..*'
            'Many'      = '*'
            'n'         = 'n'
            'ZeroToN'   = '0..n'
            'OneToN'    = '1..n'
        }
        return ($Global:CardinalityTypes).Keys
    }
}



function New-MermaidClassRelationShip {
    [CmdletBinding()]
    param (
        [ValidateSet([RelationShipType],ErrorMessage="Value '{0}' is invalid. Try one of: {1}")]
        $RelationShipType = $Null,
        $FirstClass,
        $SecondClass,
        [ValidateSet([CardinalityType],ErrorMessage="Value '{0}' is invalid. Try one of: {1}")]
        $FirstCardinality,
        [ValidateSet([CardinalityType],ErrorMessage="Value '{0}' is invalid. Try one of: {1}")]
        $SecondCardinality
    )
    
    begin {
        $ReturnString = ""
        $SelectedFirstCardinality =""
        $SelectedSecondCardinality =""
        $SelectedRelationShipType = $Global:RelationShipTypes[$RelationShipType]
        if(-not [string]::IsNullOrEmpty($FirstCardinality)){
            $SelectedFirstCardinality = " `"$($Global:CardinalityTypes[$FirstCardinality])`""
        }
        if(-not [string]::IsNullOrEmpty($SecondCardinality)){
            $SelectedSecondCardinality = " `"$($Global:CardinalityTypes[$SecondCardinality])`""
        }
    }
    
    process {
        $ReturnString = "{0}{1} {2}{3} {4}" -f $FirstClass,$SelectedFirstCardinality,$SelectedRelationShipType, $SelectedSecondCardinality,$SecondClass
    }
    
    end {
        return $ReturnString
    }
}