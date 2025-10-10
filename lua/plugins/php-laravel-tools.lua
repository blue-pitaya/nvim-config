return {
	{
		dir = os.getenv("HOME") .. "/projects/php-laravel-tools/nvim-plugin/php-laravel-tools",
		config = function()
			require("php-laravel-tools").setup()
		end,
	},
}
