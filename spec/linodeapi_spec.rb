require 'spec_helper'

describe LinodeAPI do
  it 'has a default endpoint' do
    expect(LinodeAPI::DEFAULT_ENDPOINT).to be_an_instance_of String
  end

  it 'has a spec URL' do
    expect(LinodeAPI::SPEC_URL).to be_an_instance_of String
  end

  it 'makes the spec available' do
    expect(LinodeAPI.spec[:subs]).to be_an_instance_of Hash
    expect(LinodeAPI.spec[:subs][:linode][:subs][:create][:type]).to eql :call
  end

  it 'makes the spec version available' do
    expect(LinodeAPI.spec_version).to match(/[\d.]*/)
  end
end
