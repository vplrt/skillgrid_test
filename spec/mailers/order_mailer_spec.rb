require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do
  before(:each) do
    @user = create(:user)
    @admin = create(:admin, email: "other_user@example.com")
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []

    #send mails
    OrderMailer.purchase_email(@user, "http://placehold.it/600/92c952").deliver_now
    OrderMailer.notify_admin_email(@admin, "201").deliver_now
    OrderMailer.purchase_error_email(@admin, "aaa").deliver_now
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  it 'should send 3 emails' do
    expect(ActionMailer::Base.deliveries.count).to eq 3
  end

  it 'purchase_email renders the receiver email' do
    expect(ActionMailer::Base.deliveries.first.to[0]).to eq @user.email
  end

  it 'notify_admin_email renders the receiver email' do
    expect(ActionMailer::Base.deliveries.second.to[0]).to eq @admin.email
  end

  it 'purchase_error_email renders the receiver email' do
    expect(ActionMailer::Base.deliveries.third.to[0]).to eq @admin.email
  end

  it 'purchase_email should set the subject to the correct subject' do
    expect(ActionMailer::Base.deliveries.first.subject).to eq 'Your purchase.'
  end

  it 'notify_admin_email should set the subject to the correct subject' do
    expect(ActionMailer::Base.deliveries.second.subject).to eq 'Notification.'
  end

  it 'purchase_error_email should set the subject to the correct subject' do
    expect(ActionMailer::Base.deliveries.third.subject).to eq 'Purchase error.'
  end

  it 'purchase_email renders the sender email' do
    expect(ActionMailer::Base.deliveries.first.from).to eq ['from@example.com']
  end

  it 'notify_admin_email renders the sender email' do
    expect(ActionMailer::Base.deliveries.second.from).to eq ['from@example.com']
  end

  it 'purchase_error_email renders the sender email' do
    expect(ActionMailer::Base.deliveries.third.from).to eq ['from@example.com']
  end

end
