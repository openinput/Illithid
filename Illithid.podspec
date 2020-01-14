Pod::Spec.new do |s|
  s.name             = 'Illithid'
  s.version          = '0.1.0'
  s.summary          = 'Run your tests in a blank environment.'

  s.description      = <<-DESC
  Illithid is a test helper providing a blank environment for your tests involving the access of
  data in UserDefaults. The data is backed up before running your test and restored after finishing it.
                       DESC

  s.homepage         = 'https://github.com/openinput/Illithid'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'José González' => 'jose.gonzalez@openinput.com' }
  s.source           = { :git => 'https://github.com/openinput/Illithid.git', :tag => s.version.to_s }

  s.osx.deployment_target = '10.10'
  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'
  s.swift_version = '5'

  s.source_files = 'Illithid/classes/**/*'

  s.test_spec 'Tests' do |test_spec|
    test_spec.requires_app_host = true
    test_spec.source_files = 'Illithid/tests/**/*'
    test_spec.dependency 'Quick', '~> 2.0'
    test_spec.dependency 'Nimble', '~> 8.0'
  end
end
