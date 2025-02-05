-- org_to_md.nvim - A Neovim plugin to convert Org-mode to Markdown and copy to clipboard

local M = {}

-- Function to convert Org-mode to Markdown
local function org_to_md(text)
	text = text:gsub("%*%*([^%*]+)%*%*", "**%1**") -- Bold
	text = text:gsub("%*([^%*]+)%*", "_%1_") -- Italics
	text = text:gsub("^%*%s*(.-)$", "# %1") -- Level 1 headers
	text = text:gsub("^%*%*%s*(.-)$", "## %1") -- Level 2 headers
	text = text:gsub("^%*%*%*%s*(.-)$", "### %1") -- Level 3 headers
	text = text:gsub("%[%(.-%)%]%((.-)%)", "[%1](%2)") -- Links
	text = text:gsub("#%+BEGIN_SRC%s*(.-)%s*\n", "```%1\n") -- Begin source block
	text = text:gsub("#%+END_SRC", "```") -- End source block
	text = text:gsub("|%s*(.-)%s*|", "| %1 |") -- Table row
	text = text:gsub("|%s*%-+%s*|", "|---|") -- Table separator
	return text
end

-- Main function to copy the converted selection to the clipboard
function M.copy_org_to_md()
	-- Get the selection
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")
	local lines = vim.fn.getline(start_pos[2], end_pos[2])

	-- Convert from Org-mode to Markdown
	for i, line in ipairs(lines) do
		lines[i] = org_to_md(line)
	end

	-- Copy to clipboard
	local joined_text = table.concat(lines, "\n")
	vim.fn.setreg("+", joined_text)
	print("Text converted and copied to clipboard")
end

-- Command to call the function
vim.api.nvim_create_user_command("CopyOrgToMd", M.copy_org_to_md, { range = true })

-- Plugin setup
function M.setup()
	vim.api.nvim_create_user_command("CopyOrgToMd", M.copy_org_to_md, { range = true })
end

return M
