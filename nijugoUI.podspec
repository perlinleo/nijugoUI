Pod::Spec.new do |s|
  s.name             = 'nijugoUI'
  s.version          = '1.0.0'
  s.summary          = 'sum'
  s.description      = 'desc'
  s.homepage         = 'https://github.com/perlinleo/nijugoUI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Your Name' => 'you@example.com' }
  s.source           = { :git => 'https://github.com/yourusername/nijugoUI.git', :tag => s.version.to_s }
  s.swift_version    = '5.9'
  s.ios.deployment_target = '16.0'
  s.watchos.deployment_target = '9.0'
  s.source_files     = 'Sources/nijugoUI/**/*.swift'
  s.frameworks       = 'SwiftUI', 'Foundation'
end

