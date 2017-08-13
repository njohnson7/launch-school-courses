var studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams:     [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams:     [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams:     [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams:     [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams:     [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

// grades => array of strings: '87 (B)'
//   exam avg     => reduce: sum all exam scores and divide by total num of exams
//   exercise sum => reduce: sum all exercise scores
//   final grade  => exam avg * 0.65 + exercise sum * 0.35
//     - round to integer
//   grade weights =>
//      93 - 100  A
//      85 - 92   B
//      77 - 84   C
//      69 - 76   D
//      60 - 68   E
//      0 - 59    F

// exams => array w/ nums of exams elems
//   map each exam to obj:
//     - properties: average, min, max






function generateClassRecordSummary(students) {
  var studentGrades = Object.keys(students).map(student => {
    var exerciseSum   = students[student].scores.exercises.reduce((sum, n) => sum + n, 0);
    var exams         = students[student].scores.exams;
    var examsAvg      = findAvg(exams);
    var weightedScore = Math.round(examsAvg * 0.65 + exerciseSum * 0.35);
    var grade         = findLetterGrade(weightedScore);

    return `${weightedScore} (${grade})`;
  });

  var examzz    = Object.keys(students).map(student => students[student].scores.exams);
  var examStats = examzz[0].map((_, i) => {
    var examScores = examzz.map(exam => exam[i]);
    var avg        = findAvg(examScores);
    var [min, max] = [Math.min(...examScores), Math.max(...examScores)];

    return { average: avg, minimum: min, maximum: max };
  });

  return { studentGrades: studentGrades, exams: examStats };
}

function findAvg(scores) {
  return scores.reduce((sum, n) => sum + n, 0) / scores.length;
}

function findLetterGrade(score) {
  if      (score >= 93) return 'A';
  else if (score >= 85) return 'B';
  else if (score >= 77) return 'C';
  else if (score >= 69) return 'D';
  else if (score >= 60) return 'E';
  else                  return 'F';
}

console.log(generateClassRecordSummary(studentScores));

// returns:
({
  studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
  exams: [
    { average: 75.6, minimum: 50, maximum: 100 },
    { average: 86.4, minimum: 70, maximum: 100 },
    { average: 87.6, minimum: 60, maximum: 100 },
    { average: 91.8, minimum: 80, maximum: 100 },
  ],
});
