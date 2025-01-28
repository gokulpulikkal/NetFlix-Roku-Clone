function init() as void
    initializeScreenManager()
    m.menu = m.top.findNode("menu")
    m.busySpinner = m.top.findNode("spinner")
    m.busySpinner.poster.observeField("loadStatus", "setUpSpinner")

    m.top.setFocus(true)

    ' Show the splash screen here and call necessary API's to start the app

    ' For now calling the Home screen directly since the API's haven't been integrated
    goToScreen({type:"HomeView"})
end function

' This function is a private function only called when Main scene is getting initialized
sub setUpSpinner()
  centerX = (1920 - m.busySpinner.poster.bitmapWidth) / 2
  centerY = (1080 - m.busySpinner.poster.bitmapHeight) / 2
  m.busySpinner.translation = [ centerX, centerY ]
end sub

'This Should get called whenever the spinner needs to be shown or hidden
sub toggleSpinner(toggle as Boolean)
  m.busySpinner.visible = toggle
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
  handled = false
  if press then
    if (key = "right") then
      focusTheTopView()
      handled = true
    else if (key = "left") then
      m.menu.setFocus(true)
      handled = true
    end if
  end if
  return handled
end function