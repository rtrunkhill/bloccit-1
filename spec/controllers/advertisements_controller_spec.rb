require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do
  let (:ad) do
    Advertisement.create(
    id: 1,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    price: 99
    )
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [ad] to @advertisement" do
      get :index
      expect(assigns(:advertisements)).to eq([ad])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: ad.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: ad.id}
      expect(response).to render_template :show
    end

    it "assigns ad to @advertisement" do
      get :show, {id: ad.id}
      expect(assigns(:advertisements)).to eq (ad)
    end

    it "instantiates @advertisement" do
      get :new
      expect(assigns(:advertisements)).not_to be_nil
    end
  end

  describe "POST #create" do
    it "increases advertisements by 1" do
     expect{post :create, advertisements: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99}}.to change(Advertisement, :count).by(1)
    end

    it "assigns the new advertisement to @advertisement" do
     post :create, advertisements: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99}
     expect(assigns(:advertisements)).to eq Advertisement.last
    end

    it "redirects to the new advertisement" do
     post :create, advertisements: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99}
     expect(response).to redirect_to Advertisement.last
    end
  end
end
