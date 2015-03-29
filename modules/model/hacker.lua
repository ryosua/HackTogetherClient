local hacker = {}

function hacker.createInstance(email, username, password, university, endorsements)
    local i = {}

    local iEmail = email
    local iEndorsements = endorsements
    local iPassword = password
    local iUniversity = university
    local iUsername = username

    function i.getEmail() return iEmail end
    function i.getEndorsements() return iEndorsements end
    function i.getUsername() return iUsername end
    function i.getPassword() return iPassword end
    function i.getUniversity() return iUniversity end

    return i
end

return hacker