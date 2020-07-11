Pod::Spec.new do |s|
    s.name             = 'Core'
    s.version          = '1.0'
    s.summary          = 'Core umbrella'
    s.homepage         = 'https://github.com/leandrogaluzzi/movieshelf'
    s.license          = { :file => 'LICENSE' }
    s.author           = 'Leandro Galuzzi'
    s.source           = { :path => '.' }

    s.ios.deployment_target = '13.5'
    s.swift_version = '5.2'

    s.source_files = 'Classes/**/*.{swift}'

    s.dependency 'Data'
    s.dependency 'Commons'
end
