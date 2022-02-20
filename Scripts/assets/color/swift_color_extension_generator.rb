class SwiftColorExtensionGenerator
  def generate_extension(output_file, node)
    file = File.open(output_file, "w")
    file << "/*\nAuto generated\nDo not modify manually!\n*/\n"
    file << "import Core\n"
    file << "import SwiftUI\n\n"
    file << "public extension Assets.Colors {\n"
    file << "\tprivate class BundleClass { /*Nop*/ }\n"
    file << "\tprivate static let bundle = Bundle(for: BundleClass.self)\n"
    generate_image_struct(file, node.group_name, node)
    file << "}\n"
    file.close
  end

  private

  def generate_image_struct(file, module_name, node, depth = 1, full_path = "")
    prefix = ""
    depth.times { prefix += "\t" }
    full_path += "#{node.group_name}/" if depth > 1
    file << "#{prefix}public struct #{node.group_name} {\n"
    node.keys.each { |key| file << "#{prefix}\tpublic static let #{key} = Color(\"#{full_path}#{key}\", bundle)\n" }
    node.childs.each { |child| generate_image_struct(file, module_name, child, depth + 1, full_path) }
    file << "#{prefix}}\n"
  end
end
