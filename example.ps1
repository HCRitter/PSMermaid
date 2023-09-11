
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
