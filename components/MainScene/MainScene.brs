function init() as void
    initializeScreenManager()
    m.menu = m.top.findNode("menu")
    m.top.setFocus(true)

    ' Show the splash screen here and call necessary API's to start the app

    ' For now calling the Home screen directly since the API's haven't been integrated
    goToScreen({type:"HomeView"})
end function

function onKeyEvent(key as String, press as Boolean) as Boolean
  handled = false
  if press then
    if (key = "right") then
      focusTheTopView()
      handled = true
    else
      m.menu.setFocus(true)
      handled = true
    end if
  end if
  return handled
end function