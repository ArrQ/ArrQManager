

# /************ 配置说明 ***************/


Pod::Spec.new do |s|
    s.name         = 'ArrQManager'
    s.version      = '1.0.0'
    s.summary      = 'a ArrQManager component'
    s.description  = <<-DESC 
                          ArrQManager 是一个用于保存一些常用工具类的工具
                   DESC
    s.homepage     = 'https://github.com/ArrQ/ArrQManager'
    s.license      = 'MIT'
    s.authors      = { 'ArrQ' => '2206506738@qq.com' }
    s.platform     = :ios, '8.0'
    s.framework = "UIKit","Foundation"
    s.source       = { :git => 'https://github.com/ArrQ/ArrQManager.git', :tag => s.version }
    s.requires_arc = true

    s.source_files = 'ArrQManagerOne/ArrQManagerOne/ArrQManager/ArrQManagerHeader.h'
     s.subspec 'YYNoticeViewTool' do |ss|
        ss.ios.deployment_target = '8.0'
        ss.source_files = 'ArrQManagerOne/ArrQManagerOne/ArrQManager/YYNoticeViewTool/YYNoticeViewTool.h','ArrQManagerOne/ArrQManagerOne/ArrQManager/YYNoticeViewTool/**/**.{h,m}'
    end
     s.subspec 'YYYYIconImgManager' do |ss|
        ss.ios.deployment_target = '8.0'
        ss.source_files = 'ArrQManagerOne/ArrQManagerOne/ArrQManager/YYIconImgManager/YYIconImgManagerHeader.h','ArrQManagerOne/ArrQManagerOne/ArrQManager/YYIconImgManager/**/**.{h,m}'
    end
     s.subspec 'YYBaseVC' do |ss|
        ss.ios.deployment_target = '8.0'
        ss.source_files = 'ArrQManagerOne/ArrQManagerOne/ArrQManager/YYBaseVC/YYBaseVCHeader.h','ArrQManagerOne/ArrQManagerOne/ArrQManager/YYBaseVC/**/**.{h,m}'
    end
     s.subspec 'YYCategory' do |ss|
        ss.ios.deployment_target = '8.0'
        ss.source_files = 'ArrQManagerOne/ArrQManagerOne/ArrQManager/YYCategory/YYCategoryHeader.h','ArrQManagerOne/ArrQManagerOne/ArrQManager/YYCategory/**/**.{h,m}'
    end
     s.subspec 'YYTimeManager' do |ss|
        ss.ios.deployment_target = '8.0'
        ss.source_files = 'ArrQManagerOne/ArrQManagerOne/ArrQManager/YYTimeManager/YYTimeManagerHeader.h','ArrQManagerOne/ArrQManagerOne/ArrQManager/YYTimeManager/**/**.{h,m}'
    end
    
end

