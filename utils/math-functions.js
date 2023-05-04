const getNumber = (N) => parseInt(N);

const isNumber = (N) => isNaN(N);

function round(N, decimalPlaces = 2) {
  if (isNumber(N)) throw new Error('Provided value should be a number.!');
  const factor = Math.pow(10, decimalPlaces);
  return Math.round(+N * factor) / factor;
}

const add = (...Ns) => round(Ns.reduce((P, C) => P + round(C), 0));

module.exports = { round, getNumber, add };
