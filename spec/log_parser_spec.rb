# frozen_string_literal: true

require './lib/log_parser'

RSpec.describe LogParser do
  subject(:parser) { described_class.new }

  let(:log) do
    <<~LOG
      /contact 184.123.665.067
      /help_page/1 126.318.035.038
      /help_page/1 929.398.951.889
      /help_page/1 929.398.951.889
    LOG
  end

  let(:file_path) { 'file_path' }

  before do
    allow(File).to receive(:open).with(file_path).and_return(log.lines)
  end

  describe '#parse' do
    let(:visits) do
      {
        '/contact' => ['184.123.665.067'],
        '/help_page/1' => ['126.318.035.038', '929.398.951.889', '929.398.951.889']
      }
    end

    it 'returns the parsed visits hash' do
      expect(parser.parse(file_path)).to eq(visits)
    end
  end

  describe '#sorted_total_visits' do
    let(:sorted_total_visits) do
      <<~OUTPUT
        /help_page/1 3 visits
        /contact 1 visits
      OUTPUT
    end

    before { parser.parse(file_path) }

    it 'returns sorted total visits' do
      expect(parser.sorted_total_visits).to eq(sorted_total_visits)
    end
  end

  describe '#sorted_unique_views' do
    let(:sorted_unique_views) do
      <<~OUTPUT
        /help_page/1 2 unique views
        /contact 1 unique views
      OUTPUT
    end

    before { parser.parse(file_path) }

    it 'returns sorted unique views' do
      expect(parser.sorted_unique_views).to eq(sorted_unique_views)
    end
  end
end
