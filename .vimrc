" Make sure that we aren't in VI compatibility mode
set nocompatible

" Use UTF-8.
set encoding=utf-8

" Enable syntax highlighting.
syntax on

" Automatically indent when adding a curly bracket, etc.
set smartindent

" Tabs should be converted to a group of 4 spaces.
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

" Configure formatting, in particular enable comment wrapping
set formatoptions=tcroq

" Enable Backspace usage
set backspace=indent,eol,start

" Highlight trailing whitespace
set list
set listchars=tab:·\ ,trail:· "

" On save any: trim trailing whitespace
autocmd! BufWrite * mark ' | silent! %s/\s\+$// | norm ''

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=999

" Disable Input Method as it causes problems with keyboard layout switching
set imd

" Set color scheme that I like.
if has("gui_running")
    colorscheme macvim
else
    colorscheme darkblue
endif

" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position

" Show line number, cursor position.
set ruler

" Display incomplete commands.
set showcmd

" To save, press ctrl-s.
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" To create new tab, press ctrl-t.
nmap <c-t> :tabnew<CR>
imap <c-t> <Esc>:tabnew<CR>a

" Search as you type.
set incsearch

" Ignore case when searching.
set ignorecase

" Show autocomplete menus.
set wildmenu

" Show editing mode
set showmode

" Error bells are displayed visually.
set visualbell

" Setup compiler for python files
autocmd BufNewFile,BufRead *.py compiler python

" Setup compiler and filetype for haXe files
autocmd BufNewFile,BufRead *.hx compiler haxe
autocmd BufNewFile,BufRead *.hx set filetype=haxe

" Setup close XML/HTML tags plugin for files which can contain XML/HTML
au Filetype html,xml,xsl,php,jsp,gsp source ~/.vim/scripts/closetag.vim

" Custom menu for encodings

" TODO: Check what for next two options
set wildmenu
set wcm=<Tab>

menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>


" Vim Pathogen package manager
filetype off

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Enable indentation for Vim plugins
filetype plugin indent on

" Zen Coding configuration
let g:user_zen_settings = {
\  'gsp' : {
\    'extends' : 'html',
\    'filters' : 'c',
\  }
\}


