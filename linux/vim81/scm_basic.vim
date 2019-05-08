function scm_basic#install()
    Plug 'mhinz/vim-startify'
    Plug 'lifepillar/vim-solarized8'
    Plug 'majutsushi/tagbar', { 'on' : ['TagbarToggle'] }
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ctrlpvim/ctrlp.vim', { 'on': ['CtrlP'] }
    Plug 'luochen1990/rainbow'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'easymotion/vim-easymotion'
    Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle'] }
    Plug 'scrooloose/nerdcommenter'
    Plug 'jiangmiao/auto-pairs'
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'Yggdroot/indentLine'
endfunction

function scm_basic#config()
    call s:config_vim_airline()
    call s:config_nerdtree()
    call s:config_tagbar()
    call s:config_ctrlp()
    call s:config_rainbow()
    call s:config_vim_solarized8()
    call s:config_nerdcommenter()
    call s:config_vim_trailing_whitespace()
endfunction

function s:config_nerdcommenter()
    let g:which_leader.c = { 'name': '+Commmenter',
                \ 'c': 'Comment current line',
                \ 'n': 'Commnet current line and force nesting',
                \ 'm': 'Comments with one set of multipart delimiters',
                \ 'i': 'Toggles the comment state of the selected line(s) individually',
                \ 's': 'Comments selected lines with a pretty block formatted layout.',
                \ 'y': 'Same as cc except that the commented line(s) are yanked first.',
                \ '$': 'Comments the current line from the cursor to the end of line.',
                \ 'A': 'Comment delimiters at end of line and into insert mode',
                \ 'a': 'Alternative set of delimiters.',
                \ 'l': 'Comment delimiters aligned left side',
                \ 'b': 'Comment delimiters aligned both side',
                \ 'u': 'Uncomment' }
endfunction

function s:config_rainbow()
    let g:rainbow_active = 1
endfunction

function s:config_ctrlp()
    nnoremap <C-P> :CtrlP<CR>
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
endfunction

function s:config_tagbar()
    let g:which_leader.t = 'TagBar'
    nnoremap <leader>t :TagbarToggle<CR>

    let g:tagbar_left=0
    let g:tagbar_width=30
    let g:tagbar_autoclose=1
    let g:tagbar_autofocus=1
    let g:tagbar_compact=1
endfunction

function s:config_vim_solarized8()
    colorscheme solarized8
endfunction

function s:config_vim_airline()
    let g:airline_theme='dark'
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    "let g:airline_statusline_ontop=1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.linenr = ''
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.notexists = ''
    let g:airline_symbols.whitespace = ''
endfunction

function s:config_nerdtree()
    let g:which_leader.f = 'NERD tree'
    nnoremap <leader>f :NERDTreeToggle<CR>
    "Sort by file type
    let g:NERDTreeSortOrder = map(range(0, 25),
                \ '"\\." . nr2char(char2nr("a") + v:val) . "[^.]*$"')
    "Close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
                \ b:NERDTree.isTabTree()) | q | endif
    let g:NERDTreeDirArrowExpandable = '+'
    let g:NERDTreeDirArrowCollapsible = '-'
    "Different highlighting for different file extensions
    call s:NERDTreeHighlightFile('vim', 'green', 'none', 'green', '#151515')
    call s:NERDTreeHighlightFile('h', 'Magenta', 'none', '#ff00ff', '#151515')
    call s:NERDTreeHighlightFile('c', 'yellow', 'none', 'yellow', '#151515')
    call s:NERDTreeHighlightFile('cpp', 'yellow', 'none', 'yellow', '#151515')
endfunction

function! s:NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
   exec 'autocmd filetype nerdtree highlight nerdtree_ft_' . a:extension
               \.' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg
               \.' guifg='. a:guifg
   exec 'autocmd filetype nerdtree syn match nerdtree_ft_' . a:extension
               \ .' #^\s\+.*'. a:extension .'$#'
endfunction

function s:config_vim_trailing_whitespace()
    let g:which_leader.r = 'remove trail space'
    nnoremap <leader>r :FixWhitespace<CR>
endfunction
