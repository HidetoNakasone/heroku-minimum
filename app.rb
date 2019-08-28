
Bundler.require

uri = URI.parse(ENV['DATABASE_URL'])
connect = PG.connect(
  host: uri.hostname,
  dbname: uri.path[1..-1],
  user: uri.user,
  port: uri.port,
  password: uri.password
)

get '/' do
  @res = connect.exec('select * from samples;')
  erb :index
end

get '/hello' do
  'hello'
end
 