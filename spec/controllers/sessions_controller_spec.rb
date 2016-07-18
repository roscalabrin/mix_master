# require 'rails_helper'

#
# RSpec.describe SessionsController, type: :controller do
#   describe "should successfully create a user" do
#     context "with valid params" do
#       it "creates a new artist" do
#         auth_data = {
#             'provider'  => 'spotify',
#             'info' => {
#               'display_name' => 'Fake User',
#               'id'           => '12345'
#             }
#           }
#
#         OmniAuth.config.mock_auth[:spotify] = auth_data
#         expect {
#           post :create,  {:user => provider: :spotify
#           }.to change{ User.count }.by(1)
#       end
#     end
#   end
# end
