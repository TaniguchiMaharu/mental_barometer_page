require 'rails_helper'

describe Post do
  before { @user = create(:user) }

  let(:morning) { '良い' }
  let(:noon) { '普通' }
  let(:night) { '悪い' }
  let(:late_night) { '睡眠' }
  let(:comment) { 'テストコメント' }
  let(:user_id) { @user.id }

  describe 'バリデーションの検証' do
    let(:post) { Post.new(morning: morning, noon: noon, night: night, late_night: late_night, user_id: user_id) }

    context '正常系' do
      it '有効である' do
        expect(post.valid?).to be(true)
      end
    end

    context '異常系' do
      context '朝の気分(morning)欄が空の場合' do
        let(:morning) { nil }
        it '無効である' do
          expect(post.valid?).to be(false)
          expect(post.errors[:morning]).to include('が入力されていません。')
        end
      end

      context 'contentが1000文字を超える場合' do
        let(:comment) { 'あ' * 1001 }
        it '無効である' do
          expect(post.valid?).to be(false)
        end
      end

      context 'user_idが空の場合' do
        let(:user_id) { nil }
        it '無効である' do
          expect(post.valid?).to be(false)
          expect(post.errors[:user]).to include('が入力されていません。')
        end
      end
    end
  end

  describe 'Postが持つ情報の検証' do
    before { create(:post, morning: morning, noon: noon, night: night, late_night: late_night, content: content, user_id: user_id) }

    subject{ described_class.first }

    it 'Postの属性値を返す' do
      expect(subject.morning).to eq("良い")
      expect(subject.noon).to eq("普通")
      expect(subject.night).to eq("悪い")
      expect(subject.late_night).to eq("睡眠")
      expect(subject.content).to eq('テストコメント')
      expect(subject.user_id).to eq(@user.id)
    end
  end
end

      