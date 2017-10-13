require_relative '../app.rb'
require 'rspec'
require 'rack/test'
require File.expand_path '../spec_helper.rb', __FILE__


set :environment, :test

describe 'Server ' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "should load the index page" do
    get '/'
    expect(last_response).to be_ok
    # last_response.should be_ok
  end

#   it "displays index page if a article[title] exists" do
#   # get '/', :article => "amrit"
#   #
#   # expect(last_response.body).to include("Hey, amrit. Thanks for coming back!")
#   get '/', :article => 'jjsfbi'
#     assert last_response.body.include?('jjsfbi')
# end
# it "displays index page if there is  article[title]" do
# test "unsuccessful edit" do
#     get index_article_path(@article)
#     assert_template '/tdo/index'
#     patch article_path(@article), params: { article: { article[title]: "",
#                                               } }
#
#     assert_template 'users/edit'
#   end
# end

# context "GET to /" do
#     let(:response) { get "/" }
#
#     it "displays a article that link to /index/:article" do
#       expect(response.body).to include('<p> amrit </p>')
#     end
#     context "GET to /index/:article" do
#     # it "returns status 200 OK"
#     # it "displays the todo list"
#   end
# end

it "displays home page" do
  get '/'
  expect(last_response.body).to include("Enter the TODO")
end

it "displays form" do
  get '/'
  expect(last_response.body).to include("form")
end

it "displays form" do
  get '/'
  expect(last_response.body).to include("list")
end

# context "post to /tdo" do
#     context "given a valid article" do
#       it "adds the article to the dev.db"
#       it "redirects to /tdo/new"
#     end
# end

# context "delete to /tdo/:id" do
#     context "article = Article.get!(id)" do
#     it "article deleted" do
#       delete '/tdo/:id',
#      expect(last_request.path).to eq('/')
#     end
#     end
# end

# it "displays form" do
#   post '/tdo' ,  :article[title] => "Laura"
# expect(last_response.body).to include("Hey, Laura. Thanks for coming back!")
# end

it "displays index page " do
  delete '/tdo', :article => nil
  # expect(last_response.redirect?)
  expect(last_request.path).to eq('/tdo')
end

it "displays index page " do
  get '/', :article => nil
  expect(last_response.redirect?)
  expect(last_request.path).to eq('/')
end


# context "GET to / " do
#   # article = Article.new(article)
#   let(:response) { get '/tdo/index' }
#
#   it "displays a form that POSTs to /tdo" do
#     # puts response.body
#     expect(response.body).to have_tag(:form, :action => "/tdo", :method => "post")
#   end
#
#   it "displays an input tag for the list" do
#     expect(response.body).to have_tag('input', :width => { :type => "text", :name => "article[title]"})
#   end
#
#   it "displays a submit tag" do
#     expect(response.body).to have_tag(:input, :type => "submit")
#   end
#
# end

end
