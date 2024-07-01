#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint referral_hero_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'referral_hero_flutter'
  s.version          = '0.0.1'
  s.summary          = 'A Flutter plugin for integrating ReferralHero API.'
  s.description      = <<-DESC
A Flutter plugin for integrating ReferralHero API to manage referrals, contests, and rewards in your mobile applications.
                       DESC
  s.homepage         = 'https://github.com/maitre-app/ReferralHero-Flutter'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'ReferralHero' => 'lamar@referralhero.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
