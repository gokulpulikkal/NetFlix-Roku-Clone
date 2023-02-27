function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    if press then
        if (key = "up") then
            m.profileBtnGroup.setFocus(true)
            handled = true
        else if (key = "down")
            if (m.profileBtnGroup.hasFocus())
                m.menuList.setFocus(true)
                handled = true
            else
                handled = false
            end if
        end if
    end if
    return handled
end function