return {
	"tpope/vim-dadbod",
	"kristijanhusak/vim-dadbod-completion",
	"kristijanhusak/vim-dadbod-ui",
	vim.api.nvim_set_keymap('n', '<leader>db', ":DBUIToggl<CR>", { desc="[D]ad [B]od ui [T]oggle"}),
}
