require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録' do
    context 'ユーザー登録ができる場合' do
      it 'nickname, email, password, password_confirmation, last_name, first_name, first_name_furigana, last_name_furigana, date_of_birthがあればユーザー登録できること' do
        expect(@user).to be_valid
      end

      it "passwordが6文字以上であれば登録できる" do
        @user.password = "123aaa"
        @user.password_confirmation = "123aaa"
        expect(@user).to be_valid
      end
     end

    context 'ユーザー登録ができない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank") 
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email) 
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken") 
      end

      it 'emailに@が含まれていない場合登録できない' do
        @user.email = 'sample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid") 
      end
    
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = "123aa"
        @user.password_confirmation = "123aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)") 
      end

      it 'passwordが半角英語のみでは登録できない' do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it 'passwordが半角数字のみでは登録できない' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it 'passwordが全角文字では登録できない' do
        @user.password = "一二三四五六"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = "123456"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameが半角文字では登録できない' do
        @user.last_name = "Yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it "first_nameが空では登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameが半角文字では登録できない' do
        @user.last_name = "Hanako"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it "last_name_furiganaが空では登録できない" do
        @user.last_name_furigana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana can't be blank")
      end

      it "last_name_furiganaが半角文字では登録できない" do
        @user.last_name_furigana = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana is invalid")
      end

      it "last_name_furiganaがカタカナ以外の全角文字では登録できない" do
        @user.last_name_furigana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana is invalid")
      end

      it "first_name_furiganaが空では登録できない" do
        @user.first_name_furigana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana can't be blank")
      end

      it "first_name_furiganaが半角文字では登録できない" do
        @user.first_name_furigana = "ﾊﾅｺ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana is invalid")
      end

      it "first_name_furiganaがカタカナ以外の全角文字では登録できない" do
        @user.first_name_furigana = "はなこ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana is invalid")
      end

      it "date_of_birthが空では登録できない" do
        @user.date_of_birth = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end
  end

end
