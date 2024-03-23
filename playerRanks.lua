local Admins = {652187268;} --Adminlerin idleri burada yer alacak.
local Prefix = "!"
local function isAdmin(Player)
	for _,Admin in pairs(Admins) do
		if type(Admin) ==  "number" and Admin == Player.userId then
			return true
		end
	end
	return false
end
local function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
local Commands = {}
local function ParseMessage(Player,Message)
	Message = string.lower(Message)
	local PrefixMatch = string.match(Message,"^"..Prefix)
	--Mesajın başında prefix var mı diye bak
	if PrefixMatch then 
		--Eğer prefix varsa Mesajdan prefixi çıkart zaten komut olduğunu anladık.
		Message = string.gsub(Message,PrefixMatch,"",1)
		local Arguments = {} --Mesajdaki boşlukla ayrılmamış kelimeleri bulacağız.
		for Argument in string.gmatch(Message,"[^%s]+") do --[^%s]+ boşlukla ayrılmamış kelimeleri bul demek.
			table.insert(Arguments,Argument) --kelimeleri Arguments tablomuza(array) ekliyoruz.
		end		
		local CommandName = Arguments[1]
		table.remove(Arguments,1)
		local CommandFunc = Commands[CommandName]
		if CommandFunc ~= nil then
			print("Commandfunc bulundu")
			CommandFunc(Player,Arguments)
		end
	end
end
local Players = game:GetService("Players")
Players.PlayerAdded:Connect(function(Player)
		print("Player", Player.Name ,"added.")
		Player.Chatted:Connect(function(Message,Recipient)
			if not Recipient and isAdmin(Player)then
				--Alıcı yok ise ve mesajı yazan adminse komutu işleme alacağız
				--Whisperlardan komut almak istemeyiz.
				ParseMessage(Player,Message)
			end
		end)
end)

Commands.print = function(Sender,Arguments)
	local Message = table.concat(Arguments,"",1,tablelength(Arguments))
	print("From",Sender.Name,":\n",Message)
end