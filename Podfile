source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'

# ignore warnings from all pods
inhibit_all_warnings!
use_frameworks!
project 'iss.xcproject/'
target 'iss' do
    pod 'Alamofire'
    pod 'SwiftyJSON'
end
	post_install do |installer|
	  installer.pods_project.targets.each do |target|
	    target.build_configurations.each do |config|
	      config.build_settings['SWIFT_VERSION'] = '3.0'
	      config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'Yes'
	    end
	  end
	end	

