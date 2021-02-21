# require 'rails_helper'

# RSpec.describe User, type: :model do
#   describe '#create' do
#     before do
#       @user = FactoryBot.build(:user)
#     end

#     it "nicknameが空では登録できない" do
#       @user.nickname = nil
#       @user.valid?
#       expect(@user.errors.full_messages).to include("Nickname can't be blank")
#     end

#     it "emailが空では登録できない" do
#       @user.email = nil
#       @user.valid?
#       expect(@user.errors.full_messages).to include("Email can't be blank") 
#     end

#     it "passwordが空では登録できない" do
#       @user.password = nil
#       @user.valid?
#       expect(@user.errors.full_messages).to include("Password can't be blank")
#     end

#     it "last_nameが空では登録できない" do
#       @user.last_name = nil
#       @user.valid?
#       expect(@user.errors.full_messages).to include("Last name can't be blank")
#     end

#     it "first_nameが空では登録できない" do
#       @user.first_name = nil
#       @user.valid?
#       expect(@user.errors.full_messages).to include("First name can't be blank")
#     end

#     it "last_name_furiganaが空では登録できない" do
#       @user.last_name_furigana = nil
#       @user.valid?
#       expect(@user.errors.full_messages).to include("Last name furigana can't be blank")
#     end

#     it "first_name_furiganaが空では登録できない" do
#       @user.first_name_furigana = nil
#       @user.valid?
#       expect(@user.errors.full_messages).to include("First name furigana can't be blank")
#     end

#     it "date_of_birthが空では登録できない" do
#       @user.date_of_birth = nil
#       @user.valid?
#       expect(@user.errors.full_messages).to include("Date of birth can't be blank")
#     end

#     it "passwordが6文字以上であれば登録できる" do
#       @user.password = "123456"
#       @user.password_confirmation = "123456"
#       expect(@user).to be_valid
#     end

#     it "passwordが5文字以下であれば登録できない" do
#       @user.password = "12345"
#       @user.password_confirmation = "12345"
#       @user.valid?
#       expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)") 
#     end

#     it "passwordとpassword_confirmationが不一致では登録できない" do
#       @user.password = "123456"
#       @user.password_confirmation = "1234567"
#       @user.valid?
#       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
#     end

#     it "重複したemailが存在する場合登録できない" do
#       @user.save
#       another_user = FactoryBot.build(:user, email: @user.email) 
#       another_user.valid?
#       expect(another_user.errors.full_messages).to include("Email has already been taken") 
#     end
#   end
# end
