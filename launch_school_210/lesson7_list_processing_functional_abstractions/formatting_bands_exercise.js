function processBands(data) {
  return data.map(band => (
    { name:    band.name.replace(/\./g, '').replace(/\b\w/g, s => s.toUpperCase()),
      country: 'Canada',
      active:  band.active,
    }
  ));
}

var bands = [
  { name: 'sunset rubdown',    country: 'UK',      active: false },
  { name: 'women',             country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain',   active: true },
];

console.log(processBands(bands));
console.log(bands);
// should return:
[
  { name: 'Sunset Rubdown',   country: 'Canada', active: false },
  { name: 'Women',            country: 'Canada', active: false },
  { name: 'A Silver Mt Zion', country: 'Canada', active: true },
]
