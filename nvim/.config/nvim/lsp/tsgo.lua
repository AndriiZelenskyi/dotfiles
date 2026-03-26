return {
  cmd = { 'tsgo', '--lsp' },
  filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx' },
  root_markers = {
    '.moon',
    'moon.yml',
    'moon.json',
    'tsconfig.json',
    'package.json',
    'jsconfig.json',
    '.git',
  },
}
