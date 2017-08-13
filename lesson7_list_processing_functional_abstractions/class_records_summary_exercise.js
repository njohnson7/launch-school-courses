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

const EXAM_WEIGHT     = 0.65;
const EXERCISE_WEIGHT = 0.35;

const generateClassRecordSummary = students => {
  let studentGrades = generateStudentGrades(students);
  let examSummaries = generateExamSummaries(students);

  return { studentGrades: studentGrades, exams: examSummaries };
};

const generateStudentGrades = students => {
  return Object.keys(students).map(student => {
    let examScoresAvg     = findAvg(students[student].scores.exams);
    let exerciseScoresSum = findSum(students[student].scores.exercises)
    let percentGrade      = findPercentGrade(examScoresAvg, exerciseScoresSum);
    let letterGrade       = findLetterGrade(percentGrade);

    return `${percentGrade} (${letterGrade})`;
  });
};

const generateExamSummaries = students => {
  let examScoresByStudent = extractExamScores(students);

  return examScoresByStudent[0].map((_, studentNum) => {
    let examScoresByExam = findExamScoresByExam(examScoresByStudent, studentNum);
    let avg              = findAvg(examScoresByExam);
    let [min, max]       = findMinMax(examScoresByExam);

    return { average: avg, minimum: min, maximum: max };
  });
};

const extractExamScores = students => {
  return Object.keys(students).map(student => students[student].scores.exams);
};

const findExamScoresByExam = (examScoresByStudent, studentNum) => {
  return examScoresByStudent.map(exam => exam[studentNum]);
};

const findSum    = scores => scores.reduce((sum, score) => sum + score, 0);
const findAvg    = scores => findSum(scores) / scores.length;
const findMinMax = scores => [Math.min(...scores), Math.max(...scores)];

const findPercentGrade = (examScoresAvg, exerciseScoresSum) => {
  return Math.round(examScoresAvg * EXAM_WEIGHT + exerciseScoresSum * EXERCISE_WEIGHT);
};

const findLetterGrade = score => {
  if      (score >= 93) return 'A';
  else if (score >= 85) return 'B';
  else if (score >= 77) return 'C';
  else if (score >= 69) return 'D';
  else if (score >= 60) return 'E';
  else                  return 'F';
};






console.log(generateClassRecordSummary(studentScores));


result = generateClassRecordSummary(studentScores);

console.log(JSON.stringify(result.studentGrades) ===
            JSON.stringify([ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ]));

console.log(JSON.stringify(result.exams) === JSON.stringify([
    { average: 75.6, minimum: 50, maximum: 100 },
    { average: 86.4, minimum: 70, maximum: 100 },
    { average: 87.6, minimum: 60, maximum: 100 },
    { average: 91.8, minimum: 80, maximum: 100 },
  ]));


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
