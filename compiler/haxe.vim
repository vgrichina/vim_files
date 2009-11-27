" vim compiler file
" Compiler: haXe		     

if exists("current_compiler")
  finish
endif
let current_compiler = "haxe"

let s:cpo_save = &cpo
set cpo-=C

setlocal makeprg=haxe\ compile.hxml 

setlocal errorformat=%f\:%l\:\ characters\ %c-%*[^\ ]\ %m,%f\:%l\:\ %m


let &cpo = s:cpo_save
unlet s:cpo_save

"vim: ft=vim
