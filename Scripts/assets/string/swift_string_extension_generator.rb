class SwiftStringExtensionGenerator
  PLAIN_KEY_REGEX = "^[a-zA-Z0-9]+$"
  COMPLEX_KEY_REGEX = "^[a-zA-Z0-9]+(_[a-zA-Z0-9]+)+$"
  COMPLEX_KEY_PARAM_SEPARATOR = "_"

  def generate_extension(output_file, node)
    file = File.open(output_file, "w")
    file << "/*\nAuto generated\nDo not modify manually!\n*/\n"
    file << "import UIKit\n\n"
    file << "import Core\n\n"
    file << "public extension Assets.Strings {\n"
    file << "\tprivate class BundleClass { /*Nop*/ }\n"
    file << "\tprivate static let bundle = Bundle(for: BundleClass.self)\n"
    generate_string_structs(file, node.group_name, node)
    file << "}\n"
    file.close
  end

  private

  def generate_string_structs(file, module_name, node, depth = 1, full_path = "")
    prefix = ""
    depth.times { prefix += "\t" }
    full_path += "#{node.group_name}/" if depth > 1
    file << "#{prefix}public struct #{node.group_name} {\n"
    node.keys.each { |key| file << generate_string_key(prefix, key, module_name, "#{full_path}#{key}") }
    node.childs.each { |child| generate_string_structs(file, module_name, child, depth + 1, full_path) }
    file << "#{prefix}}\n"
  end

  def generate_string_key(prefix, key, module_name, full_path)
    if plain_key?(key)
      return generate_plain_key(prefix, key, module_name, full_path)
    elsif complex_key?(key)
      return generate_complex_key(prefix, key, module_name, full_path)
    else
      raise "Invalid key! #{key}"
    end
  end

  def plain_key?(key)
    key.match(PLAIN_KEY_REGEX) != nil
  end

  def generate_plain_key(prefix, key, module_name, full_path)
    "#{prefix}\tpublic static let #{key} = String.localized(\"#{module_name}\", \"#{full_path}\", bundle)\n"
  end

  def complex_key?(key)
    key.match(COMPLEX_KEY_REGEX) != nil
  end

  def generate_complex_key(prefix, key, module_name, full_path)
    splited = key.split(COMPLEX_KEY_PARAM_SEPARATOR)
    raw_params = splited.drop(1)
    args = raw_params.map { |arg| "#{arg}: StringRepresentable" }.join(", ")
    "#{prefix}\tpublic static func #{splited.first}(#{args}) -> String { String.localizedWithArgs(\"#{module_name}\", \"#{full_path}\", bundle, [#{raw_params.join(", ")}]) }\n"
  end
end
