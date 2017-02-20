require 'rspec'
require 'in_memory_cache'

describe InMemoryCache do
  describe '#get' do
    it 'returns value of given key' do
      cache = InMemoryCache.new
      expect(cache.get('example@example.com')).to eq nil
    end
  end

  describe '#set' do
    it 'caches value for a given key' do
      cache = InMemoryCache.new
      cache.set('example@example.com', 'example')

      expect(cache.get('example@example.com')).to eq 'example'
    end
  end

  describe '#key?' do
    context 'when email provided is cached' do
      it 'returns true' do
        cache = InMemoryCache.new
        cache.set('1example@example.com', '1example')

        result = cache.key?('1example@example.com')

        expect(result).to eq true
      end
    end
  end

  describe '#clear' do
    it 'clears the cache' do
      cache = InMemoryCache.new
      cache.set('1example@example.com', '1example')
      cache.clear
      result = cache.get('1example@example.com')

      expect(result.nil?).to eq true
    end
  end
end
