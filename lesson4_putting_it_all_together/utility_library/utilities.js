(function () {
const _ = this._ = function _(obj) {
  return Object.create(_.prototype).init(obj);
};

_.swapValues = (a = 0, b) => [a, b] = b == null ? [0, a] : [a, b];

_.randomNum = function (min, max) {
  [min, max] = _.swapValues(min, max);
  return ~~(Math.random() * (max - min) + min);
};

_.range = function (start, end) {
  [start, end] = _.swapValues(start, end);
  return [...Array(end - start)].map((_, i) => i + start);
};

_.is = (type, value) => typeof value == type || typeof value.valueOf() == type;
'Number String Boolean Function'.split(' ').forEach(type => (
  _[`is${type}`] = value => _.is(type.toLowerCase(), value)
));
_.isObject  = value => _.is('object', value) || _.isFunction(value);
_.isElement = value => EventTarget.prototype.isPrototypeOf(value);
_.isArray   = Array.isArray;

_.shallowCopy = obj => _.isArray(obj) ? [...obj] : { ...obj };
_.extend = Object.assign;
_.extend(_.prototype, {
  init(val = []) {
    this.val = _.shallowCopy(val);
    return this;
  },
  first() {
    return this.val[0];
  },
  last() {
    return [].slice.call(this.val, -1)[0];
  },
  filter(criteriaFunc) {
    return [].filter.call(this.val, criteriaFunc);
  },
  without(...values) {
    return this.filter(elem => !values.includes(elem));
  },
  lastIndexOf(value) {
    return [].lastIndexOf.call(this.val, value);
  },
  sample(num = 1) {
    let result = [];
    let copy   = [...this.val];
    while (copy.length && num-- > 0) result.push(...copy.splice(_.randomNum(copy.length), 1));
    return result.length == 1 ? result[0] : result;
  },
  where(obj) {
    let keys = _(obj).keys();
    return this.filter(elem => keys.every(key => elem[key] === obj[key]));
  },
  findWhere(obj) {
    return _(this.where(obj)).first();
  },
  has(key) {
    return {}.hasOwnProperty.call(this.val, key);
  },
  pluck(key) {
    return this.filter(obj => _(obj).has(key)).map(obj => obj[key]);
  },
  keys() {
    return Object.keys(this.val);
  },
  values() {
    return Object.values(this.val);
  },
  filterByKeys(keys, isGoodKey) {
    return Object.entries(this.val).reduce((newObj, [key, value]) => (
      isGoodKey(key) ? { ...newObj, [key]: value } : newObj
    ), {});
  },
  pick(...keys) {
    return this.filterByKeys(keys, key => keys.includes(key));
  },
  omit(...keys) {
    return this.filterByKeys(keys, key => !keys.includes(key));
  },
});

Object.defineProperty(_.prototype, 'length', {
  get() {
    return this.val.length;
  },
  set(newLength) {
    return (this.val.length = newLength);
  },
});

'Element Array Object Function Boolean String Number'.split(' ').forEach(type => (
  _.prototype[`is${type}`] = function () {
    return _[`is${type}`](this.val);
  }
));
}());

// const a = [1, 2, 3, 4, 5];
// const o = { a: 1, b: 2, c: 3 };

_()
$()
a()
b()
1()
~()
__()
$$()
