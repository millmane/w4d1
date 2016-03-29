require 'addressable/uri'
require 'rest-client'

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  begin
    puts RestClient.post(
      url,
      { user: { name: "Gizmo"} }
    )
  rescue RestClient::Exception => e
    puts e.full.to_json
  end
end
# , email: "gizmo@gizmo.gizmo"
create_user
