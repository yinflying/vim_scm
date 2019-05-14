let g:scm_file=[]

command -nargs=1 Scmsource let g:scm_file += ['<args>']

function scm#plug(plug_dir)
    for plug in g:scm_file
        exec 'source'.plug
    endfor

    call plug#begin(a:plug_dir)
    for plug in g:scm_file
        let plug_name = fnamemodify(fnamemodify(plug, ':r'),':t')
        exec 'call '.plug_name.'#install()'
    endfor
    call plug#end()

    for plug in g:scm_file
        let plug_name = fnamemodify(fnamemodify(plug, ':r'),':t')
        exec 'call '.plug_name.'#config()'
    endfor
endfunction
