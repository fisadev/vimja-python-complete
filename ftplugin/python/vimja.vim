function! VimjaComplete(findstart, base)
python << EOF
import vim

findstart = int(vim.eval('a:findstart'))
base = vim.eval('a:base')

if findstart:
    # find the start of the relevant word to autocomplete
    column = vim.current.window.cursor[1]
    while column > 0 and vim.current.line[column - 1].isalpha():
        column -= 1
    vim.command('return %i' % column)
else:
    # return autocomplete suggestions
    # TODO do the magic here!
    suggestions = ['sugg1', 'sugg2', 'sugg3']
    vim.command('return [%s]' % ', '.join('"%s"' % s for s in suggestions))
EOF
endfunction

setlocal omnifunc=VimjaComplete
