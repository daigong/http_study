#encoding=utf-8
#
#TODO
#1. 模拟登录
#2. cookies登录
#3. 登录后做出操作
require "mechanize"

agent = Mechanize.new
agent.user_agent_alias = 'Windows IE 7'
# Agent#post URL,PARAMS return page
form_data = {
    :ppui_logintime => 188919,
    :charset => 'utf-8',
    :codestring => '',
    :token => '3134f09db2824ca9502c0b35f873481f',
    :isPhone => false,
    :index => '0',
    :u => '',
    :safeflg => '0',
    :staticpage => 'http://www.baidu.com/cache/user/html/jump.html',
    :loginType => '1',
    :tpl => 'mn',
    :callback => 'parent.bdPass.api.login._postCallback',
    :username => 'daigong',
    :password => 'realdai',
    :verifycode => '',
    :mem_pass => 'on'
}

def print_cookie agent
  p agent.cookie_jar.each do |c|
    p c
  end
end

cookie_1 = Mechanize::Cookie.new(:name => "session", :value => '"h2veOa4+R289jhKZw3VvV3E3b7s=?userid=STcxNjA5MDAwCi4="', :domain => 'passport.uucin.com',:path=>'/')
cookie_2 = Mechanize::Cookie.new(:name => "token", :value => "58800a66f2b98b5931a4057fb979a122", :domain => 'passport.uucin.com',:path=>'/')
agent.cookie_jar.add!(cookie_1)
agent.cookie_jar.add!(cookie_2)
page = agent.get "https://passport.uucin.com/center/spacecp"
p page.search('.user-name');
