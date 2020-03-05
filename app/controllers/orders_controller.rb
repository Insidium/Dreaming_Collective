class OrdersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]

  def new
    @item = Item.find(params[:book_id])
    @session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: @item.title,
      description: "by #{@item.artist.name}",
      images: ["#{@item.picture.service_url if @item.picture.attached?}"],
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

  def complete
  end

  def webhook
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)

    item_id = payment.metadata.item_id
    user_id = payment.metadata.user_id

    p "item id #{item_id}"
    p "user id #{user_id}"

    render plain: "Success"
  end
end
