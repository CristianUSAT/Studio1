# Elimine la línea siguiente si desea heredar la configuración de .editorconfig de directorios más elevados
root = true

# Archivos de Visual Basic
[*.vb]

#### Opciones principales de EditorConfig ####

# Sangría y espaciado
indent_size = 4
indent_style = space
tab_width = 4

# Nuevas preferencias de línea
end_of_line = crlf
insert_final_newline = false

#### Convenciones de codificación .NET ####

# Organizar instrucciones Using
dotnet_separate_import_directive_groups = false
dotnet_sort_system_directives_first = true
file_header_template = unset

# Preferencias de this. y .me
dotnet_style_qualification_for_event = false
dotnet_style_qualification_for_field = false
dotnet_style_qualification_for_method = false
dotnet_style_qualification_for_property = false

# Preferencias de palabras clave frente a tipos de BCL
dotnet_style_predefined_type_for_locals_parameters_members = true
dotnet_style_predefined_type_for_member_access = true

# Preferencias de paréntesis
dotnet_style_parentheses_in_arithmetic_binary_operators = always_for_clarity
dotnet_style_parentheses_in_other_binary_operators = always_for_clarity
dotnet_style_parentheses_in_other_operators = never_if_unnecessary
dotnet_style_parentheses_in_relational_binary_operators = always_for_clarity

# Preferencias de modificador
dotnet_style_require_accessibility_modifiers = for_non_interface_members

# Preferencias de nivel de expresión
dotnet_style_coalesce_expression = true
dotnet_style_collection_initializer = true
dotnet_style_explicit_tuple_names = true
dotnet_style_namespace_match_folder = true
dotnet_style_null_propagation = true
dotnet_style_object_initializer = true
dotnet_style_operator_placement_when_wrapping = beginning_of_line
dotnet_style_prefer_auto_properties = true
dotnet_style_prefer_collection_expression = when_types_loosely_match
dotnet_style_prefer_compound_assignment = true
dotnet_style_prefer_conditional_expression_over_assignment = true
dotnet_style_prefer_conditional_expression_over_return = true
dotnet_style_prefer_foreach_explicit_cast_in_source = when_strongly_typed
dotnet_style_prefer_inferred_anonymous_type_member_names = true
dotnet_style_prefer_inferred_tuple_names = true
dotnet_style_prefer_is_null_check_over_reference_equality_method = true
dotnet_style_prefer_simplified_boolean_expressions = true
dotnet_style_prefer_simplified_interpolation = true

# Preferencias de campo
dotnet_style_readonly_field = true

# Preferencias de parámetro
dotnet_code_quality_unused_parameters = all

# Preferencias de eliminación
dotnet_remove_unnecessary_suppression_exclusions = none

# Nuevas preferencias de línea
dotnet_style_allow_multiple_blank_lines_experimental = true
dotnet_style_allow_statement_immediately_after_block_experimental = true

#### Convenciones de código de VB ####

# Preferencias de modificador
visual_basic_preferred_modifier_order = partial,default,private,protected,public,friend,notoverridable,overridable,mustoverride,overloads,overrides,mustinherit,notinheritable,static,shared,shadows,readonly,writeonly,dim,const,withevents,widening,narrowing,custom,async,iterator

# Preferencias de nivel de expresión
visual_basic_style_prefer_isnot_expression = true
visual_basic_style_prefer_simplified_object_creation = true
visual_basic_style_unused_value_assignment_preference = unused_local_variable
visual_basic_style_unused_value_expression_statement_preference = unused_local_variable

#### Estilos de nomenclatura ####

# Reglas de nomenclatura

dotnet_naming_rule.interface_should_be_empieza_por_i.severity = suggestion
dotnet_naming_rule.interface_should_be_empieza_por_i.symbols = interface
dotnet_naming_rule.interface_should_be_empieza_por_i.style = empieza_por_i

dotnet_naming_rule.tipos_should_be_pascal_case.severity = suggestion
dotnet_naming_rule.tipos_should_be_pascal_case.symbols = tipos
dotnet_naming_rule.tipos_should_be_pascal_case.style = pascal_case

dotnet_naming_rule.miembros_que_no_son_un_campo_should_be_pascal_case.severity = suggestion
dotnet_naming_rule.miembros_que_no_son_un_campo_should_be_pascal_case.symbols = miembros_que_no_son_un_campo
dotnet_naming_rule.miembros_que_no_son_un_campo_should_be_pascal_case.style = pascal_case

# Especificaciones de símbolos

dotnet_naming_symbols.interface.applicable_kinds = interface
dotnet_naming_symbols.interface.applicable_accessibilities = public, friend, private, protected, protected_friend, private_protected
dotnet_naming_symbols.interface.required_modifiers = 

dotnet_naming_symbols.tipos.applicable_kinds = class, struct, interface, enum
dotnet_naming_symbols.tipos.applicable_accessibilities = public, friend, private, protected, protected_friend, private_protected
dotnet_naming_symbols.tipos.required_modifiers = 

dotnet_naming_symbols.miembros_que_no_son_un_campo.applicable_kinds = property, event, method
dotnet_naming_symbols.miembros_que_no_son_un_campo.applicable_accessibilities = public, friend, private, protected, protected_friend, private_protected
dotnet_naming_symbols.miembros_que_no_son_un_campo.required_modifiers = 

# Estilos de nomenclatura

dotnet_naming_style.pascal_case.required_prefix = 
dotnet_naming_style.pascal_case.required_suffix = 
dotnet_naming_style.pascal_case.word_separator = 
dotnet_naming_style.pascal_case.capitalization = pascal_case

dotnet_naming_style.empieza_por_i.required_prefix = I
dotnet_naming_style.empieza_por_i.required_suffix = 
dotnet_naming_style.empieza_por_i.word_separator = 
dotnet_naming_style.empieza_por_i.capitalization = pascal_case
