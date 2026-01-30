" ~/.vimrc

" Usage Settings
set showcmd             	" Show the cmd being typed in the left hand corner
set wildmenu            	" Show a menu for commands with <TAB> completion
if has('mouse')
  set mouse=a				" for those who feel compelled to use a mouse
endif                     
syntax on			" Enable syntax highlighting
set autoindent                  " Autoindent on
filetype plugin indent on   	" Load indentation plugins based on filetype
set ignorecase                  " Search without regards to case.

set incsearch               	" Search as you type
set hlsearch                	" Highlight searched items

set nojoinspaces                " Don't add white space after ., ?, !
set showmatch                   " Check matching delims () {} []

set backspace=indent,eol,start  " Make backspace work normally.
set bs=2                        " Fix backspacing in insert mode.

" UI Settings
set nocompatible        	" Use only vim features
set number              	" Displays line numbers
set ruler               	" Show line number and character under cursor
set nowrap                      " No line wrapping!
set noerrorbells                " Turn off error bells (screen flashing).
set cursorline			" Show current line
set showmode                    " Show curr mode (Insert, Replace, Visual, etc)
set belloff=all                 " Disables visual bell screen flash

if exists( "+colorcolumn" )
    set colorcolumn=80      " set a colorcolumn if possible
else
    :2mat ErrorMsg '\%81v.' " highlight if chars over 80
endif


" Assembly Files
" Do not expand tabs in assembly file.  Make them 8 chars wide.
au BufRead,BufNewFile *.s set noexpandtab
au BufRead,BufNewFile *.s set shiftwidth=8
au BufRead,BufNewFile *.s set tabstop=8

" C & Java Files
" Expand tabs in C, Java files to spaces.
au BufRead,BufNewFile *.{c,h,java} set expandtab
au BufRead,BufNewFile *.{c,h,java} set shiftwidth=2
au BufRead,BufNewFile *.{c,h,java} set tabstop=2
