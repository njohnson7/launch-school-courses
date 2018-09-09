$(function () {
  $(':checkbox').change(function () {
    let category = $(this).val();
    $(`.games li:contains(${category})`).toggle();
  });
});
