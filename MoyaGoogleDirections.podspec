Pod::Spec.new do |s|
  s.name            = "MoyaGoogleDirections"
  s.version         = "1.2.0"
  s.license         = "MIT"
  s.summary         = "Google Maps Directions API client using Moya"
  s.homepage        = "https://github.com/ridebeeline/MoyaGoogleDirections"
  s.author          = { "marcbaldwin" => "marc.baldwin88@gmail.com" }
  s.source          = { :git => "https://github.com/ridebeeline/MoyaGoogleDirections.git", :tag => s.version }
  s.source_files    = "MoyaGoogleDirections/*.swift"
  s.platform        = :ios, '8.0'
  s.swift_version   = '5'
  s.requires_arc    = true
  s.frameworks      = "Foundation"
  s.dependency "Moya", '~> 10.0'
end
