Pod::Spec.new do |spec|

  spec.name          = "MeterGauge"
  spec.version       = "0.0.1"
  spec.summary       = "Interactive energy progress indicator"

  spec.homepage      = "https://github.com/boof-tech/MeterGauge "
  spec.screenshots   = "https://user-images.githubusercontent.com/35375629/107658858-cd98b580-6c9b-11eb-9542-a26f2061693a.jpg", "https://user-images.githubusercontent.com/35375629/107660125-29b00980-6c9d-11eb-831e-a4ee3ea15d81.gif"

  spec.license       = { :type => "MIT" }
  spec.author        = { "Amirhosein Memarian" => "amirh.memarian@gmail.com" }
  spec.platform      = :ios, "10.0"
  spec.source        = { :git => 'https://github.com/boof-tech/MeterGauge.git', :tag => '0.0.1' }
  spec.source_files  = "MeterGauge/*.{h,m}"

end