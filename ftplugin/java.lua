-- Need to download: https://projectlombok.org/download
local config = {
  cmd = {
    "jdtls",
    --"--jvm-arg=" .. string.format("-javaagent:/home/kodus/.local/share/lsp_servers/lombok.jar"),
  },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
