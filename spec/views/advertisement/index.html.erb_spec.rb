<h1>Advertisements</h1>
<% @advertisements.each do |a| %>
  <div class="media">
    <div class="media-body">
      <h4 class="media-heading">
        <%= link_to "$#{a.price}: #{a.title}", a%>
      </h4>
    </div>
  </div>
<% end %>
