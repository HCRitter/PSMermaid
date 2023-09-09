class Shape : System.Management.Automation.IValidateSetValuesGenerator {
    [String[]] GetValidValues() {
        $Global:Shapes = @{ 
            'RoundEdges' = '(TEXT)'
            'Stadium' = '([TEXT])'
            'subroutine' = '[[TEXT]]'
            'cylindrical' = '[(TEXT)]'
            'circle' = '((TEXT))' 
            'asymmetric' = '>TEXT]' 
            'rhombus' = '{TEXT}' 
            'Parallelogram' ='[/TEXT/]' 
            'hexagon' = '{{TEXT}}' 
            'AltParallelogram' = '[\TEXT\]' 
            'Trapezoid' = '[/TEXT\]' 
            'AltTrapezoid' = '[\TEXT/]' 
            'DoubleCircle' = '(((TEXT)))' 
        }
        return ($Global:shapes).Keys
    }
}



function New-MermaidNode {
    [CmdletBinding()]
    param (
        [ValidateSet([Shape],ErrorMessage="Value '{0}' is invalid. Try one of: {1}")]
        $Shape,
        $ID,
        $Text
    )
    
    begin {
        $ReturnString = ''
        $SelectedShape = $Global:Shapes[$Shape]
        if([string]::IsNullOrEmpty($Text)){
            $Text = $ID
        }
    }
    
    process {
        
        $ReturnString = "{0}{1}" -f $ID, $SelectedShape.Replace('TEXT',$Text)
    }
    
    end {
        return $ReturnString
    }
}