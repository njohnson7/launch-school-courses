$(function () {
  const ITEM_TEMPLATE = $('#inventory_item').remove().html();
  const $inventory    = $('#inventory');
  let items           = [];

  const addItem = (function (id = 1) {
    return function () {
      $(ITEM_TEMPLATE.replace(/ID/g, id)).data({ id }).appendTo($inventory);
      items.push({ id: id++, name: '', stock: '', quant: 1 });
    };
  }());

  const updateItem = function () {
    let $tr                  = $(this).closest('tr');
    let [name, stock, quant] = $tr.find('input:not(:hidden)').map((_, input) => $(input).val());
    Object.assign(items.find(({ id }) => id == $tr.data('id')), { name, stock, quant: +quant });
  };

  const deleteItem = function (e) {
    e.preventDefault();
    let $tr = $(this).closest('tr');
    items.splice(items.findIndex(({ id }) => id == $tr.data('id')), 1);
    $tr.remove();
  };

  $('#add_item').click(addItem);
  $inventory.on('blur',  'input',   updateItem);
  $inventory.on('click', '.delete', deleteItem);

  (function renderDate(date = new Date) {
    let $date = $('<time>', { dateTime: date.toISOString(), text: date.toUTCString() });
    $date.appendTo('#order_date');
  }());
});
