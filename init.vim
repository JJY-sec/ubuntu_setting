source ~/.vimrc
nnoremap ` viw
" -------------------------------------------------------------
" WSL 2 사용 시 yank 내용을
" -------------------------------------------------------------
vnoremap <C-c> "+y

let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * call system('echo '.
                \shellescape(
                        \join(v:event.regcontents, "\<CR>")
                \).' | '.s:clip
        \)
    augroup END
end

" Plug-In 시작 (플러그인 설치 경로)
call plug#begin('~/.vim/plugged')

" 설치하고 싶은 플러그인 (예, NERDTree)
Plug 'preservim/nerdtree'
" 플러그인 시스템 초기화
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
call plug#end()

" 이하 본인의 nvim 설정
set nu
" Go to definition
nmap <silent> gd <Plug>(coc-definition)

" Go to type definition
nmap <silent> gy <Plug>(coc-type-definition)

" Find references
nmap <silent> gr <Plug>(coc-references)
nnoremap <leader>d :CocList symbols<CR>
set mouse=a
" Page down, up 키와 Ctrl + d/u를 서로 바꾸기
nnoremap <C-D> <PageDown>
nnoremap <C-U> <PageUp>
nnoremap <PageDown> <C-D>
nnoremap <PageUp> <C-U>
" Use <CR> to confirm completion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>"
