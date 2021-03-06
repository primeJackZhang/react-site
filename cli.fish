#!/usr/bin/env fish

function help
  echo "react-site - simple and hackable static website generator with React and browserify.
usage: react-site <command> [options]
commands:
    build - builds the site at the current directory, saves the output at ./_site/
      will minify bundle.js and set NODE_ENV to 'production'.
    serve - starts watching files to rebuild the site and serving them. 
      will use --debug flag will be used and set NODE_ENV to 'development'.
      doesn't do HMR, you still have to reload/reclick dependending on what you changed.
more information may be available at https://github.com/fiatjaf/react-site"
end

if [ (echo $argv | wc -w) -lt 1 ]
  help
  exit 1
end

set module (dirname (readlink -m (status -f)))

switch $argv[1]
  case 'build'
    eval "$module/build.fish prod"
  case 'serve'
    eval "$module/serve.fish live"
  case '--help'
    help
    exit 0
  case '*'
    help
    exit 1
end
