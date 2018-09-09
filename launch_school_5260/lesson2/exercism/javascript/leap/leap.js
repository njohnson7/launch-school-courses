const Year = function (year) {
  this.year = year
}

Year.prototype.isLeap = function () {
  return !(this.year % 400) || (!(this.year % 4) && !!(this.year % 100))
}

module.exports = Year;
