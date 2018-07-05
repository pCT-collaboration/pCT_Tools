'******************************************************************************************************************************************
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'******************************************************************************************************************************************
Function getAxisBounds(maxVal As Double, ByVal roundToNearest As Double, getMax As Boolean) As Double
    If getMax Then
        getAxisBounds = Round((maxVal + roundToNearest / 2) / roundToNearest) * roundToNearest
    Else
        getAxisBounds = Round((maxVal - roundToNearest / 2) / roundToNearest) * roundToNearest
    End If
End Function
'******************************************************************************************************************************************
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'******************************************************************************************************************************************
Sub createTitledChart(plotTypeTitleLabel As String, iterations As Integer, materialDependency As String, titleSuffix As String, titleFontSize As Integer, suffixOnlyLine As Boolean, outputCell As Range)
    Dim iterationString
    ActiveSheet.Shapes.AddChart2(332, xlLineMarkers).Select
    'Selection.Top = Range(Application.Caller.Address).Top
    'Selection.Left = Range(Application.Caller.Address).Left
    Selection.Top = Range(outputCell.Address).Top
    Selection.Left = Range(outputCell.Address).Left
    If iterations = 1 Then
        iterationString = iterations & " Iteration "
    Else
        iterationString = iterations & " Iterations "
    End If
    If suffixOnlyLine Then
        ActiveChart.ChartTitle.Text = plotTypeTitleLabel & " vs. N " & materialDependency & Chr(13) & "After " & iterationString & titleSuffix
    Else
        ActiveChart.ChartTitle.Text = plotTypeTitleLabel & " vs. N" & materialDependency & " After " & iterationString & Chr(13) & titleSuffix
    End If
    ActiveChart.ChartTitle.Font.Size = titleFontSize
End Sub
'******************************************************************************************************************************************
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'******************************************************************************************************************************************
Sub fillAlphaSeries(xvals As Range, ser1 As Range, ser2 As Range, ser3 As Range, ser4 As Range, ser5 As Range, OTVS As Range)
    ActiveChart.FullSeriesCollection(1).Name = ChrW(945) & "=0.5"
    ActiveChart.FullSeriesCollection(1).XValues = xvals
    ActiveChart.FullSeriesCollection(1).Values = ser1
    ActiveChart.SeriesCollection.NewSeries
    ActiveChart.FullSeriesCollection(2).Name = ChrW(945) & "=0.65"
    ActiveChart.FullSeriesCollection(2).Values = ser2
    ActiveChart.SeriesCollection.NewSeries
    ActiveChart.FullSeriesCollection(3).Name = ChrW(945) & "=0.75"
    ActiveChart.FullSeriesCollection(3).Values = ser3
    ActiveChart.SeriesCollection.NewSeries
    ActiveChart.FullSeriesCollection(4).Name = ChrW(945) & "=0.85"
    ActiveChart.FullSeriesCollection(4).Values = ser4
    ActiveChart.SeriesCollection.NewSeries
    ActiveChart.FullSeriesCollection(5).Name = ChrW(945) & "=0.95"
    ActiveChart.FullSeriesCollection(5).Values = ser5
    ActiveChart.SeriesCollection.NewSeries
    ActiveChart.FullSeriesCollection(6).Name = "OTVS"
    ActiveChart.FullSeriesCollection(6).Values = OTVS
    '-------------------------------------------------------------------------------------
    Call setSeriesFormat(1, msoThemeColorText1, 0, msoLineSolid, 3, 7, msoThemeColorText1)
    Call setSeriesFormat(2, msoThemeColorBackground2, -0.15, msoLineSolid, 1, 6, msoThemeColorText1)
    Call setSeriesFormat(3, msoThemeColorBackground2, -0.35, msoLineSolid, 2, 7, msoThemeColorText1)
    Call setSeriesFormat(4, msoThemeColorBackground2, -0.15, msoLineSolid, 4, 7, msoThemeColorText1)
    Call setSeriesFormat(5, msoThemeColorBackground2, -0.5, msoLineSolid, 8, 7, msoThemeColorText1)
    Call setSeriesFormat(6, msoThemeColorText1, 0, msoLineSysDash, -4142, 3, msoThemeColorText1)
End Sub
'******************************************************************************************************************************************
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'******************************************************************************************************************************************
Sub fillTVcheckSeries(xvals As Range, ser1 As Range, ser2 As Range, OTVS As Range)
    ActiveChart.FullSeriesCollection(1).Name = "NTVS, TV Check Off"
    ActiveChart.FullSeriesCollection(1).XValues = xvals
    ActiveChart.FullSeriesCollection(1).Values = ser1
    ActiveChart.SeriesCollection.NewSeries
    ActiveChart.FullSeriesCollection(2).Name = "NTVS, TV Check On"
    ActiveChart.FullSeriesCollection(2).Values = ser2
    ActiveChart.SeriesCollection.NewSeries
    ActiveChart.FullSeriesCollection(3).Name = "OTVS"
    ActiveChart.FullSeriesCollection(3).Values = OTVS
    '-------------------------------------------------------------------------------------
    Call setSeriesFormat(1, msoThemeColorBackground2, -0.5, msoLineSolid, 3, 7, msoThemeColorText1)
    Call setSeriesFormat(2, msoThemeColorBackground2, -0.1000000015, msoLineSolid, 1, 6, msoThemeColorBackground2)
    Call setSeriesFormat(3, msoThemeColorText1, 0, msoLineSysDash, -4142, 3, msoThemeColorText1)
End Sub
'******************************************************************************************************************************************
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'******************************************************************************************************************************************
Sub fillTVvsKSeries(xvals As Range, ser1 As Range, OTVS As Range)
    ActiveChart.FullSeriesCollection(1).Name = "NTVS, TV Check Off"
    ActiveChart.FullSeriesCollection(1).XValues = xvals
    ActiveChart.FullSeriesCollection(1).Values = ser1
    ActiveChart.SeriesCollection.NewSeries
    ActiveChart.FullSeriesCollection(2).Name = "OTVS"
    ActiveChart.FullSeriesCollection(2).Values = OTVS
    '-------------------------------------------------------------------------------------
    Call setSeriesFormat(1, msoThemeColorBackground2, -0.15, msoLineSolid, 8, 7, msoThemeColorText1)
    Call setSeriesFormat(2, msoThemeColorText1, 0, msoLineSysDash, -4142, 3, msoThemeColorText1)
End Sub
'******************************************************************************************************************************************
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'******************************************************************************************************************************************
Sub fillvsLSeries(xvals As Range, ser1 As Range, ser2 As Range, ser3 As Range)
    ActiveChart.FullSeriesCollection(1).Name = ChrW(955) & "=0.0001"
    ActiveChart.FullSeriesCollection(1).XValues = xvals
    ActiveChart.FullSeriesCollection(1).Values = ser1
    ActiveChart.SeriesCollection.NewSeries
    ActiveChart.FullSeriesCollection(2).Name = ChrW(955) & "=0.00015"
    ActiveChart.FullSeriesCollection(2).Values = ser2
    ActiveChart.SeriesCollection.NewSeries
    ActiveChart.FullSeriesCollection(3).Name = ChrW(955) & "=0.0002"
    ActiveChart.FullSeriesCollection(3).Values = ser3
    '-------------------------------------------------------------------------------------
    Call setSeriesFormat(1, msoThemeColorBackground2, -0.05, msoLineSolid, 3, 7, msoThemeColorText1)
    Call setSeriesFormat(2, msoThemeColorBackground2, -0.15, msoLineSolid, 8, 6, msoThemeColorText1)
    Call setSeriesFormat(3, msoThemeColorBackground2, -0.75, msoLineSolid, 1, 6, msoThemeColorText1)
End Sub
'******************************************************************************************************************************************
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'******************************************************************************************************************************************
Sub setSeriesFormat(seriesNum As Integer, lineColor As MsoThemeColorIndex, brightness As Double, dashStyle As MsoLineDashStyle, markerStyle As Integer, markerSize As Integer, markerColor As MsoThemeColorIndex)
    With ActiveChart.FullSeriesCollection(seriesNum).Format.Line
        .Visible = msoFalse
        .Visible = msoTrue
        .ForeColor.ObjectThemeColor = lineColor
        .ForeColor.TintAndShade = 0
        .ForeColor.brightness = brightness
        .Transparency = 0
        .dashStyle = dashStyle
        .Weight = 2#
    End With
    With ActiveChart.FullSeriesCollection(seriesNum)
        .MarkerForegroundColor = markerColor
        .MarkerBackgroundColorIndex = 15
        .markerStyle = markerStyle
        .markerSize = markerSize
    End With
End Sub
Sub setAxesFormat(axisType As XlAxisType, axisTitle As String, fontSize As Integer, reverseValOrder As Boolean)
    ActiveChart.Axes(axisType).HasTitle = True
    ActiveChart.Axes(axisType, xlPrimary).axisTitle.Text = axisTitle
    ActiveChart.Axes(axisType).axisTitle.Font.Size = fontSize
    ActiveChart.Axes(axisType).HasMajorGridlines = True
    ActiveChart.Axes(axisType).MajorGridlines.Format.Line.Visible = msoTrue
    ActiveChart.Axes(axisType).MajorTickMark = xlOutside
    If axisType = xlValue Then
        ActiveChart.Axes(xlValue).HasMinorGridlines = True
        ActiveChart.Axes(xlValue).MinorGridlines.Format.Line.Visible = msoTrue
        ActiveChart.Axes(xlValue).MinorTickMark = xlOutside
        If reverseValOrder Then
            ActiveChart.Axes(xlValue).ReversePlotOrder = True
            ActiveChart.Axes(xlValue).Crosses = xlMaximum
        Else
            ActiveChart.Axes(xlValue).Crosses = xlMinimum
        End If
    Else
        ActiveChart.Axes(xlCategory).HasMinorGridlines = False
        ActiveChart.Axes(xlCategory).MinorGridlines.Format.Line.Visible = msoFalse
        ActiveChart.Axes(xlCategory).MinorTickMark = xlNone
        ActiveChart.Axes(xlCategory).AxisBetweenCategories = False
        If reverseValOrder Then
            ActiveChart.Axes(xlCategory).TickLabelPosition = xlHigh
        Else
            ActiveChart.Axes(xlCategory).TickLabelPosition = xlLow
        End If
    End If
    With ActiveChart.Axes(axisType).Format.Line
        .Visible = msoTrue
        .ForeColor.ObjectThemeColor = msoThemeColorBackground2 'msoThemeColorText1
        .ForeColor.TintAndShade = 0
        .ForeColor.brightness = -0.25 '0
    End With
End Sub
Sub addChartLegend()
    ActiveChart.HasLegend = True
    ActiveChart.Legend.Position = xlBottom 'xlLegendPositionRight
    With ActiveChart.Legend.Format.Line
        .Visible = msoTrue
        .ForeColor.ObjectThemeColor = msoThemeColorText1
        .ForeColor.TintAndShade = 0
        .ForeColor.brightness = 0
    End With
End Sub
Sub setTVcheckChartSizing(titleLeftPos As Double)
    ActiveChart.Parent.Width = 282.24 '3.92 * ptsPerInch
    ActiveChart.Parent.Height = 229.68 '3.19 * ptsPerInch
    ActiveChart.PlotArea.Top = 38.18
    ActiveChart.PlotArea.Height = 146.846
    ActiveChart.PlotArea.Width = 251.846
    ActiveChart.PlotArea.Left = 105.18
    ActiveChart.Axes(xlCategory).axisTitle.Top = 183.224
    ActiveChart.Axes(xlValue).axisTitle.Left = 0
    ActiveChart.ChartTitle.Left = titleLeftPos
    ActiveChart.ChartTitle.Top = 0
    ActiveChart.Legend.Left = 0.989
    ActiveChart.Legend.Width = 270.26
    ActiveChart.Legend.Height = 16.846
    ActiveChart.Legend.Top = 203
End Sub
Sub setTVvsKChartSizing(titleLeftPos As Double)
    Call setTVcheckChartSizing(titleLeftPos)
    ActiveChart.ChartTitle.Left = titleLeftPos
    ActiveChart.Legend.Width = 250.26
    ActiveChart.Legend.Left = 10.989
    ActiveChart.Legend.Top = 208
End Sub
Sub setLChartSizing(titleLeftPos As Double)
    ActiveChart.Parent.Width = 282.24 '3.92 * ptsPerInch
    ActiveChart.Parent.Height = 229.68 '3.19 * ptsPerInch
    ActiveChart.PlotArea.Top = 38.18
    ActiveChart.PlotArea.Height = 146.846
    ActiveChart.PlotArea.Width = 251.846
    ActiveChart.PlotArea.Left = 105.18
    ActiveChart.Axes(xlCategory).axisTitle.Top = 183.224
    ActiveChart.Axes(xlValue).axisTitle.Left = 0
    ActiveChart.ChartTitle.Left = titleLeftPos
    ActiveChart.ChartTitle.Top = 0
    ActiveChart.Legend.Left = 0.989
    ActiveChart.Legend.Width = 270.26
    ActiveChart.Legend.Height = 16.846
    ActiveChart.Legend.Top = 203
End Sub
Sub setAlphaChartSizing(titleLeftPos As Double)
    ActiveChart.Parent.Width = 370.8 '337.68 '5.15 * ptsPerInch
    ActiveChart.Parent.Height = 294.75 '258.48 '4.15 * ptsPerInch
    ActiveChart.PlotArea.Top = 44.68
    ActiveChart.PlotArea.Height = 200.346 '176.846
    ActiveChart.PlotArea.Width = 339.846 '309.846
    ActiveChart.PlotArea.Left = 105.18
    ActiveChart.Axes(xlCategory).axisTitle.Top = 245.024 '215.724
    ActiveChart.Axes(xlValue).axisTitle.Left = 0
    ActiveChart.ChartTitle.Left = titleLeftPos '85.467 '69.467
    ActiveChart.ChartTitle.Top = -5
    ActiveChart.Legend.Left = -3
    ActiveChart.Legend.Width = 367.26
    ActiveChart.Legend.Height = 19.846
    ActiveChart.Legend.Top = 272
End Sub
'******************************************************************************************************************************************
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'******************************************************************************************************************************************
Sub CreateVsTVCheckChart(plotTypeTitleLabel As String, plotTypeAxisLabel As String, xvals As Range, ser1 As Range, ser2 As Range, OTVS As Range, iterations As Integer, lambda As Double, material As Variant, outputCell As Range)
    If plotTypeTitleLabel = "Total Variation" Then
        Call createTitledChart(plotTypeTitleLabel, iterations, "", "(" & ChrW(955) & "=" & lambda & ")", 14, False, outputCell)
    Else
        Call createTitledChart(plotTypeTitleLabel, iterations, "in " & material, "(" & ChrW(955) & "=" & lambda & ")", 14, True, outputCell)
    End If
    Call fillTVcheckSeries(xvals, ser1, ser2, OTVS)
    Call setAxesFormat(xlValue, plotTypeAxisLabel, 12, False)
    Call setAxesFormat(xlCategory, "N", 12, False)
    Call addChartLegend
    Dim roundTo As Double
    If plotTypeTitleLabel = "Total Variation" Then
        roundtTo = 100#
        Call setTVcheckChartSizing(35.467)
    ElseIf plotTypeTitleLabel = "RSP % Error" Then
        roundtTo = 0.1
        Call setTVcheckChartSizing(35.467)
    ElseIf plotTypeTitleLabel = "Standard Deviation" Then
        roundtTo = 0.0005
        Call setTVcheckChartSizing(55.467)
    Else
        roundtTo = 0.1
        Call setTVcheckChartSizing(35.467)
    End If
    'Call setLChartSizing(45.467)
    Dim plotDataRange As Range: Set plotDataRange = Union(ser1, ser2, OTVS)
    ActiveChart.Axes(xlValue).MaximumScale = getAxisBounds(Application.WorksheetFunction.Max(plotDataRange), roundtTo, True)
    ActiveChart.Axes(xlValue).MinimumScale = getAxisBounds(Application.WorksheetFunction.Min(plotDataRange), roundtTo, False)
End Sub
'------------------------------------------------------------------------------------------------------------------------------------------
Function plotTVvsTVCheck(xvals As Range, ser1 As Range, ser2 As Range, OTVS As Range, iterations As Integer, lambda As Double, outputCell As Range)
    Call CreateVsTVCheckChart("Total Variation", "Total Variation (TV)", xvals, ser1, ser2, OTVS, iterations, lambda, "", outputCell)
    ActiveChart.Axes(xlValue).MaximumScale = 11200
    ActiveChart.Axes(xlValue).MinimumScale = 10850
End Function
'------------------------------------------------------------------------------------------------------------------------------------------
Function plotRSPerrorVsTVCheck(xvals As Range, ser1 As Range, ser2 As Range, OTVS As Range, iterations As Integer, lambda As Double, material As Variant, outputCell As Range)
    Call CreateVsTVCheckChart("RSP % Error", "RSP Error (%)", xvals, ser1, ser2, OTVS, iterations, lambda, material, outputCell)
End Function
'------------------------------------------------------------------------------------------------------------------------------------------
Function plotStdDevVsTVCheck(xvals As Range, ser1 As Range, ser2 As Range, OTVS As Range, iterations As Integer, lambda As Double, material As Variant, outputCell As Range)
    Call CreateVsTVCheckChart("Standard Deviation", "Standard Deviation", xvals, ser1, ser2, OTVS, iterations, lambda, material, outputCell)
End Function
'******************************************************************************************************************************************
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'******************************************************************************************************************************************
Function createTVvsKTable(plotTypeTitleLabel As String, plotTypeAxisLabel As String, xvals As Range, ser1 As Range, OTVS As Range, iterations As Integer, lambda As Double, outputCell As Range)
    Call createTitledChart(plotTypeTitleLabel, iterations, "", ChrW(955) & "=" & lambda, 14, False, outputCell)
    Call fillTVvsKSeries(xvals, ser1, OTVS)
    Call setAxesFormat(xlValue, plotTypeAxisLabel, 12, False)
    Call setAxesFormat(xlCategory, "N", 12, False)
    Call addChartLegend
    Dim roundTo As Double
    If plotTypeTitleLabel = "Total Variation" Then
        roundtTo = 50#
        Call setTVvsKChartSizing(45.467)
    ElseIf plotTypeTitleLabel = "RSP % Error" Then
        roundtTo = 0.1
        Call setTVvsKChartSizing(45.467)
    ElseIf plotTypeTitleLabel = "Standard Deviation" Then
        roundtTo = 0.0005
        Call setTVvsKChartSizing(45.467)
    Else
        roundtTo = 0.1
        Call setTVvsKChartSizing(45.467)
    End If
    Dim plotDataRange As Range: Set plotDataRange = Union(ser1, OTVS)
    ActiveChart.Axes(xlValue).MaximumScale = getAxisBounds(Application.WorksheetFunction.Max(plotDataRange), roundtTo, True)
    ActiveChart.Axes(xlValue).MinimumScale = getAxisBounds(Application.WorksheetFunction.Min(plotDataRange), roundtTo, False)
End Function
'------------------------------------------------------------------------------------------------------------------------------------------
Function plotTVvsK(xvals As Range, ser1 As Range, OTVS As Range, iterations As Integer, lambda As Double, outputCell As Range)
    Call createTVvsKTable("Total Variation", "Total Variation (TV)", xvals, ser1, OTVS, iterations, lambda, outputCell)
End Function
'******************************************************************************************************************************************
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'******************************************************************************************************************************************
Function createVsLChart(plotTypeTitleLabel As String, plotTypeAxisLabel As String, xvals As Range, ser1 As Range, ser2 As Range, ser3 As Range, iterations As Integer, material As Variant, reverseValOrder As Boolean, outputCell As Range)
    If plotTypeTitleLabel = "Total Variation" Then
        Call createTitledChart(plotTypeTitleLabel, iterations, "", "(" & ChrW(955) & "=0.0001,0.00015,0.0002)", 14, False, outputCell)
        ActiveChart.ChartTitle.Text = plotTypeTitleLabel & " vs. N " & Chr(13) & "(" & ChrW(955) & "=0.0001,0.00015,0.0002)"
    Else
        Call createTitledChart(plotTypeTitleLabel, iterations, "in " & material, "(" & ChrW(955) & "=0.0001,0.00015,0.0002)", 14, True, outputCell)
        ActiveChart.ChartTitle.Text = plotTypeTitleLabel & " vs. N in " & material & Chr(13) & "(" & ChrW(955) & "=0.0001,0.00015,0.0002)"
    End If
    Call fillvsLSeries(xvals, ser1, ser2, ser3)
    Call setAxesFormat(xlValue, plotTypeAxisLabel, 12, False)
    Call setAxesFormat(xlCategory, "N", 12, False)
    Call addChartLegend
    'Call setLChartSizing(45.467)
    Dim roundTo As Double
    If plotTypeTitleLabel = "Total Variation" Then
        roundtTo = 200#
        Call setLChartSizing(74.467)
    ElseIf plotTypeTitleLabel = "RSP % Error" Then
        roundtTo = 0.1
        Call setLChartSizing(61.467)
    ElseIf plotTypeTitleLabel = "Standard Deviation" Then
        roundtTo = 0.001
        Call setLChartSizing(55.467)
    Else
        roundtTo = 0.1
        Call setLChartSizing(45.467)
    End If
    Dim plotDataRange As Range: Set plotDataRange = Union(ser1, ser2, ser3)
    ActiveChart.Axes(xlValue).MaximumScale = getAxisBounds(Application.WorksheetFunction.Max(plotDataRange), roundtTo, True)
    ActiveChart.Axes(xlValue).MinimumScale = getAxisBounds(Application.WorksheetFunction.Min(plotDataRange), roundtTo, False)
    'MsgBox Application.WorksheetFunction.Min(plotDataRange)

End Function
'------------------------------------------------------------------------------------------------------------------------------------------
Function plotTVVsL(xvals As Range, ser1 As Range, ser2 As Range, ser3 As Range, iterations As Integer, outputCell As Range)
    Call createVsLChart("Total Variation", "Total Variation (TV)", xvals, ser1, ser2, ser3, iterations, "", False, outputCell)
End Function
'------------------------------------------------------------------------------------------------------------------------------------------
Function plotStdDevVsL(xvals As Range, ser1 As Range, ser2 As Range, ser3 As Range, iterations As Integer, material As Variant, outputCell As Range)
    Call createVsLChart("Standard Deviation", "Standard Deviation", xvals, ser1, ser2, ser3, iterations, material, False, outputCell)
End Function
'******************************************************************************************************************************************
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'******************************************************************************************************************************************

Sub createVsAlphaChart(plotTypeTitleLabel As String, plotTypeAxisLabel As String, xvals As Range, ser1 As Range, ser2 As Range, ser3 As Range, ser4 As Range, ser5 As Range, OTVS As Range, iterations As Integer, lambda As Double, material As Variant, reverseValOrder As Boolean, outputCell As Range)
    Dim roundTo As Double
    If plotTypeTitleLabel = "Total Variation" Then
        Call createTitledChart(plotTypeTitleLabel, iterations, "", "(" & ChrW(955) & "=" & lambda & ")", 18, False, outputCell)
    Else
        Call createTitledChart(plotTypeTitleLabel, iterations, "in " & material, "(" & ChrW(955) & "=" & lambda & ")", 18, True, outputCell)
    End If
    Call fillAlphaSeries(xvals, ser1, ser2, ser3, ser4, ser5, OTVS)
    Call setAxesFormat(xlValue, plotTypeAxisLabel, 13, reverseValOrder)
    Call setAxesFormat(xlCategory, "N", 13, reverseValOrder)
    Call addChartLegend
    If plotTypeTitleLabel = "Total Variation" Then
        roundtTo = 500#
        Call setAlphaChartSizing(60.467)
    ElseIf plotTypeTitleLabel = "RSP % Error" Then
        roundtTo = 0.2
        Call setAlphaChartSizing(85.467)
    ElseIf plotTypeTitleLabel = "Standard Deviation" Then
        roundtTo = 0.001
        Call setAlphaChartSizing(76.467)
    Else
        roundtTo = 0.1
        Call setAlphaChartSizing(85.467)
    End If
    Dim plotDataRange As Range: Set plotDataRange = Union(ser1, ser2, ser3, ser4, ser5, OTVS)
    ActiveChart.Axes(xlValue).MaximumScale = getAxisBounds(Application.WorksheetFunction.Max(plotDataRange), roundtTo, True)
    ActiveChart.Axes(xlValue).MinimumScale = getAxisBounds(Application.WorksheetFunction.Min(plotDataRange), roundtTo, False)

End Sub
'------------------------------------------------------------------------------------------------------------------------------------------
Function plotTVVsAlpha(xvals As Range, ser1 As Range, ser2 As Range, ser3 As Range, ser4 As Range, ser5 As Range, OTVS As Range, iterations As Integer, lambda As Double, outputCell As Range)
    Call createVsAlphaChart("Total Variation", "Total Variation (TV)", xvals, ser1, ser2, ser3, ser4, ser5, OTVS, iterations, lambda, "", False, outputCell)
End Function
'------------------------------------------------------------------------------------------------------------------------------------------
Function plotRSPerrorVsAlpha(xvals As Range, ser1 As Range, ser2 As Range, ser3 As Range, ser4 As Range, ser5 As Range, OTVS As Range, iterations As Integer, lambda As Double, material As String, reverseValOrder As Boolean, outputCell As Range)
    Call createVsAlphaChart("RSP % Error", "RSP Error (%)", xvals, ser1, ser2, ser3, ser4, ser5, OTVS, iterations, lambda, material, reverseValOrder, outputCell)
End Function
'------------------------------------------------------------------------------------------------------------------------------------------
Function plotStdDevVsAlpha(xvals As Range, ser1 As Range, ser2 As Range, ser3 As Range, ser4 As Range, ser5 As Range, OTVS As Range, iterations As Integer, lambda As Double, material As String, outputCell As Range)
    Call createVsAlphaChart("Standard Deviation", "Standard Deviation", xvals, ser1, ser2, ser3, ser4, ser5, OTVS, iterations, lambda, material, False, outputCell)
End Function
'******************************************************************************************************************************************
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'******************************************************************************************************************************************


