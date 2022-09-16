class HelloMailer < ApplicationMailer
    
  default from: 'admin@keebx.com'
  layout "mailer"

  def welcome_email(user)
    @user = user  
    mail(to: user[:email], subject: 'Welcome to KeebX!')
  end

  def purchase(user, item)
    @user = user 
    @item = item
    mail(to: user[:email], subject: "Purchase of #{item.name}")
  end

end