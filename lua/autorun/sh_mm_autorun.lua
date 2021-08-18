//Assign table values
Mint = Mint or {}
Mint.config = Mint.config or {}

Mint.info = {}
Mint.info["Name"] = "Syzco's Mint MOTD & Content Warning"
Mint.info["Abreviation"] = "MOTD"
Mint.info["Version" ]= "2"
Mint.info["Author"] = "Syzco"
Mint.info["Contact"] = "GmodStore"
Mint.info["Location"] = "GmodStore (Protected)"
Mint.info["Relaease Date"] = "08/18/2021"
Mint.info["Directory"] = "modules"
Mint.info["Config"] = "config"
Mint.info["color"] = Color(10, 150, 255)
Mint.info["DataFolder"] = "mint_motd"

local function loadServerFile(file, path)
     if string.sub(file, 1, 2) != "sv" and string.sub(file, 1, 2) != "cl" then
          AddCSLuaFile(path)
          include(path)
          MsgC(Mint.info["color"], "\n[ Loading Shared File: ", Color(255, 255, 255), path, Mint.info["color"], " ]")
     elseif string.sub(file, 1, 2) == "cl" then
          AddCSLuaFile(path)
          MsgC(Mint.info["color"], "\n[ Loading Client File: ", Color(255, 255, 255), path, Mint.info["color"], " ]")
     elseif string.sub(file, 1, 2) == "sv" then
          include(path)
          MsgC(Mint.info["color"], "\n[ Loading Server File: ", Color(255, 255, 255), path, Mint.info["color"], " ]")
     end
end

local function loadClientFile(file, path)
     if string.sub(file, 1, 2) != "cl" then
          include(path)
          MsgC(Mint.info["color"], "\n[ Loading Shared File: ", Color(255, 255, 255), path, Mint.info["color"], " ]")
     elseif string.sub(file, 1, 2) == "cl" then
          include(path)
          MsgC(Mint.info["color"], "\n[ Loading Client File: ", Color(255, 255, 255), path, Mint.info["color"], " ]")
     end
end

local function loadSystem()
     //Load General Files
     MsgC(Mint.info["color"], "\n[ Starting Loading General Files ]")
     local fol = Mint.info["Directory"].."/"
     local files, folders = file.Find(fol.."*", "LUA")

     if SERVER then
          --MsgC(Mint.info["color"], "\n[ Loading on the Server ]")
          for _, folder in SortedPairs(folders, true) do
               if (Mint.config.packages[folder] == false) then Mint.config[folder] = nil continue end
               local fil, fold = file.Find(fol..folder.."/*.lua", "LUA")
               for _, file in SortedPairs(fil, false) do
                    local path = fol..folder.."/"..file
                    loadServerFile(file, path)
               end
          end

          if (!file.IsDir( Mint.info["DataFolder"], "DATA" )) then
               file.CreateDir( Mint.info["DataFolder"], "DATA" )
          end
     end

     fol = Mint.info["Directory"].."/"
     files, folders = file.Find(fol.."*", "LUA")

     if CLIENT then
          --MsgC(Mint.info["color"], "\n[ Loading on the Client ]")
          for _, folder in SortedPairs(folders, true) do
               if (Mint.config.packages[folder] == false) then Mint.config[folder] = nil continue end
               local fil, fold = file.Find(fol..folder.."/*.lua", "LUA")
               for __, file in SortedPairs(fil, false) do
                    local path = fol..folder.."/"..file
                    --if _ == 3 then timer.Simple(0.001, function() loadClientFile(file, path) end) end
                    loadClientFile(file, path)
               end
          end
     end
     MsgC(Mint.info["color"], "\n[ Finished Loading General Files ]\n")
end

local function loadConfig()
     MsgC(Mint.info["color"], "\n[ Starting Loading Config Files ]")
     local fol = Mint.info["Config"].."/"
     local files, folders = file.Find(fol.."*", "LUA")

     if SERVER then
          for _, file in SortedPairs(files, false) do
               local path = fol..file
               loadServerFile(file, path)
          end
     end

     fol = Mint.info["Config"].."/"
     files, folders = file.Find(fol.."*", "LUA")

     if CLIENT then
          for _, file in SortedPairs(files, false) do
               local path = fol..file
               loadClientFile(file, path)
          end
     end

     MsgC(Mint.info["color"], "\n[ Finished Loading Config Files ]\n")

     loadSystem()
end

hook.Add("Initialize", "motd_loadfiles", function()
     MsgC(Mint.info["color"], "\n\n[ Started Loading of Script: ", Color(255, 255, 255), Mint.info["Name"], Mint.info["color"], " ]")
     for k, v in SortedPairs(Mint.info, false) do
          MsgC(Mint.info["color"], "\n[ "..k..": ", Color(255, 255, 255), Mint.info[k], Mint.info["color"], " ]")
     end
     MsgC(Mint.info["color"], "\n")
     
     loadConfig()

     MsgC(Mint.info["color"], "\n[ Finished Loading of Script: ", Color(255, 255, 255), Mint.info["Name"], Mint.info["color"], " ]\n")
end)

function Mint.AddConfig(name, value)
     if (Mint.config[name]) then ErrorNoHalt("You already have a config set for this!") return end

     Mint.config[name] = value
end

function Mint.GetConfig(name)
     if not (Mint.config[name]) then ErrorNoHalt("There is no config set for this name!") return end

     return Mint.config[name]
end