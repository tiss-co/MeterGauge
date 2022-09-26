Pod::Spec.new do |spec|

  spec.name          = "MeterGauge"
  spec.version       = "0.1.0"
  spec.summary       = "Interactive energy progress indicator"

  spec.homepage      = "https://github.com/boof-tech/MeterGauge "
  spec.screenshots   = "https://user-images.githubusercontent.com/35375629/107658858-cd98b580-6c9b-11eb-9542-a26f2061693a.jpg", "https://user-images.githubusercontent.com/35375629/107660125-29b00980-6c9d-11eb-831e-a4ee3ea15d81.gif"


  spec.swift_versions = '5.0'
  spec.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }
  spec.license       = { :type => "MIT" }
  spec.author        = { "Boof Tech" => "info@boof.tech" }
  spec.platform      = :ios, "10.0"
  spec.source        = { :git => 'https://github.com/boof-tech/MeterGauge.git', :tag => '0.1.0'}
  spec.source_files  = "MeterGauge/**/*.{swift}"
end