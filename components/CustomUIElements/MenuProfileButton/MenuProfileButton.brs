function init() as void
    m.top.observeField("focusedChild", "onFocusChange")
end function

function onFocusChange() as void
    hasFocus = m.top.showFocus OR m.top.hasFocus()
    if (hasFocus)
        
    else
        
    end if
end function