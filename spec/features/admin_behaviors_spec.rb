require 'rails_helper'


describe "Admin visits behavior index page" do
  context "as admin" do
    it "allows admin to see all behaviors" do
        admin = User.create(username: "friend",
                            password: "word",
                            role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_behaviors_path
      expect(page).to have_content("ADMIN: List of Behavior Keywords")
    end


    it "default user does not see admin behaviors index" do
      user = User.create(username: "person",
                         password: "pass",
                         role: 0)
     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
     visit admin_behaviors_path
     expect(page).to_not have_content("Admin Behaviors")
     expect(page).to have_content("The page you were looking for doesn't exist.")
   end
end
end
