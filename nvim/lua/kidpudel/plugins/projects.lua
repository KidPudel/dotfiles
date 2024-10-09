return {
    "ahmedkhalf/project.nvim",
    lazy = false,
    keys = {
        {"<leader>pp", "<cmd>Telescope projects<cr>", desc = "Recent projects"},
    },
    config = function ()
        require("project_nvim").setup{

        }
    end
}
