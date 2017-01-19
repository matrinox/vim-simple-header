function SetTypes()
  let b:filetype = &ft

  if b:filetype == 'vim'
    let b:comment_type = 'line'
    let b:comment_char = '"'
  elseif b:filetype == 'ruby'
    let b:comment_type = 'line'
    let b:comment_char = '#'
  elseif b:filetype == 'c' ||
       \ b:filetype == 'css' ||
       \ b:filetype == 'groovy' ||
       \ b:filetype == 'java' ||
       \ b:filetype == 'javascript' ||
       \ b:filetype == 'javascript.jsx' ||
       \ b:filetype == 'php' ||
       \ b:filetype == 'sass'
    let b:comment_type = 'block'
    let b:comment_char_start = '/*'
    let b:comment_char_end = '*/'
  endif
endfunction

autocmd FileType * call SetTypes()
" Commands for vim user
" Author Info Headers
command! AddHeader call simple_header#simple_header()
