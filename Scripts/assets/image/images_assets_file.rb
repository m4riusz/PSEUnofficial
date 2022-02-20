class ImagesAssetsFile
  IMAGES_FILE_EXTENSION = ".xcassets"

  def initialize(file)
    @file = file
  end

  def read_keys
    raise "File not found '#{@file}'" unless File.exists?(@file)
    raise "Invalid file!" unless @file.end_with?(IMAGES_FILE_EXTENSION)
    Dir["#{@file}/**/*"]
      .filter { |file| file.match("^*\\.(imageset|appiconset)$") }
      .map { |name| name.sub(/.*Images.xcassets\//, "") }
      .map { |name| name.sub(/\.\w*/, "") }
  end
end
