"
" ========= [ COMMON PART ] =========

syntax on
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%' "Теперь, когда вы будете вводить последовательность %% в командной строке Vim, она автоматически будет замещаться путем к каталогу, где хранится активный файл, как если бы вы ввели %:h<Tab>

if len(nvim_list_uis())
    " your side effect code
endif

" set colorcolumn=80
set autoread
set cmdheight=2      " Give more space for displaying messages.
set cursorline
set expandtab        " преобразовать табуляцию в пробелы.Так же влияет на отступы, добавляемые командами >> и <<.
set hlsearch
set inccommand=split " Live замена в предпросмотре :%s/asdad/fsf/g. Крутая фича
set incsearch
set linebreak
set mouse=a
set nobackup         " no backup files
set nocompatible     " отключает поддержку vi
set noswapfile       " no swap files
" set nowrap
set nowritebackup    " only in case you don't want a backup file while editing
set nrformats=       " Она заставит Vim интерпретировать все числа как десятичные, независимо от наличия ведущего нуля.
set nu               "rnu        " Включение относительных номеров строк
set pastetoggle=<F3>
set shiftwidth=2     "по умолчанию используется для регулирование ширины отступов в пробелах, добавляемых командами >> и <<. Если значение опции не равно tabstop, как и в случае с softtabstop, отступ может состоять как из символов табуляций так и из пробелов. При включении опции — smarttab, оказывает дополнительное влияние.
set showcmd
set showmatch        " проверка скобок
set smartindent      " Умные отступы (например, автоотступ после {)
set smarttab         "(выключена) — в случае включения этой опции, нажатие Tab в начале строки (если быть точнее, до первого непробельного символа в строке) приведет к добавлению отступа, ширина которого соответствует shiftwidth (независимо от значений в tabstop и softtabstop). Нажатие на Backspace удалит отступ, а не только один символ, что очень полезно при включенной expandtab. Напомню: опция оказывает влияние только на отступы в начале строки, в остальных местах используются значения из tabstop и softtabstop.
set splitbelow
set splitright
set t_Co=256
set tabstop=2        "количество пробелов, которыми символ табуляции отображается в тексте. Оказывает влияние как на уже существующие табуляции, так и на новые. В случае изменения значения, «на лету» применяется к тексту.
" set termguicolors "Uncomment to disable colorscheme gruvbox
set ts=2             "Табуляция в 2 символа
set undodir=~/.vim/undodir
set undofile

set listchars=tab:>-,space:.,eol:\ " Set tabs and space symbol
let g:indentLine_char = '│'
let g:indent_blankline_char = '│'
let g:indent_blankline_space_char = ' '
let g:indent_blankline_indent_level = 4
let g:indentLine_char_list = ['│', '¦', '┆', '┊']
let g:indent_blankline_filetype_exclude = ['help, *.md']
let g:indent_blankline_bufname_exclude = ['*.md', '*.json', '.*\.py']
let g:indentLine_setConceal = 0  " Fixed json's doublequotes ""
highlight ColorColumn ctermbg=0 guibg=lightgrey "Color for vertical line

" PLUGINS
call plug#begin('~/.config/nvim/plugged')

" Text managing and linting
Plug 'junegunn/vim-easy-align'
Plug 'hashivim/vim-terraform'

" Completion
Plug 'jiangmiao/auto-pairs'

" " Common
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'davidhalter/jedi-vim'      "Maybe not for this plugin manager
Plug 'francoiscabrol/ranger.vim' " RANGER File manager instead of built in nerdtree
Plug 'rbgrouleff/bclose.vim'     " Needs for properly working ranger plugin. Closing buffer. For nvim only.
Plug 'tpope/vim-surround'
Plug 'qpkorr/vim-bufkill'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'dhruvasagar/vim-table-mode' " Table mode
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Colors and themes
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'
Plug 'wojciechkepka/vim-github-dark'

"Search and destroy
Plug 'dkprice/vim-easygrep'

" " Programming
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'mbbill/undotree'
Plug 'junegunn/gv.vim'    " A git commit browser in Vim
Plug 'tpope/vim-fugitive' " Крутая работа с гитом
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" " Comment cool
Plug 'scrooloose/nerdcommenter' " Для обалденного и удобного комментирования

" " Themes
Plug 'gruvbox-community/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'KabbAmine/vCoolor.vim'

" " Code2picture
Plug 'segeljakt/vim-silicon'
" ----------------------------------------

Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
call plug#end()


let g:loaded_ruby_provider = 0
setf dosini " Enable highlight for the conf and ini files

let g:gruvbox_invert_selection='0' " Adds background coloring for selected symbols with their own color.
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" au FileType json setlocal cole=0

" Clipboard ------------------------------
noremap gy "+y
noremap gp "+p
noremap gP "+P

let loaded_matchparen = 1
" Setting leader key to space
let mapleader = " "
nmap <leader>fp :let @" = expand("%:p")<CR>
nmap <leader>ra :Ranger<CR>

" =============
" Commenter
let g:NERDSpaceDelims     = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign    = 'left'

" let g:jellybeans_background_color = "none"

let g:vim_markdown_folding_disabled=1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" Позволяет точке работать как макрос, сразу на несколько выделенных строк
vnoremap . :norm.<CR>
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

"Airline
set guifont='Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11'
let g:airline_theme                        = 'angr' " term - also good
let g:airline_powerline_fonts              = 1
let g:airline#extensions#tabline#enabled   = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_y                    = ' d'


" === VIM color self options ===

set background=dark
" autocmd vimenter * ++nested colorscheme solarized8_high
autocmd vimenter * ++nested colorscheme gruvbox


let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

hi Normal guibg=NONE
hi Comment guifg=#A9A9A9 gui=italic
hi CursorLine guibg=#384873 guifg=#FFFFFF
hi Visual guibg=#ffbc00 guifg=#384873
hi CocHighlightText guibg=#708090 guifg=#FFFFFF

" Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down one entire line. with line wrapping on, this can cause the cursor to actually skip a few lines on the screen because it's moving from line N to line N+1 in the file. I want this to act more visually -- I want `down' to mean the next line on the screen
nmap j gj
nmap k gk

" Renaming a word for a whole project
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>

" Fast spkklit switch focus
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

noremap Q !!$SHELL<CR> " Выполнение команды в шелле, название которой находится под курсором
nnoremap * *N

" Inserts linebreak without staying in instert mode. Plus changes timeout before waiting just o or just O symbol
nmap oo o<Esc>k
nmap OO O<Esc>j

"Timeout for leader key activity
set timeoutlen=400
set go+=a
filetype on
filetype plugin on
set omnifunc=syntaxcomplete#Complete

set scrolloff=6 " 5 строк при скролле за раз

" GIT ----------------------------------------
" Sweet Sweet FuGITive
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>

nnoremap <leader>gb :GBranches<CR>
nnoremap <leader>gd :Gdiffsplit<CR>
nnoremap <leader>gD :GBranches diff<CR>
nmap <leader>gs :G<CR> " Git status
nnoremap <leader>gc :Git commit -v<CR>
nnoremap <leader>gC :Gdiffsplit!<CR>
nnoremap <leader>ga :Git commit --amend<CR>

let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_branch_actions = {
      \ 'delete': {'keymap': 'ctrl-r'},
      \}
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let g:fzf_branch_actions = {
      \ 'diff': {
      \   'prompt': 'Diff> ',
      \   'execute': 'Gvdiffsplit {branch}',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-f',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \}

" RANGER --------------------------------------------------

" map <C-S-n> :RangerCurrentFileNewTab<CR>
let g:ranger_map_keys      = 0
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory
let g:ranger_on_exit       = 'bw!' " Обязательная опция что бы буфер закрывался автоматически после выхода из ренджера, а не висел ексит 0 терминала.
" =======================

nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

" Enabling relative numbers
nmap <leader>ne <Esc>:set nu!<cr>      " Toggle line numbers
nmap <leader>nr <Esc>:set nu! rnu!<cr> " Toggle line relative numbers

nmap     <leader>jk <Esc>:w<cr>            " Fast way to save from normal
imap     <leader>jk <Esc>:w<cr>            " Fast way to save from instert
imap     jk         <Esc>                  " Fast way for switch to command mode from instert
vmap     jk         <Esc>                  " Fast way for switch to command mode from visual
nmap     <F4>       :BD<CR>
noremap  <F5>       :set list!<CR>         " Toggle list. Space, tab, eol symbols, etc.
inoremap <F5>       <C-o>:set list!<CR>
cnoremap <F5>       <C-c>:set list!<CR>
nmap     <F6>       :q!<cr>                " Just Quit without saving

set encoding=utf-8
set wildmenu " String ending format
set wcm=<Tab>
menu string-end.unix :set fileformat=unix<CR>
menu string-end.dos  :set fileformat=dos<CR>
menu string-end.mac  :set fileformat=mac<CR>
map <F7> :emenu string-end.<Tab>

map <F9> :emenu Exec.<Tab>
set wildmenu " code executer
set wcm=<Tab>
menu Exec.Go            :!go run % <CR>
menu Exec.Python3       :!python3 % <CR>
menu Exec.Python2.7     :!python2.7 % <CR>
menu Exec.bash          :!/bin/bash % <CR>
menu Exec.Dockerfile    :!docker build . <CR>
menu Exec.Yaml-Linter   :!yamllint -c ~/.yamllint/default % <CR>

set wildmenu " Encoding changing
set wcm=<Tab>
menu Encoding.utf-8   :e ++enc=utf-8<CR>
menu Encoding.koi8-r  :e ++enc=koi8-r<CR>
menu Encoding.cp1251  :e ++enc=cp1251<CR>
menu Encoding.cp866   :e ++enc=cp866<CR>
menu Encoding.ucs-2le :e ++enc=ucs-2le<CR>
map <F8> :emenu Encoding.<Tab>

" ============== FILETYPE DIFFERENT SETTINGS ================
autocmd Filetype py setlocal set tabstop=4 set shiftwidth=4 set ts=4	"Табуляция в 4 символа для питона

let g:go_def_mapping_enabled = 0
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Remap for rename current variable
nmap <F2> <Plug>(coc-rename)

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]
" from readme
" if hidden is not set, TextEdit might fail.

command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<c-n>" :
            \ <sid>check_back_space() ? "\<tab>" :
            \ coc#refresh()

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" GoTo code navigation.
" nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename) " Rename variable in whole file
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart


" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

vnoremap X "_d
nnoremap <C-S> :w<CR>
vnoremap <C-S> <esc>:w<CR>
inoremap <C-S> <esc>:w<CR>
nnoremap <C-Q> :q<CR>
inoremap <C-Q> <esc>:q<CR>
nnoremap <Leader><Space> :nohlsearch<CR>
nnoremap ,, :NERDTreeFind<CR>

" FZF
nnoremap <silent> <C-p> :call FZFOpen(':FZF')<CR>
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" gitgutter
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added                     = '┃'
let g:gitgutter_sign_modified                  = '┃'
let g:gitgutter_sign_removed                   = '┃'
let g:gitgutter_sign_removed_first_line        = '┃'
let g:gitgutter_sign_modified_removed          = '┃'

" FUNCTIONS
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 50)
augroup END

autocmd BufWritePre * :call TrimWhitespace() " Remove white spaces in the end while file save

set cole=0
