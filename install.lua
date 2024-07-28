fs.makeDir("rom/github")

local request = http.get("https://github.com/Ph4i1ur3/CCScripts/masterlist.txt")
for file in request.readAll():gmatch("%S+") do
  local thisReq = http.get("https://github.com/Ph4i1ur3/CCScripts/scripts/" .. file)
  local localFile = fs.open("github/" .. file, "w+")
  localFile.write(thisReq.readAll())
  localFile.close()
  thisReq.close()
end
request.close()
