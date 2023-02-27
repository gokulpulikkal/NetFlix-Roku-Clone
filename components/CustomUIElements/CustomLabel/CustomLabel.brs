function init() as void
    m.font = m.top.findNode("font")
    m.font.uri = getFontURI()
    m.font.size = m.top.fontSize
end function

function updateFont() as void
    m.font.uri = getFontURI()
end function

function getFontURI() as string
    fontName = m.top.fontFamily
    fontStyle = m.top.fontStyle
    return Substitute("pkg:/fonts/{0}-{1}.ttf", fontName, fontStyle)
end function