; Inject Gleam into expression content (interpolations)
((interpolation (expression_content) @injection.content)
 (#set! injection.language "gleam"))

; Inject Gleam into block expression content ({#if expr}, {#each expr}, {#case expr})
((block_expression (expression_content) @injection.content)
 (#set! injection.language "gleam"))

; Inject Gleam into raw expression content ({>expr})
((raw_expression (expression_content) @injection.content)
 (#set! injection.language "gleam"))

; Inject Gleam into case branch content ({:Pattern(args)})
((case_branch (expression_content) @injection.content)
 (#set! injection.language "gleam"))

; Inject Gleam into expression attribute values ({expr} in attributes)
((expression_value (expression_content) @injection.content)
 (#set! injection.language "gleam"))

; Inject Gleam into directive content (@params, @type, @import, etc.)
((directive (directive_content) @injection.content)
 (#set! injection.language "gleam"))
