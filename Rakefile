namespace :project do
    desc "Generate project"
    task :generate => [:assets] do
        puts "Generating project file"
        sh "rm -rf PSEUnofficial.xcodeproj/"
        sh "xcodegen generate --spec project.json"
    end

    desc "Generate assets files"
    task :assets do
        createDummyFiles("Core")
        createDummyFiles("iOS")
    end

    def createDummyFiles(moduleName)
        puts "Generate empty assets files"
        sh "mkdir -p #{moduleName}/Resources/Generated/"
        sh "touch #{moduleName}/Resources/Generated/#{moduleName}Strings.swift"
        sh "touch #{moduleName}/Resources/Generated/#{moduleName}Images.swift"
        sh "touch #{moduleName}/Resources/Generated/#{moduleName}Colors.swift"
    end
end