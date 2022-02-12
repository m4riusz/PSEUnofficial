class StringsAssetsFile
  KEY_VALUE_SEPARATOR = "="
  STRINGS_FILE_EXTENSION = ".strings"

  def initialize(file_name)
    @file_name = file_name
  end

  def read_keys
    raise "Invalid file extension" unless @file_name.end_with?(STRINGS_FILE_EXTENSION)
    raise "File not found #{@file_name}" unless File.exists?(@file_name)
    read_keys_from_strings_file
  end

  private

  def read_keys_from_strings_file
    keys = []
    file = File.open(@file_name)
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
