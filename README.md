# chess

This is a command line chess game written in Ruby.

## Usage

1. Clone this repository.
2. On the command line, cd to the repository's directory.
3. Use the following command to start chess: ```ruby lib/game.rb```
4. Enter moves as two positions separated by a comma.
   * Ordered like so: Starting position, destination position
   * Positions based on standard chess grid, with letter first (eg. "e2, e4")
5. Enter "quit" to leave the game.

## Implementation Details

This game is written in Ruby, and utilizes classical inheritance to keep code DRY. It makes use of unicode box characters to display the game board neatly on the command line without spaces between lines. The chess pieces are also drawn from a unicode codepage.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## TODO

* Fix save state (generate folder if necessary)
