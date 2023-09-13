# Changelog

## Version 0.1.1

- Added basic functionality to create a 'gitGraphs'
- Following new functions: 'New-MermaidGitGraph', 'New-MermaidGitGraphEntry' created

```mermaid
gitGraph
        commit id: "ZERO"
        branch develop
        commit id: "A"
        checkout main
        commit id: "ONE"
        checkout develop
        commit id: "B"
        checkout main
        commit id: "TWO"
        cherry-pick id: "A"
        commit id: "THREE"
        checkout develop
        commit id: "C"

```

## Version 0.1.0

- Added basic functionality to create a 'ERDiagram' (EntityRelationship-Diagram)
- Following new functions: 'New-MermaidERDiagram','New-MermaidERDiagramEntity', 'New-MermaidERDiagramEntityAttribute','New-MermaidERDiagramRelationShip', 'New-MermaidERDiagramRelationShipType' created

```mermaid
erDiagram 
        CAR {
                string registrationNumber PK
                string make
                string model
                string[] parts
        }

        PERSON {
                string driversLicense PK "The license #"
                string(99) firstname  "Only 99 characters are allowed"
                string lastname
                string phone UK
                int age
        }

        NAMED-DRIVER {
                string carRegistrationNumber PK,FK
                string driverLicence PK,FK
        }

        CAR ||--o{ NAMED-DRIVER : allows
        PERSON ||--o{ NAMED-DRIVER : is
```

## Version 0.0.9

- Added basic functionality to create a 'QuardrantChart'
- Following new functions: 'New-MermaidQuadrantChart','New-MermaidQuadrantChartAxis', 'New-MermaidQuadrantChartDataSet','New-MermaidQuadrantChartQuadrant' created

## Version 0.0.8

- Added basic functionality to create a 'Timeline'
- Following new functions: 'New-MermaidTimeLine','New-MermaidTimelineDataSet', 'New-MermaidTimelineSection','New-MermaidTimelineDirective' created

```mermaid
timeline
        title History of Social Media Platform
        2002 : LinkedIn
        2004 : Facebook : Google
        2005 : Youtube
        2006 : Twitter
```

## Version 0.0.7

- Added basic functionality to create a 'pie chart'
- Following new functions: 'New-MermaidPie','New-MermaidPieDataSet' created

```mermaid
%%{init: {"pie": {"textPosition": 0.5}, "themeVariables": {"pieOuterStrokeWidth": "5px"}} }%%
pie showData
        title Key elements in Product X
        "Calcium" : 42.96
        "Potassium" : 50.05
        "Magnesium" : 10.01
        "Iron" : 5

```

## Version 0.0.6

- Added basic functionality to create a 'userjourney'
- Following new functions: 'New-MermaidJourney','New-MermaidJourneySection','New-MermaidJourneyTask' created

```mermaid
journey
        title My working day
        section Go to work
                Make teak: 5: Me
                Go upstairs: 3: Me
                Do work: 1: Me, Cat

        section Go home
                Go downstairs: 5: Me
                Sit down: 5: Me
```

## Version 0.0.5

- Added basic functionality to create ClassDiagrams
- Following new functions: 'New-MermaidClass','New-MermaidClassDiagram','New-MermaidClassMethod','New-MermaidClassProperty','New-MermaidClassRelationShip' created

```mermaid
classDiagram
class Animal{
        +int age
        +String Gender
        +isMammal()
        +mate()
}
class Fish{
        -int sizeInFeet
        -canEat()
}
class Duck{
        +string beackColor
        +swim()
        +quack()
}
Animal <|-- Duck
Animal <|-- Fish
```

## Version 0.0.4

### Changes

- Added function 'New-MermaidClassDefinition' to create class definitions to MermaidNodes
- Updated parameter from 'New-MermaidGraph' to accept ClassDefinitions
  
## Version 0.0.3

### Changes

- Added functionality to 'New-MermaidGraphLink' to generate Bidirectional links, added new arrow types (Arrow, Dot and Cross).
  
```mermaid
flowchart LR
    A o-.-o|Example| B
    C x-.-x|Example| D
    E <.->|Example| F
```
