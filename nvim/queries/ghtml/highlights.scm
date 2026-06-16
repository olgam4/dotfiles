; Directive keywords (@import, @params, @style, etc.)
(directive_name) @keyword.directive

; Block tags (#if, :else, /if, #each, /each, #case, /case)
(block_tag) @keyword.conditional

; Case branch marker (:)
(case_marker) @keyword.conditional

; Raw expression marker (>)
(raw_expression ">") @keyword.operator

; === HTML tags ===

; Tag names
(open_tag (tag_name) @tag)
(close_tag (tag_name) @tag)
(self_closing_tag (tag_name) @tag)

; PascalCase component tags get special highlighting
((tag_name) @tag.component
 (#match? @tag.component "^[A-Z]"))

; Tag delimiters
(open_tag "<" @punctuation.bracket)
(open_tag ">" @punctuation.bracket)
(close_tag "</" @punctuation.bracket)
(close_tag ">" @punctuation.bracket)
(self_closing_tag "<" @punctuation.bracket)
(self_closing_tag "/>" @punctuation.bracket)

; Attribute names
(attribute_name) @tag.attribute

; Attribute values (quoted strings)
(quoted_attribute_value) @string

; Attribute = sign
(attribute "=" @punctuation.delimiter)

; === Expressions ===

; Expression delimiters
(interpolation "{" @punctuation.bracket)
(interpolation "}" @punctuation.bracket)
(raw_expression "{" @punctuation.bracket)
(raw_expression "}" @punctuation.bracket)
(block_expression "{" @punctuation.bracket)
(block_expression "}" @punctuation.bracket)
(case_branch "{" @punctuation.bracket)
(case_branch "}" @punctuation.bracket)
(expression_value "{" @punctuation.bracket)
(expression_value "}" @punctuation.bracket)

; Directive delimiters
(directive "(" @punctuation.bracket)
(directive ")" @punctuation.bracket)

; Strings inside expressions
(string_content) @string

; Comments
(comment) @comment
