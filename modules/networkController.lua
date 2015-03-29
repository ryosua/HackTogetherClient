local networkController = {}

local POST = "POST"
local URL = "http://index.html"

local function networkListener( e )
    if ( e.isError ) then
        print( "Network error!" )
    else
        print ( "RESPONSE: " .. e.response )
    end
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

        --network.request( URL, POST, networkListener, params )
    end

    function i.login(email, password)
        print "Attempting login."
        print ("Email: " .. email)
        print ("Password: " .. password)
        print ("")

        --network.request( URL, POST, networkListener, params )
    end

    function i.getHackers(userID)
        print "Getting hackers."

        local hackers = {}

        for i = 1, 20 do
            hackers[i] =
            {
                name = ("Test User " .. i),
                id = i,
            }
        end

        return hackers

        --network.request( URL, POST, networkListener, params )
    end

    function i.getHackathons(userID)
        print "Getting hackers."

        local hackathons = {}

        for i = 1, 20 do
            hackathons[i] =
            {
                name = ("Test Hackathon " .. i),
                id = i,
            }
        end

        return hackathons

        --network.request( URL, POST, networkListener, params )
    end

    return i
end

return networkController