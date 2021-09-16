H.keymap('v', 'Re', [[ <cmd>lua require('refactoring').refactor('Extract Function')<cr>]],
         {silent = true, expr = false})
H.keymap('v', 'Rf', [[ <cmd>lua require('refactoring').refactor('Extract Function To File')<cr>]],
         {silent = true, expr = false})
H.keymap('v', 'Rt', [[ <cmd>lua G.refactors()<cr>]], {silent = true, expr = false})
