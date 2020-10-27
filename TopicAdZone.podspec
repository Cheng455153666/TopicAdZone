Pod::Spec.new do |spec|

  spec.name         = "TopicAdZone"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of TopicAdZone SDK for iOS."
  spec.description  = <<-DESC
            TopicAdZone is a Ad collection SDK
                   DESC
  spec.homepage     = "https://github.com/anythinkteam/sdk_ios_cocoapod"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "CherryKing" => "http://www.torosea.cn/" }
  spec.source       = { :git => "git@github.com:Cheng455153666/TopicAdZone.git", :tag => spec.version }
  spec.platform     = :ios, '9.0'
  spec.ios.deployment_target = '9.0'
  spec.requires_arc = true
  spec.frameworks = 'SystemConfiguration', 'CoreGraphics','Foundation','UIKit'
  
  spec.user_target_xcconfig =   {'OTHER_LDFLAGS' => ['-lObjC']}
  spec.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 armv7s arm64' }

  # spec.vendored_frameworks = 'TopicAd/*.framework'

  spec.subspec 'Core' do |core|
    core.source_files = 'TopicAdZone/Core/**/*.{h,m}'
    core.frameworks = 'UIKit', 'Foundation', 'AdSupport'
  end

  spec.subspec 'Adspot' do |adspot|
    adspot.dependency 'TopicAdZone/Core'
    adspot.source_files = 'TopicAdZone/Adspot/**/*.{h,m}'
  end

  spec.subspec 'Mercury' do |mer|
    mer.dependency 'TopicAdZone/Core'
    mer.dependency 'TopicAdZone/Adspot'
    mer.dependency 'TopicAd'
    mer.source_files = 'TopicAdZone/Adapter/mercury/**/*.{h,m}'
    mer.frameworks = 'StoreKit', 'AVFoundation'
  end

  spec.subspec 'CSJ' do |csj|
    csj.dependency 'TopicAdZone/Core'
    csj.dependency 'TopicAdZone/Adspot'
    csj.dependency 'Bytedance-UnionAD'
    csj.source_files = 'TopicAdZone/Adapter/csj/**/*.{h,m}'
    csj.frameworks = 'UIKit', 'MapKit', 'WebKit', 'MediaPlayer', 'CoreLocation', 'AdSupport', 'CoreMedia', 'AVFoundation', 'CoreTelephony', 'StoreKit', 'SystemConfiguration', 'MobileCoreServices', 'CoreMotion', 'Accelerate'
    csj.libraries  = 'c++', 'resolv', 'z', 'sqlite3'
  end

  spec.subspec 'GDT' do |gdt|
    gdt.dependency 'TopicAdZone/Core'
    gdt.dependency 'TopicAdZone/Adspot'
    gdt.dependency 'GDTMobSDK'
    gdt.source_files =  'TopicAdZone/Adapter/gdt/**/*.{h,m}'
    gdt.frameworks = 'AdSupport', 'CoreLocation', 'QuartzCore', 'SystemConfiguration', 'CoreTelephony', 'Security', 'StoreKit', 'AVFoundation', 'WebKit'
    gdt.libraries     = 'xml2', 'z'
  end

  valid_archs = ['armv7', 'armv7s', 'x86_64', 'arm64']
  spec.xcconfig = {
    'VALID_ARCHS' =>  valid_archs.join(' '),
  }

end
