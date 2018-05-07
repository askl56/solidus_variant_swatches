Spree::ProductsController.class_eval do
  before_action :load_option_value, only: :show

  private

    def load_option_value
      @option_value = Spree::OptionValue.find(params[:option_value]) if params[:option_value].present?
    end
end
