require 'Docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases a bike' do
    expect{subject.release_bike}.to raise_error("There are no bikes")
  end

  # it 'releases working bikes' do
  #   bike = Bike.new
  #   expect(subject.dock(bike).release_bike).to be_working
  # end

  it 'fails to dock a bike' do
    DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
    expect{subject.dock(Bike.new)}.to raise_error("There are no spaces available")
  end

  describe '#initialize' do
    it 'change the capacity of the docking station' do
      docking_station = DockingStation.new(12)
      12.times { docking_station.dock(Bike.new) }
      expect{docking_station.dock(Bike.new)}.to raise_error("There are no spaces available")
    end
  end
end
