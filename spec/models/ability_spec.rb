require 'rails_helper'

RSpec.describe Ability, type: :model do
  describe 'abilities' do
    subject(:ability) { Ability.new(user) }
    let(:user) { nil }

    context 'when user is admin' do
      let(:user) { FactoryBot.create(:user, :admin) }

      it 'can manage everything' do
        is_expected.to be_able_to(:manage, :all)
      end
    end

    context 'when user is not admin' do
      let(:user) { FactoryBot.create(:user) }

      it 'can manage user, expense and category that belongs to him' do
        is_expected.to be_able_to(:manage, User, id: user.id)
        is_expected.to be_able_to(:manage, Expense, author_id: user.id)
        is_expected.to be_able_to(:manage, Category, author_id: user.id)
      end
    end

    context 'when user is guest' do
      it 'cannot manage anything' do
        is_expected.to_not be_able_to(:manage, :all)
      end
    end
  end
end
