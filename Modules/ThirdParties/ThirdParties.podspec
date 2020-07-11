Pod::Spec.new do |s|
    s.name             = 'ThirdParties'
    s.version          = '1.0'
    s.summary          = 'Third parties umbrella'
    s.homepage         = 'https://github.com/leandrogaluzzi/movieshelf'
    s.license          = { :file => 'LICENSE' }
    s.author           = 'Leandro Galuzzi'
    s.source           = { :path => '.' }

    s.ios.deployment_target = '13.5'
    s.swift_version = '5.2'

    s.subspec  'Pods' do |ss|
      ss.dependency 'SnapKit'
      ss.dependency 'RxSwift'
      ss.dependency 'RxCocoa'
      ss.dependency 'SwiftLint'
      ss.dependency 'Moya'
      ss.dependency 'RxRealm'
    end

end
