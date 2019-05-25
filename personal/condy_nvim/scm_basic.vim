function scm_basic#install()
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'scrooloose/nerdcommenter'
endfunction

function scm_basic#config()
    call s:config_vim_surround()
    call s:config_fugitive()
    call s:config_nerdcommenter()
endfunction

function s:config_vim_surround()
endfunction

function s:config_fugitive()
endfunction

function s:config_nerdcommenter()
	" Add spaces after comment delimiters by default
	let g:NERDSpaceDelims = 1

	" Use compact syntax for prettified multi-line comments
	let g:NERDCompactSexyComs = 1

	" Align line-wise comment delimiters flush left instead of following code indentation
	let g:NERDDefaultAlign = 'left'

	" Set a language to use its alternate delimiters by default
	let g:NERDAltDelims_java = 1

	" Add your own custom formats or override the defaults
	let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

	" Allow commenting and inverting empty lines (useful when commenting a region)
	let g:NERDCommentEmptyLines = 1

	" Enable trimming of trailing whitespace when uncommenting
	let g:NERDTrimTrailingWhitespace = 1

	" Enable NERDCommenterToggle to check all selected lines is commented or not 
	let g:NERDToggleCheckAllLines = 1
endfunction
