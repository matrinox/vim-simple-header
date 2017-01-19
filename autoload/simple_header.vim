if !exists('g:simple_header_lines')
  let g:simple_header_lines = ['Set g:simple_header_lines to customize headers']
endif

function simple_header#simple_header()
  if b:comment_type == 'line'
    let l:i = 0

    for line in g:simple_header_lines
      let comment = b:comment_char . ' ' . line
      call append(l:i, comment)
      let l:i += 1
    endfor
  elseif b:comment_type == 'block'
    call append(l:i, b:comment_char_start)
    let l:i = 1

    for line in g:simple_header_lines
      call append(l:i, line)
      let l:i += 1
    endfor
    call append(l:i, b:comment_char_end)
  endif
endfunction
