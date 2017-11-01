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
  end

  it "can get one item" do
    5.times do |n|
      Item.create(name: "Item#{n}", description: "description#{n}", image_url: "http://bit.ly/2iSfuZS")
    end

    id = Item.first.id

    get "/api/v1/items/#{id}.json"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
  end

  it "can delete an item" do
    item = Item.create(name: "yoyo", description: "Nice yoyo", image_url: "http://bit.ly/2iSfuZS")

    expect(Item.count).to eq(1)

    delete "/api/v1/items/#{item.id}"

    expect(response).to be_success
    expect(Item.count).to eq(0)
  end

  it "can create a new item" do
    item_params = {name: "Toy", description: "Popular Christmas Item", image_url: "http://bit.ly/2iSfuZS"}

    post "/api/v1/items", params: {item: item_params}
    item = Item.last

    assert_response :success
    expect(response).to be_success
    expect(item.name).to eq(item_params[:name])
    expect(item.description).to eq(item_params[:description])
  end

end
