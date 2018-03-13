" setup for manually installed vim-plug (for nvim)
call plug#begin('~/.local/share/nvim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
" end setup for vim-plug

" Basics
set number
set scrolloff=7
set textwidth=80

" eggache vim
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa
:command QA qa

" Cscope shortcuts
nmap <unique> <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <unique> <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <unique> <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <unique> <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <unique> <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-Space><C-Space>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-Space><C-Space>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-Space><C-Space>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-Space><C-Space>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-Space><C-Space>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-Space><C-Space>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <unique> <C-Space><C-Space>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <unique> <C-Space><C-Space>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

" Nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '\.o$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '~'

" Tagbar
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1

" Airline
let g:airline_theme='minimalist'

" Keybindings for plugin toggle
nmap <F5> :TagbarToggle<cr>
nmap <F6> :NERDTreeToggle<cr>