local M = {}

--[[
indent_map {
  ['file_extension'] = {
    tabstop = tabtop
    shiftwidth = shiftwidth,
    ...
  }
}
--]]

M.setup = function(indent_map)
  local group = vim.api.nvim_create_augroup("autoIndentGroup", { clear = true })

  local pattern = {}
  local command = {}
  local param1 = {"BufRead", "BufNewFile"}

  for _patterns, _commands in pairs(indent_map) do

    local temp_pattern = {}  -- example pattern = {"*.lua", "*.txt"}
    for p in _patterns:gmatch("[^,]+") do
      p = p:gsub("%s+", "") -- strip spaces
      table.insert(temp_pattern, string.format("*.%s", p))
    end
    table.insert(pattern, temp_pattern)

    local temp_command = ""
    for c, v in pairs(_commands) do
      local cs = tostring(c)
      local vs = tostring(v)
  
      if not string.find("expandtab,autoindent,smarttab", cs) then
        temp_command = temp_command..cs.."="..vs.." "
      else
        if v == 1 then
          temp_command = temp_command..cs.." "
        else
          temp_command = temp_command.."no"..cs.." "
        end
      end
    end
    table.insert(command, temp_command)

  end

  for i = 1, #pattern do
    vim.api.nvim_create_autocmd(param1, {
      pattern = pattern[i],
      command = "set "..command[i],
      group = group

    })
  end


end
return M
