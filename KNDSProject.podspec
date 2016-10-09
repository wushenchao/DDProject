Pod::Spec.new do |s|

  s.name         = "KNDSProject"
  s.version      = "0.0.1"
  s.summary      = "simple tools"
  s.homepage     = "https://github.com/wushenchao/KNDSProject"
  s.license      = "MIT"
  s.author       = {
                    "wushenchao" => "625574612@qq.com"
 }
  s.source       = { :git => "https://github.com/wushenchao/KNDSProject.git", :tag => s.version }
  s.source_files  = "KNDSProject/*.{h,m}"
  s.requires_arc  = true

  s.private_header_files = "KNDSProject/KNDSProject.h"

  s.ios.deployment_target = "7.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.framework = "CFNetwork"

  s.dependency "Mantle", "~> 2.0.0"
  s.dependency "MagicalRecord", "~> 2.3.0"

end
