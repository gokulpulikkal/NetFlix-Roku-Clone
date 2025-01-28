sub init()
    m.rowlist = m.top.findNode("mainRowList")
    m.rowlist.setFocus(true)
    
    m.rowlist.observeField("rowItemSelected", "onItemSelectedRowList")
    getRowListData()
end sub

sub onFocusChange()
    if m.top.hasFocus()
      m.rowlist.setFocus(true)
    end if
end sub

sub onItemSelectedRowList(event as Object) as void
    indexes = event.getData()
    if indexes <> invalid
      rowContent = m.rowlist.content.getChild(indexes[0])
      if rowContent <> invalid
        rowItem = rowContent.getChild(indexes[1])
        if rowItem <> invalid
          goToScreen({type:"DetailsScreen", data:rowItem})
        end if
      end if
    end if
end sub