set errorformat=\[error]\ %f:%l:%c:\ %m,
set errorformat+=%E\ %#[error]\ %#%f:%l:\ %m,%-C\ %#[error]\ %m,%-Z\ %#[error]\ %p^
set errorformat+=%W\ %#[warn]\ %#%f:%l:\ %m,%-C\ %#[warn]\ %m,%-Z\ %#[warn]\ %p^
set errorformat+=%-G%.%#
noremap <silent> <Leader>ff :cf .git/sbt.quickfix<CR>
noremap <silent> <Leader>fn :cn<CR>

" Search local or project for the class, trait, val or def under the cursor
nnoremap <silent><space>f /\(def\\|val\\|class\\|trait\\|object\) \<<C-r><C-w>\>/I<cr>
nnoremap <silent><space>gf :Unite -buffer-name=ack grep:.::(def\|class\|trait\|object)\ <C-r><C-w>\\b<cr>
nnoremap <silent><space>ge :Unite -buffer-name=ack grep:.::(extends\|with)\ <C-r><C-w>\\b<cr>
" class User
" class UserName

function! GetPackageForFile()
    let regexes = [
                \   [ '/src/main/scala',      '/src/main/scala' ],
                \   [ '/src/test/scala',      '/src/test/scala' ],
                \   [ '/src/it/scala',        '/src/it/scala' ],
                \   [ '/src/multi-jvm/scala', '/src/multi-jvm/scala' ],
                \   [ '/app/model/scala',     '/app/model/scala' ],
                \   [ '/app/controllers',     '/app' ],
                \   [ '/app/com',             '/app' ],
                \   [ '/test/com',            '/test' ],
                \   [ '/test/scala',          '/test/scala' ]
                \ ]
    return _GetPackageForFile(regexes)
endfunction
