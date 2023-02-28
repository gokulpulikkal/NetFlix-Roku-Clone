function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    if press then
        if (key = "up") then
            handled = true
            if (m.notificationButton.hasFocus())
                m.menuList.setFocus(true)
            else if (m.menuList.hasFocus())
                m.profileBtnGroup.setFocus(true)
            else
                handled = false
            end if
        else if (key = "down")
            handled = true
            if (m.profileBtnGroup.hasFocus())
                m.menuList.setFocus(true)
            else if (m.menuList.hasFocus())
                m.notificationButton.setFocus(true)
            else
                handled = false
            end if
        else if (key = "right")
            handled = true
            if (m.notificationButton.hasFocus())
                m.getHelpButton.setFocus(true)
            else if (m.getHelpButton.hasFocus())
                m.exitButton.setFocus(true)
            else
                handled = false
            end if
        else if (key = "left")
            handled = true
            if (m.exitButton.hasFocus())
                m.getHelpButton.setFocus(true)
            else if (m.getHelpButton.hasFocus())
                m.notificationButton.setFocus(true)
            else
                handled = false
            end if
        end if
    end if
    return handled
end function