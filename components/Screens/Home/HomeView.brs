sub init()
    m.rowlist = m.top.findNode("mainRowList")
    m.rowlist.setFocus(true)
    m.top.observeField("focusedChild", "onFocusChange")
    getRowListData()
end sub

sub onFocusChange()
    if m.top.hasFocus()
      m.rowlist.setFocus(true)
    end if
end sub