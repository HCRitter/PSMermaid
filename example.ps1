
# Create a complex graph / workflow
New-MermaidGraph -Direction LR -NodeConnections @(
    $(
        $newMermaidNodeConnectionSplat = @{
            FirstNode = $(New-MermaidGraphNode -Shape RoundEdges -ID ID1 -Text "Frankfurt am Main" -Class "Starter")
            SecondNode = $(New-MermaidGraphNode -Shape DoubleCircle -ID ID2 -Text "PSConfEU$((Get-Date).Year +1)")
            Link = $(New-MermaidGraphLink -Text "traveling to:" -Linktype Link -ArrowType Cross) 
        }
        New-MermaidGraphNodeConnection @newMermaidNodeConnectionSplat
    ),
    $(
        $newMermaidNodeConnectionSplat = @{
            FirstNode = $(New-MermaidGraphNode -Shape DoubleCircle -ID ID2 -Text "PSConfEU$((Get-Date).Year +1)")
            SecondNode = $(New-MermaidGraphNode -Shape subroutine -ID ID3 -Text "Enjoying for 4 Days")
            Link = $(New-MermaidGraphLink -Linktype Dotted -ArrowType Arrow -BiDirectional)
        }
        New-MermaidGraphNodeConnection @newMermaidNodeConnectionSplat
    ),
    $(
        $newMermaidNodeConnectionSplat = @{
            FirstNode = $(New-MermaidGraphNode -Shape DoubleCircle -ID ID2 -Text "PSConfEU$((Get-Date).Year +1)")
            SecondNode = $(New-MermaidGraphNode -Shape RoundEdges -ID ID1 -Text "Frankfurt am Main")
            Link = $(New-MermaidGraphLink -Text "traveling home:" -Linktype Link -ArrowType Dot)
        }
        New-MermaidGraphNodeConnection @newMermaidNodeConnectionSplat
    )
) -ClassDefinitions @(
    New-MermaidGraphStyleClassDefinition -Name "Starter" -FillColor "#6699ff" -StrokeColor "#999966"
)

# Create a complex class diagram
$newMermaidClassDiagramSplat = @{
    Class = @(
        $(
            $newMermaidClassSplat = @{
                Name = 'Animal'
                property = @(
                    $(
                        $newmermaidclasspropertySplat = @{
                            Accessability = 'Public'
                            Name = 'age'
                            Datatype = 'int'
                        }
                        new-mermaidclassproperty @newmermaidclasspropertySplat
                    ),
                    $(
                        $newmermaidclasspropertySplat = @{
                            Accessability = 'Public'
                            Name = 'Gender'
                            Datatype = 'String'
                        }
                        new-mermaidclassproperty @newmermaidclasspropertySplat
                    )
                )
                Method = @(
                    $(
                        $newMermaidClassMethodSplat = @{
                            Encapsulation = 'Public'
                            Name = 'isMammal'
                        }
                        New-MermaidClassMethod @newMermaidClassMethodSplat 
                    ),
                    $(
                        $newMermaidClassMethodSplat = @{
                            Encapsulation = 'Public'
                            Name = 'mate'
                        }
                        New-MermaidClassMethod @newMermaidClassMethodSplat
                    )
                )
            }
            New-MermaidClass @newMermaidClassSplat
        ),
        $(
            $newMermaidClassSplat = @{
                Name = 'Fish'
                property = @(
                    $(
                        $newmermaidclasspropertySplat = @{
                            Accessability = 'Private'
                            Name = 'sizeInFeet'
                            Datatype = 'int'
                        }
                        new-mermaidclassproperty @newmermaidclasspropertySplat
                    )
                )
                Method = @(
                    $(
                        $newMermaidClassMethodSplat = @{
                            Encapsulation = 'Private'
                            Name = 'canEat'
                        }
                        New-MermaidClassMethod @newMermaidClassMethodSplat 
                    )
                )
            }
            New-MermaidClass @newMermaidClassSplat
        ),
        $(
            $newMermaidClassSplat = @{
                Name = 'Duck'
                property = @(
                    $(
                        $newmermaidclasspropertySplat = @{
                            Accessability = 'Public'
                            Name = 'beackColor'
                            Datatype = 'string'
                        }
                        new-mermaidclassproperty @newmermaidclasspropertySplat
                    )
                )
                Method = @(
                    $(
                        $newMermaidClassMethodSplat = @{
                            Encapsulation = 'Public'
                            Name = 'swim'
                        }
                        New-MermaidClassMethod @newMermaidClassMethodSplat 
                    ),
                    $(
                        $newMermaidClassMethodSplat = @{
                            Encapsulation = 'Public'
                            Name = 'quack'
                        }
                        New-MermaidClassMethod @newMermaidClassMethodSplat
                    )
                )
            }
            New-MermaidClass @newMermaidClassSplat
        )
    )
    RelationShip = @(
        $(
            $newMermaidClassRelationShipSplat = @{
                RelationShipType = 'Inheritance'
                FirstClass = 'Animal'
                SecondClass = 'Duck'
            }

            New-MermaidClassRelationShip @newMermaidClassRelationShipSplat
        ),
        $(
            $newMermaidClassRelationShipSplat = @{
                RelationShipType = 'Inheritance'
                FirstClass = 'Animal'
                SecondClass = 'Fish'
            }

            New-MermaidClassRelationShip @newMermaidClassRelationShipSplat
        )
    )
}

New-MermaidClassDiagram @newMermaidClassDiagramSplat

# Create a UserJourney
New-MermaidJourney -Title "My working day" -Section @(
    $(
        New-MermaidJourneySection -Title "Go to work" -Task @(
            $(
                New-MermaidJourneyTask -Name "Make teak" -Score 5 -Actor @("Me")
            ),
            $(
                New-MermaidJourneyTask -Name "Go upstairs" -Score 3 -Actor @("Me")
            ),
            $(
                New-MermaidJourneyTask -Name "Do work" -Score 1 -Actor @("Me, Cat")
            )
        )
    ),
    $(
        New-MermaidJourneySection -Title "Go home" -Task @(
            $(
                New-MermaidJourneyTask -Name "Go downstairs" -Score 5 -Actor @("Me")
            ),
            $(
                New-MermaidJourneyTask -Name "Sit down" -Score 5 -Actor @("Me")
            )
        )
    )
)

# Create a Pie Chart
New-MermaidPie -Title "Key elements in Product X" -ShowData -DataSet @(
    $(
        New-MermaidPieDataSet -Name Calcium -Value 42.96
    ),
    $(
        New-MermaidPieDataSet -Name Potassium -Value 50.05
    ),
    $(
        New-MermaidPieDataSet -Name Magnesium -Value 10.01
    ),
    $(
        New-MermaidPieDataSet -Name Iron -Value 5
    )
)

# Create a basic Timeline
New-MermaidTimeline -Title "History of Social Media Platform" -DataSet @(
    $(New-MermaidTimelineDataSet -TimePeriod "2002" -Events "LinkedIn"),
    $(New-MermaidTimelineDataSet -TimePeriod "2004" -Events @("Facebook","Google")),
    $(New-MermaidTimelineDataSet -TimePeriod "2005" -Events "Youtube"),
    $(New-MermaidTimelineDataSet -TimePeriod "2006" -Events "Twitter")
)


# Create a Timeline with sections
New-MermaidTimeline -Title "England's History Timeline" -Section @(
    $(New-MermaidTimelineSection -Name "Stone Age" -DataSet @(
        $(New-MermaidTimelineDataSet -TimePeriod "7600 BC" -Events "Britain's oldest known house was built in Orkney, Scotland"),
        $(New-MermaidTimelineDataSet -TimePeriod "6000 BC" -Events "Sea levels rise and Britain becomes an island.<br> The people who live here are hunter-gatherers.")
    )),
    $(New-MermaidTimelineSection -Name "Bronze Age" -DataSet @(
        $(New-MermaidTimelineDataSet -TimePeriod "2300 BC" -Events @("People arrive from Europe and settle in Britain. <br>They bring farming and metalworking.","New styles of pottery and ways of burying the dead appear.")),
        $(New-MermaidTimelineDataSet -TimePeriod "2200 BC" -Events @("The last major building works are completed at Stonehenge.<br> People now bury their dead in stone circles.","The first metal objects are made in Britain.Some other nice things happen. it is a good time to be alive."))
    ))
)

# Create a Quadrant Chart
New-MermaidQuadrantChart -Title "Reach and engagement of campaigns" -XAxis $(New-MermaidQuadrantChartAxis -From "Low Reach" -To "High Reach" -Axis x) -YAxis $(New-MermaidQuadrantChartAxis -From "Low Engagement" -To "High Engagement" -Axis y) -Quadrant @(
    $(New-MermaidQuadrantChartQuadrant -Number 1 -Text "We should expand"),
    $(New-MermaidQuadrantChartQuadrant -Number 2 -Text "Need to promote"),
    $(New-MermaidQuadrantChartQuadrant -Number 3 -Text "Re-evaluate"),
    $(New-MermaidQuadrantChartQuadrant -Number 4 -Text "May be improved")
) -DataSet @(
    $(New-MermaidQuadrantChartDataSet -XPosition 0.3 -YPosition 0.6 -Name "Campaign A"),
    $(New-MermaidQuadrantChartDataSet -XPosition 0.45 -YPosition 0.23 -Name "Campaign B"),
    $(New-MermaidQuadrantChartDataSet -XPosition 0.57 -YPosition 0.69 -Name "Campaign C"),
    $(New-MermaidQuadrantChartDataSet -XPosition 0.78 -YPosition 0.34 -Name "Campaign D"),
    $(New-MermaidQuadrantChartDataSet -XPosition 0.40 -YPosition 0.34 -Name "Campaign E"),
    $(New-MermaidQuadrantChartDataSet -XPosition 0.35 -YPosition 0.78 -Name "Campaign F")
) 



# Create a ERDiagram
New-MermaidERDiagram -Entity @(
    $(New-MermaidERDiagramEntity -Name "CAR" -Attribute @(
        $(New-MermaidERDiagramEntityAttribute -Type "string" -Name "registrationNumber" -Key Primary ),
        $(New-MermaidERDiagramEntityAttribute -Type "string" -Name "make" ),
        $(New-MermaidERDiagramEntityAttribute -Type "string" -Name "model" ),
        $(New-MermaidERDiagramEntityAttribute -Type "string[]" -Name "parts" )
    )),
    $(New-MermaidERDiagramEntity -Name "PERSON" -Attribute @(
        $(New-MermaidERDiagramEntityAttribute -Type "string" -Name "driversLicense" -Key Primary -Comment "The license #"),
        $(New-MermaidERDiagramEntityAttribute -Type "string(99)" -Name "firstname" -Comment "Only 99 characters are allowed"),
        $(New-MermaidERDiagramEntityAttribute -Type "string" -Name "lastname"),
        $(New-MermaidERDiagramEntityAttribute -Type "string" -Name "phone UK")
        $(New-MermaidERDiagramEntityAttribute -Type "int" -Name "age")
    )),
    $(New-MermaidERDiagramEntity -Name "NAMED-DRIVER" -Attribute @(
        $(New-MermaidERDiagramEntityAttribute -Type "string" -Name "carRegistrationNumber" -Key Primary, Foreign),
        $(New-MermaidERDiagramEntityAttribute -Type "string" -Name "driverLicence" -Key Primary, Foreign)
    ))
) -Relationship @(
    $(
        $newMermaidERDiagramRelationShipSplat = @{
            FirstEntityName = "CAR"
            SecondEntityName = "NAMED-DRIVER"
            RelationTypeLeft = $(New-MermaidERDiagramRelationShipType -Relationshiptype ExactlyOne -Direction Left)
            RelationTypeRight = $(New-MermaidERDiagramRelationShipType -Relationshiptype ZeroOrMore -Direction Right)
            Comment = "allows"
        }
        New-MermaidERDiagramRelationShip @newMermaidERDiagramRelationShipSplat
    ),
    $(
        $newMermaidERDiagramRelationShipSplat = @{
            FirstEntityName = "PERSON"
            SecondEntityName = "NAMED-DRIVER"
            RelationTypeLeft = $(New-MermaidERDiagramRelationShipType -Relationshiptype ExactlyOne -Direction Left)
            RelationTypeRight = $(New-MermaidERDiagramRelationShipType -Relationshiptype ZeroOrMore -Direction Right)
            Comment = "is"
        }
        New-MermaidERDiagramRelationShip @newMermaidERDiagramRelationShipSplat
    )
)

# Create a Git Graph
new-MermaidGitGraph -Entry @(
    $(New-MermaidGitGraphEntryCommit -id "ZERO"),
    $(New-MermaidGitGraphEntryBranch -Name "develop"),
    $(New-MermaidGitGraphEntryCommit -id "A"),
    $(New-MermaidGitGraphEntryCheckOut -name "main"),
    $(New-MermaidGitGraphEntryCommit -id "ONE"),
    $(New-MermaidGitGraphEntryCheckOut -name "develop"),
    $(New-MermaidGitGraphEntryCommit -id "B"),
    $(New-MermaidGitGraphEntryCheckOut -name "main"),
    $(New-MermaidGitGraphEntryCommit -id "TWO"),
    $(New-MermaidGitGraphEntryCherrypick -id "A"),
    $(New-MermaidGitGraphEntryCommit -id "THREE"),
    $(New-MermaidGitGraphEntryCheckOut -name "develop"),
    $(New-MermaidGitGraphEntryCommit -id "C")
)


# Create a Gantt Chart
$topaxis='true'
$header=@"
---
displayMode: compact
config:
    theme: base
    themeVariables:
    primaryColor: "#4682B4"
gantt:
    topAxis: $topaxis
---

"@

$header
New-MermaidGanttChart -Title "Team Absence" -Section @(
    $(New-MermaidGanttChartSection -Title 'Bob' -Events @(
        $(New-MermaidGanttChartEvent -Label 'Holiday' -Tag 'active' -TID 1 -StartDate '2024-08-01' -Enddate '2024-08-14'),
        $(New-MermaidGanttChartEvent -Label 'National Holiday' -Tag 'milestone' -TID 2 -StartDate '2024-08-26' -Enddate '2024-08-27')
    )),
    $(New-MermaidGanttChartSection -Title 'Billy' -Events @(
        $(New-MermaidGanttChartEvent -Label 'Holiday' -Tag 'done' -TID 1 -StartDate '2024-08-14' -Enddate '2024-08-17'),
        $(New-MermaidGanttChartEvent -Label 'National Holiday' -Tag 'milestone' -TID 2 -StartDate '2024-08-26' -Enddate '2024-08-27')
    )),
    $(New-MermaidGanttChartSection -Title 'Mary' -Events @(
        $(New-MermaidGanttChartEvent -Label 'Unapproved' -Tag 'crit' -TID 1 -StartDate '2024-08-19' -Enddate '2024-08-21'),
        $(New-MermaidGanttChartEvent -Label 'National Holiday' -Tag 'milestone' -TID 2 -StartDate '2024-08-26' -Enddate '2024-08-27')
    ))

)
