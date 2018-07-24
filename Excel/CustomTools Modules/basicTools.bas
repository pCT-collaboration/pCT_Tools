Attribute VB_Name = "basicTools"
'Tools.bas (UDF)
'Collection of basiclow-level User Defined Functions (UDFs) and Subroutines for performing basic application, math, string, and cell(s)/Range tasks
'******************************************************************************************************************************************
'------------------------------------------------------------------------------------------------------------------------------------------
'----------------------------------------------------------- Generic Functions ------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'******************************************************************************************************************************************
'------------------------------------------------------------------------------------------------------------------------------------------
Private Sub Workbook_Open()
    Application.Calculation = xlCalculationManual
End Sub
'------------------------------------------------------------------------------------------------------------------------------------------
Sub printVar(var As Variant, msg As String)
    MsgBox msg & " = " & var
End Sub
'------------------------------------------------------------------------------------------------------------------------------------------
Sub echoAssign(assignment As Variant, var As Variant, msg As String, printOn As Boolean)
    var = ActiveSheet.Evaluate(assignment)
    If printOn Then
        MsgBox msg & " = " & var
    End If
End Sub
''******************************************************************************************************************
''------------------------------------------------------------------------------------------------------------------
''------------------------------------------------- TextFormula ----------------------------------------------------
''------------------------------------------------------------------------------------------------------------------
''******************************************************************************************************************
Function TextFormula(Ref As String)
    Application.Volatile
    Dim theString As String
    theString = Application.ThisCell.Parent.Evaluate(Ref)
    TextFormula = theString
End Function
'******************************************************************************************************************************************
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------- Math Functions -------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'******************************************************************************************************************************************
Function fixNumError(ByVal value As Variant) As Variant
    fixNumError = round(value, 10)
End Function
'------------------------------------------------------------------------------------------------------------------------------------------
Function stripInt(value As Variant) As Variant
    stripInt = round(value - Int(value), 10)
End Function
'------------------------------------------------------------------------------------------------------------------------------------------
Function XLMod(a As Variant, n As Variant, Optional roundVal As Boolean = False) As Variant 'a = nq + r
   'XLMod = a Mod n
    'XLMod = a - n * (a \ n)
    XLMod = a - n * Int(a / n)
    If roundVal Then
        XLMod = round(XLMod, 10)
    End If
End Function
'------------------------------------------------------------------------------------------------------------------------------------------
Function fMod(ByVal operand As Variant, ByVal divisor As Variant) As Variant
    Dim scalePow As Variant: scalePow = decimalZeros(divisor)
    Dim scaleFactor As Variant: scaleFactor = 10 ^ scalePow
    Dim intOperand As Variant: intOperand = operand * scaleFactor
    Dim intDivisor As Variant: intDivisor = divisor * scaleFactor
    fMod = XLMod(intOperand, intDivisor, True)
    If fMod > 0 Then
        fMod = intDivisor - fMod
    End If
    fMod = fMod / scaleFactor
End Function
'------------------------------------------------------------------------------------------------------------------------------------------
Function precisionOf(ByVal value As Variant) As Variant
    precisionOf = 0
    Do While value <> 0
        value = value * 10
        value = stripInt(value)
        precisionOf = precisionOf + 1
    Loop
End Function
'------------------------------------------------------------------------------------------------------------------------------------------
Function decimalZeros(ByVal value As Variant) As Variant
    decimalZeros = 0
    Do While value * 10 ^ decimalZeros < 1
        decimalZeros = decimalZeros + 1
    Loop
End Function
'------------------------------------------------------------------------------------------------------------------------------------------
Function intOrderOf(ByVal value As Variant) As Variant
    intOrderOf = 0
    value = Int(value)
    Do While value / 10 > 1
        value = value / 10
        intOrderOf = intOrderOf + 1
    Loop
End Function
'------------------------------------------------------------------------------------------------------------------------------------------
Function orderOf(ByVal value As Variant) As Variant
    orderOf = 0
    If value >= 1# Then
        orderOf = intOrderOf(value)
    Else
        orderOf = -decimalZeros(value)
    End If
End Function
'------------------------------------------------------------------------------------------------------------------------------------------
'******************************************************************************************************************************************
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------- Math Functions -------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'******************************************************************************************************************************************
Public Enum RoundingDirection
    Nearest
    Up
    Down
End Enum
'------------------------------------------------------------------------------------------------------------------------------------------
Function GetRoundedNumber(ByVal number As Variant, ByVal multiplier As Variant, ByVal direction As RoundingDirection) As Variant
    Dim nearestValue As Variant: nearestValue = (CInt(number / multiplier) * multiplier)
    Select Case direction
        Case RoundingDirection.Nearest
            GetRoundedNumber = nearestValue
        Case RoundingDirection.Up
            If nearestValue >= number Then
                GetRoundedNumber = nearestValue
            Else
                GetRoundedNumber = nearestValue + multiplier
            End If
        Case RoundingDirection.Down
            If nearestValue <= number Then
                GetRoundedNumber = nearestValue
            Else
                GetRoundedNumber = nearestValue - multiplier
            End If
    End Select
End Function
'******************************************************************************************************************************************
'------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------------ String Functions ------------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'******************************************************************************************************************************************
'----------------------------------------- Substring Occurence Counting -------------------------------------------
Function CountOccurrences(sText As String, sSearchTerm As String) As Long
    On Error GoTo Error_Handler
    CountOccurrences = UBound(Split(sText, sSearchTerm))
Error_Handler_Exit:
    On Error Resume Next
    Exit Function
Error_Handler:
    MsgBox "MS Access has generated the following error" & vbCrLf & vbCrLf & _
           "Error Number: " & Err.number & vbCrLf & _
           "Error Source: CountOccurrences" & vbCrLf & _
           "Error Description: " & Err.Description, vbCritical, "An Error has Occured!"
    Resume Error_Handler_Exit
End Function
'------------------------------------------------- CSV Parsing ----------------------------------------------------
Public Function CSVindex(CSVtext As Range, startIndex As Range)
'Public Function CSVparse(CSVtext As Range, startIndex As Integer)
    Dim strLeft, strRight As Integer, theString As String
    theString = CSVtext.value
    CSVindex = ""
    If IsError(startIndex) Or IsEmpty(startIndex) Then Exit Function
    If startIndex > 1 Then
        strLeft = InStr(startIndex, theString, ", ")
        strRight = InStr(strLeft + 1, theString, ", ")
        strLeft = strLeft + 2
     Else
        strLeft = 1
        strRight = InStr(strLeft + 1, theString, ", ")
    End If
    If strLeft = 0 Then Exit Function
    If strRight = 0 Then strRight = Len(theString)
    CSVindex = Mid(theString, strLeft, strRight - strLeft)
End Function
'------------------------------------------------- CSV Parsing ----------------------------------------------------
Public Function CSVparse(CSVtext As Range, outputCell As Range)
    Dim i, strLeft, strRight, currentRowOffset, theString As String
    currentRowOffset = Abs(Application.Caller.row - outputCell.row)
    theString = CSVtext.value
    CSVparse = ""
    strRight = -1
    If currentRowOffset > CSVitems(CSVtext.value, ", ") Then Exit Function
    For i = 0 To currentRowOffset
        strLeft = strRight + 2
        strRight = InStr(strLeft, theString, ", ")
        If strRight = 0 Then strRight = Len(CSVtext.value)
    Next i
    CSVparse = Mid(theString, strLeft, strRight - strLeft)
End Function
'--------------------------------------------------------------------------------------------------------------------------------------------
Sub SplitCSV()
    'Dim xRg As Range, xRg1 As Range, xCell As Range, I As Long, xAddress As String, xUpdate As Boolean, xRet As Variant
    Dim xRg, xRg1, xCell As Range, i As Long, xAddress As String, xUpdate As Boolean, xRet As Variant
    On Error Resume Next
    xAddress = Application.ActiveWindow.RangeSelection.Address
    Set xRg = Application.InputBox("Please select a range", "Kutools for Excel", xAddress, , , , , 8)
    Set xRg = Application.Intersect(xRg, xRg.Worksheet.UsedRange)
    If xRg Is Nothing Then Exit Sub
    If xRg.Columns.count > 1 Then
        MsgBox "You can't select multiple columns", , "Kutools for Excel"
        Exit Sub
    End If
    Set xRg1 = Application.InputBox("Split to (single cell):", "Kutools for Excel", , , , , , 8)
    Set xRg1 = xRg1.Range("A1")
    If xRg1 Is Nothing Then Exit Sub
    xUpdate = Application.ScreenUpdating
    Application.ScreenUpdating = False
    For Each xCell In xRg
        xRet = Split(xCell.value, ",")
        xRg1.Worksheet.Range(xRg1.Offset(i, 0), xRg1.Offset(i + UBound(xRet, 1), 0)) = Application.WorksheetFunction.Transpose(xRet)
        i = i + UBound(xRet, 1) + 1
    Next
    Application.ScreenUpdating = xUpdate
End Sub
'--------------------------------------------------------------------------------------------------------------------------------------------
'********************************************************************************************************************************************
'--------------------------------------------------------------------------------------------------------------------------------------------
'------------------------------------------------------ Cell(s)/Range Object Functions ------------------------------------------------------
'--------------------------------------------------------------------------------------------------------------------------------------------
'********************************************************************************************************************************************
Function subRange(rng As Range, startPos As Integer, endPos As Integer) As Range
    Set subRange = rng.Parent.Range(rng.Cells(startPos), rng.Cells(endPos))
End Function
'------------------------------------------------------------------------------------------------------------------------------------------
Function intersectionOf(rowCell As Range, colCell As Range) As Variant
    'intersectionOf = rowCell.Offset(0, colCell.Column - rowCell.Column)
    intersectionOf = Sheets(colCell.Parent.Name).Cells(rowCell.row, colCell.Column)
End Function
'------------------------------ Identify Column Range by 1st Element or Range Selection  ------------------------------
Function colID2Range(columnIdentifier As Range) As Range
    Dim endColumn, columnRange As Range
    If columnIdentifier.Rows.count = 1 Then
        Set colID2Range = Range(columnIdentifier.Offset(-1, 0), columnIdentifier.End(xlDown))
    Else
        Set colID2Range = Range(columnIdentifier.End(xlUp).Offset(0, 0), columnIdentifier.End(xlDown).Offset(-1, 0))
    End If
End Function
'------------------------------------------------------------------------------------------------------------------------------------------
'********************************************************************************************************************************************
'--------------------------------------------------------------------------------------------------------------------------------------------
'----------------------------------------------------- Cell(s)/Range Content Functions ------------------------------------------------------
'--------------------------------------------------------------------------------------------------------------------------------------------
'********************************************************************************************************************************************
'------------------------------- Count Rows Before Next Nonzero Value (Recursively) -------------------------------
Function QtyZeros(qtyCell As Range) As Integer
    Dim skip As Integer
    If qtyCell.value = 0 Then
        skip = 1 + QtyZeros(qtyCell.Offset(1, 0))
    Else
        skip = 0
    End If
    QtyZeros = skip
End Function
'------------------------------------ Count Rows in 'CellRange' Matching 'val' ------------------------------------
Function countIfEqual(CellRange As Range, val As Variant) As Integer
    Dim cell As Range
    countIfEqual = 0
    For Each cell In CellRange
        If cell.value = val Then
            countIfEqual = countIfEqual + 1
        End If
    Next cell
End Function
'------------------------------------ Find nth non-zero cell in column from 'TopQtyCell' ------------------------------------
Function nthNonzero(TopQtyCell As Range, n As Integer) As Variant
    Dim i As Integer
    Dim zerosAhead As Integer
    Dim cell As Range
    Set cell = TopQtyCell.Offset(0, 0)
    For i = 0 To n
        zerosAhead = QtyZeros(cell)
        Set cell = cell.Offset(zerosAhead + 1, 0)
    Next i
    nthNonzero = cell.Offset(-1, 0)
End Function
'------------------------------------ Find nth cell matching 'val' in column from 'TopQtyCell' ------------------------------------
Function nthEqual(TopCell As Range, n As Integer, val As Variant) As Variant
    Dim count, rowOffset As Integer, cell, endColumn, Column As Range
    Set cell = TopCell
    Set endColumn = TopCell.End(xlDown)
    Set Column = Range(TopCell, endColumn)
    count = 0
    rowOffset = 0
    For Each cell In Column
        If cell.value = val Then
            count = count + 1
        End If
        If count = n Then
            nthEqual = cell.Address
            Exit For
        End If
        rowOffset = rowOffset + 1
    Next cell
    If count < n Or rowOffset > endColumn.row Then
        nthEqual = vbNullString
    End If
End Function
'------------------------------------ Find nth cell NOT matching 'val' in column from 'TopQtyCell' ------------------------------------
Function nthNotEqual(TopCell As Range, n As Integer, val As Variant) As Variant
    Dim count, rowOffset As Integer, cell, endColumn, Column As Range
    Set cell = TopCell
    Set endColumn = TopCell.End(xlDown)
    Set Column = Range(TopCell, endColumn)
    count = 0
    rowOffset = 0
    For Each cell In Column
        If cell.value <> val Then
            count = count + 1
        End If
        If count = n Then
            nthNotEqual = cell.Address
            Exit For
        End If
        rowOffset = rowOffset + 1
    Next cell
    If count < n Or rowOffset > endColumn.row Then
        nthNotEqual = vbNullString
    End If
End Function
'------------------------------------ Find nth non-zero cell matching 'val' in column from 'TopQtyCell' ------------------------------------
Function nthNonzeroEqual(TopQtyCell As Range, TopRefCell As Range, n As Integer, val As Variant) As Variant
    Dim count, rowOffset As Integer, cell, refCell, endQtyColumn, QtyColumn As Range
    Set cell = TopQtyCell
    Set endQtyColumn = TopQtyCell.End(xlDown)
    Set QtyColumn = Range(TopQtyCell, endQtyColumn)
    count = 0
    rowOffset = 0
    For Each cell In QtyColumn
        Set refCell = TopRefCell.Offset(rowOffset, 0)
        If cell.value <> 0 And refCell.value = val Then
            count = count + 1
        End If
        If count = n Then
            nthNonzeroEqual = cell.Address
            Exit For
        End If
        rowOffset = rowOffset + 1
    Next cell
    If count < n Or rowOffset > endQtyColumn.row Then
        nthNonzeroEqual = vbNullString
    End If
End Function
'------------- return T/F ('1/0') if a cell in 'setElements' matches 'element' (and if provided, 'non0check' is non-zero) ----------------------------
Function isElementOf(element As Range, setElements As Range, Optional non0Check As Variant) As Integer
    Dim count As Integer, non0CheckVal As Variant, setElement, valCell, refCell, endQtyColumn, QtyColumn As Range
    If IsMissing(non0Check) Then                                  ' Original implementation w/o optional argument
        non0CheckVal = 1
    Else                                                            ' Implementation w/ optional argument provided
        Set non0CheckVal = non0Check
    End If
    For Each setElement In setElements
        If non0CheckVal.value <> 0 And element.value = setElement.value Then
            count = count + 1
            Exit For
        End If
    Next setElement
    isElementOf = count
End Function
'------------- find nth non-zero cell in 'TopQtyCell' column where corresponding cell in 'TopRefCell column matches cell in 'valCells' column ----------------------------
Function nthNonzeroMemberOf(TopQtyCell As Range, TopRefCell As Range, n As Integer, valCells As Range) As Variant
    Dim count, rowOffset As Integer, qtyCell, endQtyColumn, QtyColumn As Range
    count = 0
    rowOffset = 0
    Set QtyColumn = colID2Range(TopQtyCell)
    Set endQtyColumn = QtyColumn.End(xlDown).Offset(-1, 0)
    
    For Each qtyCell In QtyColumn
        count = count + isElementOf(TopRefCell.Offset(rowOffset, 0), valCells, qtyCell)
        If count = n Then
            nthNonzeroMemberOf = qtyCell.Address
            Exit For
        End If
        rowOffset = rowOffset + 1
    Next qtyCell
    If count < n Or rowOffset > endQtyColumn.row Then
        nthNonzeroMemberOf = vbNullString
    End If
End Function
'------------------------------------------------------------------------------------------------------------------------------------------
'******************************************************************************************************************************************
'------------------------------------------------------------------------------------------------------------------------------------------
'----------------------------------------------------- Shape/DrawingObject Functions ------------------------------------------------------
'------------------------------------------------------------------------------------------------------------------------------------------
'******************************************************************************************************************************************
'------------------------------------------------------------------------------------------------------------------------------------------
Sub deleteAllCharts()
    Dim sht As Worksheet
    For Each sht In ThisWorkbook.Worksheets
        sht.Shapes.SelectAll
        Selection.Delete
        sht.DrawingObjects.Delete
    Next sht
End Sub
'------------------------------------------------------------------------------------------------------------------------------------------
Sub deleteActiveSheetObjects()
    Dim sht As Worksheet
    For Each sht In ActiveWorkbook.Worksheets
        sht.DrawingObjects.Delete
    Next sht
End Sub
'------------------------------------------------------------------------------------------------------------------------------------------
Sub deleteActiveSheetCharts()
    Dim chtObj As ChartObject
    For Each chtObj In ActiveSheet.ChartObjects
        chtObj.Delete
    Next
End Sub
'------------------------------------------------------------------------------------------------------------------------------------------
Function countWorkbookCharts()
    Dim sht As Worksheet, cht As ChartObject, i As Long: i = 0
    For Each sht In ActiveWorkbook.Worksheets
        For Each cht In sht.ChartObjects
            countWorkbookCharts = countWorkbookCharts + 1
        Next cht
    Next sht
End Function
'------------------------------------------------------------------------------------------------------------------------------------------
Sub URLPictureInsert()
'Updateby Extendoffice 20161116
    Dim Pshp As Shape
    On Error Resume Next
    Application.ScreenUpdating = False
    Dim PixUnitsConversion As Double
    Dim ImagePixels As Integer
    ImagePixels = 50
    PixUnitsConversion = 8.43 / 64
    Set rng = ActiveSheet.Range("J5:J36")
    Range("K1").ColumnWidth = PixUnitsConversion * ImagePixels
    '13.171875
    Range("K5:K36").RowHeight = ImagePixels
    For Each cell In rng
        filenam = cell
        ActiveSheet.Pictures.Insert(filenam).Select
        Set Pshp = Selection.ShapeRange.Item(1)
        With Pshp
           .LockAspectRatio = msoTrue
           .Width = ImagePixels
           .Height = ImagePixels
           .Cut
        End With
        Cells(cell.row, cell.Column + 1).PasteSpecial
        'Range("K1").ColumnWidth = 5 * Pshp.Height
    Next
    Application.ScreenUpdating = True
End Sub
'--------------------------------------------------------------------------------------------------------------------------------------------
Sub InstallPictures()
    Dim i As Long, v As String
    For i = 2 To 1903
        v = Cells(i, "J").value
        If v = "" Then Exit Sub
        With ActiveSheet.Pictures
            .Insert (v)
        End With
    Next i
End Sub '
'********************************************************************************************************************************************
'--------------------------------------------------------------------------------------------------------------------------------------------
'--------------------------------------------------------- Notes ----------------------------------------------------------------------------
'--------------------------------------------------------------------------------------------------------------------------------------------
'********************************************************************************************************************************************




