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
