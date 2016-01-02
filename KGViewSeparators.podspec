Pod::Spec.new do |s|
  s.name         = 'KGViewSeparators'
  s.version      = '0.9.0'
  s.source       = { :git => 'https://github.com/kgaidis/KGViewSeparators.git', :tag => '0.9.0' }
  s.source_files = 'KGViewSeparators/*.{h,m}'
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.summary      = 'KGViewSeparators is a small helper library that helps to quickly insert separators into a view. No subclassing required!'
  s.author       =  { 'Krisjanis Gaidis' => 'http://www.krisjanisgaidis.com/' }
  s.homepage     = 'https://github.com/kgaidis/KGViewSeparators'
end