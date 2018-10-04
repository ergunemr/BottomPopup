Pod::Spec.new do |s|

  s.name         = "BottomPopup"
  s.version      = "0.1.1"
  s.summary      = "BottomPopup provides a popup-like presentation style to any view controller"

  s.homepage     = "https://github.com/ergunemr/BottomPopup"
  s.screenshots  = "https://media.giphy.com/media/MRWZQ2PUS0NSeCytPx/giphy.gif", "https://media.giphy.com/media/3bzmRH74e9wL6XKNnG/giphy.gif"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "Emre" => "ergunemr@itu.edu.tr" }

  s.platform = :ios
  s.ios.deployment_target = '10.0'

  s.source       = { :git => "https://github.com/ergunemr/BottomPopup.git", :tag => "#{s.version}" }

  s.source_files  = "BottomPopup/BottomPopupController/*.{swift}"

  s.framework = "UIKit"

  s.swift_version = "3.0"

  s.requires_arc = true

end
