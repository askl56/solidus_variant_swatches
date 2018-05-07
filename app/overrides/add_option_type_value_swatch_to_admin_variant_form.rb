Deface::Override.new(
  virtual_path: "spree/admin/option_types/edit",
  insert_before: "[data-hook='option_header'] .actions",
  text: "<th>Swatch</th>",
  name: "add_option_type_value_swatch_header_to_admin_variant_form",
  original: ""
)

Deface::Override.new(
  virtual_path: "spree/admin/option_types/_option_value_fields",
  insert_before: ".actions",
  partial: "spree/shared/option_type_swatch_form_field",
  name: "add_option_type_value_swatch_to_admin_variant_form",
  original: ""
)
