function get_conf_filenames(folder)
    local lua_files = vim.fn.system("ls -R ~/.config/nvim/lua/*/" .. folder .. "/*.lua")
    local names = {}
    for filename in lua_files:gmatch("[^\r\n]+") do
        file_path, num = filename:gsub("^.*/lua/(.*)$", "%1")
        table.insert(names, file_path)
    end
    return names
end

function require_files(files)
  for i, file in pairs(files) do
    file, num = file:gsub("^(.*)%.lua$", "%1")
    module, num = file:gsub("/", ".")
    require(module)
  end
end

require("rockem.plugins-setup")
require_files(get_conf_filenames("core"))
require_files(get_conf_filenames("plugins"))

print("Happy hacking!")
