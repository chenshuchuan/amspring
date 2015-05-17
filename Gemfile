source 'https://ruby.taobao.org/'

ruby '2.0.0'
gem 'rails', '4.0.0'
gem 'mysql2'
gem 'pg', '0.15.1'
gem 'bootstrap-sass', '2.3.2.0'
gem 'sprockets', '=2.11.0'
gem 'bcrypt-ruby', '3.0.1'
gem 'faker', '1.1.2'

#分页
gem 'will_paginate', '3.0.4'
gem 'bootstrap-will_paginate', '0.0.9'

#文本编译器
gem 'rails_kindeditor'

#图片上传
gem 'carrierwave', '~> 0.10.0'
gem 'mini_magick'

# 站内信息
gem 'acts-as-messageable'

# 搜索 
gem 'sunspot_rails'
#gem 'sunspot_solr', github: 'xhj/sunspot', require: 'sunspot_solr'
gem 'sunspot_solr'
gem 'progress_bar'

#权限
gem 'cancancan', '~> 1.10'

gem 'sass-rails', '4.0.0'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '4.0.0'
gem 'jquery-rails', '2.2.1'
gem 'turbolinks', '1.1.1'
gem 'jbuilder', '1.0.2'

group :development, :test do
  gem 'rspec-rails', '2.13.1'
end

group :test do
  gem 'selenium-webdriver', '~> 2.35.1'
  gem 'capybara', '2.1.0'
  gem 'sqlite3'
  gem 'factory_girl_rails', '4.2.1'
  gem 'cucumber-rails', '1.3.0', :require => false
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
end

group :doc do
  gem 'sdoc', '0.3.20', require: false
end
group :production do
  gem 'rails_12factor', '0.0.2'
end