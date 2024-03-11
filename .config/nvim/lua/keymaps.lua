-- Keymaps for better default experience
-- Save file
--
vim.keymap.set({ 'n', 'i' }, '<C-s>', '<C-\\><C-N>:Format<Enter>:w<Enter>')

-- Open LazyGit
vim.keymap.set('n', '<leader>gg', '<C-\\><C-N>:LazyGit<Enter>')

-- Exit file
vim.keymap.set('n', "½", vim.cmd.Ex)

-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Creates keybind for exiting terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Binds alt+{h,j,k,l} to move window in all modes
vim.keymap.set({ 'n', 'v', 'i', 't' }, '<A-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set({ 'n', 'v', 'i', 't' }, '<A-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set({ 'n', 'v', 'i', 't' }, '<A-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set({ 'n', 'v', 'i', 't' }, '<A-l>', '<C-\\><C-N><C-w>l')

-- Allow tab to swithc between tabs
vim.keymap.set({ 'n' }, '<leader><Tab>', '<C-\\><C-N><C-w>:tabnext<Enter>')
vim.keymap.set({ 'n' }, '<leader><S-Tab>', '<C-\\><C-N><C-w>:-tabnext<Enter>')

-- Reload init
vim.keymap.set({ 'n' }, '<leader>½', ':luafile ~/.config/nvim/init.lua<Enter>')

-- Keybinds for netrw
vim.api.nvim_create_autocmd('filetype', {
	pattern = 'netrw',
	desc = 'Better mappings for netrw',
	callback = function()
		local bind = function(lhs, rhs)
			vim.keymap.set('n', lhs, rhs, { remap = true, buffer = true })
		end

		-- Move up directory
		bind('½', '-')
		bind('<leader><Tab>', ':tabnext<Enter>')
		bind('<leader><S-Tab>', ':-tabnext<Enter>')
	end
})
