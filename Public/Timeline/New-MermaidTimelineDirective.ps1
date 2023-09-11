function New-MermaidTimelineDirective {
    [CmdletBinding()]
    param (
        [ValidateSet("base","forest","dark","default","neutral")]
        $Theme,
        [switch] $DisableMulticolor
    )
    
    begin {
        $ReturnString = ""
    }
    
    process {
        $ReturnString = (("%%{init: {'logLevel': 'debug', 'theme': 'RPTHEME', 'timeline': {'disableMulticolor': RPDISABLEMULTICOLOR}}}%%").Replace('RPTHEME',$Theme)).Replace('RPDISABLEMULTICOLOR',$DisableMulticolor)
        
    }
    
    end {
        return $ReturnString
    }
}