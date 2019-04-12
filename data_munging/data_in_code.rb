#!/usr/bin/env ruby

# source
# https://www.honeybadger.io/blog/data-and-end-in-ruby/

# there can be only one DATA global

def print_data_in_code
  DATA.each_line do |line|
    puts line
  end
end

print_data_in_code

__END__
#!/usr/bin/env bash
set -euo pipefail

HELP_MESSAGE=$(cat <<TEXT

infra-tools version manager

commands:

update
TEXT
)
THISDIR=$(perl -MCwd=abs_path -E "say abs_path '$(dirname "$0")'")

version_filename() {
  echo "${HELP_MESSAGE}"
}

version_filename

