local networkController = {}

function networkController.createInstance()
    local i = {}

    function i.register(userName, email, university)
        print "Attempting to register."
        print ("UserName: " .. userName)
        print ("Email: " .. email)
        print ("University: " .. university)
        print ("")
    end

    function i.login()
        print "Attempting login."
    end

    return i
end

return networkController