require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
    it { should have_many(:plants).through(:plots) }
  end

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
  end

  describe 'instance methods' do
    describe '#that it filters out names by unique and also does not list plants with day to harvest over 100 days' do
      it 'can filter names to only be used once and does not show plant with harvest over a 100 days' do
        
        expect(@garden1.unique_name_and_not_100_days).to eq([@plant3.name, @plant4.name])
      end
    end
  end
end
