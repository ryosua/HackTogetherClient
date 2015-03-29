local networkController = {}

-- Modules
local json = require "json"

local POST = "POST"
local SERVER_URL = "http://127.0.0.1:8000/"

local function networkListener( e )
    if ( e.isError ) then
        print( "Network error!" )
    else
        print ( "RESPONSE: " .. e.response )
    end
end

local function post(jsonkKeyValue, path)
    local post_body = json.encode(jsonkKeyValue)

    local headers = {}
    --headers["Content-Type"] = "application/json"
    --headers["Accept-Language"] = "en-US"

    local params = {}
    params.headers = headers
    params.body = post_body
    --params.progress = "download"

    network.request ( (SERVER_URL .. path), POST, networkListener, params )
end

function networkController.createInstance()
    local i = {}

    function i.register(email, username, password, university)
        print "Attempting to register."
        print ("Email: " .. email)
        print ("Username: " .. username)
        print ("Password: " .. password)
        print ("University: " .. university)
        print ("")

        local jsonkKeyValue =
        {
            email = email,
            username = username,
            password = password,
            university = university,
        }

        local path = ""

        post(jsonkKeyValue, path)
    end

    function i.login(email, password)
        print "Attempting login."
        print ("Email: " .. email)
        print ("Password: " .. password)
        print ("")

        local jsonkKeyValue =
        {
            email = email,
            password = password,
        }

        local path = "login/"

        post(jsonkKeyValue, path)
    end

    function i.getHackers(userID)
        print "Getting hackers."

        local jsonkKeyValue =
        {
            userID = userID,
        }

        local path = ""

        post(jsonkKeyValue, path)


        -- Simulate response.
        local hackers = {}

        for i = 1, 20 do
            hackers[i] =
            {
                id = i,
                name = ("Test User " .. i),
                email = "test@test.test",
                university = "Penn State",
                endorsements = 3,
                -- skills
                -- proficiencies
            }
        end

        return hackers
    end

    function i.getHackathons(userID)
        print "Getting hackers."
        
        

        -- Simulate response.

        local hackathons = {}

        for i = 1, 20 do
            hackathons[i] =
            {
                name = ("Test Hackathon " .. i),
                id = i,
            }
        end

        return hackathons
    end

    return i
end

return networkController