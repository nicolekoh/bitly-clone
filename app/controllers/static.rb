



get '/' do

 @urls = Url.all
  erb :"static/index"
end

post '/urls' do 
	puts 'POSTING DATA TO URLS PATH -------------------------'
	puts "PARAMS: #{params}"
	long_url = params[:long_url] #used param to get the key=long_url(in the form), value=long url
	short_url = Url.shorten
	my_url = Url.new(long_url: long_url, short_url: short_url) # create a new object to hold the long and short url
     if my_url.save
    redirect '/'
else 
	@notes = my_url.errors.full_messages

	end
    # my_url.short_url # calling the short url. 

    # erb :"static/index", 
    # locals: {url:my_url.short_url } #call my_url.short_url is calling shorten method at url.rb
end 

get'/count' do 
	@url = Url.all
	erb :"static/count" #link back url to user 
end 

get '/:short_url' do 
	short_url = params[:short_url] #find the 6 digit short url 
	final_result= Url.find_by(short_url: short_url) # find the short url match the long url in the database 

	# link = final_result.long_url # <Url id: 13, long_url: "http://www.w3schools.com/html/html_basic.asp", short_url: "EeUyI0">
	count = final_result.counter.to_i 
	count +=1
	final_result.counter = count 
	final_result.save 
	redirect final_result.long_url

	# find my long url , use short one find long one, redirect user to browser 
end 

get "/delete/:short_url" do 
	@url = Url.find_by(short_url: params[:short_url])
	@url.destroy
	redirect '/'
end 



#add a click count 


