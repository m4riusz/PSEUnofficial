class Node
  KEY_GROUP_SEPARATOR = "/"
  attr_reader :keys
  attr_reader :group_name
  attr_reader :childs

  def initialize(group_name, keys = [], childs = [])
    @group_name = group_name
    @keys = keys
    @childs = childs
  end

  def insert(node = self, key)
    if group?(key)
      group_name = first_group(key)
      new_key = drop_group(key)
      child = node.childs.find { |child| child.group_name == group_name }
      if child.nil?
        child = Node.new(group_name)
        node.childs.append(child)
        insert(child, new_key)
      else
        insert(child, new_key)
      end
    else
      node.keys.append(key)
    end
  end

  private

  def group?(key)
    key.include?(KEY_GROUP_SEPARATOR)
  end

  def first_group(key)
    key.split(KEY_GROUP_SEPARATOR)[0]
  end

  def drop_group(key)
    key.split(KEY_GROUP_SEPARATOR).drop(1).join(KEY_GROUP_SEPARATOR)
  end
end
