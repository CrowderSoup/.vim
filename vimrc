set nocompatible              " be iMproved, required
filetype off                  " required

" Need to set a couple os specific things
let s:uname = system("uname")
if s:uname == "Darwin\n"
  let g:python_host_prog = expand('~/.pyenv/versions/global/bin/python')
  let g:python3_host_prog = expand('~/.pyenv/versions/global/bin/python3')

  set clipboard=unnamed
else
  let g:python_host_prog = $HOME.'/.pyenv/versions/global/bin/python'
  let g:python3_host_prog = $HOME.'/.pyenv/versions/global/bin/python3'

  set clipboard=unnamedplus
endif

" Some plugins are hosted on GitLab, thus:
let gitlab = 'https://gitlab.com/'

" ----------------------------------------- "
" Plugins       			    			            "
" ----------------------------------------- "
" set the runtime path to include Vundle and initialize
if has("win32") || has("win16")
  set rtp+=~/vimfiles/bundle/Vundle.vim
else
  set rtp+=~/.vim/bundle/Vundle.vim
endif
call vundle#begin('~/.vim_plugins')

" ----------------------------------------- "
"  NVIM VS. VIM                             "
" ----------------------------------------- "
if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif

" ----------------------------------------- "
"  AutoComplete / Lint                      "
" ----------------------------------------- "
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'wellle/tmux-complete.vim'
Plugin 'w0rp/ale'
Plugin 'Raimondi/delimitMate'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sleuth'
Plugin 'leafgarland/typescript-vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'sheerun/vim-polyglot'
Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'mattn/emmet-vim'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'OrangeT/vim-csharp'
Plugin 'puremourning/vimspector'

" ----------------------------------------- "
"  Files / Finders                          "
" ----------------------------------------- "
Plugin 'junegunn/fzf'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'mcchrish/nnn.vim'

" ----------------------------------------- "
"  Interface / Usability                    "
" ----------------------------------------- "
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'moll/vim-bbye'
Plugin 'ap/vim-buftabline'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'mhinz/vim-sayonara'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ryanoasis/vim-devicons'
Plugin 'preservim/tagbar'
Plugin 'matze/vim-move'
Plugin 'tmux-plugins/vim-tmux-focus-events'

" ----------------------------------------- "
"  Git Integration                          "
" ----------------------------------------- "
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-conflicted'
Plugin 'airblade/vim-gitgutter'

" ----------------------------------------- "
"  Snippets                                 "
" ----------------------------------------- "
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" ----------------------------------------- "
"  Misc                                     "
" ----------------------------------------- "
Plugin 'wakatime/vim-wakatime'
Plugin gitlab.'dbeniamine/todo.txt-vim'
Plugin 'tpope/vim-dadbod'
"Plugin 'jmcantrell/vim-virtualenv'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Source My Helpers
if has("win32") || has("win16")
  source ~/vimfiles/helpers.vim
else
  source ~/.vim/helpers.vim
endif

"
" Settings
"
set noerrorbells                " No beeps
set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.

set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set nowritebackup
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set hidden

set ruler                       " Show the cursor position all the time
au FocusLost * :wa              " Set vim to save the file on focus out.

set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats

set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set ttyfast
set lazyredraw                  " Wait to redraw "

" speed up syntax highlighting
set nocursorcolumn
set nocursorline

syntax on
syntax sync minlines=256
set synmaxcol=300
set re=1

" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

" Make Vim to handle long lines nicely.
set wrap
set textwidth=79
set formatoptions=qrn1

set autoindent
set complete-=i
set showmatch
set smarttab

" Fix indentation
map <F7> gg=G<C-o><C-o>

set et
set tabstop=2
set shiftwidth=2
set expandtab

set nrformats-=octal
set shiftround

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Better Completion
set complete=.,w,b,u,t
set completeopt=menu,menuone,preview,noselect,noinsert

if &history < 1000
  set history=50
endif

if &tabpagemax < 50
  set tabpagemax=50
endif

if !empty(&viminfo)
  set viminfo^=!
endif

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

" Code folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \     exe "normal! g`\"" |
          \ endif

  augroup END
else
endif " has("autocmd")

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
      \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


syntax enable
if has('gui_running')
  set transparency=3
  " fix js regex syntax
  set regexpengine=1
  syntax enable
endif
set background=dark
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
set t_Co=256
colorscheme PaperColor
set guifont=FiraCode:h15
set guioptions-=L

" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" This trigger takes advantage of the fact that the quickfix window can be
" easily distinguished by its file-type, qf. The wincmd J command is
" equivalent to the Ctrl+W, Shift+J shortcut telling Vim to move a window to
" the very bottom (see :help :wincmd and :help ^WJ).
autocmd FileType qf wincmd J

" Some useful quickfix/location list shortcuts
":cc      see the current error
":cn      next error
":cp      previous error
":clist   list all errors
nnoremap <leader>s :cclose<CR>
nnoremap <leader>ls :lclose<CR>
nnoremap <leader>a :copen<CR>
nnoremap <leader>la :lopen<CR>
nnoremap <leader>n :cn<CR>
nnoremap <leader>ln :ln<CR>
nnoremap <leader>p :cp<CR>
nnoremap <leader>lp :lp<CR>
nnoremap <leader>l :clist<CR>

" Replace the current buffer with the given new file. That means a new file
" " will be open in a buffer while the old one will be deleted
com! -nargs=1 -complete=file Breplace edit <args>| bdelete #

function! DeleteInactiveBufs()
  "From tabpagebuflist() help, get a list of all buffers in all tabs
  let tablist = []
  for i in range(tabpagenr('$'))
    call extend(tablist, tabpagebuflist(i + 1))
  endfor

  "Below originally inspired by Hara Krishna Dara and Keith Roberts
  "http://tech.groups.yahoo.com/group/vim/message/56425
  let nWipeouts = 0
  for i in range(1, bufnr('$'))
    if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
      "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
      silent exec 'bwipeout' i
      let nWipeouts = nWipeouts + 1
    endif
  endfor
  echomsg nWipeouts . ' buffer(s) wiped out'
endfunction

command! Ball :call DeleteInactiveBufs()

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Buffer prev/next
nnoremap <C-x> :bnext<CR>
nnoremap <C-z> :bprev<CR>

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Fast saving
nmap <leader>w :w!<cr>

" Center the screen
nnoremap <space> zz

" Move up and down on splitted lines (on small width screens)
map <Up> gk
map <Down> gj
map k gk
map j gj

" Just go out in insert mode
imap jk <ESC>l

nnoremap <F6> :setlocal spell! spell?<CR>

" Select search pattern howewever do not jump to the next one
nnoremap <leader>c :TComment<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

autocmd BufEnter * silent! lcd %:p:h

" trim all whitespaces away
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Act like D and C
nnoremap Y y$

" Do not show stupid q: window
map q: :q

" sometimes this happens and I hate it
map :Vs :vs
map :Sp :sp

" dont save .netrwhist history
let g:netrw_dirhistmax=0

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" never do this again --> :set paste <ctrl-v> :set no paste
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" set 80 character line limit
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Insert current datetime
nnoremap <leader>D :put =strftime('%a %Y-%m-%d %H:%M:%S%z') <CR>

" Get current file path
nnoremap <leader>P :let @+ = expand("%:p")<cr>

" ----------------------------------------- "
" File Type settings 			    		          "
" ----------------------------------------- "

au BufNewFile,BufRead *.vim setlocal noet ts=2 sw=2 sts=2
au BufNewFile,BufRead *.txt setlocal noet ts=2 sw=2
au BufNewFile,BufRead *.md setlocal spell noet ts=2 sw=2
au BufNewFile,BufRead *.yml,*.yaml setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.json setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.js setlocal expandtab ts=2 sw=2

augroup filetypedetect
  au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  au BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
augroup END

au FileType nginx setlocal noet ts=4 sw=4 sts=4

" Go settings
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

" Markdown Settings
autocmd BufNewFile,BufReadPost *.md setl ts=4 sw=4 sts=4 expandtab

" shell/config/systemd settings
autocmd FileType gitconfig,sh,toml set noexpandtab

" toml settings
au BufRead,BufNewFile MAINTAINERS set ft=tom

" spell check for git commits
autocmd FileType gitcommit setlocal spell

" curl bindings
au BufNewFile,BufRead *.curl setlocal filetype=curl syntax=bash
autocmd FileType curl nmap <buffer> <leader>r vipyPgvO<Esc>O<Esc>gv:!curl --config -<CR> <bar> :-1 <bar> :put =strftime('# %a %Y-%m-%d %H:%M:%S%z') <CR>

" Wildmenu completion {{{
set wildmenu
" set wildmode=list:longest
set wildmode=list:full

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=go/pkg                           " Go static files
set wildignore+=go/bin                           " Go bin files
set wildignore+=go/bin-vagrant                   " Go bin-vagrant files
set wildignore+=*.orig                           " Merge resolution files

" ----------------------------------------- "
" Plugin configs 			    			            "
" ----------------------------------------- "

" ========= Vundle ==================================== "
map :pi :PluginInstall

" ========= deoplete ================================== "
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
      \ 'auto_refresh_delay': 0,
      \ 'num_processes': 5,
      \ })

if !has('nvim')
  call deoplete#custom#option('yarp', v:true)
endif

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" ========= A.L.E ===================================== "
" AutoComplete

" Key Mapping
nnoremap <leader>gd :ALEGoToDefinition<CR>
nnoremap <leader>gr :ALEFindReferences<CR>
nnoremap <leader>gt :ALEHover<CR>
nmap <silent> <C-a> <Plug>(ale_previous_wrap)
nmap <silent> <C-s> <Plug>(ale_next_wrap)

let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \   'go': ['gofmt', 'goimports'],
      \   'python': ['autopep8'],
      \ }

let g:ale_linters = {
      \   'go': ['govet', 'gofmt', 'golint', 'gopls'],
      \   'python': ['pylint', 'flake8', 'pyls'],
      \   'cs': ['OmniSharp'],
      \ }

" Python Config
let g:ale_python_pylint_options = '--load-plugins pylint_sqlalchemy'

" Turn some things on
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1

" AutoComplete
let g:ale_completion_enabled = 0

" ========= fzf ======================================= "
set rtp+=~/.fzf
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'FZF ' s:find_git_root()

map <C-p> :ProjectFiles<CR>

" ========= delimitMate =============================== "
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

"========== NerdTree ================================== "
" For toggling
command! NTToggle execute 'NERDTreeToggle' s:find_git_root()
nmap <C-n> :NTToggle<CR>
nmap <C-f> :NERDTreeFind<CR>

let NERDTreeShowHidden=1

let NERDTreeIgnore=['\~$', '\.git$', '.DS_Store', 'node_modules', '.vscode','.venv','__pycache__', '.pyc', '*.egg-info']

" Close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"========== NerdTree ================================== "
nnoremap <silent> <leader>f :NnnPicker<CR>

let g:nnn#command = 'nnn -d ' . s:find_git_root()
let g:nnn#set_default_mappings = 0
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }

" ========= vim-airline =============================== "

let g:airline_theme='hybridline'

" set to use powerline fonts when not in a ssh session
let g:remoteSession = ($STY == "")
if !g:remoteSession
  let g:airline_powerline_fonts=1
endif

" ========= vim-better-whitespace ===================== "

" auto strip whitespace except for file with extention blacklisted
let blacklist = ['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | StripWhitespace

" ========= vim-markdown ==================

" disable folding
let g:vim_markdown_folding_disabled = 1

" Allow for the TOC window to auto-fit when it's possible for it to shrink.
" It never increases its default size (half screen), it only shrinks.
let g:vim_markdown_toc_autofit = 1

" Disable conceal
let g:vim_markdown_conceal = 0

" Allow the ge command to follow named anchors in links of the form
" file#anchor or just #anchor, where file may omit the .md extension as usual
let g:vim_markdown_follow_anchor = 1

" highlight frontmatter
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1

" ========= Terraform ================================= "
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_commentstring='//%s'
let g:terraform_fmt_on_save=1

" ========= Sayonara ================================== "
nnoremap <silent> <leader>q :Sayonara!<CR>

" ========= JsDoc ===================================== "
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_enable_es6 = 1
nnoremap <leader>jd :JsDoc<CR>

" ========= vim-multiple-cursors ====================== "
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-i>'
let g:multi_cursor_prev_key='<C-y>'
let g:multi_cursor_skip_key='<C-b>'
let g:multi_cursor_quit_key='<Esc>'

" ========= SnipMate ================================== "
"to prevent clash with youcompleteme, change snippet trigger
let g:snipMate = { 'snippet_version' : 1 }
imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" ========= TagBar ==================================== "
nmap <F8> :TagbarToggle<CR>

" ========= TableMode ================================= "
let g:table_mode_corner='|'

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
      \ <SID>isAtStartOfLine('\|\|') ?
      \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
      \ <SID>isAtStartOfLine('__') ?
      \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" ========= vim-jsx =================================== "
let g:jsx_ext_required = 0

" ========= Fugitive ================================== "
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gw :Gwrite<CR>


" ========= Vim Todo.txt =========================== "
au filetype todo setlocal omnifunc=todo#Complete

" ========= Vim DadBod ============================== "
"" operator mapping
func! DBExe(...)
  if !a:0
    let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
    return 'g@'
  endif
  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@

  if a:1 == 'char'	" Invoked from Visual mode, use gv command.
    silent exe 'normal! gvy'
  elseif a:1 == 'line'
    silent exe "normal! '[V']y"
  else
    silent exe 'normal! `[v`]y'
  endif

  execute "DB " . @@

  let &selection = sel_save
  let @@ = reg_save
endfunc

" Source my Config
call SourceIfExists("~/.local_config/dadbod.vim")

command! DBSelect :call popup_menu(map(copy(g:dadbods), {k,v -> v.name}), #{
      \callback: 'DBSelected'
      \})

func! DBSelected(id, result)
  if a:result != -1
    let b:db = g:dadbods[a:result-1].url
    echomsg 'DB ' . g:dadbods[a:result-1].name . ' is selected.'
  endif
endfunc

xnoremap <expr> <Plug>(DBExe)     DBExe()
nnoremap <expr> <Plug>(DBExe)     DBExe()
nnoremap <expr> <Plug>(DBExeLine) DBExe() . '_'

xmap <leader>db  <Plug>(DBExe)
nmap <leader>db  <Plug>(DBExe)
omap <leader>db  <Plug>(DBExe)
nmap <leader>dbb <Plug>(DBExeLine)

" ================== Emmet-Vim ========================="
let g:user_emmet_leader_key='<C-c>'

" ================== OmniSharp ===================="
" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview', 'popup'
" and 'popuphidden' if you don't want to see any documentation whatsoever.
" Note that neovim does not support `popuphidden` or `popup` yet:
" https://github.com/neovim/neovim/issues/10996
if has('patch-8.1.1880')
  set completeopt=longest,menuone,popuphidden
  " Highlight the completion documentation popup background/foreground the same as
  " the completion menu itself, for better readability with highlighted
  " documentation.
  set completepopup=highlight:Pmenu,border:off
else
  set completeopt=longest,menuone,preview
  " Set desired preview window height for viewing documentation.
  set previewheight=5
endif

let g:OmniSharp_server_stdio=1

augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
  " Contextual code actions (uses fzf, CtrlP or unite.vim selector when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  " Repeat the last code action performed (does not use a selector)
  autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

  autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
augroup END

" ================== vim-csharp ===================="
au BufNewFile,BufRead *.razor compiler msbuild | set filetype=cshtml.html syntax=cshtml

" ================== vimspector ===================="
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-go' ]
