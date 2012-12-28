#!/usr/bin/env ruby

require 'rexml/document'
require 'rubygems'
require 'fileutils'
require 'active_support/all'
require 'json'

include REXML


class NikeplusWebcrawler

	def initialize(*args)

		puts_line
		puts "NikePlus-WebCrawler"
		puts_line

		if args.size==2
			@mail = args[0]
			@pass = args[1]
		else
			print "Type your mail: "
			@mail = STDIN.gets.chomp
			print "Type your pass: "
			@pass = STDIN.gets.chomp
		end

		`curl --cookie-jar cookies \
			--data 'email=#{@mail}' \
			--data 'password=#{@pass}' \
			--output ./login.xml \
			--silent \
			https://secure-nikeplus.nike.com/nsl/services/user/login?app=b31990e7-8583-4251-808f-9dc67b40f5d2`

		doc = Document.new(File.new("login.xml"))
		login = ( doc.elements['serviceResponse/header/success'].get_text=="true" )

		puts_line

		if login
			puts "Login successful."
			puts_line

			all = {}

			# get screen name	
			name = doc.elements['serviceResponse/body/User/screenName'].get_text

			# raw data: window.np.settings.user.achievement_list
			raw_list = `curl -s --cookie cookies \
				http://nikeplus.nike.com/plus/activity/running/#{name}/lifetime/ \
				| grep 'window.np.settings.user.achievement_list'`
			raw_list.slice! "window.np.settings.user.achievement_list = "
			raw_list.slice! ";\n"
			json_list = JSON.parse(raw_list)

			# File.open("achievement_list.json", 'w+'){ |f| f.write( JSON.pretty_generate(json_list)) }
			# File.open("achievement_list.xml", 'w+'){ |f| f.write( JSON.parse(raw_list).to_xml(:root=>:activities)) }

			json_list.each do |activity|
				id = activity['activityId']
				all[id] = activity
			end

			# raw data: window.np.activity
			raw_activity = `curl -s --cookie cookies \
				http://nikeplus.nike.com/plus/activity/running/#{name}/lifetime/ \
				| grep 'window.np.activity'`
			raw_activity.slice! "\t\twindow.np.activity = "
			raw_activity.slice! ";\n"
			json_activity = JSON.parse(raw_activity)

			# File.open("activity.json", 'w+'){ |f| f.write( JSON.pretty_generate(json_activity)) }
			# File.open("activity.xml", 'w+'){ |f| f.write( JSON.parse(raw_activity).to_xml(:root=>:activities)) }

			json_activity["activities"].each do |activity|
				id = activity['activity']['activityId']
				all[id] = activity
			end

			# download runs
			if all.length>0
				create_folders

				puts "Start to grab your #{all.length} runs:"

				all.each_with_index do |e,i|
					id = e[0]
					puts "ID ##{id} (#{(i+1)}/#{all.length})"
					get_run(name,id)
					sleep 2
				end

				puts_line
				puts "Ready! ./data_runs/json & ./data_runs/xml"
				puts_line
			end

		else
			puts "Login error."
			puts_line
		end

	end

	private

	def get_run(name, id)
		raw = `curl -s --cookie cookies \
			http://nikeplus.nike.com/plus/activity/running/#{name}/detail/#{id} \
			| grep 'window.np.baked_data'`

		raw.slice! "\t\t\twindow.np.baked_data = "
		raw.slice! ";\n"

		json = JSON.parse(raw)

		File.open("data_runs/json/#{id}.json", 'w+'){ |f| f.write( JSON.pretty_generate(json)) }
		File.open("data_runs/xml/#{id}.xml", 'w+'){ |f| f.write( JSON.parse(raw).to_xml(:root=>:run)) }
	end

	def create_folders
		FileUtils.mkdir_p 'data_runs'
		FileUtils.mkdir_p 'data_runs/json'
		FileUtils.mkdir_p 'data_runs/xml'
	end

	def puts_line
		puts "------------------------------------------"
	end

end