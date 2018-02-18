$(function () {
  const ITEM_TEMPLATE = $('#inventory_item').remove().html();
  const $inventory    = $('#inventory');
  let items           = [];

  const getParentTr = input => $(input).closest('tr');
  const getItemName = input => input.name.match(/(?:item_)([^_]+)/)[1];

  const addItem = (function (id = 1) {
    return function addItem() {
      $(ITEM_TEMPLATE.replace(/ID/g, id)).data({ id }).appendTo($inventory);
      items.push({ id: id++, name: '', stock: '', quantity: 1 });
    };
  }());

  const updateItem = function () {
    let item   = items.find(({ id }) => id == getParentTr(this).data('id'));
    let name   = getItemName(this);
    item[name] = name == 'quantity' ? +this.value : this.value;
  };

  const deleteItem = function (e) {
    e.preventDefault();
    let $tr = getParentTr(this).detach();
    let idx = items.findIndex(({ id }) => id == $tr.data('id'));
    items.splice(idx, 1);
  };

  (function attachEvents() {
    $('#add_item').click(addItem);
    $inventory.on('blur',  'input',   updateItem);
    $inventory.on('click', '.delete', deleteItem);
  }());

  (function renderDate(date = new Date) {
    $('<time>', { dateTime: date.toISOString(), text: date.toUTCString() }).appendTo('#order_date');
  }());
});
