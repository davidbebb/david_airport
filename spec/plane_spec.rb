require 'plane'

describe Plane do

  it 'is flying when created' do
      expect(subject.status).to eq(:flying)
  end

  it 'can land' do
    expect(subject).to respond_to(:land)
  end

  it 'is landed after landing' do
      subject.land
      expect(subject.status).to eq(:landed)
  end

  it 'can take off' do
    expect(subject).to respond_to(:take_off)
  end

  it 'is flying after take off' do
      subject.land
      subject.take_off
      expect(subject.status).to eq(:flying)
  end

end
