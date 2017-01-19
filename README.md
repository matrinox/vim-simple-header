# vim-simple-header
Create and customize file headers, no frills

## Installation

### Vim-plug

Plug 'matrinox/vim-simple-header', { 'on': 'AddHeader' }

### Old-fashioned way

First download the repo

```shell
git clone git@github.com:matrinox/vim-simple-header.git ~/.vim-simple-header
```

Last add it to the runtimepath so that vim can pick it up
```vim
set runtimepath+=~/.vim-simple-header
```

## Usage

To add a header to the top of the file
```vim
:AddHeader
```

To do this automatically for your files, add this to your `.vimrc`
```vim
autocmd BufNewFile *.vim :AddHeader
```

Currently supported filetypes are:

- vim
- ruby
- c
- css
- groovy
- java
- javascript
- javascript.jsx
- php
- sass

Suggest more filetypes by [creating an issue](https://github.com/matrinox/vim-simple-header/issues/new)

## Customization

Set `g:simple_header_lines` array with the lines you want in order
```vim
let g:simple_header_lines = ['John Smith', 'john.smith.example@gmail.com']
```

If you want dynamic text like the current date, use functions or any valid vimscript
```vim
let g:simple_header_lines = ['John Smith', 'Today is %{strftime("%c")}']
```

To add copyright with year, enable `g:simple_header_include_copyright`
```vim
let g:simple_header_include_copyright = 1
```
