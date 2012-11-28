#encoding=utf-8

require "mechanize"

agent = Mechanize.new
agent.user_agent_alias = 'Linux Mozilla'
page = agent.get("http://www.iteye.com/login");

login_form =  page.forms.first

login_form['name']= 'daigong'
login_form['password'] = 'dai23322793'

page = login_form.submit

p page.search(".flash_error")

