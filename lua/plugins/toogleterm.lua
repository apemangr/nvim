return{
    "akinsho/toggleterm.nvim",
    config = function ()
        require("toggleterm").setup{
          -- Configura como se abre la terminal
          direction = 'vertical', -- Puedes usar 'vertical', 'horizontal', 'tab', o 'float'
          open_mapping = [[<F6>]], -- Mapea F5 para abrir la terminal
          size = 70, -- Tamaño del split (en líneas o columnas dependiendo de la dirección)
        }
    end
}
