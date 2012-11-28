#encoding=utf-8

form_data = {
    :account => 71609000,
    :password => 'daigong'
}

require "mechanize"

def print_cookie agent
  p agent.cookie_jar.each do |c|
    p c
  end
end

agent = Mechanize.new
agent.user_agent_alias = 'Linux Mozilla'
page = agent.post "https://passport.uucin.com/account/login", form_data

page = agent.get("https://passport.uucin.com/center/spacecp");

p page.search(".red")


