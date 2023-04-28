require "rails_helper"

RSpec.describe ExpensesController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category) }
  let(:expense) { FactoryBot.create(:expense) }

  before { sign_in user }

  describe "GET #index" do
    it "returns http success" do
      get :index, params: { category_id: category.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, params: { category_id: category.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "when expense is valid" do
      it "redirects to category_expenses_path" do
        post :create,
             params: {
               expense: {
                 name: "Test Expense",
                 amount: 100
               },
               category_id: category.id
             }
        expect(response).to redirect_to(category_expenses_path(category))
      end
    end

    context "when expense is invalid" do
      it "renders new template" do
        post :create,
             params: {
               expense: {
                 name: "",
                 amount: 100
               },
               category_id: category.id
             }
        expect(response).to render_template(:new)
      end
    end
  end
end
