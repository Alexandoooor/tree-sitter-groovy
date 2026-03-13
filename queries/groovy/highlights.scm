[
  "!in"
  "!instanceof"
  "as"
  "assert"
  "case"
  "catch"
  "class"
  "interface"
  "enum"
  "def"
  "default"
  "do"
  "else"
  "extends"
  "implements"
  "finally"
  "for"
  "if"
  "import"
  "in"
  "instanceof"
  "new"
  "package"
  "pipeline"
  "return"
  "switch"
  "try"
  "while"
  (break)
  (continue)
] @keyword

[
  "true"
  "false"
] @boolean

(null) @constant
"this" @variable.builtin

[
  "int"
  "char"
  "short"
  "long"
  "boolean"
  "float"
  "double"
  "void"
] @type.builtin

[
  "final"
  "private"
  "protected"
  "public"
  "abstract"
  "static"
  "synchronized"
] @type.qualifier

(comment) @comment
(block_comment) @comment
(shebang) @comment

(string) @string
(string (escape_sequence) @operator)
(string (interpolation ([ "$" ]) @operator))

("(") @punctuation.bracket
(")") @punctuation.bracket
("[") @punctuation.bracket
("]") @punctuation.bracket
("{") @punctuation.bracket
("}") @punctuation.bracket
(":") @punctuation.delimiter
(",") @punctuation.delimiter
(".") @punctuation.delimiter

(number_literal) @number
(identifier) @variable
((identifier) @variable.parameter
  (#is? @variable.parameter "local.parameter"))

((identifier) @constant
  (#match? @constant "^[A-Z][A-Z_]+"))

[
  "%" "*" "/" "+" "-" "<<" ">>" ">>>" ".." "..<" "<..<" "<.." "<"
  "<=" ">" ">=" "==" "!=" "<=>" "===" "!==" "=~" "==~" "&" "^" "|"
  "&&" "||" "?:" "+" "*" ".&" ".@" "?." "*." "*" "*:" "++" "--" "!"
] @operator

(string ("/") @string)

(ternary_op ([ "?" ":" ]) @operator)

(map (map_item key: (identifier) @variable.parameter))

(parameter type: (identifier) @type name: (identifier) @variable.parameter)
(generic_param name: (identifier) @variable.parameter)

(declaration type: (identifier) @type)
(function_definition type: (identifier) @type)
(function_declaration type: (identifier) @type)
(class_definition name: (identifier) @type)
(class_definition superclass: (identifier) @type)
(class_definition interfaces: (identifier) @type)
(class_definition interfaces: (type_with_generics (identifier) @type))
(generic_param superclass: (identifier) @type)

(enum_definition name: (identifier) @type)
(enum_definition interfaces: (identifier) @type)
(enum_definition interfaces: (type_with_generics (identifier) @type))
(enum_constant name: (identifier) @constant)

(type_with_generics (identifier) @type)
(type_with_generics (generics (identifier) @type))
(generics [ "<" ">" ] @punctuation.bracket)
(generic_parameters [ "<" ">" ] @punctuation.bracket)
; TODO: Class literals with PascalCase

(declaration ("=") @operator)
(assignment ("=") @operator)


(function_call
  function: (identifier) @function)
(function_call
  function: (dotted_identifier
	  (identifier) @function . ))
(function_call (argument_list
		 (map_item key: (identifier) @variable.parameter)))
(juxt_function_call
  function: (identifier) @function)
(juxt_function_call
  function: (dotted_identifier
	  (identifier) @function . ))
(juxt_function_call (argument_list
		      (map_item key: (identifier) @variable.parameter)))

(function_definition
  function: (identifier) @function)
(function_declaration
  function: (identifier) @function)

(annotation) @function.macro
(annotation (identifier) @function.macro)
"@interface" @function.macro

"pipeline" @keyword

(groovy_doc) @comment.documentation

(groovy_doc (groovy_doc_first_line) @comment.documentation)

(groovy_doc
  [
    (groovy_doc_param)
    (groovy_doc_throws)
    (groovy_doc_return)
    (groovy_doc_see)
    (groovy_doc_since)
    (groovy_doc_deprecated)
    (groovy_doc_author)
    (groovy_doc_version)
    (groovy_doc_tag)
    (groovy_doc_at_text)
  ] @string.special)

(groovy_doc_param (identifier) @variable.parameter)
(groovy_doc_throws (identifier) @type)

(groovy_doc_inline_tag
  (groovy_doc_tag_name) @string.special
  (groovy_doc_tag_value) @string)


(constructor_definition
  name: (identifier) @type)

(constructor_definition
  (parameter_list
    (parameter
      type: (_) @type
      name: (identifier) @variable.parameter)))
