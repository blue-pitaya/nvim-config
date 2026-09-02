-- stylua: ignore start
return {
	enable = function()
        -- pacman -S bubblewrap
        -- npm i intelephense -g
        -- Config ref: https://github.com/yaegassy/coc-intelephense
		vim.lsp.config("intelephense", {
			cmd = {
				"bwrap",
				-- system binaries, libs, node runtime
				"--ro-bind", "/usr", "/usr",
				-- dns, certs, timezone
				"--ro-bind", "/etc", "/etc",
				-- empty writable home (hides real home)
				"--tmpfs", vim.fn.expand("~"),
				-- intelephense binary (symlink target)
				"--ro-bind", vim.fn.expand("~/.local/bin"), vim.fn.expand("~/.local/bin"),
				-- intelephense js source
				"--ro-bind", vim.fn.expand("~/.local/lib"), vim.fn.expand("~/.local/lib"),
				-- arch merged-usr symlinks
				"--symlink", "usr/lib", "/lib",
				"--symlink", "usr/lib", "/lib64",
				"--symlink", "usr/bin", "/bin",
				-- node needs /proc/self
				"--proc", "/proc",
				-- /dev/null, /dev/urandom
				"--dev", "/dev",
				-- writable scratch space
				"--tmpfs", "/tmp",
				-- project files (read-only)
				"--ro-bind", vim.fn.getcwd(), vim.fn.getcwd(),
				-- no network for process and children
				"--unshare-net",
				-- kill when neovim exits
				"--die-with-parent",
				"--", vim.fn.expand("~/.local/bin/intelephense"), "--stdio",
			},
			settings = {
				intelephense = {
					files = {
						exclude = {
							"**/.git/**",
							"**/.svn/**",
							"**/.hg/**",
							"**/CVS/**",
							"**/.DS_Store/**",
							"**/node_modules/**",
							"**/bower_components/**",
							"**/vendor/**/{Tests,tests}/**",
							"**/.history/**",
							"**/vendor/**/vendor/**",
							"**/*.blade.php",
						},
					},
					diagnostics = { enable = true },
					telemetry = { enabled = false },
					completion = {
						parameterCase = "camel",
						propertyCase = "camel",
					},
				},
			},
		})
		vim.lsp.enable("intelephense")
	end,
}
-- stylua: ignore end
