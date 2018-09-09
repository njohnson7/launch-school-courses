# Imagine that you’re writing a Cprogram that connects to a remote server and
# you have an object that represents the connection:

# RemoteConnection conn = new RemoteConnection("my_server");
# String stuff = conn.ReadStuff();
# conn.Dispose();    // close the connection to avoid a leak

# This code correctly disposes of the connection after using it. However, it
# doesn’t deal with exceptions. If ReadStuff throws an exception, then the last
# line is never executed, and conn is never disposed of. What the code should do
# is manage exceptions, disposing of the connection regardless of whether an
# exception is thrown. Cprovides a keyword named using that goes through the
# whole process for you:

# RemoteConnection conn = new RemoteConnection("some_remote_server");
# using (conn)
# {
#     conn.ReadData();
#     DoMoreStuff();
# }

# The using keyword expects that conn has a method named Dispose. This method is
# called automatically after the code in the curly braces, regardless of whether
# an exception is thrown.

# To refresh the basics of blocks, Bill throws a challenge at you: write a Ruby
# version of using. Instead of calling it using, call it with, because using is
# already a keyword in Ruby. Use this test to make sure that your with works
# like C#’s using:


module Kernel
  def with(resource)
    yield
  ensure
    resource.dispose
  end
end
