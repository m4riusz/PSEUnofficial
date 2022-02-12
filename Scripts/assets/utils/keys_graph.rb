require_relative "node"

class KeysGraph
  attr_reader :root

  def initialize(module_name, keys)
    @root = Node.new(module_name)
    keys.each { |key| @root.insert(key) }
  end
end
