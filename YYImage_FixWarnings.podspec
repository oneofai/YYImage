Pod::Spec.new do |s|
  s.name         = 'YYImage_FixWarnings'
  s.summary      = 'Image framework for iOS to display/encode/decode animated WebP, APNG, GIF, and more.'
  s.version      = '1.0.6'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'Sun' => 'holaux@gmail.com' }
  s.homepage     = 'https://github.com/oneofai/YYImage'
  s.platform     = :ios, '9.0'
  s.ios.deployment_target = '9.0'
  s.source       = { :git => 'https://github.com/oneofai/YYImage.git', :tag => s.version.to_s }
  
  s.requires_arc = true
  s.default_subspec = 'Core'
  
  s.subspec 'Core' do |core|
    core.source_files = 'YYImage/*.{h,m}'
    core.public_header_files = 'YYImage/*.{h}'
    core.libraries = 'z'
    core.frameworks = 'UIKit', 'CoreFoundation', 'QuartzCore', 'ImageIO', 'Accelerate', 'CoreServices'
  end
  
  s.subspec 'WebP' do |webp|
    webp.dependency 'YYImage/Core'
    webp.ios.vendored_frameworks = 'Vendor/WebP.framework'
  end

  s.subspec 'libwebp' do |libwebp|
    libwebp.dependency 'YYImage/Core'
    libwebp.dependency 'libwebp'
    libwebp.xcconfig = { 
      'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/libwebp/src'
    }
  end
  
end
