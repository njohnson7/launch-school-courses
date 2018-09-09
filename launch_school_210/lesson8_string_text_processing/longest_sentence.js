var longText = 'Four score and seven years ago our fathers brought forth' +
  ' on this continent a new nation, conceived in liberty, and' +
  ' dedicated to the proposition that all men are created' +
  ' equal.' +
  ' Now we are engaged in a great civil war, testing whether' +
  ' that nation, or any nation so conceived and so dedicated,' +
  ' can long endure. We are met on a great battlefield of that' +
  ' war. We have come to dedicate a portion of that field, as' +
  ' a final resting place for those who here gave their lives' +
  ' that that nation might live. It is altogether fitting and' +
  ' proper that we should do this.' +
  ' But, in a larger sense, we can not dedicate, we can not' +
  ' consecrate, we can not hallow this ground. The brave' +
  ' men, living and dead, who struggled here, have' +
  ' consecrated it, far above our poor power to add or' +
  ' detract. The world will little note, nor long remember' +
  ' what we say here, but it can never forget what they' +
  ' did here. It is for us the living, rather, to be dedicated' +
  ' here to the unfinished work which they who fought' +
  ' here have thus far so nobly advanced. It is rather for' +
  ' us to be here dedicated to the great task remaining' +
  ' before us -- that from these honored dead we take' +
  ' increased devotion to that cause for which they gave' +
  ' the last full measure of devotion -- that we here highly' +
  ' resolve that these dead shall not have died in vain' +
  ' -- that this nation, under God, shall have a new birth' +
  ' of freedom -- and that government of the people, by' +
  ' the people, for the people, shall not perish from the' +
  ' earth.';

/*
- input: string of sentences


- output: log two strings to console:
  - longest sentence => highest number of words
    - sentences end w/ either:  .  !  ?
    - word => any sequence of chars that are not spaces or sentence-ending chars
  - num of words in longest sentence
    - ex: 'The longest sentence has 86 words.'

*/

// const longestSentence = text => {
//   let longest = text.match(/\b.+?[.!?]/g)
//     .map(sentence => ({ sentence: sentence, wordCount: sentence.match(WORD_REGEX).length }));
//   sentences = sentences.map(sentence => ({ sentence: sentence, wordCount: countWords(sentence) }));
//   let longest = sentences.slice().sort((a, b) => b.wordCount - a.wordCount)[0];

//   console.log(sentence.content);
//   console.log('');
//   console.log(`The longest sentence has ${sentence.wordCount} words.`);
// };



const longestSentence = text => {
  let longest = text
    .match(/\S.*?[.!?]/g)
    .map(sentence => ({ content: sentence, wordCount: sentence.match(/[^ .!?]+/g).length }))
    .slice().sort((a, b) => b.wordCount - a.wordCount)[0];

  console.log(longest.content);
  console.log(`\nThe longest sentence has ${longest.wordCount} words.`);
};



// const SENTENCE_REGEX = /\S.*?[.!?]/g;
// const WORD_REGEX     = /[^ .!?]+/g;

// const longestSentence = text => {
//   let sentences               = extractSentences(text);
//   let sentencesWithWordCounts = generateSentencesWithWordCounts(sentences);
//   let longest                 = findLongestSentence(sentencesWithWordCounts);

//   logLongestSentenceInfo(longest);
// };

// const extractSentences = text => text.match(SENTENCE_REGEX);

// const generateSentencesWithWordCounts = sentences => {
//   return sentences.map(sentence => ({
//     content:   sentence,
//     wordCount: countWords(sentence),
//   }));
// };

// const countWords = sentence => sentence.match(WORD_REGEX).length;

// const findLongestSentence = sentences => sortByWordCount(sentences)[0];

// const sortByWordCount = sentences => {
//   return [...sentences].sort((a, b) => b.wordCount - a.wordCount);
// };

// const logLongestSentenceInfo = sentence => {
//   console.log(sentence.content);
//   console.log('');
//   console.log(`The longest sentence has ${sentence.wordCount} words.`);
// };




longestSentence(longText);


// console output:

// It is rather for us to be here dedicated to the great task remaining before us -- that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion -- that we here highly resolve that these dead shall not have died in vain -- that this nation, under God, shall have a new birth of freedom -- and that government of the people, by the people, for the people, shall not perish from the earth.

// The longest sentence has 86 words.


// var expected = 'It is rather for us to be here dedicated to the great task remaining before us -- that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion -- that we here highly resolve that these dead shall not have died in vain -- that this nation, under God, shall have a new birth of freedom -- and that government of the people, by the people, for the people, shall not perish from the earth.'
// var actual = longestSentence(longText);

// console.log(actual);
// console.log(actual.split(' ').length);

// console.log(actual.split(' ').length === expected.split(' ').length);
// console.log(actual.split(' ').length === 86);
