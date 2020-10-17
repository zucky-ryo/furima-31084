FactoryBot.define do
  factory :user_order do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '111-1111' }
    prefecture_id { '2' }
    city { '横浜市緑区' }
    address { '青山1−1-1' }
    phone { '09012345678' }
  end
end
