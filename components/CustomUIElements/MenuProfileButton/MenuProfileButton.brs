function init() as void
    ' Constants

    ' References
    m.focusOutline = m.top.findNode("focusOutLineRectangle")
    m.profileNameLabel = m.top.findNode("profileNameLabel")

    ' Observers
    m.top.observeField("focusedChild", "onFocusChange")
end function

function onFocusChange() as void
    hasFocus = m.top.showFocus OR m.top.hasFocus()
    if (hasFocus)
        m.focusOutline.visible = true
        m.profileNameLabel.color = "#FFFFFF"
        m.profileNameLabel.fontStyle = "Black"
    else
        m.focusOutline.visible = false
        m.profileNameLabel.color = "#8B8B8B"
        m.profileNameLabel.fontStyle = "Medium"
    end if
end function