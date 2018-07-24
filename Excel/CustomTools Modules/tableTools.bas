Attribute VB_Name = "tableTools"
'tableTools.bas (UDF)
'Collection of User Defined Functions (UDFs) for working with tables, particularly purchase order/equipment list tables
'******************************************************************************************************************
'------------------------------------------------------------------------------------------------------------------
'------------------------------ Count Rows Before 1st Nonzero Value ------------------------------
'------------------------------------------------------------------------------------------------------------------
'******************************************************************************************************************
Function nonzeroQtysList(TopQtyCell As Range, valCell As Range) As Variant
    nonzeroQtysList = intersectionOf(Range(nthNotEqual(TopQtyCell, 1 + Application.ThisCell.row - TopQtyCell.row, 0)), valCell)
End Function
'------------------------------------------------------------------------------------------------------------------
'------------------------------ List 'listValCol' value for table entries with nonzero Qty & 'matchVals' matching 'RefCell' ------------------------------
'------------------------------------------------------------------------------------------------------------------
'-----------------------> Moved to UDFs & Renamed
Function nonzeroQtysOfList(QtyCol As Range, toMatchCol As Range, listValCol As Range, matchVals As Range, Optional topListCell As Variant) As Variant
    Dim n As Integer, startQtyCol, startListValCol, startToMatchCol, listVals As Range 'Variant
    
    If IsMissing(topListCell) Then                                  ' Original implementation w/o optional argument
        n = Application.ThisCell.row - QtyCol.row
    Else                                                            ' Implementation w/ optional argument provided
        n = Application.ThisCell.row - topListCell.row
    End If
    nonzeroQtysOfList = intersectionOf(Range(nthNonzeroMemberOf(QtyCol, toMatchCol.End(xlUp), 1 + n, matchVals)), listValCol)
    'nonzeroQtysOfList = intersectionOf(Range(nthNonzeroMemberOf(QtyCol, toMatchCol.End(xlUp), 1 + Application.ThisCell.row - QtyCol.row, matchVals)), listValCol)
End Function 'matchVals.End(xlUp)
'------------------------------------------------------------------------------------------------------------------
'------------------------------ Count Rows Before 1st Nonzero Value ------------------------------
'------------------------------------------------------------------------------------------------------------------
Function nonzeroQtysOfRow(TopQtyCell As Range, TopRefCell As Range, listCell As Range, valCell As Range) As Variant
    nonzeroQtysOfRow = intersectionOf(Range(nthNonzeroMemberOf(TopQtyCell, TopRefCell, 1 + Application.ThisCell.row - TopQtyCell.row, valCell)), Range("$A$20")) ').EntireRow.FillDown
    'nonzeroQtysOfRow = Range(nthNonzeroMemberOf(TopQtyCell, TopRefCell, 1 + Application.ThisCell.row - TopQtyCell.row, valCell)).Address '.EntireRow '.FillDown
End Function
'------------------------------------------------------------------------------------------------------------------
'------------------------------ List 'listValCol' value for table entries with nonzero Qty & 'matchVals' matching 'RefCell' ------------------------------
'------------------------------------------------------------------------------------------------------------------
'-----------------------> Moved to UDFs & Renamed
Function nonzeroQtysOfListRows(tableTLCorner As Range, QtyCol As Range, toMatchCol As Range, matchVals As Range, Optional listTLCorner As Variant) As Variant
    Dim rowOffset, colOffset, tableLeftCol, tableTopRow, listLeftCol, listTopRow, listRow, listCol  As Integer
    tableTopRow = tableTLCorner.row
    tableLeftCol = tableTLCorner.Column
    listRow = Application.ThisCell.row
    listCol = Application.ThisCell.Column
    
    If IsMissing(listTLCorner) Then                                  ' Original implementation w/o optional argument
        rowOffset = listRow - tableTopRow
        colOffset = listCol - tableLeftCol
    Else                                                            ' Implementation w/ optional argument provided
        listTopRow = listTLCorner.row
        listLeftCol = listTLCorner.Column
        rowOffset = listRow - listTopRow
        colOffset = listCol - listLeftCol
    End If
   
    nonzeroQtysOfListRows = intersectionOf(Range(nthNonzeroMemberOf(QtyCol, toMatchCol.End(xlUp), 1 + rowOffset, matchVals)), tableTLCorner.Offset(rowOffset, colOffset))
End Function
'******************************************************************************************************************
'------------------------------------------------------------------------------------------------------------------
'------------------------------ Count Rows Before 1st Nonzero Value ------------------------------
'------------------------------------------------------------------------------------------------------------------
'******************************************************************************************************************
Function nthVendorMatch(VendorCol As Range, n As Integer, vendorsDesired As Range) As Variant
    Dim matchCount, vendorRow As Integer, vendor, endVendorCol, vendorRange, vendorElement As Range
    matchCount = 0
    vendorRow = 0
    Set vendorRange = colID2Range(VendorCol)
    Set endVendorCol = vendorRange.End(xlDown).Offset(-1, 0)
    
    For Each vendor In vendorRange
        For Each vendorElement In vendorsDesired
            If vendor.value = vendorElement Then
                matchCount = matchCount + 1
            End If
        Next vendorElement
        If matchCount = n Then
            nthVendorMatch = vendor.Address
            Exit For
        End If
        vendorRow = vendorRow + 1
    Next vendor
    If matchCount < n Or vendorRow > endVendorCol.row Then
        nthVendorMatch = vbNullString
    End If
End Function
'------------------------------------------------------------------------------------------------------------------
'------------------------------ List 'listValCol' value for table entries with nonzero Qty & 'matchVals' matching 'RefCell' ------------------------------
'------------------------------------------------------------------------------------------------------------------
' nthEqual(TopCell As Range, n As Integer, val As Variant) As Variant
Function VendorFilteredRows(tableTLCorner As Range, toMatchCol As Range, matchToVals As Range, Optional listTLCorner As Variant) As Variant
    'Dim rowOffset, colOffset As Integer
    Dim rowOffset, colOffset, tableLeftCol, tableTopRow, listLeftCol, listTopRow, listRow, listCol  As Integer
    
    tableTopRow = tableTLCorner.row
    tableLeftCol = tableTLCorner.Column
    listRow = Application.ThisCell.row
    listCol = Application.ThisCell.Column
    
    If IsMissing(listTLCorner) Then                                  ' Original implementation w/o optional argument
        rowOffset = listRow - tableTopRow
        colOffset = listCol - tableLeftCol
    Else                                                            ' Implementation w/ optional argument provided
        listTopRow = listTLCorner.row
        listLeftCol = listTLCorner.Column
        rowOffset = listRow - listTopRow
        colOffset = listCol - listLeftCol
    End If
    
    'VendorFilteredRows = nthVendorMatch(toMatchCol, 1 + rowOffset, matchToVals)
    'VendorFilteredRows = nthVendorMatch(toMatchCol, 1 + rowOffset, matchToVals)
    VendorFilteredRows = intersectionOf(Range(nthVendorMatch(toMatchCol, 1 + rowOffset, matchToVals)), tableTLCorner.Offset(rowOffset, colOffset))
    'VendorFilteredRows = Range(nthVendorMatch(toMatchCol, 1 + rowOffset, matchToVals)).Offset(0, 0)
    'QtyGt0_MatchedValRows non0QtyVendorFilteredRows rowFiltBy_Non0QtyVendor non0QtyVendorFiltRows
    'VendorFilteredRows = intersectionOf(Range(nthNonzeroMemberOf(QtyCol, toMatchCol.End(xlUp), 1 + rowOffset, matchToVals)), tableTLCorner.Offset(rowOffset, colOffset))
    'nonzeroQtysOfListRows = intersectionOf(Range(nthNonzeroMemberOf(QtyCol, toMatchCol.End(xlUp), 1 + rowOffset, matchVals)), tableTLCorner.Offset(rowOffset, colOffset))
End Function
'------------------------------------------------------------------------------------------------------------------
'------------------------------ List 'listValCol' value for table entries with nonzero Qty & 'matchVals' matching 'RefCell' ------------------------------
'------------------------------------------------------------------------------------------------------------------
Function VendorFilteredNon0QtyList(QtyCol As Range, toMatchCol As Range, listValCol As Range, matchToVals As Range, Optional topListCell As Variant) As Variant
    Dim n As Integer, startQtyCol, startListValCol, startToMatchCol, listVals As Range 'Variant
    
    If IsMissing(topListCell) Then                                  ' Original implementation w/o optional argument
        n = Application.ThisCell.row - QtyCol.row
    Else                                                            ' Implementation w/ optional argument provided
        n = Application.ThisCell.row - topListCell.row
    End If 'non0QtyVendorFilteredList listFiltBy_Non0QtyVendor non0QtyVendorFiltList
    VendorFilteredNon0QtyList = intersectionOf(Range(nthNonzeroMemberOf(QtyCol, toMatchCol.End(xlUp), 1 + n, matchToVals)), listValCol)
    'VendorFilteredNon0QtyList = intersectionOf(Range(nthNonzeroMemberOf(QtyCol, toMatchCol.End(xlUp), 1 + Application.ThisCell.row - QtyCol.row, matchToVals)), listValCol)
End Function 'matchVals.End(xlUp)
'------------------------------------------------------------------------------------------------------------------
'------------------------------ List 'listValCol' value for table entries with nonzero Qty & 'matchVals' matching 'RefCell' ------------------------------
'------------------------------------------------------------------------------------------------------------------
Function VendorFilteredNon0QtyRows(tableTLCorner As Range, QtyCol As Range, toMatchCol As Range, matchToVals As Range, Optional listTLCorner As Variant) As Variant
    'Dim rowOffset, colOffset As Integer
    Dim rowOffset, colOffset, tableLeftCol, tableTopRow, listLeftCol, listTopRow, listRow, listCol  As Integer
    
    tableTopRow = tableTLCorner.row
    tableLeftCol = tableTLCorner.Column
    listRow = Application.ThisCell.row
    listCol = Application.ThisCell.Column
    
    If IsMissing(listTLCorner) Then                                     ' Original implementation w/o optional argument
        rowOffset = listRow - tableTopRow
        colOffset = listCol - tableLeftCol
    Else                                                                ' Implementation w/ optional argument provided
        listTopRow = listTLCorner.row
        listLeftCol = listTLCorner.Column
        rowOffset = listRow - listTopRow
        colOffset = listCol - listLeftCol
    End If
    'MsgBox tableTLCorner.End(xlDown).row
    If rowOffset < 0 Or rowOffset > tableTLCorner.End(xlDown).row Then
        VendorFilteredNon0QtyRows = vbNullString
    Else
        'QtyGt0_MatchedValRows non0QtyVendorFilteredRows rowFiltBy_Non0QtyVendor non0QtyVendorFiltRows
        VendorFilteredNon0QtyRows = intersectionOf(Range(nthNonzeroMemberOf(QtyCol, toMatchCol.End(xlUp), 1 + rowOffset, matchToVals)), tableTLCorner.Offset(rowOffset, colOffset))
    End If
End Function

