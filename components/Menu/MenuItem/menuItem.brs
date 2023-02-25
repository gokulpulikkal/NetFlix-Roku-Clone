function init()
    m.top.id = "markupListItem"
    m.itemIcon = m.top.findNode("itemIcon")
    m.itemLabel = m.top.findNode("itemLabel")
    m.itemCursor = m.top.findNode("itemCursor")
    m.iconLayoutGroup = m.top.findNode("iconLayoutGroup")

    ' Constants
    m.ICON_GROUP_INITIAL_X_TRANSLATION = 30
    m.LABEL_INITIAL_X_TRANSLATION = -450
    m.ICON_GROUP_FINAL_X_TRANSLATION = 50
    m.LABEL_FINAL_X_TRANSLATION = 120
    m.SHOW_ANIMATION_DURATION = 0.2

    ' Animation references
    m.showingAnimation = m.top.findNode("showingAnimation")
    m.iconGroupInterpolator = m.top.findNode("IconGroupInterpolator")
    m.labelInterpolator = m.top.findNode("labelInterpolator")
    m.hidingAnimation = m.top.findNode("hidingAnimation")
    m.iconGroupHidingInterpolator = m.top.findNode("IconGroupHidingInterpolator")
    m.labelHidingInterpolator = m.top.findNode("labelHidingInterpolator")

    setInitialTranslation()
    setUpAnimationValues()
end function

function setInitialTranslation() as void
    m.iconLayoutGroup.translation = [m.ICON_GROUP_INITIAL_X_TRANSLATION, 0]
    m.itemLabel.translation = [m.LABEL_INITIAL_X_TRANSLATION, 0]
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
    m.itemIcon.uri = itemContent.url
    m.itemLabel.text = itemContent.title

    ' Set animation speed
    m.showingAnimation.duration = m.SHOW_ANIMATION_DURATION + (itemContent.index/10)
end function

function showFocus()
    m.itemCursor.opacity = m.top.focusPercent
end function

function onListHasFocus(event as object) as void
    isFocusOnList = event.getData()
    if (isFocusOnList)
        showItem()
    else
        hideItem()
    end if
end function

' Animation handling 
function showItem() as void
    m.showingAnimation.control = "start"
end function

function hideItem() as void
    m.hidingAnimation.control = "start"
end function