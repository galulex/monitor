ENV['RACK_ENV'] = 'test'

require 'rack/test'
require 'rspec'
require File.expand_path '../../app.rb', __FILE__

describe App do
  include Rack::Test::Methods
  def app
    described_class
  end

  describe '/' do
    context 'invalid credentials' do
      before { get '/' }

      it { expect(last_response).to_not be_ok }
      it { expect(last_response.status).to eql(404) }
    end

    context 'valid credentials' do
      before do
        allow_any_instance_of(described_class).to receive(:stream)
        get '/', token: :token
      end

      it { expect(last_response).to be_ok }
      it { expect(last_response.status).to eql(200) }
    end
  end

  describe '/verify' do
    context 'invalid credentials' do
      before { get '/verify' }

      it { expect(last_response).to_not be_ok }
      it { expect(last_response.status).to eql(404) }
    end

    context 'valid credentials' do
      before { get '/verify', token: :token }

      it { expect(last_response).to be_ok }
      it { expect(last_response.status).to eql(200) }
    end
  end
end
