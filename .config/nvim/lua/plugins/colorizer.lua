return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    local colorizer = require("colorizer")
    -- colorizer.setup({
    --   filetypes = { "*" },
    --   user_default_options = {
    --     tailwind = false, -- Enable tailwind colors
    --   },
    -- })
    colorizer.setup(
      { "*" },
      {
        RGB = true,      -- #RGB hex codes #fff #eee #FFFFFF
        RRGGBB = true,   -- #RRGGBB hex codes
        names = true,    -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true,   -- CSS rgb() and rgba() functions
        hsl_fn = true,   -- CSS hsl() and hsla() functions
        css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,   -- Enable all CSS functions: rgb_fn, hsl_fn
      },
      {
        mode = "background", -- Highlight the background, not the text
      },
      {
        tailwind = true, -- Enable tailwind colors
      },
      {
        css = true,    -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS functions: rgb_fn, hsl_fn
      }
    )
  end,
}
