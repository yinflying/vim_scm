function scm_basic#install()
    Plug 'mhinz/vim-startify'
    Plug 'morhetz/gruvbox'
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
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'Yggdroot/indentLine'
    Plug 'mileszs/ack.vim'
endfunction

function scm_basic#config()
    call s:config_vim_airline()
    call s:config_nerdtree()
    call s:config_ctrlp()
    call s:config_rainbow()
    call s:config_gruvbox()
    call s:config_nerdcommenter()
    call s:config_vim_better_whitespace()
    call s:config_auto_pairs()
    call s:config_indentline()
endfunction

function s:config_nerdcommenter()
    let g:NERDTreeQuitOnOpen = 1
    let l:nerd_key_doc = { 'name': '+Commmenter',
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
    call scm#merge_list('g:which_leader.c',l:nerd_key_doc)
endfunction

function s:config_rainbow()
    let g:rainbow_active = 1
endfunction

function s:config_ctrlp()
    nnoremap <C-P> :CtrlP<CR>
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(so|o)$'
      \ }
endfunction


function s:config_gruvbox()
    if !exists('g:gruvbox_italic')
        let g:gruvbox_italic = 0
    endif
    if !exists('g:gruvbox_bold')
        let g:gruvbox_bold = 0
    endif
    colorscheme gruvbox
    set background=dark
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
   exec 'autocmd FileType nerdtree highlight nerdtree_ft_' . a:extension
               \.' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg
               \.' guifg='. a:guifg
   exec 'autocmd FileType nerdtree syn match nerdtree_ft_' . a:extension
               \ .' #^\s\+.*'. a:extension .'$#'
endfunction

function s:config_vim_better_whitespace()
    let g:better_whitespace_ctermcolor='208'
    let g:better_whitespace_enabled=0
    let g:strip_whitespace_on_save=0
    let g:strip_whitespace_confirm=0
    nnoremap <leader>Rr :StripWhitespace<CR>
    nnoremap <leader>Rt :ToggleWhitespace<CR>
    nnoremap <leader>Rw :ToggleStripWhitespaceOnSave<CR>
    nnoremap <leader>Rn :NextTrailingWhitespace<CR>
    nnoremap <leader>Rp :PrevTrailingWhitespace<CR>
    let l:vb_key_doc = { 'name': '+Strip_White_Space',
                \ 'r' : 'remove all white strip',
                \ 't' : 'Turn on/off hightlight trail space',
                \ 'w' : 'Turn on/off auto remove trail space on save',
                \ 'n' : 'Navigate to next trail space',
                \ 'p' : 'Navigate to previous tail space'
                \}
    call scm#merge_list('g:which_leader.R',l:vb_key_doc)
endfunction

function s:config_auto_pairs()
endfunction

function s:config_indentline()
    let g:indentLine_enabled = 0
    nnoremap <leader>I :IndentLinesToggle<CR>
endfunction
