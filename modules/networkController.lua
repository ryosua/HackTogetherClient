local networkController = {}

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