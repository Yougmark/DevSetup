" setup for manually installed vim-plug (for nvim)
call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'donRaphaco/neotex', { 'for': 'tex' , 'branch': 'subfile'}
Plug 'lervag/vimtex'
Plug 'rhysd/vim-grammarous'
Plug 'bronson/vim-trailing-whitespace'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'tpope/vim-obsession'
Plug 'pprovost/vim-ps1'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
Plug 'MTDL9/vim-log-highlighting'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'alok/notational-fzf-vim'
Plug 'preservim/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'mg979/vim-visual-multi'
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree'
" Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'dag/vim-fish'
call plug#end()
call glaive#Install()
" end setup for vim-plug

" Basics
set relativenumber
set number
set scrolloff=7
set sidescroll=10
set textwidth=80

set shiftwidth=4
set tabstop=4
set expandtab
set ignorecase
set smartcase

" e ++ff=dos

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

" eggache vim
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa
:command QA qa

" Cscope shortcuts
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-Space><C-Space>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space><C-Space>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

" Nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '\.o$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"
"let g:NERDTreeDirArrowExpandable = '+'
"let g:NERDTreeDirArrowCollapsible = '~'

" Tagbar
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1

" Airline
" let g:airline_theme=''

" Keybindings for plugin toggle
nmap <F5> :TagbarToggle<cr>
nmap <F6> :NERDTreeToggle<cr>

" LaTex
let g:tex_flavor="latex"

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  " has jumping to async keyword issue; replaced by let g:rustfmt_autosave = 1
  " autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  " autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

colorscheme gruvbox

source ~/.config/nvim/coc.vim
source ~/.config/nvim/nvim-tree.vim

" CtrlP
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_clear_cache_on_exit = 0
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
" set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
"
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"   \ 'file': '\v\.(exe|so|dll)$',
"   \ 'link': 'some_bad_symbolic_links',
"   \ }
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" help ctrlp-mappings or submit ? in ctrlp for more help

" fugitive

map <leader>* :grep '\b<cword>\b'<CR>

" ripgrep
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" notational-fzf-vim
let g:nv_search_paths = ['~/note']
noremap <leader>n :NV<CR>
vnoremap <leader>n <C-C>:NV<CR>
inoremap <F3> <C-O>:NV<CR>
let g:nv_create_note_window = 'tabedit'

" fzf
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '60%' }
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

nmap <c-p> :GFiles<CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" misc
" add date
map <leader>d a<!-- <C-R>=strftime("%c")<CR> --><Esc>
" unmap F1
"
map <F1> <Esc>
imap <F1> <Esc>

vmap "+y :!xclip -f -sel clip<CR>
map "+p :r!xclip -o -sel clip<CR>

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" vim-devicons
set encoding=UTF-8

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
vnoremap m "hy:Rg <C-r>h<enter>

set mouse=

let g:rustfmt_autosave = 1
