require 'redmine'

Redmine::Plugin.register :time_entries_report do
  name 'Time Entries Report plugin'
  author 'crazyproger'
  description 'This is a plugin for Redmine. It adds custom(or more redmine-like) reports to issue time entries.'
  version '0.0.1'
  url 'https://github.com/crazyproger/time_entries_report'
  author_url 'https://github.com/crazyproger'
end

require 'timelog_controller_patch'
TimelogController.send(:include, TimelogControllerPatch)

RedmineApp::Application.routes.prepend do
  get '/time_entries/detailed', to: 'timelog#detailed'
end
