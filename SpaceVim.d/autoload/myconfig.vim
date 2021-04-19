
" Ctrl-q to record a macro
noremap <C-q> q


function! myconfig#after() abort
  let g:neomake_java_javac_classpath = '/usr/share/java/servlet-api.jar'
endfunction

