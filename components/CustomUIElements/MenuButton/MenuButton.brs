
function init() as void
    m.itemLabel = m.top.findNode("itemLabel")
    m.top.observeField("focusedChild", "onFocusChange")
end function

function onFocusChange() as void
    hasFocus = m.top.showFocus OR m.top.hasFocus()
    if (hasFocus)
        m.itemLabel.color = "#FF0000"
    else
        m.itemLabel.color = "#FFFF"
    end if
end function