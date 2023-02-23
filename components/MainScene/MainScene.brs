function init() as void
    m.global.append({screenManager: createObject("roSGNode","ScreenManager")})

    m.global.screenManager.callFunc("goToScreen",{type:"HomeView", data:m.movies})
end function
