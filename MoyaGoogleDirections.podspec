Pod::Spec.new do |s|
  s.name         = "MoyaGoogleDirections"
  s.version      = "0.0.1"
  s.license      = "MIT"
  s.summary      = "Google Maps Directions API client using Moya"
  s.homepage     = "https://github.com/ridebeeline/MoyaGoogleDirections"
  s.author       = { "marcbaldwin" => "marc.baldwin88@gmail.com" }
  s.source       = { :git => "https://github.com/ridebeeline/MoyaGoogleDirections.git", :tag => s.version }
  s.source_files = "MoyaGoogleDirections/*.swift"
  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.default_subspec = "Core"

  s.subspec "Core" do |ss|
    ss.dependency "Moya"
    ss.dependency 'SwiftyJSON'
    ss.framework  = "Foundation"
  end

end
