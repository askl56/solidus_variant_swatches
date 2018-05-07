class AddSwatchToSpreeVariants < ActiveRecord::Migration
  def change
    add_column :spree_option_values, :swatch, :string
  end
end
