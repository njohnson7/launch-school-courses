const Bob = function () {}

Bob.prototype.hey = str =>
  !str.trim()
    ? 'Fine. Be that way!'
    : /^(?=.*[A-Z])[^a-z]+\?$/.test(str)
      ? "Calm down, I know what I'm doing!"
      : /^(?=.*[A-Z])[^a-z]+$/.test(str)
        ? 'Whoa, chill out!'
        : /^.+\?( +)?$/.test(str)
          ? 'Sure.'
          : 'Whatever.'

module.exports = Bob;
