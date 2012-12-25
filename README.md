# NikePlus-WebCrawler

A ruby webcrawler, which grabs fine-grained data of your personal [Nike+](http://nikeplus.nike.com/plus/) runs.

> If you like the script and want to support my passion, feel free to make any amount of [donation](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=R38NLZUATHUJ6).

## Usage

Unzip the download:

```
unzip ~/Downloads/NikePlus-WebCrawler-master.zip
cd ~/Downloads/NikePlus-WebCrawler-master/ruby_script/
``` 

Execute the [ruby script](https://github.com/voidplus/NikePlus-WebCrawler/blob/master/ruby_script/nikeplus_webcrawler.rb):

```
ruby nikeplus_webcrawler.rb
``` 

Enter your login data:

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

The script generates the following files:

```
ruby_script
├── nikeplus_webcrawler.rb
├── cookies        // save the login session in a file
├── login.xml      // save the basic data of your account
└── data_runs      // generated json and xml data
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

## Parsers

Example [NikeRunParser](https://github.com/voidplus/NikePlus-WebCrawler/tree/master/examples_of_parsers/processing_2_sketch/NikeRunParser) for [Processing 2](http://processing.org/):

![Snapshot](https://raw.github.com/voidplus/NikePlus-WebCrawler/master/examples_of_parsers/processing_2_sketch/NikeRunParser/snapshot.png)

## Dependencies
* [Ruby 1.9.3](http://www.ruby-lang.org/)
* [RubyGems](http://rubygems.org/)
	* [json](https://rubygems.org/gems/json)
	* [active_support/all](https://rubygems.org/gems/active_support) (by [rails](http://rubyonrails.org/))
	* [fileutils](https://rubygems.org/gems/fileutils)

## Tested
System: OSX 10.8.2

## License

The script and example is Open Source Software released under the [MIT License](https://raw.github.com/voidplus/NikePlus-WebCrawler/master/MIT-LICENSE.txt). It's developed by [Darius Morawiec](http://voidplus.de).