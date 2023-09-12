class KeyType : System.Management.Automation.IValidateSetValuesGenerator {
    [String[]] GetValidValues() {
        $Script:KeyTypes = @{ 
            'Unique'      = 'UK'
            'Foreign'     = 'FK'
            'Primary'     = 'PK' 
        }
        return ($Script:KeyTypes).Keys
    }
}

function New-MermaidERDiagramEntityAttribute {
    [CmdletBinding()]
    param (
        $Type,
        $Name,
        [ValidateSet([KeyType],ErrorMessage="Value '{0}' is invalid. Try one of: {1}")]
        $Key,
        $Comment
    )
    
    begin {
        $ReturnString =""
        $SelectedKey = foreach($KeyElement in $Key){
            $script:KeyTypes[$KeyElement]
        }
        $SelectedKey = $SelectedKey | Select-Object -Unique
    }
    
    process {
        if(-not ([string]::IsNullOrEmpty($Comment))){
            $Comment = "`"$Comment`""
        }
        $ReturnString = "{0} {1} {2} {3}" -f $Type,$Name,$($SelectedKey -join ','),$Comment
    }
    
    end {
        return $ReturnString
    }
}