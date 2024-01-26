require 'rails_helper'

RSpec.describe DestinationBuy, type: :model do
  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @destination_buy = FactoryBot.build(:destination_buy, user_id: user.id, item_id: item.id)
      
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@destination_buy).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @destination_buy.building_name = ''
        expect(@destination_buy).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @destination_buy.post_code = ''
        @destination_buy.valid?
        expect(@destination_buy.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @destination_buy.post_code = '1234567'
        @destination_buy.valid?
        expect(@destination_buy.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @destination_buy.prefecture_id = 1
        @destination_buy.valid?
        expect(@destination_buy.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @destination_buy.city = ''
        @destination_buy.valid?
        expect(@destination_buy.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空だと保存できないこと' do
        @destination_buy.street_address = ''
        @destination_buy.valid?
        expect(@destination_buy.errors.full_messages).to include("Street address can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @destination_buy.telephone_number = ''
        @destination_buy.valid?
        expect(@destination_buy.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが10桁未満だと保存できないこと' do
        @destination_buy.telephone_number = '090123456'
        @destination_buy.valid?
        expect(@destination_buy.errors.full_messages).to include("Telephone number is invalid. Input only numbers")
      end
      it 'telephone_numberが11桁以上では保存できないこと' do
        @destination_buy.telephone_number = '090123456789'
        @destination_buy.valid?
        expect(@destination_buy.errors.full_messages).to include("Telephone number is invalid. Input only numbers")
      end
      it 'telephone_numberがハイフンがあると保存できないこと' do
        @destination_buy.telephone_number = '090-12345678'
        @destination_buy.valid?
        expect(@destination_buy.errors.full_messages).to include("Telephone number is invalid. Input only numbers")
      end
      it 'userが紐づいてないと保存できないこと' do
        @destination_buy.user_id = nil
        @destination_buy.valid?
        expect(@destination_buy.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいてないと保存できないこと' do
        @destination_buy.item_id = nil
        @destination_buy.valid?
        expect(@destination_buy.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @destination_buy.token = nil
        @destination_buy.valid?
        expect(@destination_buy.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
#userとitemをテストすることでdestinationテーブルのbuy_idのテストが不要