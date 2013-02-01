FactoryGirl.define do
	factory :user do
		email "ticketee@email.com"
    password "password"
    password_confirmation "password"
		
		factory :confirmed_user do
			after(:create) { |user| user.confirm! }
		end

		factory :admin_user do
			after(:create) { |user|
				user.confirm!
				user.update_attribute(:admin, true)
			}
		end
	end
end