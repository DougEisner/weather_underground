class InMemoryCache
  def initialize
    @cache = {}
  end

  def set(key, value)
    @cache[key] = value
  end

  def get(key)
    @cache[key]
  end

  def key?(key)
    @cache.has_key?(key)
  end

  def clear
    @cache = {}
  end
end
