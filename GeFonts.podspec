Pod::Spec.new do |s|

 s.name             = "GeFonts"
 s.version           = "0.0.1"
 s.summary         = "BaseKit for my's ioser"
 s.homepage        = "https://github.com/my1325/FontTool.git"
 s.license            = "MIT"
 s.platform          = :ios, "13.0"
 s.authors           = { "mayong" => "1173962595@qq.com" }
 s.source             = { :git => "https://github.com/my1325/FontTool.git", :tag => "#{s.version}" }
 s.swift_version = '5.1'
 
 s.subspec 'CustomFonts' do |ss|
    ss.source_files = 'Sources/CustomFonts/*.swift'
 end
 
 s.subspec 'AvenirNext' do |ss|
    ss.source_files = 'Sources/AvenirNext/*.swift'
    ss.dependency 'GeFonts/CustomFonts'
 end
 
 s.subspec 'Avenir' do |ss|
    ss.source_files = 'Sources/Avenir/*.swift'
    ss.dependency 'GeFonts/CustomFonts'
 end
 
 s.subspec 'KohinoorTelugu' do |ss|
    ss.source_files = 'Sources/KohinoorTelugu/*.swift'
    ss.dependency 'GeFonts/CustomFonts'
 end
 
 s.subspec 'Poppins' do |ss|
    ss.source_files = 'Sources/Poppins/*.swift'
    ss.dependency 'GeFonts/CustomFonts'
    ss.resource = 'Sources/Poppins/Fonts/*.otf'
 end
 
 s.subspec 'RammettoOne' do |ss|
    ss.source_files = 'Sources/RammettoOne/*.swift'
    ss.dependency 'GeFonts/CustomFonts'
    ss.resource = 'Sources/RammettoOne/Fonts/*.ttf'
 end
 
 s.subspec 'Outfit' do |ss|
    ss.source_files = 'Sources/Outfit/*.swift'
    ss.dependency 'GeFonts/CustomFonts'
    ss.resource = 'Sources/Outfit/Fonts/*.ttf'
 end
 
  s.subspec 'Causten' do |ss|
    ss.source_files = 'Sources/Causten/*.swift'
    ss.dependency 'GeFonts/CustomFonts'
    ss.resource = 'Sources/Causten/Fonts/*.otf'
 end
end
