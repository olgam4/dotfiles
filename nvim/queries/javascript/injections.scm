(call_expression
  function: (identifier) @function
  (#eq? @function "rml")
  arguments: (template_string) @injection.content
  (#set! injection.language html)
  (#set! injection.include-children true)
)
