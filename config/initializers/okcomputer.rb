require 'ok_computer/built_in_checks/resque_down_check'
require 'ok_computer/built_in_checks/resque_backed_up_check'

OkComputer::Registry.register "resque_down", OkComputer::ResqueDownCheck.new

OkComputer::Registry.register "resque_backed_up",
  OkComputer::ResqueBackedUpCheck.new("resizing", 100)
OkComputer::Registry.register "resque_backed_up",
  OkComputer::ResqueBackedUpCheck.new("default", 100)
OkComputer::Registry.register "resque_backed_up",
  OkComputer::ResqueBackedUpCheck.new("slow", 500)
