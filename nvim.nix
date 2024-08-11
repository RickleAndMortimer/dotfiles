{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    configure  =  {
      customRc = ''
	nnoremap <leader>ff <cmd>Telescope find_files<cr>
	nnoremap <leader>fg <cmd>Telescope live_grep<cr>
	nnoremap <leader>fb <cmd>Telescope buffers<cr>
	nnoremap <leader>fh <cmd>Telescope help_tags<cr>

	filetype plugin indent off
	syntax enable

	let g:tex_flavor = 'latex'

	let g:vimtex_view_method = 'zathura'
	let g:vimtex_compiler_method = 'latexrun'

	set conceallevel = 1
	let g:tex_conceal = 'abdmg'
	let g:UltiSnipsExpandTrigger = '<tab>'
	let g:UltiSnipsJumpForwardTrigger = '<tab>'
	let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
	let g:UltiSnipsSnippetDirectories = "$HOME.'/.config/nvim/UltiSnips/'"

	let maplocalleader = ","

	setlocal spell
	set spelllang=nl,en_gb
	inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
	start = [ nvim-treesitter.withAllGrammars nvim-lspconfig telescope-nvim vimtex ultisnips ];
      };
    };
  };
}
