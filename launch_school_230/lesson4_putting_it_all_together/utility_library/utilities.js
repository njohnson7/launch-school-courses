(function () {
const _ = this._ = function _(obj) {
  return Object.create(_.prototype).init(obj);
};

_.swapValues = (a = 0, b) => b == null ? [0, a] : [a, b];

_.randomNum = function (min, max) {
  [min, max] = _.swapValues(min, max);
  return ~~(Math.random() * (max - min) + min);
};

_.range = function (start, end) {
  [start, end] = _.swapValues(start, end);
  return [...Array(end - start)].map((_, i) => i + start);
};

'Element Array Function Boolean String Number'.split(' ').forEach(type => (
  _[`is${type}`] = value => value != null && RegExp(`${type}]$`).test({}.toString.call(value))
));
_.isObject = value => !!value && typeof value == 'object' || _.isFunction(value);

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
  sample(n = 1) {
    let copy   = _.shallowCopy(this.val);
    let newArr = _.range(n).reduce(arr => [...arr, ...copy.splice(_.randomNum(copy.length), 1)], []);
    return newArr.length == 1 ? _(newArr).first() : newArr;
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
  filterByKeys(isGoodKey) {
    return Object.entries(this.val).reduce((newObj, [key, value]) => (
      isGoodKey(key) ? { ...newObj, [key]: value } : newObj
    ), {});
  },
  pick(...keys) {
    return this.filterByKeys(key => keys.includes(key));
  },
  omit(...keys) {
    return this.filterByKeys(key => !keys.includes(key));
  },
  grep(regex) {
    return this.filter(elem => regex.test(elem));
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

_(_(_).keys()).grep(/^is/).forEach(methodName => (_.prototype[methodName] = function () {
  return _[methodName](this.val);
}));
}());
