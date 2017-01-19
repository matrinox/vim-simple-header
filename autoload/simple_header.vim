if !exists('g:simple_header_lines')
  let g:simple_header_lines = ['Set g:simple_header_lines to customize headers']
endif
if !exists('g:simple_header_include_copyright')
  let g:simple_header_include_copyright = 0
endif

" Create the final list of header lines
function! SimpleHeaderGatherHeaderLines()
  " Duplicate data so we don't override
  let l:headers = g:simple_header_lines + []
  if g:simple_header_include_copyright
    let l:headers += ['Copyright %{strftime("%Y")}']
  endif
  return l:headers
endfunction

" Parses the header lines to get the actual text to insert
function! SimpleHeaderGenerateHeaderText()
  let l:headers = []
  for line in SimpleHeaderGatherHeaderLines()
    " Matching text inside %{}
    let l:text = matchstr(line, '%{\(.*\)}')
    if l:text != ''
      " Remove the percent and curly braces
      let l:text = substitute(l:text, '%{\(.*\)}', '\1', 'g')
      " Replace matching text with the evaluated version
      let l:replace = eval(l:text)
      let line = substitute(line, '%{' . l:text . '}', l:replace, 0)
    endif
    let l:headers += [line]
  endfor
  return l:headers
endfunction

function simple_header#simple_header()
  if b:comment_type == 'line'
    let l:i = 0

    for line in SimpleHeaderGenerateHeaderText()
      let comment = b:comment_char . ' ' . line
      call append(l:i, comment)
      let l:i += 1
    endfor
  elseif b:comment_type == 'block'
    call append(l:i, b:comment_char_start)
    let l:i = 1

    for line in SimpleHeaderGenerateHeaderText()
      call append(l:i, line)
      let l:i += 1
    endfor
    call append(l:i, b:comment_char_end)
  endif
endfunction
