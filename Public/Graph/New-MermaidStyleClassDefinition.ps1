function New-MermaidStyleClassDefinition {
    [CmdletBinding()]
    param (
        $Name,
        [ValidateScript({
            
            switch ($psitem) {
                {$psitem -notmatch '^#(?:[0-9a-fA-F]{3}){1,2}$'}{
                    throw "The provided color is not a valid hex value"
                }
                Default {
                    $true
                }
            }
        })]
        $FillColor,
        [ValidateScript({
            
            switch ($psitem) {
                {$psitem -notmatch '^#(?:[0-9a-fA-F]{3}){1,2}$'}{
                    throw "The provided color is not a valid hex value"
                }
                Default {
                    $true
                }
            }
        })]
        $StrokeColor,
        [int]$StrokeWidth = 2
    )
    
    begin {
        $ReturnString = ""
    }
    
    process {
        $ReturnString += "classDef $Name "
        $Definitions =New-Object -TypeName "System.Collections.Generic.List[String]"
        if(-not([string]::IsNullOrEmpty($FillColor))){
            $Definitions.Add("fill:$FillColor")
        }
        if(-not([string]::IsNullOrEmpty($StrokeColor))){
            $Definitions.Add("stroke:$StrokeColor")
        }
        if(-not([string]::IsNullOrEmpty($StrokeWidth))){
            $Definitions.Add("stroke-width:$($StrokeWidth)px")
        }
        $ReturnString += $Definitions -join ","
    }
    
    end {
        return $ReturnString
    }
}