sub init()
    m.title = m.top.findNode("title")
    m.subTitle = m.top.findNode("subTitle")
    m.playButton = m.top.findNode("playButton")
    m.poster = m.top.findNode("poster")
end sub

sub onOpen(data as object)
    m.playButton.setFocus(true)
    data = data.data
    if data <> invalid
        m.title.text = data.title
        m.subTitle.text = data.description
        m.poster.uri = data.image
    end if
end sub

sub onFocusChange()
    if m.top.hasFocus()
        m.playButton.setFocus(true)
    end if
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    if press then
      if (key = "back") then
        goBack({closeCurrent: true})
        handled = true
      end if
    end if
    return handled
end function