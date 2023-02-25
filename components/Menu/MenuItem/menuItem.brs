sub init()
    m.top.id = "markuplistitem"
    m.itemicon = m.top.findNode("itemIcon")
    m.itemlabel = m.top.findNode("itemLabel")
    m.itemcursor = m.top.findNode("itemcursor")
end sub

sub showcontent()
    itemcontent = m.top.itemContent
    m.itemicon.uri = itemcontent.url
    m.itemlabel.text = itemcontent.title
end sub

sub showfocus()
    m.itemcursor.opacity = m.top.focusPercent
end sub