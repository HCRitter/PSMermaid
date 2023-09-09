# PSMermaid

Easily Create Mermaid Markdown Files in PowerShell
A large list with examples you can find [here](https://github.com/HCRitter/PSMermaid/blob/main/EXAMPLES.md), the full changelog you can find [here](https://github.com/HCRitter/PSMermaid/blob/main/CHANGELOG.md).

## Changelog

Version 0.0.3

### Changes

- Added functionality to 'New-MermaidLink' to generate Bidirectional links, added new arrow types (Arrow, Dot and Cross).
  
```mermaid
flowchart LR
    A o-.-o|Example| B
    C x-.-x|Example| D
    E <.->|Example| F
```

## Examples

### Creating a Graph in one big step

```powershell
New-MermaidGraph -Direction LR -NodeConnections @(
    $(
        $newMermaidNodeConnectionSplat = @{
            FirstNode = $(New-MermaidNode -Shape RoundEdges -ID ID1 -Text "Frankfurt am Main")
            SecondNode = $(New-MermaidNode -Shape DoubleCircle -ID ID2 -Text "PSConfEU$((Get-Date).Year +1)")
            Link = $(New-MermaidLink -Text "traveling to:" -Linktype ArrowLink)
        }
        New-MermaidNodeConnection @newMermaidNodeConnectionSplat
    ),
    $(
        $newMermaidNodeConnectionSplat = @{
            FirstNode = $(New-MermaidNode -Shape DoubleCircle -ID ID2 -Text "PSConfEU$((Get-Date).Year +1)")
            SecondNode = $(New-MermaidNode -Shape subroutine -ID ID3 -Text "Enjoying for 4 Days")
            Link = $(New-MermaidLink -Linktype DottedLink)
        }
        New-MermaidNodeConnection @newMermaidNodeConnectionSplat
    ),
    $(
        $newMermaidNodeConnectionSplat = @{
            FirstNode = $(New-MermaidNode -Shape DoubleCircle -ID ID2 -Text "PSConfEU$((Get-Date).Year +1)")
            SecondNode = $(New-MermaidNode -Shape RoundEdges -ID ID1 -Text "Frankfurt am Main")
            Link = $(New-MermaidLink -Text "traveling home:" -Linktype ArrowLink)
        }
        New-MermaidNodeConnection @newMermaidNodeConnectionSplat
    )
)
<# Outpout:
\`\`\`mermaid
graph LR
        ID1(Frankfurt am Main)-->|traveling to:|ID2(((PSConfEU2024)))
        ID2(((PSConfEU2024)))-.->ID3[[Enjoying for 4 Days]]
        ID2(((PSConfEU2024)))-->|traveling home:|ID1(Frankfurt am Main)
\`\`\`
#>
```

```mermaid
graph LR
        ID1(Frankfurt am Main)-->|traveling to:|ID2(((PSConfEU2024)))
        ID2(((PSConfEU2024)))-.->ID3[[Enjoying for 4 Days]]
        ID2(((PSConfEU2024)))-->|traveling home:|ID1(Frankfurt am Main)
```
