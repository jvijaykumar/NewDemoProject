
wget -uri http://localhost:1080/cgi-bin/welcome.pl -Method Get       #>>C:\APITEST.txt

#<input type="hidden" name="userSession" value="124386.309437019zDQiVcApHQVzzzzHDiDiipHctHf"/>

$CorrelationParam = @{name='"usersession" value="(.*?)&"/>'}

wget -uri http://localhost:1080/cgi-bin/nav.pl?in=home -Method Get    # >>C:\APITEST.txt

#After Login to App get all these details from form data in developer tools

$postparams= @{usersession='CorrelationParam';username='jojo';password='bean';login='Login';JSFormSubmit='off'}
wget -uri http://localhost:1080/cgi-bin/login.pl -Method Post -Body $postparams          #>>C:\APITEST.txt

#//Another transaction takes from developer tools and network

#//Request URL: http://localhost:1080/cgi-bin/welcome.pl?page=menu&in=home          Get Method

$value = @{page='menu';in='home'}
wget -Uri http://localhost:1080/cgi-bin/welcome.pl? -Method Get -Body $value          #>>C:\APITEST.txt

#//Next Transaction

#//Request URL: http://localhost:1080/cgi-bin/login.pl?intro=true        Get Method

$tag = @{intro='true';Referer='http://localhost:1080/cgi-bin/login.pl'}
wget -Uri http://localhost:1080/cgi-bin/login.pl?intro=true -Method Get -Body $tag     #>>C:\APITEST.txt

#//Next Transaction

#//Request URL: http://localhost:1080/cgi-bin/welcome.pl?signOff=1        Get Method

$Param = @{signOff='1';Referer='http://localhost:1080/cgi-bin/nav.pl?page=menu&in=home'}
wget -Uri http://localhost:1080/cgi-bin/welcome.pl?signOff=1 -Method Get -Body $param     #>>C:\APITEST.txt