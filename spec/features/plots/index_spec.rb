require 'rails_helper'
RSpec.describe 'plot index page' do

  before :each do
    @garden1 = Garden.create!(name: "Gun", organic: false)
    @garden2 = Garden.create!(name: "Charlie", organic: true)
    @plot1 = Plot.create!(number: 10, size: "large", direction: "West", garden_id: @garden1.id)
    @plot2 = Plot.create!(number: 20, size: "large", direction: "West", garden_id: @garden1.id)
    @plot3 = Plot.create!(number: 5, size: "small", direction: "East", garden_id: @garden2.id)
    @plant1 = Plant.create!(name: "tomato", description: "This is a description 1.", days_to_harvest: 1)
    @plant2 = Plant.create!(name: "cucumber", description: "This is a description 2.", days_to_harvest: 2)
    @plant3 = Plant.create!(name: "lettuce", description: "This is a description 3.", days_to_harvest: 3)
    @plant4 = Plant.create!(name: "cabbage", description: "This is a description 4.", days_to_harvest: 4)
    @plant5 = Plant.create!(name: "carrots", description: "This is a description 5.", days_to_harvest: 101)
    @plotplant1 = PlotPlant.create!(plant_id: @plant1.id, plot_id: @plot3.id)
    @plotplant2 = PlotPlant.create!(plant_id: @plant2.id, plot_id: @plot3.id)
    @plotplant3 = PlotPlant.create!(plant_id: @plant3.id, plot_id: @plot1.id)
    @plotplant4 = PlotPlant.create!(plant_id: @plant4.id, plot_id: @plot1.id)
    @plotplant5 = PlotPlant.create!(plant_id: @plant3.id, plot_id: @plot2.id)
    @plotplant6 = PlotPlant.create!(plant_id: @plant4.id, plot_id: @plot2.id)
    @plotplant7 = PlotPlant.create!(plant_id: @plant5.id, plot_id: @plot2.id)

    visit "/plots"
  end

  it "can show all the plot numbers and their names underneath their I.D.'s" do
    
    
    expect(current_path).to eq("/plots")
    expect(page).to have_content(@plot1.number)
    expect(page).to have_content(@plot2.number)
    expect(page).to have_content(@plot3.number)
    expect(page).to have_content(@plant1.name)
    expect(page).to have_content(@plant2.name)
    expect(page).to have_content(@plant3.name)
    expect(page).to have_content(@plant4.name)
    expect(page).to have_content(@plant5.name)
    expect(page).to_not have_content(@plot1.size)
    expect(page).to_not have_content(@plot2.size)
    expect(page).to_not have_content(@plot3.size)
    expect(page).to_not have_content(@plot1.direction)
    expect(page).to_not have_content(@plot2.direction)
    expect(page).to_not have_content(@plot3.direction)
  end

  it 'can click a remove plant button and delete the association between that plant and the plot associated' do
    save_and_open_page
  end
end