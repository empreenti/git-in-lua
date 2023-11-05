os = require("os")
io = require("io")

local args = {...}
CaminhoParaPasta = {"Monitoramento/"}
ArquivosDosMonitorados = {"Monitoramento/monitorados.txt"}


function Argumentos(x)
	local comandos = {}
	comandos = x
	return comandos
end

function GitInit()
	local run = function()
		local ls = os.execute("ls .. > Monitoramento/monitorados.txt")
		if ls == true then
			return true
		elseif ls == false then
			return false
		end
	end
	
	local runResult = run()
	if runResult then
		print("Git Init executado com sucesso")
	else
		print("Git Init executado com error: Escrita não poder ser executada no arquivo de monitorados: ", ArquivosDosMonitorados[1])
	end	
end


function Monitoramento(x)
		status = function()
			file = io.open(ArquivosDosMonitorados[1])
			io.write("Veja se todos os seus arquivos estão monitorados\n")
			for lines in file:lines(20) do
				print(lines)		
			end
			file:close()
		end
		
		add = function(x)
			fileread = io.open(ArquivosDosMonitorados[1])
			for lines in fileread:lines(20) do
				if lines == x then
					print("Arquivo já monitorado")
				end 
			end
			fileread:close()
			
			file = io.open(ArquivosDosMonitorados[1], "a+")
			file:write(x)
			file:close()
		end 
		
		if x == "status" then
			status()
		else 
			add(input[2])
		end
end

input = Argumentos(args)
if input[1] == "init" then
	GitInit()
elseif input[1] == "status" then
	Monitoramento("status")
elseif input[1] == "add" then 
	Monitoramento("add")
end
