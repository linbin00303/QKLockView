
Pod::Spec.new do |s|

  s.name         = 'QKLockView'
  s.module_name  = 'QKLockView'
  s.version      = '0.0.1'
  s.summary      = 'A Swift based reimplementation of the Apple QKLockView (Volume, Ringer, Rotation,…) for iOS 8 and up'

  s.homepage     = 'https://github.com/zxpLearnios/QKLockView'
  s.license          = 'MIT'
  s.author       = { 'zjn' => 'zxp1991tqd@163.com' }
  s.platform     = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  s.source       = { :git => 'https://github.com/zxpLearnios/QKLockView.git', :tag => s.version.to_s }

  s.source_files  = ['QKLockView/*.swift', 'QKLockView/QKLockView.h']
  s.public_header_files = ['QKLockView/QKLockView.h']
  s.resources     = 'QKLockView/*.xcassets'

 
end
