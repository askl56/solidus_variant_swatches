Deface::Override.new(
  virtual_path: "spree/shared/_products",
  insert_bottom: "[data-hook='products_list_item']",
  partial: "spree/shared/variant_swatch",
  name: "add_variant_swatch_to_product_list_item",
  original: "947b6c1ab1041c0400cb65dad90bc568f6537a7e"
)
