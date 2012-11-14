#encoding=utf-8
#
#TODO
#1. 模拟登录
#2. cookies登录
#3. 登录后做出操作
require "mechanize"

agent = Mechanize.new
agent.user_agent_alias = 'Linux Mozilla'
value = "kweDVYd2VVckl0bXBnZ0RDZ0dQTXo0MjF1cTFxUXhlSmlQMDBNbVljVlZzWkJSQVFBQUFBJCQAAAAAAAAAAAoawCEqYYcAZGFpZ29uZwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACAYIArMAAAALBmpXcAAAAA6p5DAAAAAAAxMC4yNi4yMlVjo1BVY6NQZ1"
#Cookie domain 当 get时候会判断发送，bug：Mechanize是不会判断顶级域名的，例如 baidu.com的cookies 是不会发送给 www.baidu.com的 - -##
baidu_cookie_1 = Mechanize::Cookie.new(:name=>'BDUSS',:value=>value,:domain=>'www.baidu.com',:path=>'/',:expired => Time.now + 7*86400);
value_2 = "9DFF63DE0D478E448B1B7F0887CCB970:FG=1"
baidu_cookie_2 = Mechanize::Cookie.new(:name=>'BAIDUID',:value=>value_2,:domain=>'www.baidu.com',:path=>'/',:expired => Time.now + 7*86400);
p baidu_cookie_2
agent.cookie_jar.add!(baidu_cookie_2);
agent.cookie_jar.add!(baidu_cookie_1);

def print_cookie agent
  p agent.cookie_jar.each do |c|
    p c
  end
end

page = agent.get "http://www.baidu.com/"
print_cookie agent
p page.search '.user-name-top'