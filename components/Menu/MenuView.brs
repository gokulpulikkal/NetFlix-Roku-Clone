function init() as void
    ' Constants
    m.PROFILE_GROUP_INITIAL_TRANSLATION = [-400, 50]
    m.PROFILE_GROUP_FINAL_TRANSLATION = [50, 50]
    m.NOTIFICATION_ICON_INITIAL_TRANSLATION = [-400, 1000]
    m.NOTIFICATION_ICON_FINAL_TRANSLATION = [50, 1000]
    m.NOTIFICATION_LABEL_INITIAL_TRANSLATION = [-400, 1000]
    m.NOTIFICATION_LABEL_FINAL_TRANSLATION = [130, 1000]
    m.RIGHT_END_BUTTON_GRP_INITIAL_TRANSLATION = [1100, 1010]
    m.RIGHT_END_BUTTON_GRP_FINAL_TRANSLATION = [1200, 1010]
    m.SHOW_ANIMATION_DURATION = 0.2

    m.notificationLabel = m.top.findNode("notificationLabel")
    m.notificationIcon = m.top.findNode("notificationIcon")
    m.profileLayoutGroup = m.top.findNode("profileLayoutGroup")
    m.rightEndBottomBtnsGroup = m.top.findNode("rightEndBottomBtnsGroup")
    m.menuList = m.top.findNode("exampleMarkupList")

    ' Animation references
    m.profileGroupShowingAnimation = m.top.findNode("profileGroupShowingAnimation")
    m.profileGroupInterpolator = m.top.findNode("profileGroupInterpolator")
    m.notificationIconShowingAnimation = m.top.findNode("notificationIconShowingAnimation")
    m.notificationIconInterpolator = m.top.findNode("notificationIconInterpolator")
    m.bottomLabelsShowingAnimation = m.top.findNode("bottomLabelsShowingAnimation")
    m.notificationLabelInterpolator = m.top.findNode("notificationLabelInterpolator")
    m.rightEndGroupInterpolator = m.top.findNode("rightEndGroupInterpolator")
    m.fadeInAnimation = m.top.findNode("fadeInAnimation")
    
    m.hidingAnimation = m.top.findNode("hidingAnimation")
    m.profileLayoutGroupHideInterpolator = m.top.findNode("profileLayoutGroupHideInterpolator")
    m.notificationIconHideInterpolator = m.top.findNode("notificationIconHideInterpolator")
    m.notificationLabelHideInterpolator = m.top.findNode("notificationLabelHideInterpolator")
    m.rightEndBottomBtnsGroupHideInterpolator = m.top.findNode("rightEndBottomBtnsGroupHideInterpolator")
    m.fadeOutAnimation = m.top.findNode("fadeOutAnimation")

    content = CreateObject("roSGNode", "MarkupListContent")
    for i = 0 to content.getChildCount() - 1
        child = content.getChild(i)
        child.update({"index": i}, true)
    end for
    m.menuList.content = content
    examplerect = m.menuList.boundingRect()
    centerx = (1920 - examplerect.width) / 2
    centery = (1080 - examplerect.height) / 2
    m.menuList.translation = [0, centery + 46 ]

    setAnimationValues()
    setInitialTranslations()

    m.top.observeField("focusedChild", "onFocusChildChange")
end function

function onFocusChildChange() as void
    if m.top.hasFocus()
        m.menuList.setFocus(true)
        showMenuItems(true)
    else
        if (NOT m.menuList.isInFocusChain())
            showMenuItems(false)
        end if
    end if
end function

'''''''''
' setAnimationValues: Sets the values needed for interpolators and animation node to work correctly
' 
'''''''''
function setAnimationValues() as void
    m.profileGroupInterpolator.key = [0.0, 1.0]
    m.profileGroupInterpolator.keyValue = [m.PROFILE_GROUP_INITIAL_TRANSLATION, m.PROFILE_GROUP_FINAL_TRANSLATION]
    m.notificationIconInterpolator.key = [0.0, 1.0]
    m.notificationIconInterpolator.keyValue = [m.NOTIFICATION_ICON_INITIAL_TRANSLATION, m.NOTIFICATION_ICON_FINAL_TRANSLATION]
    m.notificationLabelInterpolator.key = [0.0, 1.0]
    m.notificationLabelInterpolator.keyValue = [m.NOTIFICATION_LABEL_INITIAL_TRANSLATION, m.NOTIFICATION_LABEL_FINAL_TRANSLATION]
    m.rightEndGroupInterpolator.key = [0.0, 1.0]
    m.rightEndGroupInterpolator.keyValue = [m.RIGHT_END_BUTTON_GRP_INITIAL_TRANSLATION, m.RIGHT_END_BUTTON_GRP_FINAL_TRANSLATION]

    m.profileLayoutGroupHideInterpolator.key = [0.0, 1.0]
    m.profileLayoutGroupHideInterpolator.keyValue = [m.PROFILE_GROUP_FINAL_TRANSLATION, m.PROFILE_GROUP_INITIAL_TRANSLATION]
    m.notificationIconHideInterpolator.key = [0.0, 1.0]
    m.notificationIconHideInterpolator.keyValue = [m.NOTIFICATION_ICON_FINAL_TRANSLATION, m.NOTIFICATION_ICON_INITIAL_TRANSLATION]
    m.notificationLabelHideInterpolator.key = [0.0, 1.0]
    m.notificationLabelHideInterpolator.keyValue = [m.NOTIFICATION_LABEL_FINAL_TRANSLATION, m.NOTIFICATION_LABEL_INITIAL_TRANSLATION]
    m.rightEndBottomBtnsGroupHideInterpolator.key = [0.0, 1.0]
    m.rightEndBottomBtnsGroupHideInterpolator.keyValue = [m.RIGHT_END_BUTTON_GRP_FINAL_TRANSLATION, m.RIGHT_END_BUTTON_GRP_INITIAL_TRANSLATION]

    ' Set animation based on visible child length in menuList
    numberOfChild = m.menuList.content.getChildCount()
    m.bottomLabelsShowingAnimation.duration = m.SHOW_ANIMATION_DURATION + (numberOfChild/10)
end function

'''''''''
' stopALlAnimations: Stops all the animations
' 
'''''''''
function stopALlAnimations() as void
    m.profileGroupShowingAnimation.control = "stop"
    m.notificationIconShowingAnimation.control = "stop"
    m.bottomLabelsShowingAnimation.control = "stop"
    m.hidingAnimation.control = "stop"
    m.fadeInAnimation.control = "stop"
    m.fadeOutAnimation.control = "stop"
end function

'''''''''
' showMenuItems: Handling the animation works. Shows the proper animation according to the situation
' 
' @param {boolean} shouldShow: Boolean tha will be true incase of menuitems needs to be visible.
'''''''''
function showMenuItems(shouldShow as boolean) as void
    stopAllAnimations()
    if (shouldShow)
        m.profileGroupShowingAnimation.control = "start"
        m.notificationIconShowingAnimation.control = "start"
        m.bottomLabelsShowingAnimation.control = "start"
        m.fadeInAnimation.control = "start"
    else
        m.hidingAnimation.control = "start"
        m.fadeOutAnimation.control = "start"
    end if 
end function

'''''''''
' setInitialTranslations: Sets Initial translation of the menuItems
' 
'''''''''
function setInitialTranslations() as void
    m.profileLayoutGroup.translation = m.PROFILE_GROUP_INITIAL_TRANSLATION
    m.notificationIcon.translation = m.NOTIFICATION_ICON_INITIAL_TRANSLATION
    m.notificationLabel.translation = m.NOTIFICATION_LABEL_INITIAL_TRANSLATION
    m.rightEndBottomBtnsGroup.translation = m.RIGHT_END_BUTTON_GRP_INITIAL_TRANSLATION
end function