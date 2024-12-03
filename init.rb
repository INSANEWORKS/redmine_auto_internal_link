Redmine::Plugin.register :redmine_auto_internal_link do
  name 'Redmine Auto Internal Link'
  author 'INSANEWORKS,LLC'
  description 'Automatically relates issues when internal links are added in comments'
  version '1.0.0'
  url 'https://github.com/INSANEWORKS/redmine_auto_internal_link.git'
  author_url 'https://github.com/INSANEWORKS/redmine_auto_internal_link'
  requires_redmine version_or_higher: '6.0.0'
end

require File.expand_path('../lib/redmine_auto_internal_link/hooks', __FILE__)
