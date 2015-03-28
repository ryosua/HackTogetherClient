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

network.request( URL, POST, networkListener, params )

function networkController.createInstance()
    local i = {}

    function i.register(email, password, university)
        print "Attempting to register."
        print ("Email: " .. email)
        print ("Password: " .. password)
        print ("University: " .. university)
        print ("")
    end

    function i.login(email, password)
        print "Attempting login."
        print ("Email: " .. email)
        print ("Password: " .. password)
        print ("")
    end

    return i
end

return networkController