_G.require_mod = function(mod)
  local ok, result = pcall(require, mod)
  
  if not ok then 
    vim.notify("Failed to load " .. mod, "error")
    -- vim.pretty_print({plugin = mod, error = result})
    return nil
  end
  
  return result
end
