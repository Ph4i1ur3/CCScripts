makeDir("/github")

local request = http.get("https://github.com/Ph4i1ur3/CCScripts/masterlist.lua")
for file in request.readAll():gmatch("%S+") do
  local thisReq = http.get("https://github.com/Ph4i1ur3/CCScripts/scripts/" .. file)
  local localFile = open("/github" .. file, "w+")
  localFile.write(thisReq.readAll())
  localFile.close()
  thisReq.close()
end
request.close()
