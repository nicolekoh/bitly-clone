get '/' do
	puts 'ACCESSING ROOT PATH -------------------------'
  erb :"static/index"
end

post '/urls' do 
	puts 'POSTING DATA TO URLS PATH -------------------------'
	puts "PARAMS: #{params}"
	long_url = params[:long_url] #used param to get the key=long_url(in the form), value=long url
	my_url = Url.new(long_url: long_url) # create a new object to hold the long url
    @short_url = my_url.shorten #calling the shorten method to shorten the long url to short
    # my_url.update(short_url: @short_url) # create another object to hold the short url 
    my_url.save
    # my_url.short_url # calling the short url. 

    erb :"static/index", locals: {url:my_url.short_url } #call my_url.short_url is calling shorten method at url.rb
end 

get'/count' do 
	@url = Url.all
	erb :"static/count"
end 

get '/:short_url' do 
	short_url = params[:short_url] #find the 6 digit short url 
	final_result= Url.find_by(short_url: short_url) # find the short url match the long url in the database 
	link = final_result.long_url # <Url id: 13, long_url: "http://www.w3schools.com/html/html_basic.asp", short_url: "EeUyI0">
	count = final_result.counter.to_i 
	count +=1 
	final_result.counter = count 
	final_result.save 
	redirect "http://" + final_result.long_url

	# find my long url , use short one find long one, redirect user to browser 
end 



#add a click count 


