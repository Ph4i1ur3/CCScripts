fs.makeDir("github")

local request = http.get("https://github.com/Ph4i1ur3/CCScripts/masterlist.txt")
print("Request Made.")
for file in request.readAll():gmatch("%S+") do
  print(file .. " File Requested.")
  local thisReq = http.get("https://github.com/Ph4i1ur3/CCScripts/scripts/" .. file)
  local localFile = fs.open("github/" .. file, "w+")
  localFile.write(thisReq.readAll())
  localFile.close()
  thisReq.close()
end
request.close()
