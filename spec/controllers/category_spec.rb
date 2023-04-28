require "rails_helper"

RSpec.describe CategoriesController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category) }

  before { sign_in user }

  describe "GET #index" do
    it "returns http success" do
      get :index, params: { user_id: user.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "redirects to category_expenses_path" do
      get :show, params: { id: category.id }
      expect(response).to redirect_to(category_expenses_path(category))
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, params: { user_id: user.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "when category is valid" do
      it "redirects to categories_path" do
        post :create, params: { category: { name: "Test Category" } }
        expect(response).to have_http_status(:success)
      end
    end

    context "when category is invalid" do
      it "renders new template" do
        post :create, params: { category: { name: "" } }
        expect(response).to render_template(:new)
      end
    end
  end
end
