FactoryBot.define do
  factory :post do
    mental { 0 }
    content { 'コメント1' }

    association :user, factory: user
  end
end
