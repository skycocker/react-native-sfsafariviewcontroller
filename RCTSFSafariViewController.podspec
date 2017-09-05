require 'json'

Pod::Spec.new do |s|
  # NPM package specification
  package = JSON.parse(File.read(File.join(File.dirname(__FILE__), 'package.json')))

  s.name           = 'RCTSFSafariViewController'
  s.version        = package['version']
  s.license        = 'MIT'
  s.summary        = 'An SFSafariViewController wrapper for React Native presenting Safari View in a modal'
  s.author         = { 'Michał Siwek' => 'mike21@aol.pl' }
  s.homepage       = "https://github.com/jsierles/react-native-audio"
  s.source         = { :git => 'https://github.com/n8armstrong/react-native-sfsafariviewcontroller'}
  s.platform       = :ios, '9.0'
  s.preserve_paths = '*.js'
  s.frameworks     = 'SafariServices'

  s.dependency 'React'

  s.source_files = 'RCTSFSafariViewController.{h,m}'
end

