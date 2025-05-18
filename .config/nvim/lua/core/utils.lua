local M = {}
local fn, api = vim.fn, vim.api

function M.debounce(func, timeout)
  local timer_id
  return function(...)
    if timer_id ~= nil then
      fn.timer_stop(timer_id)
    end
    local args = {...}
    local function cb()
      func(args)
      timer_id = nil
    end
    timer_id = fn.timer_start(timeout, cb)
  end
end

function M.scandir(directory)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('ls -A "'..directory..'"')
    for filename in pfile:lines() do
        i = i + 1
        t[i] = filename
    end
    pfile:close()
    return t
end

function get_file_name(file)
      local file_name = file:match("[^/]*.lua$")
      return file_name:sub(0, #file_name - 4)
end

-- Convert UTF-8 hex code to character
function M.u(code)
  if type(code) == 'string' then
    code = tonumber('0x' .. code)
  end
  local c = string.char
  if code <= 0x7f then
    return c(code)
  end
  local t = {}
  if code <= 0x07ff then
    t[1] = c(bit.bor(0xc0, bit.rshift(code, 6)))
    t[2] = c(bit.bor(0x80, bit.band(code, 0x3f)))
  elseif code <= 0xffff then
    t[1] = c(bit.bor(0xe0, bit.rshift(code, 12)))
    t[2] = c(bit.bor(0x80, bit.band(bit.rshift(code, 6), 0x3f)))
    t[3] = c(bit.bor(0x80, bit.band(code, 0x3f)))
  else
    t[1] = c(bit.bor(0xf0, bit.rshift(code, 18)))
    t[2] = c(bit.bor(0x80, bit.band(bit.rshift(code, 12), 0x3f)))
    t[3] = c(bit.bor(0x80, bit.band(bit.rshift(code, 6), 0x3f)))
    t[4] = c(bit.bor(0x80, bit.band(code, 0x3f)))
  end
  return table.concat(t)
end

function M.filepath()
  local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
  if fpath == "" or fpath == "." then
      return " "
  end

  return string.format(" %%<%s/", fpath)
end

function M.filename()
  local fname = vim.fn.expand "%:t"
  if fname == "" then
      return ""
  end
  return fname .. " "
end

function M.file_exists(path)
   local f=io.open(path,"r")
   if f~=nil then io.close(f) return true else return false end
end

return M
