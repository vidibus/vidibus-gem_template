require 'spec_helper'

describe Vidibus::GemTemplate::Mongoid do
  let(:anna) {Model.new(:name => 'Anna')}

  describe 'validation' do
    it 'should pass with valid attributes' do
      anna.should be_valid
    end
    
    it 'should fail without a name' do
      anna.name = nil
      anna.should be_invalid
    end
  end

  describe '#shout' do
    it 'should return 'Yay!'' do
      anna.shout.should eql('Yay!')
    end
  end
  
  describe '.species' do
    it 'should be human' do
      Model.species.should eql('human')
    end
  end
end
