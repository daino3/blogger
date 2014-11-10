require 'rails_helper'

RSpec.describe EmailsController, :type => :controller do

  describe 'GET new', :focus do
    it 'renders a new email form without the layout' do
      get :new
      expect(assigns[:email]).to be_an(Email)
      expect(response).to render_template('emails/new')
    end
  end

  describe 'GET send_email', :focus do
    it 'creates an email, sends it, and renders a success message' do

      expect(assigns[:email]).to be_an(Email)
      expect(response).to render_template('emails/new')
    end

    it 'renders a fail message' do

    end
  end

end
