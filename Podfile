# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

plugin 'cocoapods-keys', {
    :project => "SearchPet",
    :keys => [
	"Api_key_petfinder",
	"Secret_Petfinder"
    ]
}

target 'SearchPet' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'RealmSwift'
  # Pods for SearchPet

  target 'SearchPetTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'SearchPetUITests' do
    # Pods for testing
  end

end
