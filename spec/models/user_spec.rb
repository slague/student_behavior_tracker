require 'rails_helper'

describe User do
  it "user can be created as an admin" do
    user = User.create(username: "person",
                       password: "word",
                       role: 1)


    expect(user.role).to eq("admin")
    expect(user.admin?).to be_truthy
  end

  it "user can be created as a default user" do
    user = User.create(username: "friend",
                      password: "pass",
                      role: 0)

    expect(user.role).to eq("default")
    expect(user.default?).to be_truthy
  end
end
