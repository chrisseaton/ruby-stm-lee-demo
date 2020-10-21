# Ruby STM Lee Demo

## Usage

```
% ruby 1-draw-empty-board.rb inputs/testBoard.txt testBoard.svg   
routes: 203

% ruby 2-expensive-solution.rb inputs/testBoard.txt testBoard.svg 
routes: 203
cost:   4168
depth:  5

% ruby 3-sequential-lee.rb inputs/testBoard.txt testBoard.svg 
routes: 203
cost:   3304
depth:  3

% ruby 4-transactional-lee.rb inputs/testBoard.txt testBoard.svg testBoard-expansions
routes:      203
independent: 79
overlaps:    9
conflicts:   27
spare:       0
cost:        3307
depth:       3
```

You'll need to use a build of the `thread_tvar` branch of MRI, with `instrument-atomically.patch` which applies cleanly on top of at least `66e45dc50c05d5030c8f9663bb159b8e2014d8ff`, in order to run the next two commands.

```
% ruby 5-sequential-tvar-lee.rb inputs/testBoard.txt testBoard.svg 
routes:      203
cost:        3304
depth:       3

% ruby 6-concurrent-tvar-lee.rb inputs/testBoard.txt testBoard.svg 
routes:      203
committed:   203
aborted:     7
cost:        3308
depth:       3
```

## Rendering

The SVGs produced aren't very efficient I'm afraid. You may be better off converting them to PNG.

```
% qlmanage -t -s 1000 -o testBoard-expansions testBoard-expansions/*.svg
```

You can also make an animated GIF.

```
% convert -scale 250 -delay 10 -loop 1 testBoard-expansions/*.png testBoard.gif
```

## Author

Written by Chris Seaton at Shopify, chris.seaton@shopify.com.

## License

MIT

## Inputs

Inputs are from http://apt.cs.manchester.ac.uk/projects/TM/LeeBenchmark/.

> Unless otherwise mentioned, the code copyright is held by the University of Manchester, and the code is provided "as is" without any guarantees of any kind and is distributed as open source under a BSD license.

[1] Ian Watson, Chris Kirkham and Mikel Luján. A Study of a Transactional Parallel Routing Algorithm. In Proceedings of the 16th International Conference on Parallel Architectures and Compilation Techniques (PACT 2007), Brasov, Romania, Sept. 2007, pp 388-398.

[2] Mohammad Ansari, Christos Kotselidis, Kim Jarvis, Mikel Luján, Chris Kirkham, and Ian Watson. Lee-TM: A Non-trivial Benchmark for Transactional Memory. In Proceedings of the 8th International Conference on Algorithms and Architectures for Parallel Processing (ICA3PP 2008), Aiya Napa, Cyprus, June 2008.

`inputs/minimal.txt` by Chris Seaton.
