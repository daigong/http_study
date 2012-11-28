#encoding=utf-8
require "mechanize"

agent = Mechanize.new

agent.user_agent_alias = "Linux Firefox"

page = agent.get "http://223.4.120.164:808/cacti/index.php"

form =  page.forms.first

form['login_username'] = 'admin'
form['login_password'] = 'sunmap'

form.submit

page = agent.get "http://223.4.120.164:808/cacti/graph_view.php?action=tree&tree_id=2&leaf_id=101"

page.images_with(:src=>/graph_image.php/).each do |img|
  img.fetch.save("/home/daigong/image/#{img.src}")
end