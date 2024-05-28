local prefix = "<Leader>T"

return {
  "mfussenegger/nvim-jdtls",
  dependencies = {
    "AstroNvim/astrocore",
    opts = {
      options = {
        opt = {
          -- Set indentation according to project formatting
          shiftwidth = 4,
          tabstop = 4,
        },
      },
      mappings = {
        n = {
          [prefix] = { desc = "󰗇 Tests" },
          [prefix .. "g"] = {
            function() require("jdtls.tests").goto_subjects() end,
            desc = "Go to test/implementation",
          },
          [prefix .. "c"] = {
            function() require("jdtls.tests").generate() end,
            desc = "Create test",
          },
          [prefix .. "t"] = {
            function() require("jdtls").test_nearest_method() end,
            desc = "Execute nearest test method",
          },
          [prefix .. "a"] = {
            function() require("jdtls").test_class() end,
            desc = "Execute all class test methods",
          },
        },
      },
    },
  },
  opts = function(_, opts)
    local root_markers = { ".git", "mvnw", "gradlew" }
    local root_dir = require("jdtls.setup").find_root(root_markers)
    return require("astrocore").extend_tbl(opts, {
      root_dir = root_dir,
      settings = {
        java = {
          jdtls = {
            ls = {
              vmargs = "-XX:+UseParallelGC "
                .. "-XX:GCTimeRatio=4 "
                .. "-XX:AdaptiveSizePolicyWeight=90 "
                .. "-Dsun.zip.disableMemoryMapping=true "
                .. " -Xmx1G -Xms500m "
                .. "-Xlog:disable",
            },
          },
          format = {
            enabled = true,
            settings = {
              url = root_dir .. "/eclipse-java-google-style.xml",
              profile = "GoogleStyle",
            },
          },
        },
      },
    })
  end,
}
