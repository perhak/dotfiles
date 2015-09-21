"           ___________________          _-_                 _      _-_      _          
"           \__(==========/_=_/ ____.---'---`---.____      _|_|.---'---`---.|_|_        
"                       \_ \    \----._________.----/      \----._________.----/        
"                         \ \   /  /    `-_-'                  `.  `]-['  ,'
"                     __,--`.`-'..'-_                            `.' _ `.'              
"                    /____          ||                            | (_) | 
"                         `--.____,-'                              `___' 


call pathogen#infect()

"  ______
" |      |.-----.--------.--------.-----.-----.
" |   ---||  _  |        |        |  _  |     |
" |______||_____|__|__|__|__|__|__|_____|__|__| 
"

syntax on
filetype plugin indent on
let mapleader = ","

set tabstop=2
set shiftwidth=2
set expandtab

" Använd systemets clipboard
set clipboard=unnamed

set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P
set laststatus=2

set splitbelow
set splitright

" Maintain more context around the cursor
set scrolloff=3

" Set window title to filename
set title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}
"set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)

" Show trailing whitespace, toggled by ,s
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

"set wrap
"set textwidth=79
"set formatoptions=qrn1
set colorcolumn=85

" Linenumbers relative to current line
set relativenumber
" Saves undo for each file even after closed
set undofile

"  _______               __               __   __
" |    |  |.---.-.--.--.|__|.-----.---.-.|  |_|__|.-----.-----.    .----.-----.--------.---.-.-----.-----.
" |       ||  _  |  |  ||  ||  _  |  _  ||   _|  ||  _  |     |    |   _|  -__|        |  _  |  _  |__ --|
" |__|____||___._|\___/ |__||___  |___._||____|__||_____|__|__|    |__| |_____|__|__|__|___._|   __|_____|
"                           |_____|                                                          |__|

" remap esc to jk in insert mode
inoremap jk <ESC>

" remap toggle between last open files
nnoremap <leader><leader> <c-^>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Opens new vertical split window and sets focus to it
nnoremap <leader>w <C-w>v<C-w>l

" remapping of matching brackets
nnoremap <tab> %
vnoremap <tab> %

" Movement by screen line instead of file line
nnoremap j gj
nnoremap k gk

" Removes whitespace from end of lines
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "vsp " . filename
  endfor
endfunction

command! OpenChangedFiles :call OpenChangedFiles()

"  _______                         __   
" |     __|.-----.---.-.----.----.|  |--.
" |__     ||  -__|  _  |   _|  __||     |
" |_______||_____|___._|__| |____||__|__|

" Inserts /\v before searches wich makes vim use regular regexp syntax and
" characters
nnoremap / /\v
vnoremap / /\v

" Case smart searching / only case sensitive when uppercase letter in 
" search expression, * is still case sensitive.
set ignorecase
set smartcase
" sets global substitution default on
set gdefault
" highlights search as u type
set incsearch
set showmatch
set hlsearch
" remove search highlighting
nnoremap <leader><space> :noh<cr>

nnoremap <leader>D :tabclose<cr>

"  ______         __                              __
" |      |.-----.|  |.-----.----.    .-----.----.|  |--.-----.--------.-----.
" |   ---||  _  ||  ||  _  |   _|    |__ --|  __||     |  -__|        |  -__|
" |______||_____||__||_____|__|      |_____|____||__|__|_____|__|__|__|_____|

" oklart vad de två raderna under gör eller inte gör!!!
"set t_Co=16
se t_Co=16
let g:solarized_termcolors=16
"set background=dark
set background=light
colorscheme solarized


"  _______ __ __             __                                                  __   ___ __
" |    ___|__|  |.-----.    |  |_.--.--.-----.-----.    .-----.-----.-----.----.|__|.'  _|__|.----.
" |    ___|  |  ||  -__|    |   _|  |  |  _  |  -__|    |__ --|  _  |  -__|  __||  ||   _|  ||  __|
" |___|   |__|__||_____|    |____|___  |   __|_____|    |_____|   __|_____|____||__||__| |__||____|
"                                |_____|__|                   |__|
"" Force *.hamlc be treated as haml
au BufRead,BufNewFile *.hamlc set ft=haml

" Sets indent in cucumber features
au FileType cucumber setl sw=2 sts=2 et


"  ______ __                     __
" |   __ \  |.--.--.-----.______|__|.-----.-----.
" |    __/  ||  |  |  _  |______|  ||     |__ --|
" |___|  |__||_____|___  |      |__||__|__|_____|
"                  |_____|
" CommandT
let g:CommandTMatchWindowReverse = 1
"let g:CommandTAcceptSelectionSplitMap='<C-CR>'


" Gundo - show vim's undo tree
nnoremap <F5> :GundoToggle<CR>

"                ,
"               / \,,_  .'|
"            ,{{| /}}}}/_.'            _____________________________________________
"           }}}}` '{{'  '.            /                                             \
"         {{{{{    _   ;, \          /            Ladies and Gentlemen,              \
"      ,}}}}}}    /o`\  ` ;)        |                                                |
"     {{{{{{   /           (        |                 this is ...                    |
"     }}}}}}   |            \       |                                                |
"    {{{{{{{{   \            \      |                                                |
"    }}}}}}}}}   '.__      _  |     |    _____             __             __  _      |
"    {{{{{{{{       /`._  (_\ /     |   / ___/__  ______  / /_____ ______/ /_(_)____ |
"     }}}}}}'      |    //___/   --=:   \__ \/ / / / __ \/ __/ __ `/ ___/ __/ / ___/ |
" jgs `{{{{`       |     '--'       |  ___/ / /_/ / / / / /_/ /_/ (__  ) /_/ / /__   |
"      }}}`                         | /____/\__, /_/ /_/\__/\__,_/____/\__/_/\___/   |
"                                   |      /____/                                    |
"                                   |                                               /
"                                    \_____________________________________________/
"                                                                                                                                                            
" - check for code syntax errors and smells
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_ruby_checkers = ['mri', 'reek']

" Tagbar - browse file tags
nmap <F8> :TagbarToggle<CR>

" EasyTags
:let g:easytags_auto_update = 0
:let g:easytags_auto_highlight = 0

"" Defines tab for smart code completion
"function! SuperCleverTab()
"   if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
"      return "\<Tab>"
"   else
"      if &omnifunc != ''
"         return "\<C-X>\<C-O>"
"      elseif &dictionary != ''
"         return "\<C-K>"
"      else
"         return "\<C-N>"
"      endif
"   endif
"endfunction

"inoremap <Tab> <C-R>=SuperCleverTab()<cr>

"ruby
"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
"highlight Pmenu ctermbg=238 gui=bold

