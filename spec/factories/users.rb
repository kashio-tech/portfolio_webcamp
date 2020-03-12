FactoryBot.define do
  factory :user do
    
  end
end



require 'rails_helper'

#RSpec.describe Book, "モデルに関するテスト", type: :model do
RSpec.describe Photo, "モデルに関するテスト", type: :model do
  describe 'アソシエーション' do
    it "Userモデルに属している" do
      is_expected.to belong_to(:user)
    end
  end

  describe '実際に保存してみる' do
    context "保存できる場合" do
      it "user_idを入れて保存" do
        user = FactoryBot.create(:user)
        expect(FactoryBot.create(:photo, user_id: user.id)).to be_valid
      end
    end
    context "保存できない場合" do
      it "user_idを保存していない" do
        expect(FactoryBot.build(:photo)).to_not be_valid
      end
      it "titleが空欄" do
        expect(FactoryBot.build(:photo, :no_title)).to_not be_valid
      end
      it "captionが空欄" do
        expect(FactoryBot.build(:photo, :no_caption)).to_not be_valid
      end
      # it "captionが201文字以上" do
      #   expect(FactoryBot.build(:book, :too_long_body)).to_not be_valid
      # end
    end
  end
end
