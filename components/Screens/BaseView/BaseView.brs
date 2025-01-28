function init() as void
    m.top.observeField("focusedChild", "onFocusChange")
end function

function onOpen(data as object) as void
    ' To be overridden in the inherited views
end function

sub onFocusChange()
    ' To be overridden in the inherited views
end sub