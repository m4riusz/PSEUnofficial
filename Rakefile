namespace :project do
  desc "Generate project"
  task :generate => [:assets] do
    puts "Generating project file"
    sh "rm -rf PSEUnofficial.xcodeproj/"
    sh "xcodegen generate --spec project.json"
  end

  desc "Generate assets files"
  task :assets do
    create_dummy_files("Core")
    create_dummy_files("iOS")
  end

  def create_dummy_files(module_name)
    puts "Generate empty assets files"
    sh "mkdir -p #{module_name}/Resources/Generated/"
    sh "touch #{module_name}/Resources/Generated/#{module_name}Strings.swift"
    sh "touch #{module_name}/Resources/Generated/#{module_name}Images.swift"
    sh "touch #{module_name}/Resources/Generated/#{module_name}Colors.swift"
  end
end
