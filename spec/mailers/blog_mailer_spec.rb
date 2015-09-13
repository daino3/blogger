require "rails_helper"

RSpec.describe BlogMailer, :type => :mailer do
  subject { BlogMailer }

  describe '#send' do
    it 'sends a correctly formatted email' do
      email = FactoryGirl.create(:email)

      expect{subject.create(email).deliver}.to change(ActionMailer::Base.deliveries, :count).by 1

      mailer = ActionMailer::Base.deliveries.last
      expect(mailer.subject).to eq(email.subject)
      expect(mailer.to.first).to eq(email.to)
      expect(mailer.from.first).to eq(email.from)
      expect(mailer.body.raw_source).to eq(email.body)
    end
  end

end
