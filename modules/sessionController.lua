local sessionController = {}

function sessionController.createInstance()
    local i = {}

    local loggedIn = false
    local uid = -1

    function i.getLoggedIn() return loggedIn end
    function i.getUid() return uid end

    function i.setLoggedIn(value) loggedIn = value end
    function i.setUid(id) uid = id end

    return i
end

return sessionController