FactoryBot.define do
  factory :access_token do
    user { nil }
    token_digest { "MyString" }
    expire_at { "2026-11-19 13:22:11" }
    revoked_at { "2026-11-19 13:22:11" }
  end
end
