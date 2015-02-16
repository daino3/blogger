require "rails_helper"

RSpec.describe BlogMailer, :type => :mailer do
  subject { BlogMailer }


  describe '#send' do
    it 'sends a correctly formatted email' do
      email = FactoryGirl.create(:email)

      expect{subject.format_and_send(email)}.to change(ActionMailer::Base.deliveries, :count).by 1

      mailer = ActionMailer::Base.deliveries.last
      expect(mailer.subject).to eq(email.subject)
      expect(mailer.to.first).to eq(email.to)
    end
  end

end
