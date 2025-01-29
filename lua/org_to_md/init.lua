-- org_to_md.lua - Un plugin de Neovim para convertir Org-mode a Markdown y copiar al portapapeles

local M = {}

-- Función para convertir Org-mode a Markdown
local function org_to_md(text)
	text = text:gsub("%*%*([^%*]+)%*%*", "**%1**") -- Negritas
	text = text:gsub("%*([^%*]+)%*", "_%1_") -- Itálicas
	text = text:gsub("^%*%s*(.-)$", "# %1") -- Encabezados de nivel 1
	text = text:gsub("^%*%*%s*(.-)$", "## %1") -- Encabezados de nivel 2
	text = text:gsub("^%*%*%*%s*(.-)$", "### %1") -- Encabezados de nivel 3
	text = text:gsub("%[%(.-%)%]%((.-)%)", "[%1](%2)") -- Enlaces
	return text
end

-- Función principal para copiar la selección convertida al portapapeles
function M.copy_org_to_md()
	-- Obtener la selección
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")
	local lines = vim.fn.getline(start_pos[2], end_pos[2])

	-- Convertir de Org-mode a Markdown
	for i, line in ipairs(lines) do
		lines[i] = org_to_md(line)
	end

	-- Copiar al portapapeles
	local joined_text = table.concat(lines, "\n")
	vim.fn.setreg("+", joined_text)
	print("Texto convertido y copiado al portapapeles")
end

-- Comando para llamar la función
vim.api.nvim_create_user_command("CopyOrgToMd", M.copy_org_to_md, { range = true })

-- Configuración del plugin
function M.setup()
	vim.api.nvim_create_user_command("CopyOrgToMd", M.copy_org_to_md, { range = true })
end

return M
