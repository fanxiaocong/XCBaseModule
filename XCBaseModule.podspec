

Pod::Spec.new do |s|
  s.name             = 'XCBaseModule'
  s.version          = '0.0.7'
  s.summary          = ' 基础组件，里面包含如下模块：AppConfigure：App全局配置类，配置App的基本参数；Category：App常用的一些分类；Network：网络请求基类；Tools：工具类'

  s.description      = <<-DESC
  XCBaseModule，基础组件，里面包含如下模块：
    AppConfigure：App全局配置类，配置App的基本参数
    Category：App常用的一些分类
    Network：网络请求基类
    Tools：工具类（登录账号缓存、版本更新）
                       DESC

  s.homepage         = 'https://github.com/fanxiaocong/XCBaseModule'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fanxiaocong' => '1016697223@qq.com' }
  s.source           = { :git => 'https://github.com/fanxiaocong/XCBaseModule.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

#  s.source_files = 'XCBaseModule/Classes/**/*'

  # App 全局配置
  s.subspec 'AppConfigure' do |confi|
      confi.source_files = 'XCBaseModule/Classes/AppConfigure/**/*'
      confi.dependency 'XCCategory', '~> 1.0.6'
  end
  
  # 分类
  s.subspec 'Category' do |category|
      category.source_files = 'XCBaseModule/Classes/Category/**/*'
      category.dependency 'XCCategory', '~> 1.0.6'
  end
  
  # 网络
  s.subspec 'Network' do |net|
      net.dependency 'XCMacros', '~> 1.0.2'
      net.dependency 'XCNetworking', '~> 0.0.3'
      net.source_files = 'XCBaseModule/Classes/Network/**/*'
  end
  
  # 工具
  s.subspec 'Tools' do |tool|
      tool.source_files = 'XCBaseModule/Classes/Tools/**/*'
      tool.dependency 'XCMacros', '~> 1.0.2'
  end

end
