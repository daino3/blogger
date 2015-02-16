require 'spec_helper'

describe SearchesController, type: :controller do
  render_views

  describe '#find', elasticsearch: true do
    context 'searching' do
    before(:all) do
      BlogPost.destroy_all
      Elasticsearch::Model.client.indices.delete index: "_all" rescue nil
      FactoryGirl.create(:blog_post, body:'awesome sauce', title: 'best thing ever')
      BlogPost.includes(:tags).import force: true
      sleep 1.0
    end

    it 'instantiates the right variables' do
      get :find, search: {text: 'awesome sauce'} 
      
      expect(assigns[:searched]).to eq('awesome sauce')
      expect(assigns[:posts]).to be_truthy
      expect(assigns[:categories]).to be_truthy
    end

    it 'finds a blog post', :elasticsearch => true do
      get :find, search: {text: 'awesome sauce'} 

      expect(assigns[:posts].count).to eq(1)
    end

    it 'creates instance variables with highlighting methods' do
      get :find, search: {text: 'awesome sauce'} 

      expect(assigns[:posts].first.respond_to?(:hi_body)).to be_truthy
    end
  end
  end
end
