# NhlCli

Welcome to the NHL Roster CLI! This CLI will give you access to all 31 NHL teams and their current rosters. Once prompted, you will be able to see a list of all 31 teams in alphebetical order. From there, you can input the corresponding number to the team whose roster you'd like to view. After entering that number, you will be able to view the current roster with the players numbers, names and positions. Finally, you can return back to the teams page and view another roster of your choice. 


<!-- In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/nhl_cli`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem -->

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nhl_cli'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install nhl_cli

    To run the program:
    ruby bin/run

## Usage

To start, type ruby bin/run

After the welcome message, you will be asked to enter your name.

The program will then ask you if you'd like to view the roster of your favorite NHL team by entering 'y'. If not, the user could exit the program by typing 'exit'.

After typing 'y', you will be prompted to a list of all 31 NHL teams. The user will then need to type the corressponding number to the team that they would like to view.

Finally, the user will be asked if they'd like to return to the previous page to select another team, or if they would like to exit the program.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/nhl_cli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/nhl_cli/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NhlCli project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/nhl_cli/blob/master/CODE_OF_CONDUCT.md).
