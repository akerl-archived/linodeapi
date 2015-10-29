require 'spec_helper'

USERNAME = ENV['LINODE_USERNAME'] || 'test'
PASSWORD = ENV['LINODE_PASSWORD'] || 'test'
APIKEY = ENV['LINODE_APIKEY'] || 'test'

describe LinodeAPI::Raw do
  let(:subject) do
    LinodeAPI::Raw.new(apikey: APIKEY)
  end

  it 'requires credentials' do
    VCR.use_cassette('no_creds') do
      expect { LinodeAPI::Raw.new }.to raise_error ArgumentError
    end
  end

  it 'fails if the username/password are invalid' do
    VCR.use_cassette('basic_auth_fail') do
      expect do
        LinodeAPI::Raw.new(username: 'bad', password: 'bad')
      end.to raise_error RuntimeError
    end
  end

  it 'accepts valid username/password' do
    VCR.use_cassette('basic_auth') do
      api = LinodeAPI::Raw.new(username: USERNAME, password: PASSWORD)
      expect(api.test.echo).to be_an_instance_of OpenStruct
    end
  end

  it 'accepts a valid api key' do
    VCR.use_cassette('test_echo') do
      expect(subject.test.echo).to be_an_instance_of OpenStruct
    end
  end

  it 'has a to_s representation' do
    expect(subject.to_s).to eql 'LinodeAPI::Raw object'
    expect(subject.inspect).to eql 'LinodeAPI::Raw object'
  end

  it 'accurately responds to .respond_to?' do
    expect(subject.respond_to? :linode).to be_truthy
    expect(subject.respond_to? :list).to be_falsey
  end

  it 'returns arrays for list calls' do
    VCR.use_cassette('linode_list') do
      expect(subject.linode.list.class).to eql Array
    end
  end

  it 'fails if a required param is missing' do
    expect { subject.linode.create }.to raise_error ArgumentError
  end

  it 'converts boolean params to true/false' do
    VCR.use_cassette('kernel_list') do
      expect(
        subject.avail.kernels(isxen: 'word').all? { |x| x.isxen == 1 }
      ).to be_truthy
    end
  end

  it 'raises a validation error on invalid numeric params' do
    expect do
      subject.avail.linodeplans(planid: 'word')
    end.to raise_error ArgumentError
  end
end
