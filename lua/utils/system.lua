local executable = vim.fn.executable

local M = {}

function M.is_windows()
  return vim.uv.os_uname().sysname == "Windows_NT"
end

function M.is_linux()
  return vim.uv.os_uname().sysname == "Linux"
end

function M.is_executable(bin)
  return executable(bin) > 0
end

return M
