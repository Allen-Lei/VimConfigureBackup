set nocompatible   "不与Vi兼容（采用Vim自己的操作命令）
set backspace=indent,eol,start
syntax on          "打开语法高亮
set showmode       "在底部显示，当前处于命令模式还是插入模式
set showcmd        "命令模式下，在底部显示当前键入的指令
set mouse=a        "支持使用鼠标
set encoding=utf-8 "使用utf-8编码
set t_Co=256       "启用256色
filetype indent on "开启文件类型检查
set autoindent     "缩进，按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致
set tabstop=4      "Tab = 4
set shiftwidth=4   "在文本上按>>增加一级缩进，<<取消一级缩进，或者==自动缩进
set expandtab      "由于Tab键在不同的编辑器缩进不一致，该设置自动将Tab转为空格
set softtabstop=4  "Tab转为多少个空格
set number         "显示行号
set cursorline     "光标所在当前行高亮
"set relativenumber "显示光标所在的当前行号，其他行号都为相对于该行的相对行号
set textwidth=80   "行宽
set wrap           "自动折行
"set nowrap         "关闭自动折行
set linebreak      "空格、标点折行，不会单词内部折行
set wrapmargin=2   "指定折行处与编辑窗口的右边缘之间空出的字符数
set scrolloff=5    "垂直滚动时，光标距离顶部/底部的位置
set sidescrolloff=15 "水平滚动时，光标距离行首或行尾的位置
set laststatus=2   "是否显示状态栏，0不显示，1多窗口时显示，2显示
set ruler          "状态栏显示光标所在行列
set showmatch      "光标遇到括号时，自动高亮另一个
set hlsearch       "高亮显示搜索结果
set incsearch      "输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果
"set ignorecase     "搜索时忽略大小写
"set smartcase
""如果同时打开ignorecase，对于只有一个大写字母的搜索词，大小写敏感，其他情况大小写不敏感
"set spell spelllang=en_us  "打开英语单词的拼写检查
"set nobackup        "不创建备份文件
"set noswapfile      "不创建交换文件
"set undofile        "保留撤销历史（文件名以.un~开头）

"set backupdir=~/.vim/.backup//
"set directory=~/.vim/.swp//
"set undodir=~/.vim/.undo//  "设置备份文件、交换文件、操作历史文件的保存位置
"set autochdir       "自动切换工作目录
"set noerrorbells    "出错时不要发出响声
"set visualbell      "出错时发出视觉提示
set history=1000     "Vim需要记住多少次历史操作
set autoread         "打开文件监视

"set listchars=tab:»■,trail:■
"set list             "如果行尾有多余的空格，以小方块显示
set wildmenu         "命令模式下，Tab自动补全


call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"
Plug '~/my-prototype-plugin'

" Initialize plugin system
Plug 'skywind3000/asyncrun.vim'
Plug 'w0rp/ale'
Plug 'Yggdroot/LeaderF'
Plug 'Valloric/YouCompleteMe'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'

call plug#end()

"gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml'] 
" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
"自动打开 quickfix widow,高度为6
let g:asyncrun_open = 6

"任务结束时响铃提醒
let g:asyncrun_bell = 1


"ale动态检查配置
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_sign_error = "\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

"ycm
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }

"LeaderF
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <m-p> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

"自定义快捷键

let mapleader=" "
nmap <leader>w :w<cr>
nmap <leader>q :wq<cr>
nmap <leader>Q :q!<cr>
"设置F12 打开/关闭 Quickfix 窗口
nnoremap <F12> :call asyncrun#quickfix_toggle(6)<cr>
"打开/关闭底部的quickfix窗口

nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"单文件：编译

"nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"单文件：运行
nnoremap <silent> <F5> :call CompileRun()<cr>
func! CompileRun()
    exec 'w'
    if &filetype == 'c'
        exec 'AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"'
    elseif &filetype == 'cpp'
        exec 'AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"'
    elseif &filetype == 'python'
        exec 'AsyncRun -raw python %'
    endif
endfunc

nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>
"项目：编译

nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>
"项目：运行

nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>
"项目：测试
"
nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>  
"使用Cmake生成Makefile

