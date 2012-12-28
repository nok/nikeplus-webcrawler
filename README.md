# NikePlus-WebCrawler

A webcrawler as RubyGem and RubyScript, which grabs fine-grained data of your personal [Nike+](http://nikeplus.nike.com/plus/) runs.

> If you like the gem or script and want to support my passion, feel free to make any amount of [donation](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=R38NLZUATHUJ6).

## RubyGem

Install the RubyGem:

```
gem install nikeplus_webcrawler
``` 

Execute the RubyGem with or without arguments:

```
nikeplus_webcrawler
nikeplus_webcrawler [LOGIN_MAIL] [LOGIN_PASS]
``` 

## RubyScript

Unzip the download and switch to the directory:

```
unzip ~/Downloads/NikePlus-WebCrawler-master.zip
cd ~/Downloads/NikePlus-WebCrawler-master/ruby_script/
``` 

Execute the ruby script and follow the instructions:

```
ruby nikeplus_webcrawler.rb
``` 

## Process

```
------------------------------------------
NikePlus-WebCrawler
------------------------------------------
Type your mail: [LOGIN_MAIL]
Type your pass: [LOGIN_PASS]
------------------------------------------
Login successful.
------------------------------------------
Start to grab your 10 runs:
ID #1234567890 (1/10)
ID #2345678901 (2/10)
ID #3456789012 (3/10)
// ...
------------------------------------------
Ready! ./data_runs/json & ./data_runs/xml
------------------------------------------
```

## Result

```
.
├── nikeplus_webcrawler.rb
├── cookies     // save the login session in a file
├── login.xml   // save the basic data of your account
└── data_runs   // generated json and xml data
    ├── json
    │   ├── 1234567890.json
    │   ├── 2345678901.json
    │   ├── 2345678901.json
    │   └── ...
    └── xml
        ├── 1234567890.xml
        ├── 2345678901.xml
        ├── 3456789012.xml
        └── ...
```

## Dependencies

* [Ruby 1.9.3](http://www.ruby-lang.org/)
* [RubyGems](http://rubygems.org/)
	* [json](https://rubygems.org/gems/json)
	* [active_support/all](https://rubygems.org/gems/active_support) (by [rails](http://rubyonrails.org/))
	* [fileutils](https://rubygems.org/gems/fileutils)
* Unix Shell (curl, grep)

## Tested

System: OSX 10.8.2

## Parsers

[XML Parser](https://github.com/voidplus/NikePlus-WebCrawler/tree/master/examples_of_parsers/processing_2_sketch/NikeRunParser) Example for [Processing 2](http://processing.org/):

![Snapshot](https://raw.github.com/voidplus/NikePlus-WebCrawler/master/examples_of_parsers/processing_2_sketch/NikeRunParser/snapshot.png)

## License

The script and example is Open Source Software released under the [MIT License](https://raw.github.com/voidplus/NikePlus-WebCrawler/master/MIT-LICENSE.txt). It's developed by [Darius Morawiec](http://voidplus.de).