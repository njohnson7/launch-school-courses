
const totalArea = arr => {
  return arr.reduce((sum, [width, height]) => sum + width * height, 0);
};

var rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

console.log(totalArea(rectangles)); // 141


const totalSquareArea = arr => {
  return arr.reduce((sum, [width, height]) => {
    return sum + (width === height ? width * height : 0);
  }, 0);
};

var rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

console.log(totalSquareArea(rectangles)); // 121
