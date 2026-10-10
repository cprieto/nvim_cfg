-- Use Neovim's configurable right-click menu.
vim.opt.mousemodel = 'popup_setpos'
vim.opt.pumborder = 'rounded'

local context_menu_open = false
function _G.OpenLspContextMenu()
  context_menu_open = false
  vim.schedule(function() vim.cmd('popup ]LSP') end)
end

local icon_names = {
  ['LSP Actions'] = { 'filetype', 'config' },
  ['Go to declaration'] = { 'lsp', 'file' },
  ['Go to type definition'] = { 'lsp', 'class' },
  ['Signature help'] = { 'lsp', 'text' },
  ['Format buffer'] = { 'lsp', 'snippet' },
  ['Code actions'] = { 'lsp', 'event' },
  ['Go to definition'] = { 'lsp', 'function' },
  ['Find usages'] = { 'lsp', 'reference' },
  ['Find implementations'] = { 'lsp', 'interface' },
  ['Inspect'] = { 'lsp', 'property' },
  ['Show Diagnostics'] = { 'lsp', 'event' },
  ['Show All Diagnostics'] = { 'lsp', 'array' },
  ['Cut'] = { 'lsp', 'operator' },
  ['Copy'] = { 'lsp', 'file' },
  ['Paste'] = { 'lsp', 'snippet' },
  ['Delete'] = { 'lsp', 'null' },
  ['Select All'] = { 'lsp', 'array' },
}
local icons = {}
local mini_icons = require('mini.icons')
for name, icon in pairs(icon_names) do
  icons[name] = mini_icons.get(icon[1], icon[2])
end

-- Handle the submenu launcher before the native popup consumes the click.
-- Keep ordinary clicks (including clicks outside the menu) unchanged.
vim.keymap.set('n', '<LeftMouse>', function()
  if context_menu_open and vim.fn.pumvisible() == 1 then
    local popup = vim.fn.pum_getpos()
    local mouse = vim.fn.getmousepos()
    if mouse.screenrow == popup.row + 1
      and mouse.screencol > popup.col
      and mouse.screencol <= popup.col + popup.width then
      return '<Esc><Cmd>lua OpenLspContextMenu()<CR>'
    end
  end
  return '<LeftMouse>'
end, { expr = true, desc = 'Open LSP Actions on a popup click' })

local function escape(name)
  return vim.fn.escape(name, ' .\\')
end

-- The built-in callback addresses untranslated labels directly. Update the
-- contextual state using the displayed labels instead.
vim.api.nvim_create_augroup('nvim.popupmenu', { clear = true })
vim.api.nvim_create_autocmd('MenuPopup', {
  group = vim.api.nvim_create_augroup('IconContextMenu', { clear = true }),
  callback = function()
    context_menu_open = true
    local methods = {
      ['Go to definition'] = 'textDocument/definition',
      ['Find usages'] = 'textDocument/references',
      ['Find implementations'] = 'textDocument/implementation',
      ['Go to declaration'] = 'textDocument/declaration',
      ['Go to type definition'] = 'textDocument/typeDefinition',
      ['Signature help'] = 'textDocument/signatureHelp',
      ['Format buffer'] = 'textDocument/formatting',
      ['Code actions'] = 'textDocument/codeAction',
    }
    for name, method in pairs(methods) do
      local enabled = #vim.lsp.get_clients({ bufnr = 0, method = method }) > 0
      vim.cmd('nmenu ' .. (enabled and 'enable ' or 'disable ')
        .. ']LSP.' .. escape(icons[name] .. '  ' .. name))
    end
  end,
})

-- Menu translations add icons without changing the action mappings.
for name, icon in pairs(icons) do
  local label = icon .. '  ' .. name .. (name == 'LSP Actions' and '  ›' or '')
  vim.cmd('menutrans ' .. escape(name) .. ' ' .. escape(label))
end
for name, shortcut in pairs({
  ['Go to definition'] = 'cd', ['Go to declaration'] = 'cD',
  ['Find implementations'] = 'ci', ['Go to type definition'] = 'cy',
  ['Find usages'] = 'cu', ['Format buffer'] = 'gf', ['Code actions'] = 'ca',
}) do
  local suffix = '<Tab><leader>' .. shortcut
  vim.cmd('menutrans ' .. escape(name) .. suffix .. ' ' .. escape(icons[name] .. '  ' .. name) .. suffix)
end

vim.cmd [[
  silent! aunmenu PopUp.How-to\ disable\ mouse
  silent! aunmenu PopUp.-2-
  silent! aunmenu PopUp.Configure\ Diagnostics
  silent! aunmenu PopUp.Code
  silent! aunmenu PopUp.Open\ in\ web\ browser
  silent! aunmenu PopUp.Go\ to\ definition
  silent! aunmenu PopUp.Find\ usages
  silent! aunmenu PopUp.Find\ implementations
  silent! aunmenu PopUp.-Navigation-
  silent! aunmenu PopUp.LSP
  silent! aunmenu PopUp.LSP\ Actions
  silent! aunmenu ]LSP
  nnoremenu 10.100 PopUp.LSP\ Actions <Cmd>lua OpenLspContextMenu()<CR>
  nnoremenu 10.100 ]LSP.Go\ to\ definition<Tab><leader>cd <Cmd>lua Snacks.picker.lsp_definitions()<CR>
  nnoremenu 10.110 ]LSP.Go\ to\ declaration<Tab><leader>cD <Cmd>lua Snacks.picker.lsp_declarations()<CR>
  nnoremenu 10.120 ]LSP.Find\ implementations<Tab><leader>ci <Cmd>lua Snacks.picker.lsp_implementations()<CR>
  nnoremenu 10.130 ]LSP.Go\ to\ type\ definition<Tab><leader>cy <Cmd>lua Snacks.picker.lsp_type_definitions()<CR>
  anoremenu 10.140 ]LSP.-Navigation- <Nop>
  nnoremenu 10.150 ]LSP.Find\ usages<Tab><leader>cu <Cmd>lua Snacks.picker.lsp_references()<CR>
  nnoremenu 10.160 ]LSP.Signature\ help <Cmd>lua vim.lsp.buf.signature_help()<CR>
  anoremenu 10.190 ]LSP.-Actions- <Nop>
  nnoremenu 10.200 ]LSP.Format\ buffer<Tab><leader>gf <Cmd>lua vim.lsp.buf.format()<CR>
  nnoremenu 10.210 ]LSP.Code\ actions<Tab><leader>ca <Cmd>lua require('tiny-code-action').code_action()<CR>
  anoremenu 10.110 PopUp.-LSP- <Nop>
]]

-- Recreate existing built-in entries with their translated labels, preserving
-- their original actions in Normal, Insert, Visual, and other modes.
for _, item in ipairs(vim.fn.menu_get('PopUp')[1].submenus) do
  local diagnostic = item.name:find('Show Diagnostics', 1, true) or item.name:find('Show All Diagnostics', 1, true)
  if icons[item.name] or diagnostic then
    local path = 'PopUp.' .. escape(item.name)
    vim.cmd('aunmenu ' .. path)
    if diagnostic then path = ']LSP.' .. escape(item.name) end
    for mode, mapping in pairs(item.mappings or {}) do
      local command = mode .. (mapping.noremap == 1 and 'noremenu' or 'menu')
      local silent = mapping.silent == 1 and ' <silent>' or ''
      local priority = diagnostic and '10.180' or '10.' .. item.priority
      vim.cmd(command .. silent .. ' ' .. priority .. ' ' .. path .. ' ' .. mapping.rhs)
      if mapping.enabled == 0 then vim.cmd(mode .. 'menu disable ' .. path) end
    end
  end
end
