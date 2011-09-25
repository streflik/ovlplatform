class PaymentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :verify_admin

  def create
    @payment = Payment.create(params[:payment]) do |t|
      t.user_id = current_user.id
      t.price = t.credits
    end
    if @payment.save
      @payment.user.update_attribute(:credits_available, @payment.user.credits_available + @payment.credits)
      redirect_to hub_user_path(current_user), :notice => t("bought")  
    else
      redirect_to credits_user_path(current_user), :notice => t("fail")  
    end

  end

end
