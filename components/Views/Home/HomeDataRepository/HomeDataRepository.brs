sub getRowListData() as void
    requestObject = {}
    requestObject.uri = "https://jonathanbduval.com/roku/feeds/roku-developers-feed-v1.json"
    sendRequest(requestObject, "onGettingRowListData")
end sub

sub onGettingRowListData(response as Object)
    jsonResponse = ParseJson(response.getData())
    if jsonResponse <> invalid
        root = []
        for each category in jsonResponse
            value = jsonResponse.lookup(category)
            if type(value) = "roArray" and category <> "series"
                row = {}
                row.title = category
                row.children = []
                for each item in value
                    row.children.push(getItemData(item))
                end for
                root.push(row)
            end if
        end for
        contentNode = CreateObject("roSGNode", "ContentNode")
        contentNode.update({children: root}, true)
        m.rowlist.content = contentNode
    end if
end sub

sub getItemData(item as Object) as Object
    itemData = {}
    itemData.title = item.shortDescription
    itemData.description = item.longDescription
    itemData.image = item.thumbnail
    itemData.duration = item.content.duration
    itemData.videos = item.content.videos
    return itemData
end sub