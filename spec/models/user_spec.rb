require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録がうまく行く時' do
      it 'nickname, email, password, password_confirmation, family_name, first_name, family_kana, first_kana, birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailが@を含むとき登録できる' do
        @user.email = 'furima@gmail.com'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上かつ半角英数字混合で登録できる' do
        @user.password = '111eee'
        @user.password_confirmation = '111eee'
        expect(@user).to be_valid
      end
      it 'family_nameとfirst_nameが全角（漢字・ひらがな・カタカナ）で登録できる' do
        @user.family_name = '山田'
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end
      it 'family_kanaとfirst_kanaが全角（カタカナ）で登録できる' do
        @user.family_kana = 'ヤマダ'
        @user.first_kana = 'タロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nicknameが空の時登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空の時登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailがある時登録できない' do
        @user.save
        user = FactoryBot.build(:user)
        user.email = @user.email
        user.valid?
        expect(user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれない時登録できない' do
        @user.email = 'furimagmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空の時登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下の時登録できない' do
        @user.password = '11ee'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字混合でない時登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordが存在してもpassword_confirmationが空の時登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが一致しない時登録できない' do
        @user.password = '111eee'
        @user.password_confirmation = 'eee111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空の時登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_nameが空の時登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'family_nameが全角（漢字・ひらがな・カタカナ）以外の時登録できない' do
        @user.family_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name Full-width characters')
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）以外の時登録できない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters')
      end
      it 'family_kanaが空の時登録できない' do
        @user.family_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana can't be blank")
      end
      it 'first_kanaが空の時登録できない' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end
      it 'family_kanaが全角（カタカナ）以外の時登録できない' do
        @user.family_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family kana Full-width katakana characters')
      end
      it 'first_kanaが全角（カタカナ）以外の時登録できない' do
        @user.first_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana Full-width katakana characters')
      end
      it 'birthdayが空の時登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
