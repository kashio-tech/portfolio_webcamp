require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end


Rspec.describe Photo, "モデルに関するテスト", type: :model do
	describe 'アソシエーション' do
		it "photoモデルを多数持っている" do
     is_expected.to have_many(:photos)
    end
  end
end