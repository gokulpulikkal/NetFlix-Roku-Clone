function init() as void
    m.menuList = m.top.findNode("exampleMarkupList")
    m.menuList.content = CreateObject("roSGNode", "MarkupListContent")
    examplerect = m.menuList.boundingRect()
    centerx = (1920 - examplerect.width) / 2
    centery = (1080 - examplerect.height) / 2
    m.menuList.translation = [ 40, centery + 46 ]

    m.top.observeField("focusedChild", "onFocusChildChange")
end function

function onFocusChildChange() as void
    if m.top.hasFocus()
        m.menuList.setFocus(true)
    else

    end if
end function