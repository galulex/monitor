require 'rspec'
require_relative '../../lib/monitor.rb'

describe Monitor do
  let(:output) do
    File.open(File.expand_path('./') << '/spec/support/top.output').read
  end

  before do
    allow_any_instance_of(described_class).to receive(:`).and_return(output)
  end

  describe '#processes' do
    subject { Monitor.new.processes }

    it { should be_a_kind_of(Array) }

    it 'has process attributes' do
      expect(subject.first.keys.sort).to eql(%i(cpu mem name pid user))
    end

    it 'returns correct hash' do
      expect(subject.last).to eql(
        user: 'mongodb',
        cpu: '6.2',
        mem: '0.7',
        name: 'mongod',
        pid: '25271'
      )
    end
  end

  describe '#cpu' do
    subject { Monitor.new.cpu }

    it 'returns cpu usage' do
      expect(subject).to eql('10.8')
    end
  end

  describe '#disk' do
    let(:output) do
      "Filesystem     Type 1K-blocks     Used Available Use% Mounted on\n
       /dev/sdb3      ext4  49495796 34698916  12259564  74% /\n"
    end

    subject { Monitor.new.disk }

    it 'returns space available' do
      expect(subject[:available]).to eql('12259564')
    end

    it 'returns space used' do
      expect(subject[:used]).to eql('34698916')
    end
  end

  describe '#to_hash' do
    subject { Monitor.new.to_hash }

    it { should be_a_kind_of(Hash) }

    it 'has all attributes' do
      expect(subject.keys).to eql(%i(cpu disk processes))
    end
  end
end
