# Changelog

## Version 0.0.4

### Changes

- Added function 'New-MermaidClassDefinition' to create class definitions to MermaidNodes
- Updated parameter from 'New-MermaidGraph' to accept ClassDefinitions
  
## Version 0.0.3

### Changes

- Added functionality to 'New-MermaidLink' to generate Bidirectional links, added new arrow types (Arrow, Dot and Cross).
  
```mermaid
flowchart LR
    A o-.-o|Example| B
    C x-.-x|Example| D
    E <.->|Example| F
```
