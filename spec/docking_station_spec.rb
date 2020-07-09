require 'Docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases a bike' do
    bike = Bike.new
    expect(subject.release_bike).to eq(bike)
  end

  it 'releases working bikes' do
    bike = Bike.new
    expect(subject.dock(bike).release_bike).to be_working
  end

  it 'docks a bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq(bike)
  end
end
