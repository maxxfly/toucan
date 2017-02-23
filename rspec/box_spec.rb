require 'rspec/autorun'
require_relative '../lib/box'

RSpec.describe Box do
  # Here is a list of users and the contents they have received already.
  let(:users) do
    [
      { name: 'Steve', received_contents: ['1a', '1b', '3c'] },
      { name: 'Virginie', received_contents: ['3a', '2b', '3c'] },
      { name: 'Fiona', received_contents: ['1b', '2a', '3b'] },
      { name: 'Jenny', received_contents: ['3b', '2c', '1b'] },
      { name: 'James', received_contents: ['2b', '1b', '3a'] },
      { name: 'Fede', received_contents: ['2c', '3a', '1c'] },
      { name: 'Sara', received_contents: ['3a', '2c', '3b'] },
      { name: 'Tizi', received_contents: ['2b', '1b', '2a'] },
      { name: 'Thomas', received_contents: ['3c', '2b', '1a'] },
    ]
  end

  # These are the box codes for the next shipment and their contents
  let(:boxe_codes) do
    [
      {code: 'gr1', contents: ['1a', '1b'], type: :petite},
      {code: 'gr2', contents: ['1a', '2b'], type: :petite},
      {code: 'gr3', contents: ['1b', '2c'], type: :petite},
      {code: 'gr4', contents: ['2c', '3c'], type: :petite},
      {code: 'gr5', contents: ['3b', '1c'], type: :petite},
    ]
  end
  
  let(:available_box_for_steve)    { ['gr5'] }
  let(:available_box_for_virginie) { ['gr1', 'gr3', 'gr5'] }
  let(:available_box_for_fiona)    { ['gr2', 'gr5'] }
  let(:available_box_for_jenny)    { ['gr1', 'gr2'] }
  let(:available_box_for_james)    { ['gr2', 'gr4', 'gr5'] }
  let(:available_box_for_fede)     { ['gr1', 'gr2'] }
  let(:available_box_for_sara)     { ['gr1', 'gr2'] }
  let(:available_box_for_tizi)     { ['gr4', 'gr5'] }
  let(:available_box_for_thomas)   { ['gr3', 'gr5'] }

  before do
    allow(Box).to receive(:get_all) { boxe_codes }
  end

  subject { Box.scan_new_box_for_users(:users) }

  it "check count elements" do 
    expect(subject.count).to eq users.count 
  end
  
  it "check for Steve" do 
    expect(subject).
      to include( users[0].merge(available_boxes: available_box_for_steve ))
  end

  it "check for Virginie" do 
    expect(subject).
      to include( users[1].merge(available_boxes: available_box_for_virginie ))
  end

  it "check for Fiona" do 
    expect(subject).
      to include( users[2].merge(available_boxes: available_box_for_fiona ))
  end

  it "check for Jenny" do 
    expect(subject).
      to include( users[3].merge(available_boxes: available_box_for_jenny ))
  end
  
  it "check for James" do 
    expect(subject).
      to include( users[4].merge(available_boxes: available_box_for_james ))
  end
  
  it "check for Fede" do 
    expect(subject).
      to include( users[5].merge(available_boxes: available_box_for_fede ))
  end
  
  it "check for Sara" do 
    expect(subject).
      to include( users[6].merge(available_boxes: available_box_for_sara ))
  end
  
  it "check for Tizi" do 
    expect(subject).
      to include( users[7].merge(available_boxes: available_box_for_tizi ))
  end
  
  it "check for Thomas" do 
    expect(subject).
      to include( users[8].merge(available_boxes: available_box_for_thomas ))
  end
end