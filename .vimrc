"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
set rtp+=~/.vim/autoload/

call plug#begin('~/.vim/autoload')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nanotech/jellybeans.vim',
Plug 'vim-airline/vim-airline',
Plug 'vim-airline/vim-airline-themes',
Plug 'scrooloose/nerdtree',
Plug 'tpope/vim-fugitive',
Plug 'tpope/vim-sensible',
Plug 'tpope/vim-sleuth',
Plug 'tpope/vim-unimpaired',
Plug 'tpope/vim-commentary',
Plug 'tpope/vim-surround',
Plug 'bronson/vim-trailing-whitespace',
Plug 'rbgrouleff/bclose.vim',
Plug 'christoomey/vim-tmux-navigator',
Plug 'roxma/vim-tmux-clipboard',
Plug 'skywind3000/asyncrun.vim',
" Plug 'alx741/vim-hindent',
Plug 'sheerun/vim-polyglot',
Plug 'junegunn/fzf',
Plug 'junegunn/fzf.vim',
Plug 'mileszs/ack.vim'



call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1"
let g:nerdtree_tabs_autoclose=0
let g:asyncrun_open = 6

autocmd QuickFixCmdPost *grep* cwindow

colorscheme jellybeans

syntax on
filetype plugin indent on

set nocompatible
set number
set showmode
set smartcase
set smarttab
set smartindent
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set laststatus=2
set noshowmode
set incsearch
set hlsearch
"set shortmess+=A
set encoding=utf-8
set completeopt-=preview
set clipboard=unnamed
set nospell
set noswapfile
set noerrorbells
set novisualbell
set autowrite
set autowriteall
set autoread
set list
set nowrap
set ruler
set updatetime=100
set ttyfast
set lazyredraw
set rnu

" KEYBINDIGS

inoremap <S-Insert> <C-r>*
cnoremap <S-Insert> <C-r>*
map <C-p> :call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --cached'}))<CR>
map <C-n> :NERDTreeToggle<CR>

" Leader Mappings

map <Leader>w :update<CR>
map <Leader>q :Bclose<CR>
map <Leader>d :q<CR>
map <Leader>gu :Gpull --rebase<CR>
map <Leader>gp :Gpush<CR>
map <Leader>gw :Gwrite<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gs :Gstatus<CR>
nnoremap <F5> :AsyncRun make<CR>
nnoremap <F12> :call asyncrun#quickfix_toggle(6)<cr>

" Unmap Arrows

nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>

"Fix some common typos

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"! COC
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=number


nmap <leader>l  <Plug>(coc-codelens-action)
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)



inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

let g:coc_snippet_next = '<tab>'

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

nmap ]h <Plug>(GitGutterNextHunk) "same as default
nmap [h <Plug>(GitGutterPrevHunk) "same as default

nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)

"" ACK

let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>
" }}}

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
