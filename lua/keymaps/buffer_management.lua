return {
	-- close all unmodified buffers
	vim.keymap.set('n', '<leader>bc', function()
		local buffs = vim.api.nvim_list_bufs()

		for _, buff in ipairs(buffs) do
			if vim.api.nvim_buf_is_loaded(buff) then
				local is_modified = vim.bo[buff].modified
				if not is_modified then
					vim.api.nvim_buf_delete(buff, { force = true })
				end
			end
		end
	end, { desc = 'Close all unmodified buffers' })
}
