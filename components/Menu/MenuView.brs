function init() as void
    m.menuList = m.top.findNode("exampleMarkupList")
    content = CreateObject("roSGNode", "MarkupListContent")

    for i = 0 to content.getChildCount() - 1
        child = content.getChild(i)
        child.update({"index": i}, true)
    end for


    m.menuList.content = content
    examplerect = m.menuList.boundingRect()
    centerx = (1920 - examplerect.width) / 2
    centery = (1080 - examplerect.height) / 2
    m.menuList.translation = [0, centery + 46 ]

    m.top.observeField("focusedChild", "onFocusChildChange")
end function

function onFocusChildChange() as void
    if m.top.hasFocus()
        m.menuList.setFocus(true)
    else

    end if
end function