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

    function i.register(email, password, university)
        print "Attempting to register."
        print ("Email: " .. email)
        print ("Password: " .. password)
        print ("University: " .. university)
        print ("")

        network.request( URL, POST, networkListener, params )
    end

    function i.login(email, password)
        print "Attempting login."
        print ("Email: " .. email)
        print ("Password: " .. password)
        print ("")

        network.request( URL, POST, networkListener, params )
    end

    return i
end

return networkController