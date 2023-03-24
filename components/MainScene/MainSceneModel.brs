
'''''''''
' getDataFor: calls data API call for a particular rail. It'll make use of the end point in the rail and its ID
' 
' @param {object} rail
'''''''''
function getDataFor(rail as object) as void
    requestObject = {}
    requestObject.uri = "https://api.themoviedb.org/3/trending/all/day?api_key=4e764469d9177232ecf8e12f42da7296&append_to_response=images&include_image_language=null,en"
    requestObject.railId = rail.id
    sendRequest(requestObject, "onReceivingRailData")
end function

'''''''''
' onReceivingRailData: Callback function to receive the API response for each rail. This will also saves the rail responses in list
' 
' @param {object} event
'''''''''
function onReceivingRailData(event as object) as void
    response = event.getData()
    if IsAssociativeArray(response) AND response.requestObject <> invalid AND IsString(response.requestObject.railId)
        m.responseLoadStatus[response.requestObject.railId] = true
        m.railResponseMap[response.requestObject.railId] = response.results
    end if
    if (isReadyForLaunchHome())
        ' show Home
        ? "showing Home"
    else
        ? "NOT showing Home"
    end if
end function

'''''''''
' isReadyForLaunchHome: Check API responses and tells weather it is time to show the home screen
' 
' @return {boolean}
'''''''''
function isReadyForLaunchHome() as boolean
    for each rail in m.homePageConfig.rails
      if m.responseLoadStatus[rail.id] = false
        return false
      end if
    end for
    return true
end function