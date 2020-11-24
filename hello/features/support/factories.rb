FactoryBot.define do
  factory :user, class: User do
    username { "usernamee" }
    name { "sid" }
    sequence :email do |n|
      "person#{n}web3@gmail.com"
    end
    #email { "sid@ait.asia" }
    password { "password" }
    #password_confimation { "password" }
  end


  factory :admin, class: User do
    username { "admin" }
    name { "admin" }
    is_admin { true }
    sequence :email do |n|
      "admin#{n}web3@gmail.com"
    end
    password { "password" }
  end


end