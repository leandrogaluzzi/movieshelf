source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '13.5'
use_frameworks!
inhibit_all_warnings!

workspace 'movieshelf'

def modules
  pod 'ThirdParties', :path => './Modules/ThirdParties'
  pod 'Commons', :path => './Modules/Commons'
  pod 'Data', :path => './Modules/Data'
  pod 'Core', :path => './Modules/Core'
  pod 'MovieListFlow', :path => './Modules/MovieListFlow'
end

target 'movieshelf' do
  project 'movieshelf.xcodeproj'
  
  modules
end
