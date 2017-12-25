require 'rails_helper'

RSpec.describe DataReversion do
  it 'returns empty hash if no data provided' do
    expect(DataReversion.process).to eq Hash.new
  end

  it 'returns inverted value for key value pairs' do
    hash1 = { first: 'Some data', second: 'Second data' }
    hash2 = { first: 'atad emoS', second: 'atad dnoceS' }
    expect(DataReversion.process(hash1)).to eq hash2
  end

  it 'converts input data to hash format and proccesses it' do
    array = [%i[element1 element2], %i[element3 element4]]
    res_hash = { element1: '2tnemele', element3: '4tnemele' }
    expect(DataReversion.process(array)).to eq res_hash
  end

  it 'returns empty hash if data is not convertable to hash' do
    expect(DataReversion.process(:not_hashable)).to eq Hash.new
    expect(DataReversion.process('not_hashable')).to eq Hash.new
  end

  it 'returns the inverted values also for nested hashes recursively' do
    hash1 = {
      first: { a: 'One', b: 'Two' },
      second: { c: 'Three', d: { e: 'Four' } }
    }
    hash2 = {
      first: { a: 'enO', b: 'owT' },
      second: { c: 'eerhT', d: { e: 'ruoF' } }
    }
    expect(DataReversion.process(hash1)).to eq hash2
  end
end
