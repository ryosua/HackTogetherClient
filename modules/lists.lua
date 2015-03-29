local lists = {}

local universities = {"", "Penn State", "Temple", "Shippensburg"}
local skills = {"", "Java", "Python", "Lua", "JavaScript", "HTML", "CSS"}
local platforms = {"", "Mobile", "iOS", "Android", "Web", "Windows", "Mac", "Linux"}

function lists.getUniversities()
    return universities
end

function lists.getSkills()
    return skills
end

function lists.getPlatorms()
    return  platforms
end

return lists