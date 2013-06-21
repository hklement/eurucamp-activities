module ControllerHelpers
  def should_authorize(action, subject)
    controller.should_receive(:authorize!).with(action, subject).and_return(true)
  end

  def sign_in(user = double('user'))
    if user.nil?
      request.env['warden'].stub(:authenticate!).
          and_throw(:warden, {:scope => :user})
      controller.stub :current_user => nil
    else
      request.env['warden'].stub :authenticate! => user
      controller.stub :current_user => user
    end
  end
end