return {
  cmd = { "texlab" },
  filetypes = { "tex", "plaintex", "bib" },
  root_dir = require'lspconfig.util'.root_pattern('.git', '.latexmkrc', '.texlabroot', 'texlabroot', 'Tectonic.toml'),
}
