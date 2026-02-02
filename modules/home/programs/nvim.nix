{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    initLua = ''
      vim.o.tabstop = 4
      vim.o.shiftwidth = 4
      vim.o.softtabstop = 4
      vim.opt.breakindent = true
      vim.opt.cursorline = true
      vim.opt.scrolloff = 10
      vim.opt.relativenumber = true
      vim.opt.number = true
      vim.g.have_nerd_font = true
      vim.opt.list = true
      vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
      vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
      vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
      vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
      vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
    '';
  };
}
