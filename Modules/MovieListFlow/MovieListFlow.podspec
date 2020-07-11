Pod::Spec.new do |s|
    s.name             = 'MovieListFlow'
    s.version          = '1.0'
    s.summary          = 'Movie list functional block'
    s.homepage         = 'https://github.com/leandrogaluzzi/movieshelf'
    s.license          = { :file => 'LICENSE' }
    s.author           = 'Leandro Galuzzi'
    s.source           = { :path => '.' }

    s.ios.deployment_target = '13.5'
    s.swift_version = '5.2'

    s.source_files = 'Classes/**/*.{swift}'

    s.frameworks = "UIKit"

    s.dependency 'Core'
end
