class EncapsulationType : System.Management.Automation.IValidateSetValuesGenerator {
    [String[]] GetValidValues() {
        $Global:EncapsulationTypes = @{ 
            'Public'    = '+'
            'Private'   = '-'
            'Protected' = '#'
            'Package'   = '~' 
        }
        return ($Global:EncapsulationTypes).Keys
    }
}


function New-MermaidClassMethod {
    [CmdletBinding()]
    param (
        [ValidateSet([EncapsulationType],ErrorMessage="Value '{0}' is invalid. Try one of: {1}")]
        $Encapsulation = "Public",
        $Name,
        $Parameter,
        $ReturnType
    )
    
    begin {
        $SelectedEncapsulation = $Global:EncapsulationTypes[$Encapsulation]
        $ReturnString = ""
    
    }
    
    process {

        $ReturnString += "{0}{1}($Parameter) {2}" -f $SelectedEncapsulation,$Name, $ReturnType
    }
    
    end {
        return $ReturnString
    }
}