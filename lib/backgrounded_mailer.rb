require 'mail'

module BackgroundedMailer
  
  def self.included(base)
    base.class_eval do
      alias_method :deliver_now, :deliver
      alias_method :deliver, :deliver_later
      extend ClassMethods
    end
  end
  
  def deliver_later
    self.class.backgrounded.deserialize_and_deliver self.encoded, self.delivery_handler.name
    self
  end
  
  module ClassMethods
    def deserialize_and_deliver(encoded_body, delivery_handler)
      delivery_handler = delivery_handler.constantize
      mail = Mail.new(encoded_body)
      mail.delivery_handler = delivery_handler
      mail.delivery_method delivery_handler.delivery_method
      mail.deliver_now
    end
  end

end

Mail::Message.send :include, BackgroundedMailer
