require 'json'

class FileSystemCache
  def initialize(filename)
    @filename = filename

    if File.exists? @filename
      @cache = JSON.parse(File.read(@filename))
    else
      @cache = {}
    end
  end

  def set(key, value)
    @cache[key] = value

    File.write(@filename, @cache.to_json)
  end

  def get(key)
    @cache[key]
  end

  def key?(key)
    @cache.key? key
  end
end
