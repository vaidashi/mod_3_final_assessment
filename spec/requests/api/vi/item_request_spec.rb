require 'rails_helper'

describe "Items Request API" do
  it "sends a list of all items" do

    5.times do |n|
      Item.create(name: "Item#{n}", description: "description#{n}", image_url: "http://bit.ly/2iSfuZS")
    end

    get '/api/v1/items.json'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(json.class).to eq(Array)
    expect(json.count).to eq(5)
    expect(page).to_not have_content("created_at")
    expect(page).to_not have_content("updated_at")
  end
end
