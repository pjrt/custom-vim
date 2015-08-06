set omnifunc=necoghc#omnifunc

set errorformat=%E%f:%l:%c:,%C%m
set errorformat+=%E%f:%l:%c:\ %m,%C%m
set errorformat+=%W%f:%l:%c:\ Warning:,%C%m

nnoremap <Leader>m :w<CR>:make<CR>
noremap <silent> <Leader>ff :cf .git/cabal.quickfix<CR>
noremap <silent> <Leader>fn :cn<CR>

set wildignore+=*/cabal-dev/*,*/dist/*,*.hi

" Search local or project for the class, trait, val or def under the cursor
nnoremap <silent><space>f /\(data\\|type\\|class) \<<C-r><C-w>\>/I<cr>
nnoremap <silent><space>gf :Unite -buffer-name=ack grep:.::(data\|type\|class)\ <C-r><C-w>\\b<cr>

function! GetPackageForFile()
    let regexes = [
                \   [ '/src',      '/src' ],
                \   [ '/test',      '/test' ],
                \ ]
    return _GetPackageForFile(regexes)
endfunction
