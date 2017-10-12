ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require_relative '../app'

class MainAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  # def test_displays_tdoindex_page
  #   get '/'
  #   assert last_response.ok?
  #   assert last_response.body.include?('')
  # end
  #
  # def test_displays_tdonew_page
  #   get '/tdo/new'
  #   assert last_response.ok?
  #   assert last_response.body.include?('')
  # end

  def test_displays_tdoindex_page
    get '/'
    assert last_response.ok?
    assert last_response.body.include?('@article = Article.all')
    # assert_equal @article = Article.all, false
  end

def test_displays_tdonew_page
  get '/tdo/new'
end

def test_displays_tdoedit_page
  get '/tdo/:id/edit'
end

end
