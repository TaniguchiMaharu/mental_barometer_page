require 'rails_helper'

describe User do
  let(:nickname) { 'テスト太郎' }
  let(:email) { 'test@example.com' }
  let(:user) { User.new(nickname: nickname, email: email, password: password, password_confirmation: password) } # 変数に格納

  describe '.first' do
    before do
      @user = create(:user, nickname: nickname, email: email)
      @post = create(:post, morning: '良い', noon: '普通', night: '悪い',late_night: '睡眠', content: 'コメント', user_id: @user.id)
    end

    subject { described_class.first }

    it '事前に作成した通りのUserを返す' do
      expect(subject.nickname).to eq('テスト太郎')
      expect(subject.email).to eq('test@example.com')
    end

    it '紐づくPostの情報を取得できる' do
      expect(subject.posts.size).to eq(1)
      expect(subject.posts.first.morning).to eq('良い')
      expect(subject.posts.first.noon).to eq('普通')
      expect(subject.posts.first.night).to eq('悪い')
      expect(subject.posts.first.late_night).to eq('睡眠')
      expect(subject.posts.first.content).to eq('コメント')
      expect(subject.posts.first.user_id).to eq(@user.id)
    end
  end

  describe 'validation' do
    let(:password) { '12345678' }

    describe 'nickname属性' do
      describe '文字数制限の検証' do
        context 'nicknameが20文字以下の場合' do
          let(:nickname) { 'あいうえおかきくけこさしすせそたちつてと' } # 20文字

          it 'User オブジェクトは有効である' do
            expect(user.valid?).to be(true)
          end
        end

        context 'nicknameが20文字を超える場合' do
          let(:nickname) { 'あいうえおかきくけこさしすせそたちつてとな' } # 21文字

          it 'User オブジェクトは無効である' do
            user.valid?

            expect(user.valid?).to be(false)
            expect(user.errors[:nickname]).to include('は20文字以下に設定して下さい。')
          end
        end
      end

      describe '存在性の検証' do
        context 'nicknameが空欄の場合' do
          let(:nickname) { '' }

          it 'User オブジェクトは無効である' do
            expect(user.valid?).to be(false)
            expect(user.errors[:nickname]).to include("が入力されていません。")
          end
        end
      end
    end
  end
end