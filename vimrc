filetype on
syntax on
set number
set shiftwidth=2
set tabstop=2
set expandtab
set nowrap
set autoindent
set cindent
autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

" Disable arrow keys, enforce hjkl
nnoremap <Up> :echo "Use k!"<CR>
nnoremap <Down> :echo "Use j!"<CR>
nnoremap <Left> :echo "Use h!"<CR>
nnoremap <Right> :echo "Use l!"<CR>
