local sessionController = {}

function sessionController.createInstance()
    local i = {}

    local loggedIn = false
    local loggedInUser = nil
    local uid = -1

    function i.getLoggedIn() return loggedIn end
    function i.getLoggedInUser(user) return loggedInUser end
    function i.getUid() return uid end

    function i.setLoggedIn(value) loggedIn = value end
    function i.setLoggedInUser(user) loggedInUser = user end
    function i.setUid(id) uid = id end

    return i
end

return sessionController