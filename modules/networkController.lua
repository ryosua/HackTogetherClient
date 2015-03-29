local networkController = {}

-- Modules
local json = require "json"
local hackerModel = require "modules.model.hacker"

local POST = "POST"
local SERVER_URL = "http://127.0.0.1:8000/"

local session = composer.state.session

local function networkListener( e )
    print "login listener called"
    if ( e.isError ) then
        print( "Network error!" )
    else
        print ( "RESPONSE: " .. e.response )
    end
end

local function post(jsonkKeyValue, path, listener)
    local post_body = json.encode(jsonkKeyValue)

    local headers = {}
    --headers["Content-Type"] = "application/json"
    --headers["Accept-Language"] = "en-US"

    local params = {}
    params.headers = headers
    params.body = post_body
    --params.progress = "download"

    network.request ( (SERVER_URL .. path), POST, listener, params )
end

function networkController.createInstance(failureCallBack)
    local i = {}

    local ifailureCallBack = failureCallBack

    local function loginListener( e )
        print "login listener called"

        if ( e.isError ) then
            print( "Network error!" )

            -- Clear the login fields.
            ifailureCallBack()
        else
            print ( "RESPONSE: " .. e.response )

            local decodedResponse = json.decode( e.response )
            if decodedResponse.status == "ok" then
                local uid = decodedResponse.uid
                print ("uid: " .. uid)

                -- Set the session to logged in and save the user id.
                session.setLoggedIn(true)
                session.setUid(uid)

                -- Go to the menu.
                composer.gotoScene( "scenes.menu")
            else
                print "login failed"
                -- Clear the login fields.
                ifailureCallBack()
            end
        end
    end

    local function getUserListener( e )
        print "getUserListener called"

        if ( e.isError ) then
            print( "Network error!" )

            native.showAlert( "Netork Error", "Please login again" )

            -- Go to the menu.
            composer.gotoScene( "scenes.login")
        else
            print ( "RESPONSE: " .. e.response )

            local decodedResponse = json.decode( e.response )
            if decodedResponse ~= nil then
                local email = decodedResponse.email
                local username = decodedResponse.username
                local password = decodedResponse.password
                local university = decodedResponse.university
                local endorsements = decodedResponse.endorsements

                local user = hackerModel.createInstance(email, username, password, university, endorsements)
                assert( user ~= nil )
                session.setLoggedInUser(user)
            else
                native.showAlert( "Netork Error", "Please login again" )

                -- Go to the menu.
                composer.gotoScene( "scenes.login")
            end
        end
    end

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

        local path = "registeruser/"

        post(jsonkKeyValue, path, loginListener)
    end

    function i.login(username, password)
        print "Attempting login."
        print ("Username: " .. username)
        print ("Password: " .. password)
        print ("")

        local jsonkKeyValue =
        {
            username = username,
            password = password,
        }

        local path = "login/"

        post(jsonkKeyValue, path, loginListener)
    end

    function i.getUser(uid)
        
        local jsonkKeyValue =
        {
            uid = uid,
        }

        local path = "profile/"

        post(jsonkKeyValue, path, getUserListener)
    end

    function i.getHackers(userID)
        print "Getting hackers."

        local jsonkKeyValue =
        {
            userID = userID,
        }

        local path = ""

        post(jsonkKeyValue, path, networkListener)


        -- Simulate response.
        local hackers = {}

        for i = 1, 20 do
            hackers[i] = hackerModel.createInstance("test@test.test", ("Test User " .. i), "12345", "Penn State", 3)
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