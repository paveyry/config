" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim73/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

"              __     _____ __  __ ____   ____     ______   __
"              \ \   / /_ _|  \/  |  _ \ / ___|   | __ ) \ / /
"               \ \ / / | || |\/| | |_) | |       |  _ \\ V / 
"                \ V /  | || |  | |  _ <| |___    | |_) || |  
"                 \_/  |___|_|  |_|_| \_\\____|   |____/ |_|  
"                                             
"                  _    ____  _____ ______        ___    ____  
"                 / \  |  _ \| ____/ ___\ \      / / \  |  _ \ 
"                / _ \ | |_) |  _| \___ \\ \ /\ / / _ \ | |_) |
"               / ___ \|  _ <| |___ ___) |\ V  V / ___ \|  _ < 
"              /_/   \_\_| \_\_____|____/  \_/\_/_/   \_\_| \_\

" Disable vi compatibility mode
set nocompatible

" Reload a file when it is changed from the outside
set autoread

" Write the file when we leave the buffer
set autowrite

" Force encoding to utf-8, for systems where this is not the default (windows
" comes to mind)
set encoding=utf-8

" Show line number
set number

" Removes spaces at end of lines when writing
autocmd BufWritePre * :%s/\s\+$//ge

" Closes Brackets, braces, strings... automatically
autocmd FileType php,c,java,cpp,js inoremap {<CR>  {<CR>}<Esc>O
autocmd FileType php,c,java,cpp,js inoremap (  ()<Esc>ha
autocmd FileType php,c,java,cpp,js inoremap "  ""<Esc>ha
autocmd FileType php,c,java,cpp,js inoremap '  ''<Esc>ha
autocmd FileType php,c,java,cpp,js inoremap [  []<Esc>ha
autocmd FileType php,c,java,cpp,js inoremap /* /*  */<Esc>hhha
autocmd FileType c,cpp inoremap //* /**<CR><Esc>0i*/<Esc>O<Esc>0i** 

" Displays Line ends and invisible chars
set list
set listchars=tab:>─,eol:¬,trail:\ ,nbsp:¤


" Set the minimal amount of lignes under and above the cursor
" Useful for keeping context when moving with j/k
set scrolloff=5

" Enables syntax highlighting
syntax on

" Default cterm foreground and background color to NONE
highlight Normal ctermfg=NONE ctermbg=NONE

" Background color in the first 80 columns different from the next
let &colorcolumn=join(range(80,999),",")
highlight ColorColumn ctermbg=234 guibg=234

" Allow mouse use in vim
set mouse=a

" Highlight current line
hi CursorLine cterm=NONE ctermbg=236
set cursorline

" The length of a tab
" This is for documentation purposes only,
" do not change the default value of 8, ever.
set tabstop=8

" The number of spaces inserted when you press tab
set softtabstop=2

" The number of spaces inserted/removed when using < or >
set shiftwidth=2

" Insert spaces instead of tabs
set expandtab

" When tabbing manually, use shiftwidth instead of tabstop and softtabstop
set smarttab

" Set basic indenting (i.e. copy the indentation of the previous line)
" When filetype detection didn't find a fancy indentation scheme
set autoindent
autocmd Filetype c set cindent

