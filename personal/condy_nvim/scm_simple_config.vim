function scm_simple_config#install()
endfunction

function scm_simple_config#config()
    set number
    syntax on

    filetype on
    filetype plugin on
    filetype indent on

    " 打开光标放在上次退出时的位置
    if has("autocmd")
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \    exe "normal g'\"" |
                    \ endif
    endif

    " 自动补全菜单
    set completeopt=longest,menu

    " 自动补全菜单颜色
    highlight Pmenu term=bold cterm=none ctermfg=0
    highlight PmenuSel term=bold cterm=bold ctermbg=none ctermfg=4

    set smartindent
    set autoindent

    " tab 设置
    set expandtab
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4

    " 匹配括号
    set showmatch
    set matchtime=0

    " 无备份
    set nobackup
    set nowritebackup

    " neovim 与 tmux 配合必须打开
    if has('nvim')
        set ttimeout
        set ttimeoutlen=0
    endif

    " 在 insert 模式下能用删除键进行删除
    set backspace=indent,eol,start

    " 文件编码
    set fenc=utf-8
    set fencs=utf-8,gbk,gb18030,gd2312,cp936,usc-bom,euc-jp
    set enc=utf-8

    " 搜索
    set smartcase
    set ignorecase
    set hlsearch
    set incsearch

    " workaround for c++ indent
    set cinoptions=g-1
    set cino=g0,+0

    set clipboard+=unnamedplus
    map <C-y> "+y

    " use Shift-Insert instead
    " map <C-p> "+p

    nnoremap <C-N> :bnext<CR>
    nnoremap <C-P> :bprev<CR>

    set autoread    " 文件发动时自动重新加载
    set wrap        " 自动换行

    " 避免错误提示会跳动
    " set signcolumn=yes
endfunction
