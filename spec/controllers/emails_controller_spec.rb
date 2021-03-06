require 'rails_helper'

describe EmailsController do

  describe 'GET send_email' do
    context 'on success' do
      it 'creates an email, sends it, and renders a success message' do
        expect {
          post :create, email: {from: 'dain@email.com', subject: 'ball sack', body: 'Yolo', bot_box: "0"}, format: :json
        }.to change { Email.count }.by(1)

        expect(response).to be_successful
        expect(response.body).to include("Thanks for your interest")
      end

      it 'sends an email' do
        expect {
          post :create, email: {from: 'dain@email.com', subject: 'ball sack', body: 'Yolo'}, format: :json
        }.to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end

    context 'sent from bot' do
      it "doesn't send the email" do
        expect {
          post :create, email: {from: '', subject: '', body: '', bot_box: "1"}, format: :json
        }.to_not change { Email.count }

        expect(response).to_not be_successful
        expect(response.body).to include("please stop")
      end
    end

    context 'on failure' do
      it 'renders a list of errors' do
        expect {
          post :create, email: {from: '', subject: '', body: '', bot_box: "0"}, format: :json
        }.to_not change { Email.count }

        expect(response).to be_successful
        errors = JSON.parse(response.body)["errors"]
        expect(errors["from"]).to be_present
        expect(errors["subject"]).to be_present
        expect(errors["body"]).to be_present
      end
    end
  end

end
