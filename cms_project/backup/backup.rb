# edit.erb -- form



<form action='/<%= @filename %>/edit', method='post'>
  <dl>
    <dt>
      <label for='edit'>Edit content of <%= @filename %>:</label>
    </dt>
    <dd>
      <textarea name='edit' rows='20' cols='75'>
        <%= @content %>
      </textarea>
    </dd>
  </dl>
  <input type='submit' value='Save Changes'>
</form>






<div>
  <% if session[:username] %>
    Signed in as <%= session[:username] %>.
    <form class='inline' action='/users/signout' method='post'>
      <button type='submit'>Sign Out</button>
    </form>

    <form action='users/signout' method='post'>
      <p class='user-status'>
        Signed in as <%= session[:username] %>.
        <button type='submit'>Sign out</button>
      </p>
    </form>

  <% else %>
    <form class='inline' action='/users/signin' method='get'>
      <button type='submit'>Sign In</button>
    </form>

    <p class='user-status'><a href='/users/signin'>Sign In</a></p>
  <% end %>
</div>
