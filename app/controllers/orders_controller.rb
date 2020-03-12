class OrdersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]

  # New item order
  def new
    @item = Item.find(params[:item_id])
    @session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: @item.name,
      description: "by #{@item.artist.user.first_name} #{@item.artist.user.last_name}",
      images: ["#{@item.item_image.service_url if @item.item_image.attached?}"],
      amount: (@item.price * 100).to_i,
      currency: 'aud',
      quantity: 1,
    }],
    payment_intent_data: {
      metadata: {
        user_id: current_user.id,
        item_id: @item.id
      }
    },
    success_url: "#{root_url}orders/complete",
    cancel_url: "#{root_url}",
    )
  end

  # Order completion
  def complete
  end

  # Webhook to catch invalid transactions/confirm valid transactions 
  def webhook
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)

    item_id = payment.metadata.item_id
    user_id = payment.metadata.user_id

    p "item id #{item_id}"
    p "user id #{user_id}"

    order = Order.new()
    order.item_id = item_id
    order.user_id = user_id
    order.save

    render plain: "Success"
  end
end
