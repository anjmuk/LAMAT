local Login = {}
function Login.new()
local loginElements = {}
loginElements.usr = "Guest"
loginElements.pass = ""
loginElements.status = false
setmetatable(o, {__index = Page})
return loginElements
end

function Login:login(userName, pass )
script::triggerFunction("getAccount", "Scripts/Database.lua", userName, "Login")

-- compare retrieved values to entered values
if( self.usr == userName && self.password == pass ) then
-- logged in status is true and account is set, return true
self.status = true
return true
else
-- failed, reset values and return false
self.usr = "Guest"
self.password = ""
self.status = false
return false
end
end

function Login:isLoggedIn()
return self.getStatus()
end

function Login:logOut()
self.usr = "Guest"
self.status = false
end

-- =================== Beginning of get and set functions =======================
function Login:getUserName()
return self.usr
end

function Login:getStatus()
return self.status
end

function Login:setUserName(un)
self.usr = un
end

function Login:setPassword(pass)
self.password = pass
end0
-- ==================== Beginning of event handlers =============================
function onCreated()
  user = Login.new()
end

function onSQLRecieved(results, id)
if id:find("Login") == 1 then
if operations:arraySize(results) == 0 then
user.setUserName( "" )
user.setPassword( "" )
else
user.setUserName( results["Account"][1] )
user.setPassword( results["Password"][1] )
end
end
end