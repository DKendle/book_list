# Booklist

Booklist is an application that was created to keep records of all the books you own (current or past). The idea is that you can keep track of your books so that you don't accidently buy copies or miss out on buying one you thought you had, but got rid of or let someone borrow forever.


## Installation
This application used the following versions of Ruby and Rails for development.
```ruby
Ruby 2.6.1-p33
Rails 6.0.3.4
```
You will need both available on your system to properly launch it. Once you have forked the repository and copied your cloned URL the next step is to open it in your code editor.

Next run the following to install all your code dependencies. 
```bundle install```

If your terminal does not show you are in the current directory you will need to give yourself access so that you can launch the application.
```ruby
#Example of not being in the current directory:
JohnDow@Johns-Macbook-Pro %

#Run the following to get into the current directory:
cd book-list 

#Example of being in the current directory
JohnDow@Johns-Macbook-Pro book_list % 
```
Once you are in the application run the following to launch a local server so that you can interact with the application through a browser:
```ruby
rails s
```
Afterwards, your terminal will give you a list of information including where you need to navigate in your browser to see the application. This will be similar to this:
```ruby
=> Booting Puma
=> Rails 6.0.3.4 application starting in development 
=> Run `rails server --help` for more startup options
Puma starting in single mode...
* Version 4.3.6 (ruby 2.6.1-p33), codename: Mysterious Traveller
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://127.0.0.1:3000
* Listening on tcp://[::1]:3000
* Listening on tcp://127.94.0.1:3000
Use Ctrl-C to stop
```
In the list the tcp port number that you will need is after the colon:
```ruby
#We will need the :3000 
tcp://127.0.0.1:3000
#Open a browser and prepend localhost to the number and colon:
localhost:3000
```
If the last number at the end of the tcp port is different just substitute that in at the end of the ```localhost:```

Add that to your browser address bar and hit enter. Once here you can play around with the application!

### Remember: 
While running your server any changes to the code that is within the ```app``` folder will reflect in your browser window once refreshed. If you make any changes to the routes, database, or anything outside of the ```app``` folder they will not be reflected. You will need to hit ```Ctrl+C``` to stop the server and then run the ```rails s``` command to spin it back up again.

### Tip: 
If you close the program without killing the server that tcp port might locked, meaning, you will not be able to use it. You can kill the server and free up the port with a kill command on your computers terminal. I own a Macbook so the following example is for that, but there are similar commands for Windows.
```ruby
#Brings up the computers terminal, searches for terminal, opens it.
Cmd+spacebar
#type in: 
terminal + hit enter

#type in the following with the port number locked after tcp.
#Ex: if localhost:3000 is locked:
lsof -i tcp:3000

#A list will pop up similar to this:
JohnDow@Johns-MacBook-Pro~ % lsof -i tcp:3000
COMMAND   PID USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
ruby    66242 Dina   20u  IPv4 0x8017529134621433      0t0  TCP localhost:hbci (LISTEN)
ruby    66242 Dina   21u  IPv6 0x801752912cfaf3c3      0t0  TCP localhost:hbci (LISTEN)
ruby    66242 Dina   22u  IPv4 0x8017529128f607f3      0t0  TCP client.openvpn.net:hbci (LISTEN)

#Take the PID number and enter kill -9 <PID> 
#With the above list in mind:
kill -9 66242
```
This will kill the server and should free it up for you to access it again through your code editor.

## License
 MIT License

## Project Status
Development of this project was for a bootcamp assessment, but will continue at a slower pace in between other obligations. 
