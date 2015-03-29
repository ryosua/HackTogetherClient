local hacker = {}

function hacker.createInstance(email, username, university, endorsements)
    local i = {}

    local iEmail = email
    local iEndorsements = endorsements
    local iUniversity = university
    local iUsername = username

    function i.getEmail() return iEmail end
    function i.getEndorsements() return iEndorsements end
    function i.getUsername() return iUsername end
    function i.getUniversity() return iUniversity end

    return i
end

return hacker