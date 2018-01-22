$(function () {
  let $ul = $('ul');

  $('form').submit(function (e) {
    e.preventDefault();
    let name = $('#name').val().trim();
    if (!name.length) {
      $('#msg').text('Item name cannot be empty');
      return;
    }

    $('#msg').text('');
    let quantity = $('#quantity').val() || 1;
    $ul.append(`<li>${quantity} ${name}</li>`);
    this.reset();
  });
});
