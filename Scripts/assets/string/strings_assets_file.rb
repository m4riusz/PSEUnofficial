class StringsAssetsFile
  KEY_VALUE_SEPARATOR = "="
  STRINGS_FILE_EXTENSION = ".strings"

  def initialize(file)
    @file = file
  end

  def read_keys
    raise "File not found '#{@file}'" unless File.exists?(@file)
    raise "Invalid file!" unless @file.end_with?(STRINGS_FILE_EXTENSION)
    read_keys_from_strings_file
  end

  private

  def read_keys_from_strings_file
    keys = []
    file = File.open(@file)
    while !file.eof?
      keys.append(read_key_from_line(file.readline))
    end
    file.close
    return keys
  end

  def read_key_from_line(line)
    line.split(KEY_VALUE_SEPARATOR)[0].strip[1..-2]
  end
end
