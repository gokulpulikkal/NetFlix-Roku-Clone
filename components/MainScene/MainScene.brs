function init() as void
    m.global.append({screenManager: createObject("roSGNode","ScreenManager")})

    m.menu = m.top.findNode("menu")
    m.Button = m.top.findNode("Button")
    m.menu.setFocus(true)

    ' m.global.screenManager.callFunc("goToScreen",{type:"HomeView", data:m.movies})
end function

function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    if press then
      if (key = "up") then
        m.Button.setFocus(true)
        handled = false
      else
        m.menu.setFocus(true)
        handled = true
      end if
    end if
    return handled
  end function