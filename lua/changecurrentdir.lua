-- カレントディレクトリを変更する。
local M = {}

function M.change_current_dir(directory, bang)
  if directory == '' then
    vim.cmd('lcd %:p:h')
  else
    vim.cmd('lcd ' .. vim.fn.fnameescape(directory))
  end

  if bang == '' then
    vim.cmd('pwd')
  end
end

vim.api.nvim_create_user_command('CD', function(opts)
  M.change_current_dir(opts.args, opts.bang and '!' or '')
end, {
  nargs = '?',
  complete = 'dir',
  bang = true,
})

vim.keymap.set('n', '<Space>cd', '<Cmd>CD<CR>', { silent = true })

return M
