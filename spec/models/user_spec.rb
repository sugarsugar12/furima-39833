require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '内容に問題ない場合' do
      it 'すべての情報があれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'nameが空だと保存できないこと' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it '苗字が空だと保存できないこと' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it '名前が空だと保存できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'ミョウジが空だと保存できないこと' do
        @user.family_name_k = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name k can't be blank")
      end

      it 'ナマエが空だと保存できないこと' do
        @user.first_name_k = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name k can't be blank")
      end

      it 'emailが空だと保存できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空だと保存できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'password_confirmationが空だと保存できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'birthdayが空だと保存できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end


      it 'family_nameが全角日本語でないと保存できないこと' do
        @user.family_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid. Input full-width katakana characters')
      end

      it 'first_nameが全角日本語でないと保存できないこと' do
        @user.first_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width katakana characters')
      end

      it 'family_name_kが全角カタカナでないと保存できないこと' do
        @user.family_name_k = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name k is invalid. Input full-width katakana characters')
      end

      it 'first_name_kが全角カタカナでないと保存できないこと' do
        @user.first_name_k = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name k is invalid. Input full-width katakana characters')
      end
      
      it 'passwordが半角英数字融合出ないと保存できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
    end
  end
end