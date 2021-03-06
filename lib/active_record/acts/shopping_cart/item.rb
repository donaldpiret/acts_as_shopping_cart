module ActiveRecord
  module Acts
    module ShoppingCart
      module Item

        #
        # Returns the cart item for the specified object
        #
        def item_for(object)
          shopping_cart_items.where(:item => object).first
        end

        #
        # Returns the subtotal of a specified item by multiplying the quantity times
        # the price of the item.
        #
        def subtotal_for(object)
          item = item_for(object)
          item ? item.subtotal : Money.new(0, Money.default_currency)
        end

        #
        # Returns the quantity of the specified object
        #
        def quantity_for(object)
          item = item_for(object)
          item ? item.quantity : 0
        end

        #
        # Updates the quantity of the specified object
        #
        def update_quantity_for(object, new_quantity)
          item = item_for(object)
          item.update_quantity(new_quantity) if item
        end

        #
        # Returns the price of the specified object
        #
        def price_for(object)
          item = item_for(object)
          item ? item.price : Money.new(0, Money.default_currency)
        end

        #
        # Updates the price of the specified object
        #
        def update_price_for(object, new_price)
          new_price = Money.new((new_price * 100).to_i, Money.default_currency) unless new_price.is_a?(Money)
          item = item_for(object)
          item.update_price(new_price) if item
        end
      end
    end
  end
end
