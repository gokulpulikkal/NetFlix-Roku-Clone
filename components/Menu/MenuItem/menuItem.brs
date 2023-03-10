function init()
    m.top.id = "markupListItem"
    m.menuButton = m.top.findNode("button")

    ' Constants
    m.ICON_GROUP_INITIAL_X_TRANSLATION = 30
    m.LABEL_INITIAL_X_TRANSLATION = -450
    m.ICON_GROUP_FINAL_X_TRANSLATION = 60
    m.LABEL_FINAL_X_TRANSLATION = 140
    m.SHOW_ANIMATION_DURATION = 0.1

    ' Animation references
    m.iconShowingAnimation = m.top.findNode("iconShowingAnimation")
    m.labelShowingAnimation = m.top.findNode("labelShowingAnimation")
    m.iconGroupInterpolator = m.top.findNode("IconGroupInterpolator")
    m.labelInterpolator = m.top.findNode("labelInterpolator")
    m.hidingAnimation = m.top.findNode("hidingAnimation")
    m.iconGroupHidingInterpolator = m.top.findNode("IconGroupHidingInterpolator")
    m.labelHidingInterpolator = m.top.findNode("labelHidingInterpolator")

    ' Observations
    m.global.observeField("showMenu", "onShowMenuChanges")

    setInitialTranslation()
    setUpAnimationValues()
end function

function setInitialTranslation() as void
    m.menuButton.iconPosterLGTranslation = [m.ICON_GROUP_INITIAL_X_TRANSLATION, 0]
    m.menuButton.itemLabelTranslation = [m.LABEL_INITIAL_X_TRANSLATION, 0]
end function

function setUpAnimationValues() as void
    m.iconGroupInterpolator.key = [0.0, 1.0]
    m.iconGroupInterpolator.keyValue = [[m.ICON_GROUP_INITIAL_X_TRANSLATION, 0], [m.ICON_GROUP_FINAL_X_TRANSLATION, 0]]
    m.labelInterpolator.key = [0.0, 1.0]
    m.labelInterpolator.keyValue = [[m.LABEL_INITIAL_X_TRANSLATION, 0], [m.LABEL_FINAL_X_TRANSLATION, 0]]
    m.iconGroupHidingInterpolator.key = [0.0, 1.0]
    m.iconGroupHidingInterpolator.keyValue = [[m.ICON_GROUP_FINAL_X_TRANSLATION, 0], [m.ICON_GROUP_INITIAL_X_TRANSLATION, 0]]
    m.labelHidingInterpolator.key = [0.0, 1.0]
    m.labelHidingInterpolator.keyValue = [[m.LABEL_FINAL_X_TRANSLATION, 0], [m.LABEL_INITIAL_X_TRANSLATION, 0]]
end function

function showContent()
    itemContent = m.top.itemContent
    m.menuButton.iconURI = itemContent.url
    m.menuButton.text = itemContent.title

    ' Set animation speed
    m.labelShowingAnimation.duration = m.SHOW_ANIMATION_DURATION + (itemContent.index/20)
end function

function showFocus()
    m.menuButton.cursorOpacity = m.top.focusPercent
    if (m.top.focusPercent > 0.5 AND m.top.listHasFocus)
        m.menuButton.showFocus = true
    else
        m.menuButton.showFocus = false
    end if
end function

function onListHasFocus(event as object) as void
    isListHasFocus = event.getData()
    if (isListHasFocus = true)
        showFocus()
    else
        m.menuButton.showFocus = false
    end if
end function

function onShowMenuChanges() as void
    showMenu = m.global.showMenu
    if (showMenu)
        showItem()
    else
        hideItem()
    end if
end function

' Animation handling 
function showItem() as void
    m.hidingAnimation.control = "stop"
    m.iconShowingAnimation.control = "start"
    m.labelShowingAnimation.control = "start"
end function

function hideItem() as void
    m.labelShowingAnimation.control = "stop"
    m.iconShowingAnimation.control = "stop"
    m.hidingAnimation.control = "start"
end function