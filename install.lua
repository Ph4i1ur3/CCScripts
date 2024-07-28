local version = "0.11"

print("Installation Script Version " .. version)
print("Program Starting...")
fs.makeDir("github")
print("Directory Created")

local request = http.get("https://raw.githubusercontent.com/Ph4i1ur3/CCScripts/main/masterlist.txt")
print("Request Made.")

for file in request.readAll():gmatch("%S+") do
  print(file .. " File Requested.")
  local thisReq = http.get("https://raw.githubusercontent.com/Ph4i1ur3/CCScripts/main/scripts/" .. file)
  if fs.exists("github/" .. file) then
    fs.delete("github/" .. file)
  end
  local localFile = fs.open("github/" .. file, "w")
  localFile.write(thisReq.readAll())
  localFile.close()
  thisReq.close()
end
request.close()
