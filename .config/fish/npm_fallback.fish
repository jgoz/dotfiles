function __fish_command_not_found_on_interactive --on-event fish_prompt
  functions --erase __fish_command_not_found_handler
  functions --erase __fish_command_not_found_setup

  function __fish_command_not_found_handler --on-event fish_command_not_found
    if which npx > /dev/null
        npx --no-install --quiet $argv
    else
        return 127
    end
  end

  functions --erase __fish_command_not_found_on_interactive
end