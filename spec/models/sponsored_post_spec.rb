require 'rails_helper'

 RSpec.describe SponsoredPostsController, type: :controller do

 let(:sponsored_post) {SponsoredPost.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99)}

  describe "GET index" do
      it "returns http success" do
          get :index
          expect(response).to have_http_status(:success)
    end

    it "assigns sponsored_post to @sponsored_post" do
      get :index
      expect(assigns(:sponsored_post)).to eq([sponsored_post])
      end
    end

  describe "GET show" do
      it "returns http success" do
        get :show, {id: sponsored_post.id}
        expect(response).to have_http_status(:success)
      end

  it "renders the #show view" do
    get :show, {id: sponsored_post.id}
    expect(response).to render_template :show
    end

  it "assigns sponsored_post to @sponsored_post" do
      get :show, {id: sponsored_post.id}
      expect(assigns(:sponsored_post)).to eq(sponsored_post)
    end
  end

  describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new
      expect(response).to render_template :new
     end

     it "initializes @sponsored_post" do
       get :new
      expect(assigns(:sponsored_post)).not_to be_nil
    end
   end

   describe "POST create" do
    it "increases the number of sponsored posts by 1" do
       expect{ post :create, {sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}}.to change(SponsoredPost,:count).by(1)
     end

    it "assigns SponsoredPost.last to @sponsored_post" do
       post :create, {sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}
       expect(assigns(:sponsored_post)).to eq SponsoredPost.last
     end

    it "redirects to the new sponsored post" do
       post :create, {sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}
       expect(response).to redirect_to SponsoredPost.last
    end
   end

   describe "GET edit" do
     it "returns http success" do
       get :edit, {id: sponsored_post.id}
       expect(response).to have_http_status(:success)
     end

     it "renders the #edit view" do
       get :edit, {id: sponsored_post.id}
       expect(response).to render_template :edit
     end

     it "assigns topic to be updated to @topic" do
       get :edit, {id: sponsored_post.id}
       topic_instance = assigns(:sponsored_post)

       expect(sponsored_post.id).to eq sponsored_post.id
       expect(sponsored_post.title).to eq sponsored_post.title
       expect(sponsored_post.body).to eq sponsored_post.body
     end
   end

    describe "PUT update" do
        it "updates sponsored post with expected attributes" do
        new_title = RandomData.random_sentence
        new_body = RandomData.random_paragraph

        put :update, id: sponsored_post.id, sponsored_post: { title: new_title, body: new_body }

        updated_sponsored_post = assigns(:sponsored_post)
        expect(updated_sponsored_post.id).to eq sponsored_post.id
        expect(updated_sponsored_post.title).to eq new_title
        expect(updated_sponsored_post.body).to eq new_body
     end

    it "redirects to the updated post" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph

       put :update, id: sponsored_post.id, sponsored_post: { title: new_title, body: new_body }
        expect(response).to redirect_to sponsored_post
      end
    end

    describe "DELETE destroy" do
      it "deletes the post" do
        delete :destroy, {id: sponsored_post.id}
        count = SponsoredPost.where({id: sponsored_post.id}).size
        expect(count).to eq 0
    end

      it "redirects to sponsored post index" do
        delete :destroy, {id: sponsored_post.id}
        expect(response).to redirect_to sponsored_post_path
     end
   end
end
