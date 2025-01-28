
'''''''''
' initializeScreenManager: initializes ScreenManager object and saves it to the global node
' This should Only be called once from the main scene
' 
'''''''''
function initializeScreenManager() as void
    m.global.append({screenManager: createObject("roSGNode","ScreenManager")})
end function


'''''''''
' goToScreen: calls the respective function in screen manager to show new view
' 
' @param {object} data: Data required for showing the view. eg:- {type:"HomeView", closeCurrent: false}
'''''''''
function goToScreen(data as object) as void
    m.global.screenManager.callFunc("goToScreen", data)
end function

'''''''''
' goBack: calls the respective function in screen manager to pop the current view from stack
' 
' @param {object} data: additional instructions for popping the current view. eg:- {closeCurrent: false}
'''''''''
function goBack(data as object) as void
    m.global.screenManager.callFunc("goBack", data)
end function

'''''''''
' focusTheTopView: Focuses the current top view in the screenManager view stack
' 
'''''''''
function focusTheTopView() as void
    m.global.screenManager.callFunc("focusTheTopView")
end function

'''''''''
' showLoadingScreen: function to show/hide the loading screen
' 
' @param {boolean} data: boolean toggle to show/hide the loading screen
'''''''''
function showLoadingScreen(data as boolean) as void
    m.global.screenManager.callFunc("showLoadingScreen", data)
end function