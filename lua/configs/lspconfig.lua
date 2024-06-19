local config = require "nvchad.configs.lspconfig"

local on_attach = config.on_attach
local capabilities = config.capabilities
local on_init = config.on_init

local lspconfig = require "lspconfig"

-- local utils = require "lspconfig/util"
-- local path = util.path
-- local function get_python_path(workspace)
--   -- Use activated virtualenv.
--   if vim.env.VIRTUAL_ENV then
--     return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
--   end
--
--   -- Find and use virtualenv in workspace directory.
--   for _, pattern in ipairs { "*", ".*" } do
--     local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
--     if match ~= "" then
--       return path.join(path.dirname(match), "bin", "python")
--     end
--   end
--
--   -- Fallback to system Python.
--   return exepath "python3" or exepath "python" or "python"
-- end

lspconfig.pyright.setup {
  -- before_init = function(_, config)
  --   config.settings.python.pythonPath = get_python_path(config.root_dir)
  -- end,
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "python" },
}
